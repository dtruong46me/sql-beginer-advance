## Advance Functions

**Outline:**
- Insert-Update-Delete
    + `MERGE`

- Ranking function
    + `ROW_NUMBER`
    + `DENSE_RANK`
    + `RANK`

- Analytic function
    + `LAG`
    + `LEAD`


### MERGE

Giả sử cần **copy** dữ liệu từ bảng A sang bảng B:
- Nếu B có tồn tại dữ liệu của bảng A thì **update**
- Nếu chưa có thì **insert**

> Trong ví dụ này thì A là **Source** và B là **Target**

```
MERGE [Destination table] AS ds
USING [Source Table] AS st -- Include the columns Name
ON ds.[Common column] = st.[Common Column]
-- It's not about matching, You have to add the expressions
WHEN MATCHED THEN INSERT | DELETE | UPDATE
WHEN NOT MATCHED THEN INSERT | DELETE | UPDATE
WHEN NOT MATCHED BY SOURCE THEN INSERT | DELETE | UPDATE
```

> - `WHEN MATCHED`: Dành cho những dòng có cả ở bảng đích *(Target)* và bảng nguồn *(Source)*.
> - `WHEN NOT MATCHED`: Dành cho những dòng có ở bảng nguồn *(Source)* nhưng không có ở bảng đích
> - `WHEN NOT MATCHED BY SOURCE`: Ngược lại với cái trên


### RANKING FUNCTION

- `ROW_NUMBER()`

- `DENSE_RANK()`

- `RANK()`