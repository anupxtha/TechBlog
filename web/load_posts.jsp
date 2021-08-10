<%@page import="java.util.List" %>
<%@page import="java.lang.*" %>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.helper.*" %>

<div class="row">

    <%
        
        Thread.sleep(200);
        PostDao d = new PostDao(ConnectionProvider.getConnection());
    
        int catId = Integer.parseInt(request.getParameter("cId"));
        List<Post> posts = null;
        
        if(catId == 0){
            posts = d.getAllPosts();
        }
        else{
            posts = d.getPostByCatId(catId);
        }

        if(posts.size() == 0){
            out.println("<h3 class='display-3 text-center'>No Posts in this Category...</h3>");
            return;
        }

        for(Post p : posts){

    %>

    <div class="col-md-6">

        <div class="card mt-3">

            <img style="max-height: 283.13px; max-width: 377.5px;" class="card-img-top" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap"/>
            <div class="card-body">
                <h5><%= p.getpTitle() %></h5>
                <p><%= p.getpContent() %></p>
            </div>
            
            <div class="card-footer primary-background text-center">
                <a href="show_blog_page.jsp?post_id=<%= p.getpId() %>" class="btn btn-outline-light btn-sm">Read More</a>
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>10</span></a>
            </div>

        </div>

    </div>


    <%
        }  
    %>

</div>