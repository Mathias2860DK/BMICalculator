package web.commands;

import business.entities.Sport;
import business.exceptions.UserException;
import business.services.BmiFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManageSportCommand extends CommandProtectedPage {

    BmiFacade bmiFacade;

    public ManageSportCommand(String pageToShow, String role) {
        super(pageToShow, role);
        this.bmiFacade = new BmiFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException {

        String deleteId = request.getParameter("delete");
        String editId = request.getParameter("edit");
        String update = request.getParameter("update");

        if (deleteId != null){
            //delete from database.
            int rowsAffected = bmiFacade.deleteSport(Integer.parseInt(deleteId));
            if (rowsAffected > 0 ){
                //update sportList in applicationScope
                request.getServletContext().setAttribute("sportList",bmiFacade.getAllSports());
            } else {
                request.setAttribute("error","Du kan IKKE fjerne denne sportsgren, eftersom den er valgt af andre brugere.");
            }

        } else if (editId != null){
            Sport sport = bmiFacade.getSportById(Integer.parseInt(editId));
            request.setAttribute("sportItem",sport);
            return "editsportspage";
        } else if (update != null){
            //opdater sportsgren i databasen
            String name = request.getParameter("name");
            String sportId = request.getParameter("sports_id");
            int rowsInserted = bmiFacade.updateSport(Integer.parseInt(sportId),name);
            if (rowsInserted == 1){
                //update aplication state.
                request.getServletContext().setAttribute("sportList",bmiFacade.getAllSports());
            }
            System.out.println("nyt navn: " + name + " sportsId " + sportId);
        }
        return pageToShow;
    }
}
