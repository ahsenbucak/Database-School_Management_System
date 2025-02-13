PGDMP     .    /                z           school    14.3    14.3 ,               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            !           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            "           1262    18320    school    DATABASE     h   CREATE DATABASE school WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Netherlands.1254';
    DROP DATABASE school;
                postgres    false            �            1259    18354    class_    TABLE     �   CREATE TABLE public.class_ (
    classid integer NOT NULL,
    classname character varying(20) NOT NULL,
    capacity integer NOT NULL
);
    DROP TABLE public.class_;
       public         heap    postgres    false            �            1259    18353    class__capacity_seq    SEQUENCE     �   CREATE SEQUENCE public.class__capacity_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.class__capacity_seq;
       public          postgres    false    215            #           0    0    class__capacity_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.class__capacity_seq OWNED BY public.class_.capacity;
          public          postgres    false    214            �            1259    18352    class__classid_seq    SEQUENCE     �   CREATE SEQUENCE public.class__classid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.class__classid_seq;
       public          postgres    false    215            $           0    0    class__classid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.class__classid_seq OWNED BY public.class_.classid;
          public          postgres    false    213            �            1259    18338    lessons    TABLE     �   CREATE TABLE public.lessons (
    lessonid integer NOT NULL,
    lessonname character varying(20) NOT NULL,
    classid integer NOT NULL
);
    DROP TABLE public.lessons;
       public         heap    postgres    false            �            1259    18337    lessons_lessonid_seq    SEQUENCE     �   CREATE SEQUENCE public.lessons_lessonid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.lessons_lessonid_seq;
       public          postgres    false    212            %           0    0    lessons_lessonid_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.lessons_lessonid_seq OWNED BY public.lessons.lessonid;
          public          postgres    false    211            �            1259    18424    lessons_students    TABLE     �   CREATE TABLE public.lessons_students (
    lessonid integer NOT NULL,
    studentid integer NOT NULL,
    midterm integer,
    final_ integer,
    attendance integer
);
 $   DROP TABLE public.lessons_students;
       public         heap    postgres    false            �            1259    18497    lessons_teachers    TABLE     h   CREATE TABLE public.lessons_teachers (
    lessonid integer NOT NULL,
    teacherid integer NOT NULL
);
 $   DROP TABLE public.lessons_teachers;
       public         heap    postgres    false            �            1259    18419    students    TABLE        CREATE TABLE public.students (
    studentid bigint NOT NULL,
    studentname character varying(20) NOT NULL,
    studentsurname character varying(20) NOT NULL,
    dateofbirth date NOT NULL,
    gender character varying(10) NOT NULL,
    password_ character varying(9999999) NOT NULL
);
    DROP TABLE public.students;
       public         heap    postgres    false            �            1259    18418    students_studentid_seq    SEQUENCE     �   ALTER TABLE public.students ALTER COLUMN studentid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.students_studentid_seq
    START WITH 10000000
    INCREMENT BY 1
    MINVALUE 10000000
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    18329    teachers    TABLE     L  CREATE TABLE public.teachers (
    teacherid integer NOT NULL,
    username character varying(20) NOT NULL,
    teachername character varying(20) NOT NULL,
    teachersurname character varying(20) NOT NULL,
    password_ character varying(99999) NOT NULL,
    gender character varying(10) NOT NULL,
    dateofbirth date NOT NULL
);
    DROP TABLE public.teachers;
       public         heap    postgres    false            �            1259    18328    teachers_teacherid_seq    SEQUENCE     �   CREATE SEQUENCE public.teachers_teacherid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.teachers_teacherid_seq;
       public          postgres    false    210            &           0    0    teachers_teacherid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.teachers_teacherid_seq OWNED BY public.teachers.teacherid;
          public          postgres    false    209            v           2604    18357    class_ classid    DEFAULT     p   ALTER TABLE ONLY public.class_ ALTER COLUMN classid SET DEFAULT nextval('public.class__classid_seq'::regclass);
 =   ALTER TABLE public.class_ ALTER COLUMN classid DROP DEFAULT;
       public          postgres    false    213    215    215            w           2604    18358    class_ capacity    DEFAULT     r   ALTER TABLE ONLY public.class_ ALTER COLUMN capacity SET DEFAULT nextval('public.class__capacity_seq'::regclass);
 >   ALTER TABLE public.class_ ALTER COLUMN capacity DROP DEFAULT;
       public          postgres    false    215    214    215            u           2604    18341    lessons lessonid    DEFAULT     t   ALTER TABLE ONLY public.lessons ALTER COLUMN lessonid SET DEFAULT nextval('public.lessons_lessonid_seq'::regclass);
 ?   ALTER TABLE public.lessons ALTER COLUMN lessonid DROP DEFAULT;
       public          postgres    false    211    212    212            t           2604    18332    teachers teacherid    DEFAULT     x   ALTER TABLE ONLY public.teachers ALTER COLUMN teacherid SET DEFAULT nextval('public.teachers_teacherid_seq'::regclass);
 A   ALTER TABLE public.teachers ALTER COLUMN teacherid DROP DEFAULT;
       public          postgres    false    210    209    210                      0    18354    class_ 
   TABLE DATA           >   COPY public.class_ (classid, classname, capacity) FROM stdin;
    public          postgres    false    215   �2                 0    18338    lessons 
   TABLE DATA           @   COPY public.lessons (lessonid, lessonname, classid) FROM stdin;
    public          postgres    false    212    3                 0    18424    lessons_students 
   TABLE DATA           \   COPY public.lessons_students (lessonid, studentid, midterm, final_, attendance) FROM stdin;
    public          postgres    false    218   �3                 0    18497    lessons_teachers 
   TABLE DATA           ?   COPY public.lessons_teachers (lessonid, teacherid) FROM stdin;
    public          postgres    false    219   �3                 0    18419    students 
   TABLE DATA           j   COPY public.students (studentid, studentname, studentsurname, dateofbirth, gender, password_) FROM stdin;
    public          postgres    false    217   4                 0    18329    teachers 
   TABLE DATA           t   COPY public.teachers (teacherid, username, teachername, teachersurname, password_, gender, dateofbirth) FROM stdin;
    public          postgres    false    210   B5       '           0    0    class__capacity_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.class__capacity_seq', 1, false);
          public          postgres    false    214            (           0    0    class__classid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.class__classid_seq', 5, true);
          public          postgres    false    213            )           0    0    lessons_lessonid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.lessons_lessonid_seq', 15, true);
          public          postgres    false    211            *           0    0    students_studentid_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.students_studentid_seq', 10000014, true);
          public          postgres    false    216            +           0    0    teachers_teacherid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.teachers_teacherid_seq', 6, true);
          public          postgres    false    209                       2606    18360    class_ Class_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.class_
    ADD CONSTRAINT "Class_pk" PRIMARY KEY (classid);
 ;   ALTER TABLE ONLY public.class_ DROP CONSTRAINT "Class_pk";
       public            postgres    false    215            }           2606    18343    lessons Lessons_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT "Lessons_pk" PRIMARY KEY (lessonid);
 >   ALTER TABLE ONLY public.lessons DROP CONSTRAINT "Lessons_pk";
       public            postgres    false    212            �           2606    18423    students Students_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.students
    ADD CONSTRAINT "Students_pk" PRIMARY KEY (studentid);
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT "Students_pk";
       public            postgres    false    217            y           2606    18334    teachers Teachers_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT "Teachers_pk" PRIMARY KEY (teacherid);
 @   ALTER TABLE ONLY public.teachers DROP CONSTRAINT "Teachers_pk";
       public            postgres    false    210            {           2606    18336    teachers teachers_username_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_username_key UNIQUE (username);
 H   ALTER TABLE ONLY public.teachers DROP CONSTRAINT teachers_username_key;
       public            postgres    false    210            �           2606    18441 %   lessons_students Lessons_Students_fk0    FK CONSTRAINT     �   ALTER TABLE ONLY public.lessons_students
    ADD CONSTRAINT "Lessons_Students_fk0" FOREIGN KEY (lessonid) REFERENCES public.lessons(lessonid);
 Q   ALTER TABLE ONLY public.lessons_students DROP CONSTRAINT "Lessons_Students_fk0";
       public          postgres    false    218    212    3197            �           2606    18505 %   lessons_teachers Lessons_Students_fk0    FK CONSTRAINT     �   ALTER TABLE ONLY public.lessons_teachers
    ADD CONSTRAINT "Lessons_Students_fk0" FOREIGN KEY (lessonid) REFERENCES public.lessons(lessonid);
 Q   ALTER TABLE ONLY public.lessons_teachers DROP CONSTRAINT "Lessons_Students_fk0";
       public          postgres    false    219    3197    212            �           2606    18446 %   lessons_students Lessons_Students_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.lessons_students
    ADD CONSTRAINT "Lessons_Students_fk1" FOREIGN KEY (studentid) REFERENCES public.students(studentid);
 Q   ALTER TABLE ONLY public.lessons_students DROP CONSTRAINT "Lessons_Students_fk1";
       public          postgres    false    218    3201    217            �           2606    18510 %   lessons_teachers Lessons_Students_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.lessons_teachers
    ADD CONSTRAINT "Lessons_Students_fk1" FOREIGN KEY (teacherid) REFERENCES public.teachers(teacherid);
 Q   ALTER TABLE ONLY public.lessons_teachers DROP CONSTRAINT "Lessons_Students_fk1";
       public          postgres    false    3193    219    210            �           2606    18373    lessons Lessons_fk1    FK CONSTRAINT     z   ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT "Lessons_fk1" FOREIGN KEY (classid) REFERENCES public.class_(classid);
 ?   ALTER TABLE ONLY public.lessons DROP CONSTRAINT "Lessons_fk1";
       public          postgres    false    3199    215    212               8   x�3�L�)M�44�2�,JM1�9�32K�b&���99�� �)gzQjj����� �[�         S   x��9�0���0C�r��"��4�=��h��)�Vh��֎�6|�-'�L;�Jqr��#���8����9G\r��c ��8H         U   x�u���0�3SA��٥��Q%
�d���d㤲�Hf8@m��3��D�"�B!�Λ���� 4��#Cp�@����/'�0�            x�3�4�24 f@l	�@���� -4<           x���Mn� Fן����t�t3v&	��
p�_H������7Ç�^��&�����Yx��y�:f�4t�Y�R�8�Q\��ajī_��#�5�~і���1��x���qjK�
�]�a�B\��P�P��<��ġ�2E>E>SN�����8Vcΰ���_�G��q|�n�� m��,E�yhL�-Y�[
;$��
Ȉ���l�j�}��G�W
��6	Ֆ�!D^��k�n;AVD�p|w�pag�o�k,rN����_;ޯr�c D��B�~<2��[�4�/o         �   x���A�0����]jf
�rw�\������zzx �|�?/�!�eZ"lq���u-����\(CQ
;�p�K�[87���ZH�G�`�]��H���yC���Q�$�w&��XB����J�~�v*C��
+H�QgXi5�{�!Clآ�s����g����/-^����m�     