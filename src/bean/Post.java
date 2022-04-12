package bean;

public class Post {
    int id;
    String title;
    String content;
    int categry_id;
    String created_ar;
    int p_class;
    static int len;

    public Post() {
        this.title="请选择分类";
        this.setCategry_id(-1);
    }

    public int getLen() {
        return len;
    }

    public void setLen(int len) {
        this.len = len;
    }

    public int getP_class() {
        return p_class;
    }

    public void setP_class(int p_class) {
        this.p_class = p_class;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCategry_id() {
        return categry_id;
    }

    public void setCategry_id(int categry_id) {
        this.categry_id = categry_id;
    }

    public String getCreated_ar() {
        return created_ar;
    }

    public void setCreated_ar(String created_ar) {
        this.created_ar = created_ar;
    }
}
