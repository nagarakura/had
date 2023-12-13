<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
xmlns:app="http://schemas.android.com/apk/res-auto"
xmlns:tools="http://schemas.android.com/tools"
android:layout_width="match_parent"
android:layout_height="match_parent"
tools:context=".MainActivity">
<TextView
    android:id="@+id/textView"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:text="Login"
    android:gravity="center"
    android:textSize="45dp"
    android:fontFamily="sans-serif-black"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toTopOf="parent"
    app:layout_constraintVertical_bias="0.044" />
<EditText
    android:id="@+id/username"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:ems="10"
    android:inputType="textPersonName"
    android:text="Usarname"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintHorizontal_bias="0.497"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toBottomOf="@+id/textView"
    app:layout_constraintVertical_bias="0.06" />
<EditText
    android:id="@+id/password"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:ems="10"
    android:inputType="textPersonName"
    android:text="Password"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintHorizontal_bias="0.497"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toBottomOf="@+id/username"
    app:layout_constraintVertical_bias="0.023" />
<Button
    android:id="@+id/register"
    android:layout_width="126dp"
    android:layout_height="56dp"
    android:text="Register"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintHorizontal_bias="0.218"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toTopOf="parent"
    app:layout_constraintVertical_bias="0.427" />
<Button
    android:id="@+id/delete"
    android:layout_width="124dp"
    android:layout_height="56dp"
    android:text="Delete"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintHorizontal_bias="0.815"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toTopOf="parent"
    app:layout_constraintVertical_bias="0.429" />
<Button
    android:id="@+id/update"
    android:layout_width="128dp"
    android:layout_height="51dp"
    android:text="Update"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintHorizontal_bias="0.219"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toTopOf="parent"
    app:layout_constraintVertical_bias="0.536" />
<Button
    android:id="@+id/display"
    android:layout_width="129dp"
    android:layout_height="52dp"
    android:text="Display"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintHorizontal_bias="0.829"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toTopOf="parent"
    app:layout_constraintVertical_bias="0.536" />
<TextView
    android:id="@+id/result"
    android:layout_width="331dp"
    android:layout_height="102dp"
    android:gravity="center"
    android:text="Text"
    android:textSize="30dp"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintHorizontal_bias="0.498"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toTopOf="parent"
    app:layout_constraintVertical_bias="0.759" />

</androidx.constraintlayout.widget.ConstraintLayout>





package com.example.four;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
public class MainActivity extends AppCompatActivity {
    EditText user,pass;
    Button register,delete,update,display;
    DBHelper dbHelper;
    TextView res;
    private static final String dbName="studentdb";
    private static final String tbName="student" ;
    private static final int dbVersion = 1 ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        user=findViewById(R.id.username);
        pass=findViewById(R.id.password);
        register=findViewById(R.id.register);
        delete=findViewById(R.id.delete);
        update=findViewById(R.id.update);
        display=findViewById(R.id.display);
        res=findViewById(R.id.result);
        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dbHelper=new DBHelper(MainActivity.this, dbName,null,dbVersion);
                long val = dbHelper.adduser(user.getText().toString(), pass.getText().toString()) ;
                if(val == -1)
                    Toast.makeText(MainActivity.this, "Error in adding user",
                            Toast.LENGTH_SHORT).show();
                else {
                    Toast.makeText(MainActivity.this, "USER REGISTERED",
                            Toast.LENGTH_SHORT).show();
                }
            }
        });
        update.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dbHelper = new DBHelper(MainActivity.this, dbName, null, dbVersion) ;
                dbHelper.update(user.getText().toString(), pass.getText().toString());
            }
        });
        delete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dbHelper = new DBHelper(MainActivity.this, dbName,null, dbVersion) ;
                dbHelper.delete(user.getText().toString());
            }
        });
        res.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dbHelper = new DBHelper(MainActivity.this, dbName, null, dbVersion);
                String out= dbHelper.display(MainActivity.this);
                res.setText(out);
            }
        });
    }
}







package com.example.four;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import androidx.annotation.Nullable;
public class DBHelper extends SQLiteOpenHelper {
    private static final String dbName="studentdb"; // Database Name
    private static final String tbName="student" ; // Table Name
    private static final int dbVersion = 1 ;
    public DBHelper(@Nullable Context context, @Nullable String name, @Nullable SQLiteDatabase.CursorFactory
            factory, int version) {
        super(context, dbName, factory, dbVersion);
    }
    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE "+tbName+"(uname VARCHAR(10) ,passw VARCHAR(10))"+";");
    }
    @Override
    public void onUpgrade(SQLiteDatabase db, int i, int i1) {
        db.execSQL("DROP TABLE IF EXISTS "+tbName);
        onCreate(db);
    }
    public long adduser(String name,String pass){
        SQLiteDatabase db=this.getWritableDatabase();
        ContentValues cv=new ContentValues();
        cv.put("uname",name);
        cv.put("passw ",pass);
        long result = db.insert(tbName, null,cv);
        db.close();
        return result ;
    }
    public void update(String name, String pass){
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL("UPDATE "+tbName+" SET passw='"+pass+"'"+" WHERE uname='"+name+"';");//6(b)
        // UPDATE tbName SET passw='pass' WHERE uname='name' ; SQL statement
        db.close();
    }
    public void delete(String name){
        SQLiteDatabase db=this.getWritableDatabase();
        db.execSQL("DELETE FROM "+tbName+" WHERE uname='" +name+"';");
        db.close();
    }
    public String display(Context ctx){
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery("SELECT * FROM "+tbName, null);
        String finalres = " " ;
        while(cursor.moveToNext()){
            finalres += cursor.getString(0)+":"+cursor.getString(1);
        }
        return finalres;
    }
}
