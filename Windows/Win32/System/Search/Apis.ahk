#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Search
 */

;@region Functions
/**
 * SQLBindCol Function
 * @remarks
 * **SQLBindCol** is used to associate, or *bind,* columns in the result set to data buffers and length/indicator buffers in the application. When the application calls **SQLFetch**, **SQLFetchScroll**, or **SQLSetPos** to fetch data, the driver returns the data for the bound columns in the specified buffers; for more information, see [SQLFetch Function](../../../odbc/reference/syntax/sqlfetch-function.md). When the application calls **SQLBulkOperations** to update or insert a row or **SQLSetPos** to update a row, the driver retrieves the data for the bound columns from the specified buffers; for more information, see [SQLBulkOperations Function](../../../odbc/reference/syntax/sqlbulkoperations-function.md) or [SQLSetPos Function](../../../odbc/reference/syntax/sqlsetpos-function.md). For more information about binding, see [Retrieving Results (Basic)](../../../odbc/reference/develop-app/retrieving-results-basic.md).  
 *   
 *  Notice that columns do not have to be bound to retrieve data from them. An application can also call **SQLGetData** to retrieve data from columns. Although it is possible to bind some columns in a row and call **SQLGetData** for others, this is subject to some restrictions. For more information, see [SQLGetData](../../../odbc/reference/syntax/sqlgetdata-function.md).
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Integer} ColumnNumber [Input] Number of the result set column to bind. Columns are numbered in increasing column order starting at 0, where column 0 is the bookmark column. If bookmarks are not used - that is, the SQL_ATTR_USE_BOOKMARKS statement attribute is set to SQL_UB_OFF - then column numbers start at 1.
 * @param {Integer} TargetType [Input] The identifier of the C data type of the \**TargetValuePtr* buffer. When it is retrieving data from the data source with **SQLFetch**, **SQLFetchScroll**, **SQLBulkOperations**, or **SQLSetPos**, the driver converts the data to this type; when it sends data to the data source with **SQLBulkOperations** or **SQLSetPos**, the driver converts the data from this type. For a list of valid C data types and type identifiers, see the [C Data Types](../../../odbc/reference/appendixes/c-data-types.md) section in Appendix D: Data Types.  
 *   
 *  If the *TargetType* argument is an interval data type, the default interval leading precision (2) and the default interval seconds precision (6), as set in the SQL_DESC_DATETIME_INTERVAL_PRECISION and SQL_DESC_PRECISION fields of the ARD, respectively, are used for the data. If the *TargetType* argument is SQL_C_NUMERIC, the default precision (driver-defined) and default scale (0), as set in the SQL_DESC_PRECISION and SQL_DESC_SCALE fields of the ARD, are used for the data. If any default precision or scale is not appropriate, the application should explicitly set the appropriate descriptor field by a call to **SQLSetDescField** or **SQLSetDescRec**.  
 *   
 *  You can also specify an extended C data type. For more information, see [C Data Types in ODBC](../../../odbc/reference/develop-app/c-data-types-in-odbc.md).
 * @param {Pointer<Void>} TargetValue 
 * @param {Integer} BufferLength [Input] Length of the \**TargetValuePtr* buffer in bytes.  
 *   
 *  The driver uses *BufferLength* to avoid writing past the end of the \**TargetValuePtr* buffer when it returns variable-length data, such as character or binary data. Notice that the driver counts the null-termination character when it returns character data to \**TargetValuePtr*. \**TargetValuePtr* must therefore contain space for the null-termination character or the driver will truncate the data.  
 *   
 *  When the driver returns fixed-length data, such as an integer or a date structure, the driver ignores *BufferLength* and assumes the buffer is large enough to hold the data. Therefore, it is important for the application to allocate a large enough buffer for fixed-length data or the driver will write past the end of the buffer.
 * @param {Pointer<Integer>} StrLen_or_Ind 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlbindcol-function
 */
export SQLBindCol(StatementHandle, ColumnNumber, TargetType, TargetValue, BufferLength, StrLen_or_Ind) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    TargetValueMarshal := TargetValue is VarRef ? "ptr" : "ptr"
    StrLen_or_IndMarshal := StrLen_or_Ind is VarRef ? "int64*" : "ptr"

    result := DllCall("ODBC32.dll\SQLBindCol", StatementHandleMarshal, StatementHandle, "ushort", ColumnNumber, "short", TargetType, TargetValueMarshal, TargetValue, "int64", BufferLength, StrLen_or_IndMarshal, StrLen_or_Ind, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} StatementHandle 
 * @param {Integer} ParameterNumber 
 * @param {Integer} ValueType 
 * @param {Integer} ParameterType 
 * @param {Integer} LengthPrecision 
 * @param {Integer} ParameterScale 
 * @param {Pointer<Void>} ParameterValue 
 * @param {Pointer<Integer>} StrLen_or_Ind 
 * @returns {Integer} 
 * @deprecated ODBC API: SQLBindParam is deprecated. Please use SQLBindParameter instead.
 */
export SQLBindParam(StatementHandle, ParameterNumber, ValueType, ParameterType, LengthPrecision, ParameterScale, ParameterValue, StrLen_or_Ind) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    ParameterValueMarshal := ParameterValue is VarRef ? "ptr" : "ptr"
    StrLen_or_IndMarshal := StrLen_or_Ind is VarRef ? "int64*" : "ptr"

    result := DllCall("ODBC32.dll\SQLBindParam", StatementHandleMarshal, StatementHandle, "ushort", ParameterNumber, "short", ValueType, "short", ParameterType, "uint", LengthPrecision, "short", ParameterScale, ParameterValueMarshal, ParameterValue, StrLen_or_IndMarshal, StrLen_or_Ind, Int16)
    return result
}

/**
 * SQLColAttribute Function
 * @remarks
 * For information about how applications use the information returned by **SQLColAttribute**, see [Result Set Metadata](../../../odbc/reference/develop-app/result-set-metadata.md).  
 *   
 *  **SQLColAttribute** returns information either in \**NumericAttributePtr* or in \**CharacterAttributePtr*. Integer information is returned in \**NumericAttributePtr* as a SQLLEN value; all other formats of information are returned in \**CharacterAttributePtr*. When information is returned in \**NumericAttributePtr*, the driver ignores *CharacterAttributePtr*, *BufferLength*, and *StringLengthPtr*. When information is returned in \**CharacterAttributePtr*, the driver ignores *NumericAttributePtr*.  
 *   
 *  **SQLColAttribute** returns values from the descriptor fields of the IRD. The function is called with a statement handle rather than a descriptor handle. The values returned by **SQLColAttribute** for the *FieldIdentifier* values listed later in this section can also be retrieved by calling **SQLGetDescField** with the appropriate IRD handle.  
 *   
 *  The currently defined descriptor fields, the version of ODBC in which they were introduced, and the arguments in which information is returned for them are shown later in this section; more descriptor types may be defined by drivers to take advantage of different data sources.  
 *   
 *  An ODBC 3.*x* driver must return a value for each of the descriptor fields. If a descriptor field does not apply to a driver or data source and unless otherwise stated, the driver returns 0 in \**StringLengthPtr* or an empty string in **CharacterAttributePtr*.
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Integer} ColumnNumber [Input] The number of the record in the IRD from which the field value is to be retrieved. This argument corresponds to the column number of result data, ordered sequentially in increasing column order, starting at 1. Columns can be described in any order.  
 *   
 *  Column 0 can be specified in this argument, but all values except SQL_DESC_TYPE and SQL_DESC_OCTET_LENGTH will return undefined values.
 * @param {Integer} FieldIdentifier [Input] The descriptor handle. This handle defines which field in the IRD should be queried (for example, SQL_COLUMN_TABLE_NAME).
 * @param {Integer} CharacterAttribute 
 * @param {Integer} BufferLength [Input] If *FieldIdentifier* is an ODBC-defined field and *CharacterAttributePtr* points to a character string or binary buffer, this argument should be the length of \**CharacterAttributePtr*. If *FieldIdentifier* is an ODBC-defined field and \**CharacterAttribute*Ptr is an integer, this field is ignored. If the *\*CharacterAttributePtr* is a Unicode string (when calling **SQLColAttributeW**), the *BufferLength* argument must be an even number. If *FieldIdentifier* is a driver-defined field, the application indicates the nature of the field to the Driver Manager by setting the *BufferLength* argument. *BufferLength* can have the following values:  
 *   
 * -   If *CharacterAttributePtr* is a pointer to a pointer, *BufferLength* should have the value SQL_IS_POINTER.  
 *   
 * -   If *CharacterAttributePtr* is a pointer to a character string, the *BufferLength* is the length of the buffer.  
 *   
 * -   If *CharacterAttributePtr* is a pointer to a binary buffer, the application places the result of the SQL_LEN_BINARY_ATTR(*length*) macro in *BufferLength*. This places a negative value in *BufferLength*.  
 *   
 * -   If *CharacterAttributePtr* is a pointer to a fixed-length data type, *BufferLength* must be one of the following: SQL_IS_INTEGER, SQL_IS_UINTEGER, SQL_IS_SMALLINT, or SQL_IS_USMALLINT.
 * @param {Pointer<Integer>} StringLength 
 * @param {Pointer<Integer>} NumericAttribute 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcolattribute-function
 */
export SQLColAttribute(StatementHandle, ColumnNumber, FieldIdentifier, CharacterAttribute, BufferLength, StringLength, NumericAttribute) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    StringLengthMarshal := StringLength is VarRef ? "short*" : "ptr"
    NumericAttributeMarshal := NumericAttribute is VarRef ? "int64*" : "ptr"

    result := DllCall("ODBC32.dll\SQLColAttribute", StatementHandleMarshal, StatementHandle, "ushort", ColumnNumber, "ushort", FieldIdentifier, "ptr", CharacterAttribute, "short", BufferLength, StringLengthMarshal, StringLength, NumericAttributeMarshal, NumericAttribute, Int16)
    return result
}

/**
 * SQLDescribeCol Function
 * @remarks
 * An application typically calls **SQLDescribeCol** after a call to **SQLPrepare** and before or after the associated call to **SQLExecute**. An application can also call **SQLDescribeCol** after a call to **SQLExecDirect**. For more information, see [Result Set Metadata](../../../odbc/reference/develop-app/result-set-metadata.md).  
 *   
 *  **SQLDescribeCol** retrieves the column name, type, and length generated by a **SELECT** statement. If the column is an expression, **ColumnName* is either an empty string or a driver-defined name.  
 *   
 * > [!NOTE]  
 * >  ODBC supports SQL_NULLABLE_UNKNOWN as an extension, even though the Open Group and SQL Access Group Call Level Interface specification does not specify the option for **SQLDescribeCol**.
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Integer} ColumnNumber [Input] Column number of result data, ordered sequentially in increasing column order, starting at 1. The *ColumnNumber* argument can also be set to 0 to describe the bookmark column.
 * @param {Pointer<Integer>} ColumnName [Output] Pointer to a null-terminated buffer in which to return the column name. This value is read from the SQL_DESC_NAME field of the IRD. If the column is unnamed or the column name cannot be determined, the driver returns an empty string.  
 *   
 *  If *ColumnName* is NULL, *NameLengthPtr* will still return the total number of characters (excluding the null-termination character for character data) available to return in the buffer pointed to by *ColumnName*.
 * @param {Integer} BufferLength [Input] Length of the **ColumnName* buffer, in characters.
 * @param {Pointer<Integer>} NameLength 
 * @param {Pointer<Integer>} DataType 
 * @param {Pointer<Integer>} ColumnSize 
 * @param {Pointer<Integer>} DecimalDigits 
 * @param {Pointer<Integer>} Nullable 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldescribecol-function
 */
export SQLDescribeCol(StatementHandle, ColumnNumber, ColumnName, BufferLength, NameLength, DataType, ColumnSize, DecimalDigits, Nullable) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    ColumnNameMarshal := ColumnName is VarRef ? "char*" : "ptr"
    NameLengthMarshal := NameLength is VarRef ? "short*" : "ptr"
    DataTypeMarshal := DataType is VarRef ? "short*" : "ptr"
    ColumnSizeMarshal := ColumnSize is VarRef ? "uint*" : "ptr"
    DecimalDigitsMarshal := DecimalDigits is VarRef ? "short*" : "ptr"
    NullableMarshal := Nullable is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLDescribeCol", StatementHandleMarshal, StatementHandle, "ushort", ColumnNumber, ColumnNameMarshal, ColumnName, "short", BufferLength, NameLengthMarshal, NameLength, DataTypeMarshal, DataType, ColumnSizeMarshal, ColumnSize, DecimalDigitsMarshal, DecimalDigits, NullableMarshal, Nullable, Int16)
    return result
}

/**
 * SQLFetchScroll Function
 * @remarks
 * **SQLFetchScroll** returns a specified rowset from the result set. Rowsets can be specified by absolute or relative position or by bookmark. **SQLFetchScroll** can be called only while a result set exists - that is, after a call that creates a result set and before the cursor over that result set is closed. If any columns are bound, it returns the data in those columns. If the application has specified a pointer to a row status array or a buffer in which to return the number of rows fetched, **SQLFetchScroll** returns this information as well. Calls to **SQLFetchScroll** can be mixed with calls to **SQLFetch** but cannot be mixed with calls to **SQLExtendedFetch**.  
 *   
 *  For more information, see [Using Block Cursors](../../../odbc/reference/develop-app/using-block-cursors.md) and [Using Scrollable Cursors](../../../odbc/reference/develop-app/using-scrollable-cursors.md).
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Integer} FetchOrientation [Input]  
 *   
 *  Type of fetch:  
 *   
 *  SQL_FETCH_NEXT  
 *   
 *  SQL_FETCH_PRIOR  
 *   
 *  SQL_FETCH_FIRST  
 *   
 *  SQL_FETCH_LAST  
 *   
 *  SQL_FETCH_ABSOLUTE  
 *   
 *  SQL_FETCH_RELATIVE  
 *   
 *  SQL_FETCH_BOOKMARK  
 *   
 *  For more information, see "Positioning the Cursor" in the "Comments" section.
 * @param {Integer} FetchOffset [Input]  
 *   
 *  Number of the row to fetch. The interpretation of this argument depends on the value of the *FetchOrientation* argument. For more information, see "Positioning the Cursor" in the "Comments" section.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfetchscroll-function
 */
export SQLFetchScroll(StatementHandle, FetchOrientation, FetchOffset) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLFetchScroll", StatementHandleMarshal, StatementHandle, "short", FetchOrientation, "int64", FetchOffset, Int16)
    return result
}

/**
 * SQLGetData Function
 * @remarks
 * **SQLGetData** returns the data in a specified column. **SQLGetData** can be called only after one or more rows have been fetched from the result set by **SQLFetch**, **SQLFetchScroll**, or **SQLExtendedFetch**. If variable-length data is too large to be returned in a single call to **SQLGetData** (due to a limitation in the application), **SQLGetData** can retrieve it in parts. It is possible to bind some columns in a row and call **SQLGetData** for others, although this is subject to some restrictions. For more information, see [Getting Long Data](../../../odbc/reference/develop-app/getting-long-data.md).  
 *   
 *  For information about using **SQLGetData** with streamed output parameters, see [Retrieving Output Parameters Using SQLGetData](../../../odbc/reference/develop-app/retrieving-output-parameters-using-sqlgetdata.md).
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Integer} ColumnNumber 
 * @param {Integer} TargetType [Input] The type identifier of the C data type of the **TargetValuePtr* buffer. For a list of valid C data types and type identifiers, see the [C Data Types](../../../odbc/reference/appendixes/c-data-types.md) section in Appendix D: Data Types.  
 *   
 *  If *TargetType* is SQL_ARD_TYPE, the driver uses the type identifier specified in the SQL_DESC_CONCISE_TYPE field of the ARD. If *TargetType* is SQL_APD_TYPE, **SQLGetData** will use the same C data type that was specified in **SQLBindParameter**. Otherwise, the C data type specified in **SQLGetData** overrides the C data type specified in **SQLBindParameter**. If it is SQL_C_DEFAULT, the driver selects the default C data type based on the SQL data type of the source.  
 *   
 *  You can also specify an extended C data type. For more information, see [C Data Types in ODBC](../../../odbc/reference/develop-app/c-data-types-in-odbc.md).
 * @param {Pointer<Void>} TargetValue 
 * @param {Integer} BufferLength [Input] Length of the **TargetValuePtr* buffer in bytes.  
 *   
 *  The driver uses *BufferLength* to avoid writing past the end of the \**TargetValuePtr* buffer when returning variable-length data, such as character or binary data. Note that the driver counts the null-termination character when returning character data to \**TargetValuePtr*. **TargetValuePtr* must therefore contain space for the null-termination character, or the driver will truncate the data.  
 *   
 *  When the driver returns fixed-length data, such as an integer or a date structure, the driver ignores *BufferLength* and assumes the buffer is large enough to hold the data. It is therefore important for the application to allocate a large enough buffer for fixed-length data or the driver will write past the end of the buffer.
 * @param {Pointer<Integer>} StrLen_or_IndPtr [Output] Pointer to the buffer in which to return the length or indicator value. If this is a null pointer, no length or indicator value is returned. This returns an error when the data being fetched is NULL.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetdata-function
 */
export SQLGetData(StatementHandle, ColumnNumber, TargetType, TargetValue, BufferLength, StrLen_or_IndPtr) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    TargetValueMarshal := TargetValue is VarRef ? "ptr" : "ptr"
    StrLen_or_IndPtrMarshal := StrLen_or_IndPtr is VarRef ? "int64*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetData", StatementHandleMarshal, StatementHandle, "ushort", ColumnNumber, "short", TargetType, TargetValueMarshal, TargetValue, "int64", BufferLength, StrLen_or_IndPtrMarshal, StrLen_or_IndPtr, Int16)
    return result
}

/**
 * SQLGetDescRec Function
 * @remarks
 * An application can call **SQLGetDescRec** to retrieve the values of the following descriptor fields for a single column or parameter:  
 *   
 * -   SQL_DESC_NAME  
 *   
 * -   SQL_DESC_TYPE  
 *   
 * -   SQL_DESC_DATETIME_INTERVAL_CODE (for records whose type is SQL_DATETIME or SQL_INTERVAL)  
 *   
 * -   SQL_DESC_OCTET_LENGTH  
 *   
 * -   SQL_DESC_PRECISION  
 *   
 * -   SQL_DESC_SCALE  
 *   
 * -   SQL_DESC_NULLABLE  
 *   
 *  **SQLGetDescRec** does not retrieve the values for header fields.  
 *   
 *  An application can prevent the return of a field's setting by setting the argument that corresponds to the field to a null pointer.  
 *   
 *  When an application calls **SQLGetDescRec** to retrieve the value of a field that is undefined for a particular descriptor type, the function returns SQL_SUCCESS but the value returned for the field is undefined. For example, calling **SQLGetDescRec** for the SQL_DESC_NAME or SQL_DESC_NULLABLE field of an APD or ARD will return SQL_SUCCESS but an undefined value for the field.  
 *   
 *  When an application calls **SQLGetDescRec** to retrieve the value of a field that is defined for a particular descriptor type but that has no default value and has not been set yet, the function returns SQL_SUCCESS but the value returned for the field is undefined. For more information, see "Initialization of Descriptor Fields" in [SQLSetDescField](../../../odbc/reference/syntax/sqlsetdescfield-function.md).  
 *   
 *  The values of fields can also be retrieved individually by a call to **SQLGetDescField**. For a description of the fields in a descriptor header or record, see [SQLSetDescField](../../../odbc/reference/syntax/sqlsetdescfield-function.md). For more information about descriptors, see [Descriptors](../../../odbc/reference/develop-app/descriptors.md).
 * @param {Pointer<Void>} DescriptorHandle [Input] Descriptor handle.
 * @param {Integer} RecNumber [Input] Indicates the descriptor record from which the application seeks information. Descriptor records are numbered from 1, with record number 0 being the bookmark record. The *RecNumber* argument must be less than or equal to the value of SQL_DESC_COUNT. If *RecNumber* is less than or equal to SQL_DESC_COUNT but the row does not contain data for a column or parameter, a call to **SQLGetDescRec** will return the default values of the fields. (For more information, see "Initialization of Descriptor Fields" in [SQLSetDescField](../../../odbc/reference/syntax/sqlsetdescfield-function.md).)
 * @param {Pointer<Integer>} Name [Output] A pointer to a buffer in which to return the SQL_DESC_NAME field for the descriptor record.  
 *   
 *  If *Name* is NULL, *StringLengthPtr* will still return the total number of characters (excluding the null-termination character for character data) available to return in the buffer pointed to by *Name*.
 * @param {Integer} BufferLength [Input] Length of the **Name* buffer, in characters.
 * @param {Pointer<Integer>} StringLengthPtr [Output] A pointer to a buffer in which to return the number of characters of data available to return in the \**Name* buffer, excluding the null-termination character. If the number of characters was greater than or equal to *BufferLength*, the data in \**Name* is truncated to *BufferLength* minus the length of a null-termination character, and is null-terminated by the driver.
 * @param {Pointer<Integer>} TypePtr [Output] A pointer to a buffer in which to return the value of the SQL_DESC_TYPE field for the descriptor record.
 * @param {Pointer<Integer>} SubTypePtr [Output] For records whose type is SQL_DATETIME or SQL_INTERVAL, this is a pointer to a buffer in which to return the value of the SQL_DESC_DATETIME_INTERVAL_CODE field.
 * @param {Pointer<Integer>} LengthPtr [Output] A pointer to a buffer in which to return the value of the SQL_DESC_OCTET_LENGTH field for the descriptor record.
 * @param {Pointer<Integer>} PrecisionPtr [Output] A pointer to a buffer in which to return the value of the SQL_DESC_PRECISION field for the descriptor record.
 * @param {Pointer<Integer>} ScalePtr [Output] A pointer to a buffer in which to return the value of the SQL_DESC_SCALE field for the descriptor record.
 * @param {Pointer<Integer>} NullablePtr [Output] A pointer to a buffer in which to return the value of the SQL_DESC_NULLABLE field for the descriptor record.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, SQL_NO_DATA, or SQL_INVALID_HANDLE.  
 *   
 *  SQL_NO_DATA is returned if *RecNumber* is greater than the current number of descriptor records.  
 *   
 *  SQL_NO_DATA is returned if *DescriptorHandle* is an IRD handle and the statement is in the prepared or executed state but there was no open cursor associated with it.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetdescrec-function
 */
export SQLGetDescRec(DescriptorHandle, RecNumber, Name, BufferLength, StringLengthPtr, TypePtr, SubTypePtr, LengthPtr, PrecisionPtr, ScalePtr, NullablePtr) {
    DescriptorHandleMarshal := DescriptorHandle is VarRef ? "ptr" : "ptr"
    NameMarshal := Name is VarRef ? "char*" : "ptr"
    StringLengthPtrMarshal := StringLengthPtr is VarRef ? "short*" : "ptr"
    TypePtrMarshal := TypePtr is VarRef ? "short*" : "ptr"
    SubTypePtrMarshal := SubTypePtr is VarRef ? "short*" : "ptr"
    LengthPtrMarshal := LengthPtr is VarRef ? "int64*" : "ptr"
    PrecisionPtrMarshal := PrecisionPtr is VarRef ? "short*" : "ptr"
    ScalePtrMarshal := ScalePtr is VarRef ? "short*" : "ptr"
    NullablePtrMarshal := NullablePtr is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetDescRec", DescriptorHandleMarshal, DescriptorHandle, "short", RecNumber, NameMarshal, Name, "short", BufferLength, StringLengthPtrMarshal, StringLengthPtr, TypePtrMarshal, TypePtr, SubTypePtrMarshal, SubTypePtr, LengthPtrMarshal, LengthPtr, PrecisionPtrMarshal, PrecisionPtr, ScalePtrMarshal, ScalePtr, NullablePtrMarshal, NullablePtr, Int16)
    return result
}

/**
 * SQLPutData Function
 * @remarks
 * **SQLPutData** can be called to supply data-at-execution data for two uses: parameter data to be used in a call to **SQLExecute** or **SQLExecDirect**, or column data to be used when a row is updated or added by a call to **SQLBulkOperations** or is updated by a call to **SQLSetPos**.  
 *   
 *  When an application calls **SQLParamData** to determine which data it should send, the driver returns an indicator that the application can use to determine which parameter data to send or where column data can be found. It also returns SQL_NEED_DATA, which is an indicator to the application that it should call **SQLPutData** to send the data. In the *DataPtr* argument to **SQLPutData**, the application passes a pointer to the buffer containing the actual data for the parameter or column.  
 *   
 *  When the driver returns SQL_SUCCESS for **SQLPutData**, the application calls **SQLParamData** again. **SQLParamData** returns SQL_NEED_DATA if more data needs to be sent, in which case the application calls **SQLPutData** again. It returns SQL_SUCCESS if all data-at-execution data has been sent. The application then calls **SQLParamData** again. If the driver returns SQL_NEED_DATA and another indicator in *\*ValuePtrPtr*, it requires data for another parameter or column and **SQLPutData** is called again. If the driver returns SQL_SUCCESS, then all data-at-execution data has been sent and the SQL statement can be executed or the **SQLBulkOperations** or **SQLSetPos** call can be processed.  
 *   
 *  For more information on how data-at-execution parameter data is passed at statement execution time, see "Passing Parameter Values" in [SQLBindParameter](../../../odbc/reference/syntax/sqlbindparameter-function.md) and [Sending Long Data](../../../odbc/reference/develop-app/sending-long-data.md). For more information on how data-at-execution column data is updated or added, see the section "Using SQLSetPos" in [SQLSetPos](../../../odbc/reference/syntax/sqlsetpos-function.md), "Performing Bulk Updates Using Bookmarks" in [SQLBulkOperations](../../../odbc/reference/syntax/sqlbulkoperations-function.md), and [Long Data and SQLSetPos and SQLBulkOperations](../../../odbc/reference/develop-app/long-data-and-sqlsetpos-and-sqlbulkoperations.md).  
 *   
 * > [!NOTE]  
 * >  An application can use **SQLPutData** to send data in parts only when sending character C data to a column with a character, binary, or data source-specific data type or when sending binary C data to a column with a character, binary, or data source-specific data type. If **SQLPutData** is called more than once under any other conditions, it returns SQL_ERROR and SQLSTATE HY019 (Non-character and non-binary data sent in pieces).
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Pointer<Void>} Data 
 * @param {Integer} StrLen_or_Ind [Input] Length of \**DataPtr*. Specifies the amount of data sent in a call to **SQLPutData**. The amount of data can vary with each call for a given parameter or column. *StrLen_or_Ind* is ignored unless it meets one of the following conditions:  
 *   
 * -   *StrLen_or_Ind* is SQL_NTS, SQL_NULL_DATA, or SQL_DEFAULT_PARAM.  
 *   
 * -   The C data type specified in **SQLBindParameter** or **SQLBindCol** is SQL_C_CHAR or SQL_C_BINARY.  
 *   
 * -   The C data type is SQL_C_DEFAULT, and the default C data type for the specified SQL data type is SQL_C_CHAR or SQL_C_BINARY.  
 *   
 *  For all other types of C data, if *StrLen_or_Ind* is not SQL_NULL_DATA or SQL_DEFAULT_PARAM, the driver assumes that the size of the \**DataPtr* buffer is the size of the C data type specified with *ValueType* or *TargetType* and sends the entire data value. For more information, see [Converting Data from C to SQL Data Types](../../../odbc/reference/appendixes/converting-data-from-c-to-sql-data-types.md) in Appendix D: Data Types.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlputdata-function
 */
export SQLPutData(StatementHandle, Data, StrLen_or_Ind) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    DataMarshal := Data is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLPutData", StatementHandleMarshal, StatementHandle, DataMarshal, Data, "int64", StrLen_or_Ind, Int16)
    return result
}

/**
 * SQLRowCount Function
 * @remarks
 * If the last SQL statement executed on the statement handle was not an **UPDATE**, **INSERT**, or **DELETE** statement or if the *Operation* argument in the previous call to **SQLBulkOperations** was not SQL_ADD, SQL_UPDATE_BY_BOOKMARK, or SQL_DELETE_BY_BOOKMARK, or if the *Operation* argument in the previous call to **SQLSetPos** was not SQL_UPDATE or SQL_DELETE, the value of **RowCountPtr* is driver-defined. For more information, see [Determining the Number of Affected Rows](../../../odbc/reference/develop-app/determining-the-number-of-affected-rows.md).
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Pointer<Integer>} RowCount 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlrowcount-function
 */
export SQLRowCount(StatementHandle, RowCount) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    RowCountMarshal := RowCount is VarRef ? "int64*" : "ptr"

    result := DllCall("ODBC32.dll\SQLRowCount", StatementHandleMarshal, StatementHandle, RowCountMarshal, RowCount, Int16)
    return result
}

/**
 * SQLSetConnectOption Function
 * @remarks
 * See [ODBC 64-Bit Information](../../../odbc/reference/odbc-64-bit-information.md), if your application will run on a 64-bit operating system.  
 *   
 * > [!NOTE]  
 * >  The attribute SQL_ASYNC_DBC_FUNCTION_ENABLE introduced in ODBC 3.8 is not supported by **SQLSetConnectOption**. Applications that use the asynchronous operation on connection handle must use **SQLSetConnectAttr**.
 * @param {Pointer<Void>} ConnectionHandle 
 * @param {Integer} Option 
 * @param {Integer} Value 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetconnectoption-function
 * @deprecated ODBC API: SQLSetConnectOption is deprecated. Please use SQLSetConnectAttr instead.
 */
export SQLSetConnectOption(ConnectionHandle, Option, Value) {
    ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetConnectOption", ConnectionHandleMarshal, ConnectionHandle, "ushort", Option, "uint", Value, Int16)
    return result
}

/**
 * SQLSetDescRec Function
 * @remarks
 * An application can call **SQLSetDescRec** to set the following fields for a single column or parameter:  
 *   
 * -   SQL_DESC_TYPE  
 *   
 * -   SQL_DESC_DATETIME_INTERVAL_CODE (for records whose type is SQL_DATETIME or SQL_INTERVAL)  
 *   
 * -   SQL_DESC_OCTET_LENGTH  
 *   
 * -   SQL_DESC_PRECISION  
 *   
 * -   SQL_DESC_SCALE  
 *   
 * -   SQL_DESC_DATA_PTR  
 *   
 * -   SQL_DESC_OCTET_LENGTH_PTR  
 *   
 * -   SQL_DESC_INDICATOR_PTR  
 *   
 * > [!NOTE]  
 * >  If a call to **SQLSetDescRec** fails, the contents of the descriptor record identified by the *RecNumber* argument are undefined.  
 *   
 *  When binding a column or parameter, **SQLSetDescRec** allows you to change multiple fields affecting the binding without calling **SQLBindCol** or **SQLBindParameter** or making multiple calls to **SQLSetDescField**. **SQLSetDescRec** can set fields on a descriptor not currently associated with a statement. Note that **SQLBindParameter** sets more fields than **SQLSetDescRec**, can set fields on both an APD and an IPD in one call, and does not require a descriptor handle.  
 *   
 * > [!NOTE]  
 * >  The statement attribute SQL_ATTR_USE_BOOKMARKS should always be set before calling **SQLSetDescRec** with a *RecNumber* argument of 0 to set bookmark fields. While this is not mandatory, it is strongly recommended.
 * @param {Pointer<Void>} DescriptorHandle [Input] Descriptor handle. This must not be an IRD handle.
 * @param {Integer} RecNumber [Input] Indicates the descriptor record that contains the fields to be set. Descriptor records are numbered from 0, with record number 0 being the bookmark record. This argument must be equal to or greater than 0. If *RecNumber* is greater than the value of SQL_DESC_COUNT, SQL_DESC_COUNTis changed to the value of *RecNumber*.
 * @param {Integer} Type [Input] The value to which to set the SQL_DESC_TYPE field for the descriptor record.
 * @param {Integer} SubType [Input] For records whose type is SQL_DATETIME or SQL_INTERVAL, this is the value to which to set the SQL_DESC_DATETIME_INTERVAL_CODE field.
 * @param {Integer} Length [Input] The value to which to set the SQL_DESC_OCTET_LENGTH field for the descriptor record.
 * @param {Integer} Precision [Input] The value to which to set the SQL_DESC_PRECISION field for the descriptor record.
 * @param {Integer} Scale [Input] The value to which to set the SQL_DESC_SCALE field for the descriptor record.
 * @param {Integer} Data 
 * @param {Pointer<Integer>} StringLength 
 * @param {Pointer<Integer>} Indicator 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetdescrec-function
 */
export SQLSetDescRec(DescriptorHandle, RecNumber, Type, SubType, Length, Precision, Scale, Data, StringLength, Indicator) {
    DescriptorHandleMarshal := DescriptorHandle is VarRef ? "ptr" : "ptr"
    StringLengthMarshal := StringLength is VarRef ? "int64*" : "ptr"
    IndicatorMarshal := Indicator is VarRef ? "int64*" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetDescRec", DescriptorHandleMarshal, DescriptorHandle, "short", RecNumber, "short", Type, "short", SubType, "int64", Length, "short", Precision, "short", Scale, "ptr", Data, StringLengthMarshal, StringLength, IndicatorMarshal, Indicator, Int16)
    return result
}

/**
 * SQLSetParam Function
 * @remarks
 * See [ODBC 64-Bit Information](../../../odbc/reference/odbc-64-bit-information.md), if your application will run on a 64-bit operating system.
 * @param {Pointer<Void>} StatementHandle 
 * @param {Integer} ParameterNumber 
 * @param {Integer} ValueType 
 * @param {Integer} ParameterType 
 * @param {Integer} LengthPrecision 
 * @param {Integer} ParameterScale 
 * @param {Pointer<Void>} ParameterValue 
 * @param {Pointer<Integer>} StrLen_or_Ind 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetparam-function
 * @deprecated ODBC API: SQLSetParam is deprecated. Please use SQLBindParameter instead.
 */
export SQLSetParam(StatementHandle, ParameterNumber, ValueType, ParameterType, LengthPrecision, ParameterScale, ParameterValue, StrLen_or_Ind) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    ParameterValueMarshal := ParameterValue is VarRef ? "ptr" : "ptr"
    StrLen_or_IndMarshal := StrLen_or_Ind is VarRef ? "int64*" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetParam", StatementHandleMarshal, StatementHandle, "ushort", ParameterNumber, "short", ValueType, "short", ParameterType, "uint", LengthPrecision, "short", ParameterScale, ParameterValueMarshal, ParameterValue, StrLen_or_IndMarshal, StrLen_or_Ind, Int16)
    return result
}

/**
 * SQLSetStmtOption Function
 * @remarks
 * See [ODBC 64-Bit Information](../../../odbc/reference/odbc-64-bit-information.md), if your application will run on a 64-bit operating system.
 * @param {Pointer<Void>} StatementHandle 
 * @param {Integer} Option 
 * @param {Integer} Value 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetstmtoption-function
 * @deprecated ODBC API: SQLSetStmtOption is deprecated. Please use SQLSetStmtAttr instead.
 */
export SQLSetStmtOption(StatementHandle, Option, Value) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetStmtOption", StatementHandleMarshal, StatementHandle, "ushort", Option, "uint", Value, Int16)
    return result
}

/**
 * SQLColAttributes Function
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} icol 
 * @param {Integer} fDescType 
 * @param {Pointer<Void>} rgbDesc 
 * @param {Integer} cbDescMax 
 * @param {Pointer<Integer>} pcbDesc 
 * @param {Pointer<Integer>} pfDesc 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcolattributes-function
 */
export SQLColAttributes(hstmt, icol, fDescType, rgbDesc, cbDescMax, pcbDesc, pfDesc) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    rgbDescMarshal := rgbDesc is VarRef ? "ptr" : "ptr"
    pcbDescMarshal := pcbDesc is VarRef ? "short*" : "ptr"
    pfDescMarshal := pfDesc is VarRef ? "int64*" : "ptr"

    result := DllCall("ODBC32.dll\SQLColAttributes", hstmtMarshal, hstmt, "ushort", icol, "ushort", fDescType, rgbDescMarshal, rgbDesc, "short", cbDescMax, pcbDescMarshal, pcbDesc, pfDescMarshal, pfDesc, Int16)
    return result
}

/**
 * SQLDescribeParam Function
 * @remarks
 * Parameter markers are numbered in increasing parameter order, starting with 1, in the order they appear in the SQL statement.  
 *   
 *  **SQLDescribeParam** does not return the type (input, input/output, or output) of a parameter in an SQL statement. Except in calls to procedures, all parameters in SQL statements are input parameters. To determine the type of each parameter in a call to a procedure, an application calls **SQLProcedureColumns**.  
 *   
 *  For more information, see [Describing Parameters](../../../odbc/reference/develop-app/describing-parameters.md).
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} ipar 
 * @param {Pointer<Integer>} pfSqlType 
 * @param {Pointer<Integer>} pcbParamDef 
 * @param {Pointer<Integer>} pibScale 
 * @param {Pointer<Integer>} pfNullable 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldescribeparam-function
 */
export SQLDescribeParam(hstmt, ipar, pfSqlType, pcbParamDef, pibScale, pfNullable) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    pfSqlTypeMarshal := pfSqlType is VarRef ? "short*" : "ptr"
    pcbParamDefMarshal := pcbParamDef is VarRef ? "uint*" : "ptr"
    pibScaleMarshal := pibScale is VarRef ? "short*" : "ptr"
    pfNullableMarshal := pfNullable is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLDescribeParam", hstmtMarshal, hstmt, "ushort", ipar, pfSqlTypeMarshal, pfSqlType, pcbParamDefMarshal, pcbParamDef, pibScaleMarshal, pibScale, pfNullableMarshal, pfNullable, Int16)
    return result
}

/**
 * SQLExtendedFetch Function
 * @remarks
 * The behavior of **SQLExtendedFetch** is identical to that of **SQLFetchScroll**, with the following exceptions:  
 *   
 * -   **SQLExtendedFetch** and **SQLFetchScroll** use different methods to return the number of rows fetched. **SQLExtendedFetch** returns the number of rows fetched in *\*RowCountPtr*; **SQLFetchScroll** returns the number of rows fetched directly to the buffer pointed to by SQL_ATTR_ROWS_FETCHED_PTR. For more information, see the *RowCountPtr* argument.  
 *   
 * -   **SQLExtendedFetch** and **SQLFetchScroll** return the status of each row in different arrays. For more information, see the *RowStatusArray* argument.  
 *   
 * -   **SQLExtendedFetch** and **SQLFetchScroll** use different methods to retrieve the bookmark when *FetchOrientation* is SQL_FETCH_BOOKMARK. **SQLExtendedFetch** does not support variable-length bookmarks or fetching rowsets at an offset other than 0 from a bookmark. For more information, see the *FetchOffset* argument.  
 *   
 * -   **SQLExtendedFetch** and **SQLFetchScroll** use different rowset sizes. **SQLExtendedFetch** uses the value of the SQL_ROWSET_SIZE statement attribute, and **SQLFetchScroll** uses the value of the SQL_ATTR_ROW_ARRAY_SIZE statement attribute.  
 *   
 * -   **SQLExtendedFetch** has slightly different error handling semantics than **SQLFetchScroll**. For more information, see "Error Handling" in the "Comments" section of [SQLFetchScroll](../../../odbc/reference/syntax/sqlfetchscroll-function.md).  
 *   
 * -   **SQLExtendedFetch** does not support binding offsets (the SQL_ATTR_ROW_BIND_OFFSET_PTR statement attribute).  
 *   
 * -   Calls to **SQLExtendedFetch** cannot be mixed with calls to **SQLFetch** or **SQLFetchScroll**, and if **SQLBulkOperations** is called before any fetch function is called, **SQLExtendedFetch** cannot be called until the cursor is closed and reopened. That is, **SQLExtendedFetch** can be called only in statement state S7. For more information, see [Statement Transitions](../../../odbc/reference/appendixes/statement-transitions.md) in Appendix B: ODBC State Transition Tables.  
 *   
 *  When an application calls **SQLFetchScroll** while using an ODBC 2*.x* driver, the Driver Manager maps this call to **SQLExtendedFetch**. For more information, see "SQLFetchScroll and ODBC 2*.x* Drivers" in [SQLFetchScroll](../../../odbc/reference/syntax/sqlfetchscroll-function.md).  
 *   
 *  In ODBC 2*.x*, **SQLExtendedFetch** was called to fetch multiple rows and **SQLFetch** was called to fetch a single row. In ODBC 3*.x*, on the other hand, **SQLFetch** can be called to fetch multiple rows.
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} fFetchType 
 * @param {Integer} _irow 
 * @param {Pointer<Integer>} pcrow 
 * @param {Pointer<Integer>} rgfRowStatus 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlextendedfetch-function
 */
export SQLExtendedFetch(hstmt, fFetchType, _irow, pcrow, rgfRowStatus) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    pcrowMarshal := pcrow is VarRef ? "uint*" : "ptr"
    rgfRowStatusMarshal := rgfRowStatus is VarRef ? "ushort*" : "ptr"

    result := DllCall("ODBC32.dll\SQLExtendedFetch", hstmtMarshal, hstmt, "ushort", fFetchType, "int64", _irow, pcrowMarshal, pcrow, rgfRowStatusMarshal, rgfRowStatus, Int16)
    return result
}

/**
 * SQLParamOptions Function
 * @remarks
 * See [ODBC 64-Bit Information](../../../odbc/reference/odbc-64-bit-information.md), if your application will run on a 64-bit operating system.
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} crow 
 * @param {Pointer<Integer>} pirow 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlparamoptions-function
 */
export SQLParamOptions(hstmt, crow, pirow) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    pirowMarshal := pirow is VarRef ? "uint*" : "ptr"

    result := DllCall("ODBC32.dll\SQLParamOptions", hstmtMarshal, hstmt, "uint", crow, pirowMarshal, pirow, Int16)
    return result
}

/**
 * SQLSetPos Function
 * @remarks
 * > [!CAUTION]
 * >  For information on the statement states that **SQLSetPos** can be called in and what it needs to do for compatibility with ODBC *2.x* applications, see [Block Cursors, Scrollable Cursors, and Backward Compatibility](../../../odbc/reference/appendixes/block-cursors-scrollable-cursors-and-backward-compatibility.md).
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} _irow 
 * @param {Integer} fOption 
 * @param {Integer} fLock 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NEED_DATA, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetpos-function
 */
export SQLSetPos(hstmt, _irow, fOption, fLock) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetPos", hstmtMarshal, hstmt, "uint", _irow, "ushort", fOption, "ushort", fLock, Int16)
    return result
}

/**
 * SQLBindParameter Function
 * @remarks
 * An application calls **SQLBindParameter** to bind each parameter marker in an SQL statement. Bindings remain in effect until the application calls **SQLBindParameter** again, calls **SQLFreeStmt** with the SQL_RESET_PARAMS option, or calls **SQLSetDescField** to set the SQL_DESC_COUNT header field of the APD to 0.  
 *   
 *  For more information about parameters, see [Statement Parameters](../../../odbc/reference/develop-app/statement-parameters.md). For more information about parameter data types and parameter markers, see [Parameter Data Types](../../../odbc/reference/appendixes/parameter-data-types.md) and [Parameter Markers](../../../odbc/reference/appendixes/parameter-markers.md) in Appendix C: SQL Grammar.
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} ipar 
 * @param {Integer} fParamType 
 * @param {Integer} fCType 
 * @param {Integer} fSqlType 
 * @param {Integer} cbColDef 
 * @param {Integer} ibScale 
 * @param {Pointer<Void>} rgbValue 
 * @param {Integer} cbValueMax 
 * @param {Pointer<Integer>} pcbValue 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlbindparameter-function
 */
export SQLBindParameter(hstmt, ipar, fParamType, fCType, fSqlType, cbColDef, ibScale, rgbValue, cbValueMax, pcbValue) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    rgbValueMarshal := rgbValue is VarRef ? "ptr" : "ptr"
    pcbValueMarshal := pcbValue is VarRef ? "int64*" : "ptr"

    result := DllCall("ODBC32.dll\SQLBindParameter", hstmtMarshal, hstmt, "ushort", ipar, "short", fParamType, "short", fCType, "short", fSqlType, "uint", cbColDef, "short", ibScale, rgbValueMarshal, rgbValue, "int64", cbValueMax, pcbValueMarshal, pcbValue, Int16)
    return result
}

/**
 * SQLSetScrollOptions Function
 * @remarks
 * If your application will run on a 64-bit operating system, see [ODBC 64-Bit Information](../../../odbc/reference/odbc-64-bit-information.md).
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} fConcurrency 
 * @param {Integer} crowKeyset 
 * @param {Integer} crowRowset 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetscrolloptions-function
 */
export SQLSetScrollOptions(hstmt, fConcurrency, crowKeyset, crowRowset) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetScrollOptions", hstmtMarshal, hstmt, "ushort", fConcurrency, "int64", crowKeyset, "ushort", crowRowset, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} iCol 
 * @param {Integer} iField 
 * @param {Integer} pCharAttr 
 * @param {Integer} cbDescMax 
 * @param {Pointer<Integer>} pcbCharAttr 
 * @param {Pointer<Integer>} pNumAttr 
 * @returns {Integer} 
 */
export SQLColAttributeW(hstmt, iCol, iField, pCharAttr, cbDescMax, pcbCharAttr, pNumAttr) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    pcbCharAttrMarshal := pcbCharAttr is VarRef ? "short*" : "ptr"
    pNumAttrMarshal := pNumAttr is VarRef ? "int64*" : "ptr"

    result := DllCall("ODBC32.dll\SQLColAttributeW", hstmtMarshal, hstmt, "ushort", iCol, "ushort", iField, "ptr", pCharAttr, "short", cbDescMax, pcbCharAttrMarshal, pcbCharAttr, pNumAttrMarshal, pNumAttr, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} icol 
 * @param {Integer} fDescType 
 * @param {Integer} rgbDesc 
 * @param {Integer} cbDescMax 
 * @param {Pointer<Integer>} pcbDesc 
 * @param {Pointer<Integer>} pfDesc 
 * @returns {Integer} 
 */
export SQLColAttributesW(hstmt, icol, fDescType, rgbDesc, cbDescMax, pcbDesc, pfDesc) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    pcbDescMarshal := pcbDesc is VarRef ? "short*" : "ptr"
    pfDescMarshal := pfDesc is VarRef ? "int64*" : "ptr"

    result := DllCall("ODBC32.dll\SQLColAttributesW", hstmtMarshal, hstmt, "ushort", icol, "ushort", fDescType, "ptr", rgbDesc, "short", cbDescMax, pcbDescMarshal, pcbDesc, pfDescMarshal, pfDesc, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} icol 
 * @param {Pointer<Integer>} szColName 
 * @param {Integer} cchColNameMax 
 * @param {Pointer<Integer>} pcchColName 
 * @param {Pointer<Integer>} pfSqlType 
 * @param {Pointer<Integer>} pcbColDef 
 * @param {Pointer<Integer>} pibScale 
 * @param {Pointer<Integer>} pfNullable 
 * @returns {Integer} 
 */
export SQLDescribeColW(hstmt, icol, szColName, cchColNameMax, pcchColName, pfSqlType, pcbColDef, pibScale, pfNullable) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szColNameMarshal := szColName is VarRef ? "ushort*" : "ptr"
    pcchColNameMarshal := pcchColName is VarRef ? "short*" : "ptr"
    pfSqlTypeMarshal := pfSqlType is VarRef ? "short*" : "ptr"
    pcbColDefMarshal := pcbColDef is VarRef ? "uint*" : "ptr"
    pibScaleMarshal := pibScale is VarRef ? "short*" : "ptr"
    pfNullableMarshal := pfNullable is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLDescribeColW", hstmtMarshal, hstmt, "ushort", icol, szColNameMarshal, szColName, "short", cchColNameMax, pcchColNameMarshal, pcchColName, pfSqlTypeMarshal, pfSqlType, pcbColDefMarshal, pcbColDef, pibScaleMarshal, pibScale, pfNullableMarshal, pfNullable, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdesc 
 * @param {Integer} iRecord 
 * @param {Pointer<Integer>} szName 
 * @param {Integer} cchNameMax 
 * @param {Pointer<Integer>} pcchName 
 * @param {Pointer<Integer>} pfType 
 * @param {Pointer<Integer>} pfSubType 
 * @param {Pointer<Integer>} pLength 
 * @param {Pointer<Integer>} pPrecision 
 * @param {Pointer<Integer>} pScale 
 * @param {Pointer<Integer>} pNullable 
 * @returns {Integer} 
 */
export SQLGetDescRecW(hdesc, iRecord, szName, cchNameMax, pcchName, pfType, pfSubType, pLength, pPrecision, pScale, pNullable) {
    hdescMarshal := hdesc is VarRef ? "ptr" : "ptr"
    szNameMarshal := szName is VarRef ? "ushort*" : "ptr"
    pcchNameMarshal := pcchName is VarRef ? "short*" : "ptr"
    pfTypeMarshal := pfType is VarRef ? "short*" : "ptr"
    pfSubTypeMarshal := pfSubType is VarRef ? "short*" : "ptr"
    pLengthMarshal := pLength is VarRef ? "int64*" : "ptr"
    pPrecisionMarshal := pPrecision is VarRef ? "short*" : "ptr"
    pScaleMarshal := pScale is VarRef ? "short*" : "ptr"
    pNullableMarshal := pNullable is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetDescRecW", hdescMarshal, hdesc, "short", iRecord, szNameMarshal, szName, "short", cchNameMax, pcchNameMarshal, pcchName, pfTypeMarshal, pfType, pfSubTypeMarshal, pfSubType, pLengthMarshal, pLength, pPrecisionMarshal, pPrecision, pScaleMarshal, pScale, pNullableMarshal, pNullable, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Integer} fOption 
 * @param {Integer} vParam 
 * @returns {Integer} 
 */
export SQLSetConnectOptionW(hdbc, fOption, vParam) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetConnectOptionW", hdbcMarshal, hdbc, "ushort", fOption, "uint", vParam, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} iCol 
 * @param {Integer} iField 
 * @param {Integer} pCharAttr 
 * @param {Integer} cbCharAttrMax 
 * @param {Pointer<Integer>} pcbCharAttr 
 * @param {Pointer<Integer>} pNumAttr 
 * @returns {Integer} 
 */
export SQLColAttributeA(hstmt, iCol, iField, pCharAttr, cbCharAttrMax, pcbCharAttr, pNumAttr) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    pcbCharAttrMarshal := pcbCharAttr is VarRef ? "short*" : "ptr"
    pNumAttrMarshal := pNumAttr is VarRef ? "int64*" : "ptr"

    result := DllCall("ODBC32.dll\SQLColAttributeA", hstmtMarshal, hstmt, "short", iCol, "short", iField, "ptr", pCharAttr, "short", cbCharAttrMax, pcbCharAttrMarshal, pcbCharAttr, pNumAttrMarshal, pNumAttr, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} icol 
 * @param {Integer} fDescType 
 * @param {Integer} rgbDesc 
 * @param {Integer} cbDescMax 
 * @param {Pointer<Integer>} pcbDesc 
 * @param {Pointer<Integer>} pfDesc 
 * @returns {Integer} 
 */
export SQLColAttributesA(hstmt, icol, fDescType, rgbDesc, cbDescMax, pcbDesc, pfDesc) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    pcbDescMarshal := pcbDesc is VarRef ? "short*" : "ptr"
    pfDescMarshal := pfDesc is VarRef ? "int64*" : "ptr"

    result := DllCall("ODBC32.dll\SQLColAttributesA", hstmtMarshal, hstmt, "ushort", icol, "ushort", fDescType, "ptr", rgbDesc, "short", cbDescMax, pcbDescMarshal, pcbDesc, pfDescMarshal, pfDesc, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} icol 
 * @param {Pointer<Integer>} szColName 
 * @param {Integer} cbColNameMax 
 * @param {Pointer<Integer>} pcbColName 
 * @param {Pointer<Integer>} pfSqlType 
 * @param {Pointer<Integer>} pcbColDef 
 * @param {Pointer<Integer>} pibScale 
 * @param {Pointer<Integer>} pfNullable 
 * @returns {Integer} 
 */
export SQLDescribeColA(hstmt, icol, szColName, cbColNameMax, pcbColName, pfSqlType, pcbColDef, pibScale, pfNullable) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szColNameMarshal := szColName is VarRef ? "char*" : "ptr"
    pcbColNameMarshal := pcbColName is VarRef ? "short*" : "ptr"
    pfSqlTypeMarshal := pfSqlType is VarRef ? "short*" : "ptr"
    pcbColDefMarshal := pcbColDef is VarRef ? "uint*" : "ptr"
    pibScaleMarshal := pibScale is VarRef ? "short*" : "ptr"
    pfNullableMarshal := pfNullable is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLDescribeColA", hstmtMarshal, hstmt, "ushort", icol, szColNameMarshal, szColName, "short", cbColNameMax, pcbColNameMarshal, pcbColName, pfSqlTypeMarshal, pfSqlType, pcbColDefMarshal, pcbColDef, pibScaleMarshal, pibScale, pfNullableMarshal, pfNullable, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdesc 
 * @param {Integer} iRecord 
 * @param {Pointer<Integer>} szName 
 * @param {Integer} cbNameMax 
 * @param {Pointer<Integer>} pcbName 
 * @param {Pointer<Integer>} pfType 
 * @param {Pointer<Integer>} pfSubType 
 * @param {Pointer<Integer>} pLength 
 * @param {Pointer<Integer>} pPrecision 
 * @param {Pointer<Integer>} pScale 
 * @param {Pointer<Integer>} pNullable 
 * @returns {Integer} 
 */
export SQLGetDescRecA(hdesc, iRecord, szName, cbNameMax, pcbName, pfType, pfSubType, pLength, pPrecision, pScale, pNullable) {
    hdescMarshal := hdesc is VarRef ? "ptr" : "ptr"
    szNameMarshal := szName is VarRef ? "char*" : "ptr"
    pcbNameMarshal := pcbName is VarRef ? "short*" : "ptr"
    pfTypeMarshal := pfType is VarRef ? "short*" : "ptr"
    pfSubTypeMarshal := pfSubType is VarRef ? "short*" : "ptr"
    pLengthMarshal := pLength is VarRef ? "int64*" : "ptr"
    pPrecisionMarshal := pPrecision is VarRef ? "short*" : "ptr"
    pScaleMarshal := pScale is VarRef ? "short*" : "ptr"
    pNullableMarshal := pNullable is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetDescRecA", hdescMarshal, hdesc, "short", iRecord, szNameMarshal, szName, "short", cbNameMax, pcbNameMarshal, pcbName, pfTypeMarshal, pfType, pfSubTypeMarshal, pfSubType, pLengthMarshal, pLength, pPrecisionMarshal, pPrecision, pScaleMarshal, pScale, pNullableMarshal, pNullable, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Integer} fOption 
 * @param {Integer} vParam 
 * @returns {Integer} 
 */
export SQLSetConnectOptionA(hdbc, fOption, vParam) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetConnectOptionA", hdbcMarshal, hdbc, "ushort", fOption, "uint", vParam, Int16)
    return result
}

/**
 * SQLAllocConnect Function
 * @param {Pointer<Void>} EnvironmentHandle 
 * @param {Pointer<Pointer<Void>>} ConnectionHandle 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlallocconnect-function
 */
export SQLAllocConnect(EnvironmentHandle, ConnectionHandle) {
    EnvironmentHandleMarshal := EnvironmentHandle is VarRef ? "ptr" : "ptr"
    ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("ODBC32.dll\SQLAllocConnect", EnvironmentHandleMarshal, EnvironmentHandle, ConnectionHandleMarshal, ConnectionHandle, Int16)
    return result
}

/**
 * SQLAllocEnv Function
 * @param {Pointer<Pointer<Void>>} EnvironmentHandle 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlallocenv-function
 */
export SQLAllocEnv(EnvironmentHandle) {
    EnvironmentHandleMarshal := EnvironmentHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("ODBC32.dll\SQLAllocEnv", EnvironmentHandleMarshal, EnvironmentHandle, Int16)
    return result
}

/**
 * SQLAllocHandle Function
 * @remarks
 * **SQLAllocHandle** is used to allocate handles for environments, connections, statements, and descriptors, as described in the following sections. For general information about handles, see [Handles](../../../odbc/reference/develop-app/handles.md).  
 *   
 *  More than one environment, connection, or statement handle can be allocated by an application at a time if multiple allocations are supported by the driver. In ODBC, no limit is defined on the number of environment, connection, statement, or descriptor handles that can be allocated at any one time. Drivers may impose a limit on the number of a certain type of handle that can be allocated at a time; for more information, see the driver documentation.  
 *   
 *  If the application calls **SQLAllocHandle** with *\*OutputHandlePtr* set to an environment, connection, statement, or descriptor handle that already exists, the driver overwrites the information associated with the *handle*, unless the application is using connection pooling (see "Allocating an Environment Attribute for Connection Pooling" later in this section). The Driver Manager does not check to see whether the *handle* entered in *\*OutputHandlePtr* is already being used, nor does it check the previous contents of a handle before overwriting them.  
 *   
 * > [!NOTE]  
 * >  It is incorrect ODBC application programming to call **SQLAllocHandle** two times with the same application variable defined for *\*OutputHandlePtr* without calling **SQLFreeHandle** to free the handle before reallocating it. Overwriting ODBC handles in such a manner could lead to inconsistent behavior or errors on the part of ODBC drivers.  
 *   
 *  On operating systems that support multiple threads, applications can use the same environment, connection, statement, or descriptor handle on different threads. Drivers must therefore support safe, multithread access to this information; one way to achieve this, for example, is by using a critical section or a semaphore. For more information about threading, see [Multithreading](../../../odbc/reference/develop-app/multithreading.md).  
 *   
 *  **SQLAllocHandle** does not set the SQL_ATTR_ODBC_VERSION environment attribute when it is called to allocate an environment handle; the environment attribute must be set by the application, or SQLSTATE HY010 (Function sequence error) will be returned when **SQLAllocHandle** is called to allocate a connection handle.  
 *   
 *  For standards-compliant applications, **SQLAllocHandle** is mapped to **SQLAllocHandleStd** at compile time. The difference between these two functions is that **SQLAllocHandleStd** sets the SQL_ATTR_ODBC_VERSION environment attribute to SQL_OV_ODBC3 when it is called with the *HandleType* argument set to SQL_HANDLE_ENV. This is done because standards-compliant applications are always ODBC 3.*x* applications. Moreover, the standards do not require the application version to be registered. This is the only difference between these two functions; otherwise, they are identical. **SQLAllocHandleStd** is mapped to **SQLAllocHandle** inside the driver manager. Therefore, third-party drivers do not have to implement **SQLAllocHandleStd**.  
 *   
 *  ODBC 3.8 applications should use:  
 *   
 * -   **SQLAllocHandle and not SQLAllocHandleStd** to allocate an environment handle.  
 *   
 * -   **SQLSetEnvAttr** to set the SQL_ATTR_ODBC_VERSION environment attribute to SQL_OV_ODBC3_80.
 * @param {Integer} _HandleType [Input] The type of handle to be allocated by **SQLAllocHandle**. Must be one of the following values:  
 *   
 * -   SQL_HANDLE_DBC  
 *   
 * -   SQL_HANDLE_DBC_INFO_TOKEN  
 *   
 * -   SQL_HANDLE_DESC  
 *   
 * -   SQL_HANDLE_ENV  
 *   
 * -   SQL_HANDLE_STMT  
 *   
 *  SQL_HANDLE_DBC_INFO_TOKEN handle is used only by the Driver Manager and driver. Applications should not use this handle type. For more information about SQL_HANDLE_DBC_INFO_TOKEN, see [Developing Connection-Pool Awareness in an ODBC Driver](../../../odbc/reference/develop-driver/developing-connection-pool-awareness-in-an-odbc-driver.md).
 * @param {Pointer<Void>} InputHandle [Input] The input handle in whose context the new handle is to be allocated. If *HandleType* is SQL_HANDLE_ENV, this is SQL_NULL_HANDLE. If *HandleType* is SQL_HANDLE_DBC, this must be an environment handle, and if it is SQL_HANDLE_STMT or SQL_HANDLE_DESC, it must be a connection handle.
 * @param {Pointer<Pointer<Void>>} OutputHandle 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_INVALID_HANDLE, or SQL_ERROR.  
 *   
 *  When allocating a handle other than an environment handle, if **SQLAllocHandle** returns SQL_ERROR, it sets *OutputHandlePtr* to SQL_NULL_HDBC, SQL_NULL_HSTMT, or SQL_NULL_HDESC, depending on the value of *HandleType*, unless the output argument is a null pointer. The application can then obtain additional information from the diagnostic data structure associated with the handle in the *InputHandle* argument.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlallochandle-function
 */
export SQLAllocHandle(_HandleType, InputHandle, OutputHandle) {
    InputHandleMarshal := InputHandle is VarRef ? "ptr" : "ptr"
    OutputHandleMarshal := OutputHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("ODBC32.dll\SQLAllocHandle", "short", _HandleType, InputHandleMarshal, InputHandle, OutputHandleMarshal, OutputHandle, Int16)
    return result
}

/**
 * SQLAllocStmt Function
 * @param {Pointer<Void>} ConnectionHandle 
 * @param {Pointer<Pointer<Void>>} StatementHandle 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlallocstmt-function
 */
export SQLAllocStmt(ConnectionHandle, StatementHandle) {
    ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("ODBC32.dll\SQLAllocStmt", ConnectionHandleMarshal, ConnectionHandle, StatementHandleMarshal, StatementHandle, Int16)
    return result
}

/**
 * SQLCancel Function
 * @remarks
 * **SQLCancel** can cancel the following types of processing on a statement:  
 *   
 * -   A function running asynchronously on the statement.  
 *   
 * -   A function on a statement that needs data.  
 *   
 * -   A function running on the statement on another thread.  
 *   
 *  In ODBC 2.*x*, if an application calls **SQLCancel** when no processing is being done on the statement, **SQLCancel** has the same effect as **SQLFreeStmt** with the SQL_CLOSE option; this behavior is defined only for completeness and applications should call **SQLFreeStmt** or **SQLCloseCursor** to close cursors.  
 *   
 *  When **SQLCancel** is called to cancel a function running asynchronously in a statement or a function on a statement that needs data, diagnostic records posted by the function being canceled are cleared, and **SQLCancel** posts its own diagnostic records; when **SQLCancel** is called to cancel a function running on a statement on another thread, however, it does not clear the diagnostic records of the being canceled function and does not post its own diagnostic records.
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcancel-function
 */
export SQLCancel(StatementHandle) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLCancel", StatementHandleMarshal, StatementHandle, Int16)
    return result
}

/**
 * SQLCancelHandle Function
 * @remarks
 * This function is similar to **SQLCancel** but may take either a connection or statement handle as a parameter rather than only a statement handle. The Driver Manager maps a call to **SQLCancelHandle** to a call to **SQLCancel** when *HandleType* is SQL_HANDLE_STMT. This allows applications to use **SQLCancelHandle** to cancel statement operations even if the driver does not implement **SQLCancelHandle**.  
 *   
 *  For more information about cancelling a statement operation, see [SQLCancel Function](../../../odbc/reference/syntax/sqlcancel-function.md).  
 *   
 *  If there are no operations in progress on *Handle* the call to **SQLCancelHandle** has no effect.  
 *   
 *  **SQLCancelHandle** on a connection handle can cancel the following types of processing:  
 *   
 * -   A function running asynchronously on the connection.  
 *   
 * -   A function running on the connection handle on another thread.  
 *   
 *  When **SQLCancelHandle** is called to cancel a function running asynchronously in a connection, diagnostic records posted by **SQLCancelHandle** are appended to those returned by the operation being canceled; **SQLCancelHandle** does not return diagnostic records, however, when canceling a function running on a connection on another thread.  
 *   
 *  Using **SQLCancelHandle** to cancel **SQLEndTran** may put the connection in suspended state. For more information on suspended state, see [SQLEndTran Function](../../../odbc/reference/syntax/sqlendtran-function.md).  
 *   
 * > [!NOTE]  
 * >  For information about how to use **SQLCancelHandle** in an application that will be deployed on a Windows operating system older than Windows 7, see [Compatibility Matrix](../../../odbc/reference/develop-app/compatibility-matrix.md).
 * @param {Integer} _HandleType [Input] The type of the handle on which to cacel processing. Valid values are SQL_HANDLE_DBC or SQL_HANDLE_STMT.
 * @param {Pointer<Void>} InputHandle 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcancelhandle-function
 */
export SQLCancelHandle(_HandleType, InputHandle) {
    InputHandleMarshal := InputHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLCancelHandle", "short", _HandleType, InputHandleMarshal, InputHandle, Int16)
    return result
}

/**
 * SQLCloseCursor Function
 * @remarks
 * **SQLCloseCursor** returns SQLSTATE 24000 (Invalid cursor state) if no cursor is open. Calling **SQLCloseCursor** is equivalent to calling **SQLFreeStmt** with the SQL_CLOSE option, with the exception that **SQLFreeStmt** with SQL_CLOSE has no effect on the application if no cursor is open on the statement, while **SQLCloseCursor** returns SQLSTATE 24000 (Invalid cursor state).  
 *   
 * > [!NOTE]  
 * >  If an ODBC 3.*x* application working with an ODBC 2.*x* driver calls **SQLCloseCursor** when no cursor is open, SQLSTATE 24000 (Invalid cursor state) is not returned, because the Driver Manager maps **SQLCloseCursor** to **SQLFreeStmt** with SQL_CLOSE.  
 *   
 *  For more information, see [Closing the Cursor](../../../odbc/reference/develop-app/closing-the-cursor.md).
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlclosecursor-function
 */
export SQLCloseCursor(StatementHandle) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLCloseCursor", StatementHandleMarshal, StatementHandle, Int16)
    return result
}

/**
 * SQLColumns Function
 * @remarks
 * This function typically is used before statement execution to retrieve information about columns for a table or tables from the data source's catalog. **SQLColumns** can be used to retrieve data for all types of items returned by **SQLTables**. In addition to base tables, this may include (but is not limited to) views, synonyms, system tables, and so on. By contrast, the functions **SQLColAttribute** and **SQLDescribeCol** describe the columns in a result set and the function **SQLNumResultCols** returns the number of columns in a result set. For more information, see [Uses of Catalog Data](../../../odbc/reference/develop-app/uses-of-catalog-data.md).  
 *   
 * > [!NOTE]  
 * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
 *   
 *  **SQLColumns** returns the results as a standard result set, ordered by TABLE_CAT, TABLE_SCHEM, TABLE_NAME, and ORDINAL_POSITION.  
 *   
 * > [!NOTE]  
 * >  When an application works with an ODBC 2.*x* driver, no ORDINAL_POSITION column is returned in the result set. As a result, when working with ODBC 2.*x* drivers, the order of the columns in the column list returned by **SQLColumns** is not necessarily the same as the order of the columns returned when the application performs a SELECT statement on all columns in that table.  
 *   
 * > [!NOTE]  
 * >  **SQLColumns** might not return all columns. For example, a driver might not return information about pseudo-columns, such as Oracle ROWID. Applications can use any valid column, whether it is returned by **SQLColumns**.  
 * >   
 * >  Some columns that can be returned by **SQLStatistics** are not returned by **SQLColumns**. For example, **SQLColumns** does not return the columns in an index created over an expression or filter, such as SALARY + BENEFITS or DEPT = 0012.  
 *   
 *  The lengths of VARCHAR columns are not shown in the table; the actual lengths depend on the data source. To determine the actual lengths of the TABLE_CAT, TABLE_SCHEM, TABLE_NAME, and COLUMN_NAME columns, an application can call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, SQL_MAX_TABLE_NAME_LEN, and SQL_MAX_COLUMN_NAME_LEN options.  
 *   
 *  The following columns have been renamed for ODBC 3.*x*. The column name changes do not affect backward compatibility because applications bind by column number.  
 *   
 * |ODBC 2.0 column|ODBC 3.*x* column|  
 * |---------------------|-----------------------|  
 * |TABLE_QUALIFIER|TABLE_CAT|  
 * |TABLE_OWNER|TABLE_SCHEM|  
 * |PRECISION|COLUMN_SIZE|  
 * |LENGTH|BUFFER_LENGTH|  
 * |SCALE|DECIMAL_DIGITS|  
 * |RADIX|NUM_PREC_RADIX|  
 *   
 *  The following columns have been added to the result set returned by **SQLColumns** for ODBC 3.*x*:  
 * 
 * :::row:::
 *     :::column:::
 *         CHAR_OCTET_LENGTH  
 *         COLUMN_DEF  
 *     :::column-end:::
 *     :::column:::
 *         IS_NULLABLE  
 *         ORDINAL_POSITION  
 *     :::column-end:::
 *     :::column:::
 *         SQL_DATA_TYPE  
 *         SQL_DATETIME_SUB  
 *     :::column-end:::
 * :::row-end:::
 * 
 *  The following table lists the columns in the result set. Additional columns beyond column 18 (IS_NULLABLE) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set instead of specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
 *   
 * |Column name|Column<br /><br /> number|Data type|Comments|  
 * |-----------------|-----------------------|---------------|--------------|  
 * |TABLE_CAT (ODBC 1.0)|1|Varchar|Catalog name; NULL if not applicable to the data source. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have catalogs.|  
 * |TABLE_SCHEM (ODBC 1.0)|2|Varchar|Schema name; NULL if not applicable to the data source. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have schemas.|  
 * |TABLE_NAME (ODBC 1.0)|3|Varchar not NULL|Table name.|  
 * |COLUMN_NAME (ODBC 1.0)|4|Varchar not NULL|Column name. The driver returns an empty string for a column that does not have a name.|  
 * |DATA_TYPE (ODBC 1.0)|5|Smallint not NULL|SQL data type. This can be an ODBC SQL data type or a driver-specific SQL data type. For datetime and interval data types, this column returns the concise data type (such as SQL_TYPE_DATE or SQL_INTERVAL_YEAR_TO_MONTH, instead of the nonconcise data type such as SQL_DATETIME or SQL_INTERVAL). For a list of valid ODBC SQL data types, see [SQL Data Types](../../../odbc/reference/appendixes/sql-data-types.md) in Appendix D: Data Types. For information about driver-specific SQL data types, see the driver's documentation.<br /><br /> The data types returned for ODBC 3.*x* and ODBC 2.*x* applications may be different. For more information, see [Backward Compatibility and Standards Compliance](../../../odbc/reference/develop-app/backward-compatibility-and-standards-compliance.md).|  
 * |TYPE_NAME (ODBC 1.0)|6|Varchar not NULL|Data source-dependent data type name; for example, "CHAR", "VARCHAR", "MONEY", "LONG VARBINAR", or "CHAR ( ) FOR BIT DATA".|  
 * |COLUMN_SIZE (ODBC 1.0)|7|Integer|If DATA_TYPE is SQL_CHAR or SQL_VARCHAR, this column contains the maximum length in characters of the column. For datetime data types, this is the total number of characters required to display the value when it is converted to characters. For numeric data types, this is either the total number of digits or the total number of bits allowed in the column, according to the NUM_PREC_RADIX column. For interval data types, this is the number of characters in the character representation of the interval literal (as defined by the interval leading precision, see [Interval Data Type Length](../../../odbc/reference/appendixes/interval-data-type-length.md) in Appendix D: Data Types). For more information, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md) in Appendix D: Data Types.|  
 * |BUFFER_LENGTH (ODBC 1.0)|8|Integer|The length in bytes of data transferred on an SQLGetData, SQLFetch, or SQLFetchScroll operation if SQL_C_DEFAULT is specified. For numeric data, this size may differ from the size of the data stored on the data source. This value might differ from COLUMN_SIZE column for character data. For more information about length, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md) in Appendix D: Data Types.|  
 * |DECIMAL_DIGITS (ODBC 1.0)|9|Smallint|The total number of significant digits to the right of the decimal point. For SQL_TYPE_TIME and SQL_TYPE_TIMESTAMP, this column contains the number of digits in the fractional seconds component. For the other data types, this is the decimal digits of the column on the data source. For interval data types that contain a time component, this column contains the number of digits to the right of the decimal point (fractional seconds). For interval data types that do not contain a time component, this column is 0. For more information about decimal digits, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md) in Appendix D: Data Types. NULL is returned for data types where DECIMAL_DIGITS is not applicable.|  
 * |NUM_PREC_RADIX (ODBC 1.0)|10|Smallint|For numeric data types, either 10 or 2. If it is 10, the values in COLUMN_SIZE and DECIMAL_DIGITS give the number of decimal digits allowed for the column. For example, a DECIMAL(12,5) column would return a NUM_PREC_RADIX of 10, a COLUMN_SIZE of 12, and a DECIMAL_DIGITS of 5; a FLOAT column could return a NUM_PREC_RADIX of 10, a COLUMN_SIZE of 15, and a DECIMAL_DIGITS of NULL.<br /><br /> If it is 2, the values in COLUMN_SIZE and DECIMAL_DIGITS give the number of bits allowed in the column. For example, a FLOAT column could return a RADIX of 2, a COLUMN_SIZE of 53, and a DECIMAL_DIGITS of NULL.<br /><br /> NULL is returned for data types where NUM_PREC_RADIX is not applicable.|  
 * |NULLABLE (ODBC 1.0)|11|Smallint not NULL|SQL_NO_NULLS if the column could not include NULL values.<br /><br /> SQL_NULLABLE if the column accepts NULL values.<br /><br /> SQL_NULLABLE_UNKNOWN if it is not known whether the column accepts NULL values.<br /><br /> The value returned for this column differs from the value returned for the IS_NULLABLE column. The NULLABLE column indicates with certainty that a column can accept NULLs, but cannot indicate with certainty that a column does not accept NULLs. The IS_NULLABLE column indicates with certainty that a column cannot accept NULLs, but cannot indicate with certainty that a column accepts NULLs.|  
 * |REMARKS (ODBC 1.0)|12|Varchar|A description of the column.|  
 * |COLUMN_DEF (ODBC 3.0)|13|Varchar|The default value of the column. The value in this column should be interpreted as a string if it is enclosed in quotation marks.<br /><br /> If NULL was specified as the default value, this column is the word NULL, not enclosed in quotation marks. If the default value cannot be represented without truncation, this column contains TRUNCATED, without enclosing single quotation marks. If no default value was specified, this column is NULL.<br /><br /> The value of COLUMN_DEF can be used in generating a new column definition, except when it contains the value TRUNCATED.|  
 * |SQL_DATA_TYPE (ODBC 3.0)|14|Smallint not NULL|SQL data type, as it appears in the SQL_DESC_TYPE record field in the IRD. This can be an ODBC SQL data type or a driver-specific SQL data type. This column is the same as the DATA_TYPE column, except for datetime and interval data types. This column returns the nonconcise data type (such as SQL_DATETIME or SQL_INTERVAL), instead of the concise data type (such as SQL_TYPE_DATE or SQL_INTERVAL_YEAR_TO_MONTH) for datetime and interval data types. If this column returns SQL_DATETIME or SQL_INTERVAL, the specific data type can be determined from the SQL_DATETIME_SUB column. For a list of valid ODBC SQL data types, see [SQL Data Types](../../../odbc/reference/appendixes/sql-data-types.md) in Appendix D: Data Types. For information about driver-specific SQL data types, see the driver's documentation.<br /><br /> The data types returned for ODBC 3.*x* and ODBC 2.*x* applications may be different. For more information, see [Backward Compatibility and Standards Compliance](../../../odbc/reference/develop-app/backward-compatibility-and-standards-compliance.md).|  
 * |SQL_DATETIME_SUB (ODBC 3.0)|15|Smallint|The subtype code for datetime and interval data types. For other data types, this column returns a NULL. For more information about datetime and interval subcodes, see "SQL_DESC_DATETIME_INTERVAL_CODE" in [SQLSetDescField](../../../odbc/reference/syntax/sqlsetdescfield-function.md).|  
 * |CHAR_OCTET_LENGTH (ODBC 3.0)|16|Integer|The maximum length in bytes of a character or binary data type column. For all other data types, this column returns a NULL.|  
 * |ORDINAL_POSITION (ODBC 3.0)|17|Integer not NULL|The ordinal position of the column in the table. The first column in the table is number 1.|  
 * |IS_NULLABLE (ODBC 3.0)|18|Varchar|"NO" if the column does not include NULLs.<br /><br /> "YES" if the column could include NULLs.<br /><br /> This column returns a zero-length string if nullability is unknown.<br /><br /> ISO rules are followed to determine nullability. An ISO SQL-compliant DBMS cannot return an empty string.<br /><br /> The value returned for this column differs from the value returned for the NULLABLE column. (See the description of the NULLABLE column.)|
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Pointer<Integer>} CatalogName [Input] Catalog name. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, an empty string ("") indicates those tables that do not have catalogs. *CatalogName* cannot contain a string search pattern.  
 *   
 * > [!NOTE]  
 * >  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *CatalogName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *CatalogName* is an ordinary argument; it is treated literally, and its case is significant. For more information, see [Arguments in Catalog Functions](../../../odbc/reference/develop-app/arguments-in-catalog-functions.md).
 * @param {Integer} NameLength1 [Input] Length in characters of **CatalogName*.
 * @param {Pointer<Integer>} SchemaName [Input] String search pattern for schema names. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, an empty string ("") indicates those tables that do not have schemas.  
 *   
 * > [!NOTE]  
 * >  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *SchemaName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *SchemaName* is a pattern value argument; it is treated literally, and its case is significant.
 * @param {Integer} NameLength2 [Input] Length in characters of **SchemaName*.
 * @param {Pointer<Integer>} TableName [Input] String search pattern for table names.  
 *   
 * > [!NOTE]  
 * >  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *TableName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *TableName* is a pattern value argument; it is treated literally, and its case is significant.
 * @param {Integer} NameLength3 [Input] Length in characters of **TableName*.
 * @param {Pointer<Integer>} ColumnName [Input] String search pattern for column names.  
 *   
 * > [!NOTE]  
 * >  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *ColumnName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *ColumnName* is a pattern value argument; it is treated literally, and its case is significant.
 * @param {Integer} NameLength4 [Input] Length in characters of **ColumnName*.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcolumns-function
 */
export SQLColumns(StatementHandle, CatalogName, NameLength1, SchemaName, NameLength2, TableName, NameLength3, ColumnName, NameLength4) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    CatalogNameMarshal := CatalogName is VarRef ? "char*" : "ptr"
    SchemaNameMarshal := SchemaName is VarRef ? "char*" : "ptr"
    TableNameMarshal := TableName is VarRef ? "char*" : "ptr"
    ColumnNameMarshal := ColumnName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLColumns", StatementHandleMarshal, StatementHandle, CatalogNameMarshal, CatalogName, "short", NameLength1, SchemaNameMarshal, SchemaName, "short", NameLength2, TableNameMarshal, TableName, "short", NameLength3, ColumnNameMarshal, ColumnName, "short", NameLength4, Int16)
    return result
}

/**
 * SQLCompleteAsync Function
 * @remarks
 * In polling based asynchronous processing mode, *AsyncRetCodePtr* might be SQL_STILL_EXECUTING when **SQLCompleteAsync** returns SQL_SUCCESS. Application should keep polling until *AsyncRetCodePtr* is not SQL_STILL_EXECUTING. In notification based asynchronous processing mode, *AsyncRetCodePtr* will never be SQL_STILL_EXECUTING.
 * @param {Integer} _HandleType [Input] The type of the handle on which to complete asynchronous processing. Valid values are SQL_HANDLE_DBC or SQL_HANDLE_STMT.
 * @param {Pointer<Void>} _Handle [Input] The handle on which to complete asynchronous processing. If *Handle* is not a valid handle of the type specified by *HandleType*, **SQLCompleteAsync** returns SQL_INVALID_HANDLE.  
 *   
 *  If *Handle* is not a valid handle of the type specified by *HandleType*, **SQLCompleteAsync** returns SQL_INVALID_HANDLE.
 * @param {Pointer<Integer>} AsyncRetCodePtr [Output] Pointer to a buffer that will contain the return code of the asynchronous API. If *AsyncRetCodePtr* is NULL, **SQLCompleteAsync** returns SQL_ERROR.
 * @returns {Integer} SQL_SUCCESS, SQL_ERROR, SQL_NO_DATA, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcompleteasync-function
 */
export SQLCompleteAsync(_HandleType, _Handle, AsyncRetCodePtr) {
    _HandleMarshal := _Handle is VarRef ? "ptr" : "ptr"
    AsyncRetCodePtrMarshal := AsyncRetCodePtr is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLCompleteAsync", "short", _HandleType, _HandleMarshal, _Handle, AsyncRetCodePtrMarshal, AsyncRetCodePtr, Int16)
    return result
}

/**
 * SQLConnect Function
 * @remarks
 * For information about why an application uses **SQLConnect**, see [Connecting with SQLConnect](../../../odbc/reference/develop-app/connecting-with-sqlconnect.md).  
 *   
 *  The Driver Manager does not connect to a driver until the application calls a function (**SQLConnect**, **SQLDriverConnect**, or **SQLBrowseConnect**) to connect to the driver. Until that point, the Driver Manager works with its own handles and manages connection information. When the application calls a connection function, the Driver Manager checks whether a driver is currently connected to for the specified *ConnectionHandle*:  
 *   
 * -   If a driver is not connected to, the Driver Manager connects to the driver and calls **SQLAllocHandle** with a *HandleType* of SQL_HANDLE_ENV, **SQLAllocHandle** with a *HandleType* of SQL_HANDLE_DBC, **SQLSetConnectAttr** (if the application specified any connection attributes), and the connection function in the driver. The Driver Manager returns SQLSTATE IM006 (Driver's **SQLSetConnectOption** failed) and SQL_SUCCESS_WITH_INFO for the connection function if the driver returned an error for **SQLSetConnectAttr**. For more information, see [Connecting to a Data Source or Driver](../../../odbc/reference/develop-app/connecting-to-a-data-source-or-driver.md).  
 *   
 * -   If the specified driver is already connected to on the *ConnectionHandle*, the Driver Manager calls only the connection function in the driver. In this case, the driver must make sure that all connection attributes for the *ConnectionHandle* maintain their current settings.  
 *   
 * -   If a different driver is connected to, the Driver Manager calls **SQLFreeHandle** with a *HandleType* of SQL_HANDLE_DBC, and then, if no other driver is connected to in that environment, it calls **SQLFreeHandle** with a *HandleType* of SQL_HANDLE_ENV in the connected driver and then disconnects that driver. It then performs the same operations as when a driver is not connected to.  
 *   
 *  The driver then allocates handles and initializes itself.  
 *   
 *  When the application calls **SQLDisconnect**, the Driver Manager calls **SQLDisconnect** in the driver. However, it does not disconnect the driver. This keeps the driver in memory for applications that repeatedly connect to and disconnect from a data source. When the application calls **SQLFreeHandle** with a *HandleType* of SQL_HANDLE_DBC, the Driver Manager calls **SQLFreeHandle** with a *HandleType* of SQL_HANDLE_DBC and then **SQLFreeHandle** with a *HandleType* of SQL_HANDLE_ENV in the driver, and then disconnects the driver.  
 *   
 *  An ODBC application can establish more than one connection.
 * @param {Pointer<Void>} ConnectionHandle [Input] Connection handle.
 * @param {Pointer<Integer>} ServerName [Input] Data source name. The data might be located on the same computer as the program, or on another computer somewhere on a network. For information about how an application chooses a data source, see [Choosing a Data Source or Driver](../../../odbc/reference/develop-app/choosing-a-data-source-or-driver.md).
 * @param {Integer} NameLength1 [Input] Length of **ServerName* in characters.
 * @param {Pointer<Integer>} UserName [Input] User identifier.
 * @param {Integer} NameLength2 [Input] Length of **UserName* in characters.
 * @param {Pointer<Integer>} Authentication [Input] Authentication string (typically the password).
 * @param {Integer} NameLength3 [Input] Length of **Authentication* in characters.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, SQL_INVALID_HANDLE, or SQL_STILL_EXECUTING.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlconnect-function
 */
export SQLConnect(ConnectionHandle, ServerName, NameLength1, UserName, NameLength2, Authentication, NameLength3) {
    ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"
    ServerNameMarshal := ServerName is VarRef ? "char*" : "ptr"
    UserNameMarshal := UserName is VarRef ? "char*" : "ptr"
    AuthenticationMarshal := Authentication is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLConnect", ConnectionHandleMarshal, ConnectionHandle, ServerNameMarshal, ServerName, "short", NameLength1, UserNameMarshal, UserName, "short", NameLength2, AuthenticationMarshal, Authentication, "short", NameLength3, Int16)
    return result
}

/**
 * SQLCopyDesc Function
 * @remarks
 * A call to **SQLCopyDesc** copies the fields of the source descriptor handle to the target descriptor handle. Fields can be copied only to an application descriptor or an IPD, but not to an IRD. Fields can be copied from either an application or an implementation descriptor.  
 *   
 *  Fields can be copied from an IRD only if the statement handle is in the prepared or executed state; otherwise, the function returns SQLSTATE HY007 (Associated statement is not prepared).  
 *   
 *  Fields can be copied from an IPD whether or not a statement has been prepared. If an SQL statement with dynamic parameters has been prepared and automatic population of the IPD is supported and enabled, then the IPD is populated by the driver. When **SQLCopyDesc** is called with the IPD as the *SourceDescHandle*, the populated fields are copied. If the IPD is not populated by the driver, the contents of the fields originally in the IPD are copied.  
 *   
 *  All fields of the descriptor, except SQL_DESC_ALLOC_TYPE (which specifies whether the descriptor handle was automatically or explicitly allocated), are copied, whether or not the field is defined for the destination descriptor. Copied fields overwrite the existing fields.  
 *   
 *  The driver copies all descriptor fields if the *SourceDescHandle* and *TargetDescHandle* arguments are associated with the same driver, even if the drivers are on two different connections or environments. If the *SourceDescHandle* and *TargetDescHandle* arguments are associated with different drivers, the Driver Manager copies ODBC-defined fields, but does not copy driver-defined fields or fields that are not defined by ODBC for the type of descriptor.  
 *   
 *  The call to **SQLCopyDesc** is aborted immediately if an error occurs.  
 *   
 *  When the SQL_DESC_DATA_PTR field is copied, a consistency check is performed on the target descriptor. If the consistency check fails, SQLSTATE HY021 (Inconsistent descriptor information) is returned and the call to **SQLCopyDesc** is immediately aborted. For more information on consistency checks, see "Consistency Checks" in [SQLSetDescRec Function](../../../odbc/reference/syntax/sqlsetdescrec-function.md).  
 *   
 *  Descriptor handles can be copied across connections even if the connections are under different environments. If the Driver Manager detects that the source and the destination descriptor handles do not belong to the same connection and the two connections belong to separate drivers, it implements **SQLCopyDesc** by performing a field-by-field copy using **SQLGetDescField** and **SQLSetDescField**.  
 *   
 *  When **SQLCopyDesc** is called with a *SourceDescHandle* on one driver and a *TargetDescHandle* on another driver, the error queue of the *SourceDescHandle* is cleared. This occurs because **SQLCopyDesc** in this case is implemented by calls to **SQLGetDescField** and **SQLSetDescField**.  
 *   
 * > [!NOTE]  
 * >  An application might be able to associate an explicitly allocated descriptor handle with a *StatementHandle*, rather than calling **SQLCopyDesc** to copy fields from one descriptor to another. An explicitly allocated descriptor can be associated with another *StatementHandle* on the same *ConnectionHandle* by setting the SQL_ATTR_APP_ROW_DESC or SQL_ATTR_APP_PARAM_DESC statement attribute to the handle of the explicitly allocated descriptor. When this is done, **SQLCopyDesc** does not have to be called to copy descriptor field values from one descriptor to another. A descriptor handle cannot be associated with a *StatementHandle* on another *ConnectionHandle*, however; to use the same descriptor field values on *StatementHandles* on different *ConnectionHandles*, **SQLCopyDesc** has to be called.  
 *   
 *  For a description of the fields in a descriptor header or record, see [SQLSetDescField Function](../../../odbc/reference/syntax/sqlsetdescfield-function.md). For more information on descriptors, see [Descriptors](../../../odbc/reference/develop-app/descriptors.md).
 * @param {Pointer<Void>} SourceDescHandle [Input] Source descriptor handle.
 * @param {Pointer<Void>} TargetDescHandle [Input] Target descriptor handle. The *TargetDescHandle* argument can be a handle to an application descriptor or an IPD. *TargetDescHandle* cannot be set to a handle to an IRD, or **SQLCopyDesc** will return SQLSTATE HY016 (Cannot modify an implementation row descriptor).
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcopydesc-function
 */
export SQLCopyDesc(SourceDescHandle, TargetDescHandle) {
    SourceDescHandleMarshal := SourceDescHandle is VarRef ? "ptr" : "ptr"
    TargetDescHandleMarshal := TargetDescHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLCopyDesc", SourceDescHandleMarshal, SourceDescHandle, TargetDescHandleMarshal, TargetDescHandle, Int16)
    return result
}

/**
 * SQLDataSources Function
 * @remarks
 * Because **SQLDataSources** is implemented in the Driver Manager, it is supported for all drivers regardless of a particular driver's standards compliance.  
 *   
 *  An application can call **SQLDataSources** multiple times to retrieve all data source names. The Driver Manager retrieves this information from the system information. When there are no more data source names, the Driver Manager returns SQL_NO_DATA. If **SQLDataSources** is called with SQL_FETCH_NEXT immediately after it returns SQL_NO_DATA, it will return the first data source name. For information about how an application uses the information returned by **SQLDataSources**, see [Choosing a Data Source or Driver](../../../odbc/reference/develop-app/choosing-a-data-source-or-driver.md).  
 *   
 *  If SQL_FETCH_NEXT is passed to **SQLDataSources** the very first time it is called, it will return the first data source name.  
 *   
 *  The driver determines how data source names are mapped to actual data sources.
 * @param {Pointer<Void>} EnvironmentHandle [Input] Environment handle.
 * @param {Integer} _Direction [Input] Determines which data source the Driver Manager returns information about. Can be:  
 *   
 *  SQL_FETCH_NEXT (to fetch the next data source name in the list), SQL_FETCH_FIRST (to fetch from the beginning of the list), SQL_FETCH_FIRST_USER (to fetch the first user DSN), or SQL_FETCH_FIRST_SYSTEM (to fetch the first system DSN).  
 *   
 *  When *Direction* is set to SQL_FETCH_FIRST, subsequent calls to **SQLDataSources** with *Direction* set to SQL_FETCH_NEXT return both user and system DSNs. When *Direction* is set to SQL_FETCH_FIRST_USER, all subsequent calls to **SQLDataSources** with *Direction* set to SQL_FETCH_NEXT return only user DSNs. When *Direction* is set to SQL_FETCH_FIRST_SYSTEM, all subsequent calls to **SQLDataSources** with *Direction* set to SQL_FETCH_NEXT return only system DSNs.
 * @param {Pointer<Integer>} ServerName [Output] Pointer to a buffer in which to return the data source name.  
 *   
 *  If *ServerName* is NULL, *NameLength1Ptr* will still return the total number of characters (excluding the null-termination character for character data) available to return in the buffer pointed to by *ServerName*.
 * @param {Integer} BufferLength1 [Input] Length of the **ServerName* buffer, in characters; this does not need to be longer than SQL_MAX_DSN_LENGTH plus the null-termination character.
 * @param {Pointer<Integer>} NameLength1Ptr [Output] Pointer to a buffer in which to return the total number of characters (excluding the null-termination character) available to return in \**ServerName*. If the number of characters available to return is greater than or equal to *BufferLength1*, the data source name in \**ServerName* is truncated to *BufferLength1* minus the length of a null-termination character.
 * @param {Pointer<Integer>} Description [Output] Pointer to a buffer in which to return the description of the driver associated with the data source. For example, dBASE or SQL Server.  
 *   
 *  If *Description* is NULL, *NameLength2Ptr* will still return the total number of characters (excluding the null-termination character for character data) available to return in the buffer pointed to by *Description*.
 * @param {Integer} BufferLength2 [Input] Length in characters of the **Description* buffer.
 * @param {Pointer<Integer>} NameLength2Ptr [Output] Pointer to a buffer in which to return the total number of characters (excluding the null-termination character) available to return in \**Description*. If the number of characters available to return is greater than or equal to *BufferLength2*, the driver description in \**Description* is truncated to *BufferLength2* minus the length of a null-termination character.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldatasources-function
 */
export SQLDataSources(EnvironmentHandle, _Direction, ServerName, BufferLength1, NameLength1Ptr, Description, BufferLength2, NameLength2Ptr) {
    EnvironmentHandleMarshal := EnvironmentHandle is VarRef ? "ptr" : "ptr"
    ServerNameMarshal := ServerName is VarRef ? "char*" : "ptr"
    NameLength1PtrMarshal := NameLength1Ptr is VarRef ? "short*" : "ptr"
    DescriptionMarshal := Description is VarRef ? "char*" : "ptr"
    NameLength2PtrMarshal := NameLength2Ptr is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLDataSources", EnvironmentHandleMarshal, EnvironmentHandle, "ushort", _Direction, ServerNameMarshal, ServerName, "short", BufferLength1, NameLength1PtrMarshal, NameLength1Ptr, DescriptionMarshal, Description, "short", BufferLength2, NameLength2PtrMarshal, NameLength2Ptr, Int16)
    return result
}

/**
 * SQLDisconnect Function
 * @remarks
 * If an application calls **SQLDisconnect** after **SQLBrowseConnect** returns SQL_NEED_DATA and before it returns a different return code, the driver cancels the connection browsing process and returns the connection to an unconnected state.  
 *   
 *  If an application calls **SQLDisconnect** while there is an incomplete transaction associated with the connection handle, the driver returns SQLSTATE 25000 (Invalid transaction state), indicating that the transaction is unchanged and the connection is open. An incomplete transaction is one that has not been committed or rolled back with **SQLEndTran**.  
 *   
 *  If an application calls **SQLDisconnect** before it has freed all statements associated with the connection, the driver, after it successfully disconnects from the data source, frees those statements and all descriptors that have been explicitly allocated on the connection. However, if one or more of the statements associated with the connection are still executing asynchronously, **SQLDisconnect** returns SQL_ERROR with a SQLSTATE value of HY010 (Function sequence error). Also, **SQLDisconnect** will free all associated statements and all descriptors that have been explicitly allocated on the connection, if the connection is in a suspended state or if **SQLDisconnect** was successfully canceled by **SQLCancelHandle**.  
 *   
 *  For information about how an application uses **SQLDisconnect**, see [Disconnecting from a Data Source or Driver](../../../odbc/reference/develop-app/disconnecting-from-a-data-source-or-driver.md).
 * @param {Pointer<Void>} ConnectionHandle [Input] Connection handle.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, SQL_INVALID_HANDLE, or SQL_STILL_EXECUTING.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldisconnect-function
 */
export SQLDisconnect(ConnectionHandle) {
    ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLDisconnect", ConnectionHandleMarshal, ConnectionHandle, Int16)
    return result
}

/**
 * SQLEndTran Function
 * @remarks
 * For an ODBC 3.*x* driver, if *HandleType* is SQL_HANDLE_ENV and *Handle* is a valid environment handle, then the Driver Manager will call **SQLEndTran** in each driver associated with the environment. The *Handle* argument for the call to a driver will be the driver's environment handle. For an ODBC 2.*x* driver, if *HandleType* is SQL_HANDLE_ENV and *Handle* is a valid environment handle, and there are multiple connections in a connected state in that environment, then the Driver Manager will call **SQLTransact** in the driver once for each connection in a connected state in that environment. The *Handle* argument in each call will be the connection's handle. In either case, the driver will attempt to commit or roll back transactions, depending on the value of *CompletionType*, on all connections that are in a connected state on that environment. Connections that are not active do not affect the transaction.  
 *   
 * > [!NOTE]  
 * >  **SQLEndTran** cannot be used to commit or roll back transactions on a shared environment. SQLSTATE HY092 (Invalid attribute/option identifier) will be returned if **SQLEndTran** is called with *Handle* set to either the handle of a shared environment or the handle of a connection on a shared environment.  
 *   
 *  The Driver Manager will return SQL_SUCCESS only if it receives SQL_SUCCESS for each connection. If the Driver Manager receives SQL_ERROR on one or more connections, it returns SQL_ERROR to the application, and the diagnostic information is placed in the diagnostic data structure of the environment. To determine which connection or connections failed during the commit or rollback operation, the application can call **SQLGetDiagRec** for each connection.  
 *   
 * > [!NOTE]  
 * >  The Driver Manager does not simulate a global transaction across all connections and therefore does not use two-phase commit protocols.  
 *   
 *  If *CompletionType* is SQL_COMMIT, **SQLEndTran** issues a commit request for all active operations on any statement associated with an affected connection. If *CompletionType* is SQL_ROLLBACK, **SQLEndTran** issues a rollback request for all active operations on any statement associated with an affected connection. If no transactions are active, **SQLEndTran** returns SQL_SUCCESS with no effect on any data sources. For more information, see [Committing and Rolling Back Transactions](../../../odbc/reference/develop-app/committing-and-rolling-back-transactions.md).  
 *   
 *  If the driver is in manual-commit mode (by calling **SQLSetConnectAttr** with the SQL_ATTR_AUTOCOMMIT attribute set to SQL_AUTOCOMMIT_OFF), a new transaction is implicitly started when an SQL statement that can be contained within a transaction is executed against the current data source. For more information, see [Commit Mode](../../../odbc/reference/develop-app/commit-mode.md).  
 *   
 *  To determine how transaction operations affect cursors, an application calls **SQLGetInfo** with the SQL_CURSOR_ROLLBACK_BEHAVIOR and SQL_CURSOR_COMMIT_BEHAVIOR options. For more information, see the following paragraphs and also see [Effect of Transactions on Cursors and Prepared Statements](../../../odbc/reference/develop-app/effect-of-transactions-on-cursors-and-prepared-statements.md).  
 *   
 *  If the SQL_CURSOR_ROLLBACK_BEHAVIOR or SQL_CURSOR_COMMIT_BEHAVIOR value equals SQL_CB_DELETE, **SQLEndTran** closes and deletes all open cursors on all statements associated with the connection and discards all pending results. **SQLEndTran** leaves any statement present in an allocated (unprepared) state; the application can reuse them for subsequent SQL requests or can call **SQLFreeStmt** or **SQLFreeHandle** with a *HandleType* of SQL_HANDLE_STMT to deallocate them.  
 *   
 *  If the SQL_CURSOR_ROLLBACK_BEHAVIOR or SQL_CURSOR_COMMIT_BEHAVIOR value equals SQL_CB_CLOSE, **SQLEndTran** closes all open cursors on all statements associated with the connection. **SQLEndTran** leaves any statement present in a prepared state; the application can call **SQLExecute** for a statement associated with the connection without first calling **SQLPrepare**.  
 *   
 *  If the SQL_CURSOR_ROLLBACK_BEHAVIOR or SQL_CURSOR_COMMIT_BEHAVIOR value equals SQL_CB_PRESERVE, **SQLEndTran** does not affect open cursors associated with the connection. Cursors remain at the row they pointed to prior to the call to **SQLEndTran**.  
 *   
 *  For drivers and data sources that support transactions, calling **SQLEndTran** with either SQL_COMMIT or SQL_ROLLBACK when no transaction is active returns SQL_SUCCESS (indicating that there is no work to be committed or rolled back) and has no effect on the data source.  
 *   
 *  When a driver is in autocommit mode, the Driver Manager does not call **SQLEndTran** in the driver. **SQLEndTran** always returns SQL_SUCCESS regardless of whether it is called with a *CompletionType* of SQL_COMMIT or SQL_ROLLBACK.  
 *   
 *  Drivers or data sources that do not support transactions (**SQLGetInfo** *option* SQL_TXN_CAPABLE is SQL_TC_NONE) are effectively always in autocommit mode and therefore always return SQL_SUCCESS for **SQLEndTran** whether or not they are called with a *CompletionType* of SQL_COMMIT or SQL_ROLLBACK. Such drivers and data sources do not actually roll back transactions when requested to do so.
 * @param {Integer} _HandleType [Input] Handle type identifier. Contains either SQL_HANDLE_ENV (if *Handle* is an environment handle) or SQL_HANDLE_DBC (if *Handle* is a connection handle).
 * @param {Pointer<Void>} _Handle [Input] The handle, of the type indicated by *HandleType*, indicating the scope of the transaction. See "Comments" for more information.
 * @param {Integer} CompletionType [Input] One of the following two values:  
 *   
 *  SQL_COMMIT SQL_ROLLBACK
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, SQL_INVALID_HANDLE, or SQL_STILL_EXECUTING.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlendtran-function
 */
export SQLEndTran(_HandleType, _Handle, CompletionType) {
    _HandleMarshal := _Handle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLEndTran", "short", _HandleType, _HandleMarshal, _Handle, "short", CompletionType, Int16)
    return result
}

/**
 * SQLError Function
 * @param {Pointer<Void>} EnvironmentHandle 
 * @param {Pointer<Void>} ConnectionHandle 
 * @param {Pointer<Void>} StatementHandle 
 * @param {Pointer<Integer>} Sqlstate 
 * @param {Pointer<Integer>} NativeError 
 * @param {Pointer<Integer>} MessageText 
 * @param {Integer} BufferLength 
 * @param {Pointer<Integer>} TextLength 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlerror-function
 */
export SQLError(EnvironmentHandle, ConnectionHandle, StatementHandle, Sqlstate, NativeError, MessageText, BufferLength, TextLength) {
    EnvironmentHandleMarshal := EnvironmentHandle is VarRef ? "ptr" : "ptr"
    ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    SqlstateMarshal := Sqlstate is VarRef ? "char*" : "ptr"
    NativeErrorMarshal := NativeError is VarRef ? "int*" : "ptr"
    MessageTextMarshal := MessageText is VarRef ? "char*" : "ptr"
    TextLengthMarshal := TextLength is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLError", EnvironmentHandleMarshal, EnvironmentHandle, ConnectionHandleMarshal, ConnectionHandle, StatementHandleMarshal, StatementHandle, SqlstateMarshal, Sqlstate, NativeErrorMarshal, NativeError, MessageTextMarshal, MessageText, "short", BufferLength, TextLengthMarshal, TextLength, Int16)
    return result
}

/**
 * SQLExecDirect Function
 * @remarks
 * The application calls **SQLExecDirect** to send an SQL statement to the data source. For more information about direct execution, see [Direct Execution](../../../odbc/reference/develop-app/direct-execution-odbc.md). The driver modifies the statement to use the form of SQL used by the data source and then submits it to the data source. In particular, the driver modifies the escape sequences used to define certain features in SQL. For the syntax of escape sequences, see [Escape Sequences in ODBC](../../../odbc/reference/develop-app/escape-sequences-in-odbc.md).  
 *   
 *  The application can include one or more parameter markers in the SQL statement. To include a parameter marker, the application embeds a question mark (?) into the SQL statement at the appropriate position. For information about parameters, see [Statement Parameters](../../../odbc/reference/develop-app/statement-parameters.md).  
 *   
 *  If the SQL statement is a **SELECT** statement and if the application called **SQLSetCursorName** to associate a cursor with a statement, then the driver uses the specified cursor. Otherwise, the driver generates a cursor name.  
 *   
 *  If the data source is in manual-commit mode (requiring explicit transaction initiation) and a transaction has not already been initiated, the driver initiates a transaction before it sends the SQL statement. For more information, see [Manual-Commit Mode](../../../odbc/reference/develop-app/manual-commit-mode.md).  
 *   
 *  If an application uses **SQLExecDirect** to submit a **COMMIT** or **ROLLBACK** statement, it will not be interoperable between DBMS products. To commit or roll back a transaction, an application calls **SQLEndTran**.  
 *   
 *  If **SQLExecDirect** encounters a data-at-execution parameter, it returns SQL_NEED_DATA. The application sends the data using **SQLParamData** and **SQLPutData**. See [SQLBindParameter](../../../odbc/reference/syntax/sqlbindparameter-function.md), [SQLParamData](../../../odbc/reference/syntax/sqlparamdata-function.md), [SQLPutData](../../../odbc/reference/syntax/sqlputdata-function.md), and [Sending Long Data](../../../odbc/reference/develop-app/sending-long-data.md).  
 *   
 *  If **SQLExecDirect** executes a searched update, insert, or delete statement that does not affect any rows at the data source, the call to **SQLExecDirect** returns SQL_NO_DATA.  
 *   
 *  If the value of the SQL_ATTR_PARAMSET_SIZE statement attribute is greater than 1 and the SQL statement contains at least one parameter marker, **SQLExecDirect** will execute the SQL statement once for each set of parameter values from the arrays pointed to by the *ParameterValuePointer* argument in the call to **SQLBindParameter**. For more information, see [Arrays of Parameter Values](../../../odbc/reference/develop-app/arrays-of-parameter-values.md).  
 *   
 *  If bookmarks are turned on and a query is executed that cannot support bookmarks, the driver should attempt to coerce the environment to one that supports bookmarks by changing an attribute value and returning SQLSTATE 01S02 (Option value changed). If the attribute cannot be changed, the driver should return SQLSTATE HY024 (Invalid attribute value).  
 *   
 * > [!NOTE]  
 * >  When using connection pooling, an application must not execute SQL statements that change the database or the context of the database, such as the **USE** _database_ statement in SQL Server, which changes the catalog used by a data source.
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Pointer<Integer>} StatementText [Input] SQL statement to be executed.
 * @param {Integer} TextLength [Input] Length of **StatementText* in characters.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NEED_DATA, SQL_STILL_EXECUTING, SQL_ERROR, SQL_NO_DATA, SQL_INVALID_HANDLE, or SQL_PARAM_DATA_AVAILABLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlexecdirect-function
 */
export SQLExecDirect(StatementHandle, StatementText, TextLength) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    StatementTextMarshal := StatementText is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLExecDirect", StatementHandleMarshal, StatementHandle, StatementTextMarshal, StatementText, "int", TextLength, Int16)
    return result
}

/**
 * SQLExecute Function
 * @remarks
 * **SQLExecute** executes a statement prepared by **SQLPrepare**. After the application processes or discards the results from a call to **SQLExecute**, the application can call **SQLExecute** again with new parameter values. For more information about prepared execution, see [Prepared Execution](../../../odbc/reference/develop-app/prepared-execution-odbc.md).  
 *   
 *  To execute a **SELECT** statement more than once, the application must call **SQLCloseCursor** before reexecuting the **SELECT** statement.  
 *   
 *  If the data source is in manual-commit mode (requiring explicit transaction initiation) and a transaction has not already been initiated, the driver initiates a transaction before it sends the SQL statement. For more information, see [Transactions](../../../odbc/reference/develop-app/transactions-odbc.md).  
 *   
 *  If an application uses **SQLPrepare** to prepare and **SQLExecute** to submit a **COMMIT** or **ROLLBACK** statement, it will not be interoperable between DBMS products. To commit or roll back a transaction, call **SQLEndTran**.  
 *   
 *  If **SQLExecute** encounters a data-at-execution parameter, it returns SQL_NEED_DATA. The application sends the data using **SQLParamData** and **SQLPutData**. See [SQLBindParameter](../../../odbc/reference/syntax/sqlbindparameter-function.md), [SQLParamData](../../../odbc/reference/syntax/sqlparamdata-function.md), [SQLPutData](../../../odbc/reference/syntax/sqlputdata-function.md), and [Sending Long Data](../../../odbc/reference/develop-app/sending-long-data.md).  
 *   
 *  If **SQLExecute** executes a searched update, insert, or delete statement that does not affect any rows at the data source, the call to **SQLExecute** returns SQL_NO_DATA.  
 *   
 *  If the value of the SQL_ATTR_PARAMSET_SIZE statement attribute is greater than 1 and the SQL statement contains at least one parameter marker, **SQLExecute** executes the SQL statement once for each set of parameter values in the arrays pointed to by the *\*ParameterValuePtr* argument in the calls to **SQLBindParameter**. For more information, see [Arrays of Parameter Values](../../../odbc/reference/develop-app/arrays-of-parameter-values.md).  
 *   
 *  If bookmarks are enabled and a query is executed that cannot support bookmarks, the driver should attempt to coerce the environment to one that supports bookmarks by changing an attribute value and returning SQLSTATE 01S02 (Option value changed). If the attribute cannot be changed, the driver should return SQLSTATE HY024 (Invalid attribute value).  
 *   
 * > [!NOTE]  
 * >  When using connection pooling, an application must not execute SQL statements that change the database or the context of the database, such as the **USE** _database_ statement in SQL Server, which changes the catalog used by a data source.
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NEED_DATA, SQL_STILL_EXECUTING, SQL_ERROR, SQL_NO_DATA, SQL_INVALID_HANDLE, or SQL_PARAM_DATA_AVAILABLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlexecute-function
 */
export SQLExecute(StatementHandle) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLExecute", StatementHandleMarshal, StatementHandle, Int16)
    return result
}

/**
 * SQLFetch Function
 * @remarks
 * **SQLFetch** returns the next rowset in the result set. It can be called only while a result set exists: that is, after a call that creates a result set and before the cursor over that result set is closed. If any columns are bound, it returns the data in those columns. If the application has specified a pointer to a row status array or a buffer in which to return the number of rows fetched, **SQLFetch** also returns this information. Calls to **SQLFetch** can be mixed with calls to **SQLFetchScroll** but cannot be mixed with calls to **SQLExtendedFetch**. For more information, see [Fetching a Row of Data](../../../odbc/reference/develop-app/fetching-a-row-of-data.md).  
 *   
 *  If an ODBC 3*.x* application works with an ODBC 2*.x* driver, the Driver Manager maps **SQLFetch** calls to **SQLExtendedFetch** for an ODBC 2*.x* driver that supports **SQLExtendedFetch**. If the ODBC 2*.x* driver does not support **SQLExtendedFetch**, the Driver Manager maps **SQLFetch** calls to **SQLFetch** in the ODBC 2*.x* driver, which can fetch only a single row.  
 *   
 *  For more information, see [Block Cursors, Scrollable Cursors, and Backward Compatibility](../../../odbc/reference/appendixes/block-cursors-scrollable-cursors-and-backward-compatibility.md) in Appendix G: Driver Guidelines for Backward Compatibility.
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfetch-function
 */
export SQLFetch(StatementHandle) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLFetch", StatementHandleMarshal, StatementHandle, Int16)
    return result
}

/**
 * SQLFreeConnect Function
 * @param {Pointer<Void>} ConnectionHandle 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfreeconnect-function
 */
export SQLFreeConnect(ConnectionHandle) {
    ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLFreeConnect", ConnectionHandleMarshal, ConnectionHandle, Int16)
    return result
}

/**
 * SQLFreeEnv Function
 * @param {Pointer<Void>} EnvironmentHandle 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfreeenv-function
 */
export SQLFreeEnv(EnvironmentHandle) {
    EnvironmentHandleMarshal := EnvironmentHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLFreeEnv", EnvironmentHandleMarshal, EnvironmentHandle, Int16)
    return result
}

/**
 * SQLFreeHandle Function
 * @remarks
 * **SQLFreeHandle** is used to free handles for environments, connections, statements, and descriptors, as described in the following sections. For general information about handles, see [Handles](../../../odbc/reference/develop-app/handles.md).  
 *   
 *  An application should not use a handle after it has been freed; the Driver Manager does not check the validity of a handle in a function call.
 * @param {Integer} _HandleType [Input] The type of handle to be freed by **SQLFreeHandle**. Must be one of the following values:  
 *   
 * -   SQL_HANDLE_DBC  
 *   
 * -   SQL_HANDLE_DBC_INFO_TOKEN  
 *   
 * -   SQL_HANDLE_DESC  
 *   
 * -   SQL_HANDLE_ENV  
 *   
 * -   SQL_HANDLE_STMT  
 *   
 *  SQL_HANDLE_DBC_INFO_TOKEN handle is used only by the Driver Manager and driver. Applications should not use this handle type. For more information about SQL_HANDLE_DBC_INFO_TOKEN, see [Developing Connection-Pool Awareness in an ODBC Driver](../../../odbc/reference/develop-driver/developing-connection-pool-awareness-in-an-odbc-driver.md).  
 *   
 *  If *HandleType* is not one of these values, **SQLFreeHandle** returns SQL_INVALID_HANDLE.
 * @param {Pointer<Void>} _Handle [Input] The handle to be freed.
 * @returns {Integer} SQL_SUCCESS, SQL_ERROR, or SQL_INVALID_HANDLE.  
 *   
 *  If **SQLFreeHandle** returns SQL_ERROR, the handle is still valid.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfreehandle-function
 */
export SQLFreeHandle(_HandleType, _Handle) {
    _HandleMarshal := _Handle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLFreeHandle", "short", _HandleType, _HandleMarshal, _Handle, Int16)
    return result
}

/**
 * SQLFreeStmt Function
 * @remarks
 * Calling **SQLFreeStmt** with the SQL_CLOSE option is equivalent to calling **SQLCloseCursor**, except that **SQLFreeStmt** with SQL_CLOSE does not affect the application if no cursor is open on the statement. If no cursor is open, a call to **SQLCloseCursor** returns SQLSTATE 24000 (Invalid cursor state).  
 *   
 *  An application should not use a statement handle after it has been freed; the Driver Manager does not check the validity of a handle in a function call.
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle
 * @param {Integer} Option [Input] One of the following options:  
 *   
 *  SQL_ CLOSE: Closes the cursor associated with *StatementHandle* (if one was defined) and discards all pending results. The application can reopen this cursor later by executing a **SELECT** statement again with the same or different parameter values. If no cursor is open, this option has no effect for the application. **SQLCloseCursor** can also be called to close a cursor. For more information, see [Closing the Cursor](../../../odbc/reference/develop-app/closing-the-cursor.md).  
 *   
 *  SQL_DROP: This option is deprecated. A call to **SQLFreeStmt** with an *Option* of SQL_DROP is mapped in the Driver Manager to [SQLFreeHandle](../../../odbc/reference/syntax/sqlfreehandle-function.md).  
 *   
 *  SQL_UNBIND: Sets the SQL_DESC_COUNT field of the ARD to 0, releasing all column buffers bound by **SQLBindCol** for the given *StatementHandle*. This does not unbind the bookmark column; to do that, the SQL_DESC_DATA_PTR field of the ARD for the bookmark column is set to NULL. Notice that if this operation is performed on an explicitly allocated descriptor that is shared by more than one statement, the operation will affect the bindings of all statements that share the descriptor. For more information, see [Overview of Retrieving Results (Basic)](../../../odbc/reference/develop-app/retrieving-results-basic.md).  
 *   
 *  SQL_RESET_PARAMS: Sets the SQL_DESC_COUNT field of the APD to 0, releasing all parameter buffers set by **SQLBindParameter** for the given *StatementHandle*. If this operation is performed on an explicitly allocated descriptor that is shared by more than one statement, this operation will affect the bindings of all the statements that share the descriptor. For more information, see [Binding Parameters](../../../odbc/reference/develop-app/binding-parameters-odbc.md).
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlfreestmt-function
 */
export SQLFreeStmt(StatementHandle, Option) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLFreeStmt", StatementHandleMarshal, StatementHandle, "ushort", Option, Int16)
    return result
}

/**
 * SQLGetConnectAttr Function
 * @remarks
 * For general information about connection attributes, see [Connection Attributes](../../../odbc/reference/develop-app/connection-attributes.md).  
 *   
 *  For a list of attributes that can be set, see [SQLSetConnectAttr](../../../odbc/reference/syntax/sqlsetconnectattr-function.md). Notice that if *Attribute* specifies an attribute that returns a string, *ValuePtr* must be a pointer to a buffer for the string. The maximum length of the returned string, including the null-termination character, will be *BufferLength* bytes.  
 *   
 *  Depending on the attribute, an application does not have to establish a connection before calling **SQLGetConnectAttr**. However, if **SQLGetConnectAttr** is called and the specified attribute does not have a default and has not been set by a prior call to **SQLSetConnectAttr**, **SQLGetConnectAttr** will return SQL_NO_DATA.  
 *   
 *  If *Attribute* is SQL_ATTR_ TRACE or SQL_ATTR_ TRACEFILE, *ConnectionHandle* does not have to be valid, and **SQLGetConnectAttr** will not return SQL_ERROR or SQL_INVALID_HANDLE if *ConnectionHandle* is invalid. These attributes apply to all connections. **SQLGetConnectAttr** will return SQL_ERROR or SQL_INVALID_HANDLE if another argument is invalid.  
 *   
 *  Although an application can set statement attributes by using **SQLSetConnectAttr**, an application cannot use **SQLGetConnectAttr** to retrieve statement attribute values; it must call **SQLGetStmtAttr** to retrieve the setting of statement attributes.  
 *   
 *  Both SQL_ATTR_AUTO_IPD and SQL_ATTR_CONNECTION_DEAD connection attributes can be returned by a call to **SQLGetConnectAttr** but cannot be set by a call to **SQLSetConnectAttr**.  
 *   
 * > [!NOTE]  
 * >  There is no asynchronous support for **SQLGetConnectAttr**. When implementing **SQLGetConnectAttr**, a driver can improve performance by minimizing the number of times that information is sent or requested from the server.
 * @param {Pointer<Void>} ConnectionHandle [Input] Connection handle.
 * @param {Integer} Attribute [Input] Attribute to retrieve.
 * @param {Pointer<Void>} Value 
 * @param {Integer} BufferLength [Input] If *Attribute* is an ODBC-defined attribute and *ValuePtr* points to a character string or a binary buffer, this argument should be the length of \**ValuePtr*. If *Attribute* is an ODBC-defined attribute and *\*ValuePtr* is an integer, *BufferLength* is ignored. If the value in *\*ValuePtr* is a Unicode string (when calling **SQLGetConnectAttrW**), the *BufferLength* argument must be an even number.  
 *   
 *  If *Attribute* is a driver-defined attribute, the application indicates the nature of the attribute to the Driver Manager by setting the *BufferLength* argument. *BufferLength* can have the following values:  
 *   
 * -   If *\*ValuePtr* is a pointer to a character string, *BufferLength* is the length of the string.  
 *   
 * -   If *\*ValuePtr* is a pointer to a binary buffer, the application places the result of the SQL_LEN_BINARY_ATTR(*length*) macro in *BufferLength*. This places a negative value in *BufferLength*.  
 *   
 * -   If *\*ValuePtr* is a pointer to a value other than a character string or binary string, *BufferLength* should have the value SQL_IS_POINTER.  
 *   
 * -   If *\*ValuePtr* contains a fixed-length data type, *BufferLength* is either SQL_IS_INTEGER or SQL_IS_UINTEGER, as appropriate.
 * @param {Pointer<Integer>} StringLengthPtr [Output] A pointer to a buffer in which to return the total number of bytes (excluding the null-termination character) available to return in \**ValuePtr*. If the attribute value is a character string and the number of bytes available to return is greater than *BufferLength* minus the length of the null-termination character, the data in *\*ValuePtr* is truncated to *BufferLength* minus the length of the null-termination character and is null-terminated by the driver.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetconnectattr-function
 */
export SQLGetConnectAttr(ConnectionHandle, Attribute, Value, BufferLength, StringLengthPtr) {
    ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"
    ValueMarshal := Value is VarRef ? "ptr" : "ptr"
    StringLengthPtrMarshal := StringLengthPtr is VarRef ? "int*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetConnectAttr", ConnectionHandleMarshal, ConnectionHandle, "int", Attribute, ValueMarshal, Value, "int", BufferLength, StringLengthPtrMarshal, StringLengthPtr, Int16)
    return result
}

/**
 * SQLGetConnectOption Function
 * @param {Pointer<Void>} ConnectionHandle 
 * @param {Integer} Option 
 * @param {Pointer<Void>} Value 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetconnectoption-function
 * @deprecated ODBC API: SQLGetConnectOption is deprecated. Please use SQLGetConnectAttr instead.
 */
export SQLGetConnectOption(ConnectionHandle, Option, Value) {
    ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"
    ValueMarshal := Value is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetConnectOption", ConnectionHandleMarshal, ConnectionHandle, "ushort", Option, ValueMarshal, Value, Int16)
    return result
}

/**
 * SQLGetCursorName Function
 * @remarks
 * Cursor names are used only in positioned update and delete statements (for example, **UPDATE** _table-name_ ...**WHERE CURRENT OF** _cursor-name_). For more information, see [Positioned Update and Delete Statements](../../../odbc/reference/develop-app/positioned-update-and-delete-statements.md). If the application does not call **SQLSetCursorName** to define a cursor name, the driver generates a name. This name begins with the letters SQL_CUR.  
 *   
 * > [!NOTE]
 * >  In ODBC 2*.x*, when there was no open cursor and no name had been set by a call to **SQLSetCursorName**, a call to **SQLGetCursorName** returned SQLSTATE HY015 (No cursor name available). In ODBC 3*.x*, this is no longer true; regardless of when **SQLGetCursorName** is called, the driver returns the cursor name.  
 *   
 *  **SQLGetCursorName** returns the name of a cursor whether or not the name was created explicitly or implicitly. A cursor name is implicitly generated if **SQLSetCursorName** is not called. **SQLSetCursorName** can be called to rename a cursor on a statement as long as the cursor is in an allocated or prepared state.  
 *   
 *  A cursor name that is set either explicitly or implicitly remains set until the *StatementHandle* with which it is associated is dropped, using **SQLFreeHandle** with a *HandleType* of SQL_HANDLE_STMT.
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Pointer<Integer>} CursorName [Output] Pointer to a buffer in which to return the cursor name.  
 *   
 *  If *CursorName* is NULL, *NameLengthPtr* will still return the total number of characters (excluding the null-termination character for character data) available to return in the buffer pointed to by *CursorName*.
 * @param {Integer} BufferLength [Input] Length of \**CursorName*, in characters.
 * @param {Pointer<Integer>} NameLengthPtr [Output] Pointer to memory in which to return the total number of characters (excluding the null-termination character) available to return in \**CursorName*. If the number of characters available to return is greater than or equal to *BufferLength*, the cursor name in \**CursorName* is truncated to *BufferLength* minus the length of a null-termination character.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetcursorname-function
 */
export SQLGetCursorName(StatementHandle, CursorName, BufferLength, NameLengthPtr) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    CursorNameMarshal := CursorName is VarRef ? "char*" : "ptr"
    NameLengthPtrMarshal := NameLengthPtr is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetCursorName", StatementHandleMarshal, StatementHandle, CursorNameMarshal, CursorName, "short", BufferLength, NameLengthPtrMarshal, NameLengthPtr, Int16)
    return result
}

/**
 * SQLGetDescField Function
 * @remarks
 * An application can call **SQLGetDescField** to return the value of a single field of a descriptor record. A call to **SQLGetDescField** can return the setting of any field in any descriptor type, including header fields, record fields, and bookmark fields. An application can obtain the settings of multiple fields in the same or different descriptors, in arbitrary order, by making repeated calls to **SQLGetDescField**. **SQLGetDescField** can also be called to return driver-defined descriptor fields.  
 *   
 *  For performance reasons, an application should not call **SQLGetDescField** for an IRD before executing a statement.  
 *   
 *  The settings of multiple fields that describe the name, data type, and storage of column or parameter data can also be retrieved in a single call to **SQLGetDescRec**. **SQLGetStmtAttr** can be called to return the setting of a single field in the descriptor header that is also a statement attribute. **SQLColAttribute**, **SQLDescribeCol**, and **SQLDescribeParam** return record or bookmark fields.  
 *   
 *  When an application calls **SQLGetDescField** to retrieve the value of a field that is undefined for a particular descriptor type, the function returns SQL_SUCCESS but the value returned for the field is undefined. For example, calling **SQLGetDescField** for the SQL_DESC_NAME or SQL_DESC_NULLABLE field of an APD or ARD will return SQL_SUCCESS but an undefined value for the field.  
 *   
 *  When an application calls **SQLGetDescField** to retrieve the value of a field that is defined for a particular descriptor type but that has no default value and has not been set yet, the function returns SQL_SUCCESS but the value returned for the field is undefined. For more information on the initialization of descriptor fields and descriptions of the fields, see "Initialization of Descriptor Fields" in [SQLSetDescField](../../../odbc/reference/syntax/sqlsetdescfield-function.md). For more information on descriptors, see [Descriptors](../../../odbc/reference/develop-app/descriptors.md).
 * @param {Pointer<Void>} DescriptorHandle [Input] Descriptor handle.
 * @param {Integer} RecNumber [Input] Indicates the descriptor record from which the application seeks information. Descriptor records are numbered from 0, with record number 0 being the bookmark record. If the *FieldIdentifier* argument indicates a header field, *RecNumber* is ignored. If *RecNumber* is less than or equal to SQL_DESC_COUNT but the row does not contain data for a column or parameter, a call to **SQLGetDescField** will return the default values of the fields. (For more information, see "Initialization of Descriptor Fields" in [SQLSetDescField](../../../odbc/reference/syntax/sqlsetdescfield-function.md).)
 * @param {Integer} FieldIdentifier [Input] Indicates the field of the descriptor whose value is to be returned. For more information, see the "*FieldIdentifier* Argument" section in [SQLSetDescField](../../../odbc/reference/syntax/sqlsetdescfield-function.md).
 * @param {Pointer<Void>} Value 
 * @param {Integer} BufferLength [Input] If *FieldIdentifier* is an ODBC-defined field and *ValuePtr* points to a character string or a binary buffer, this argument should be the length of \**ValuePtr*. If *FieldIdentifier* is an ODBC-defined field and \**ValuePtr* is an integer, *BufferLength* is ignored. If the value in *\*ValuePtr* is of a Unicode data type (when calling **SQLGetDescFieldW**), the *BufferLength* argument must be an even number.  
 *   
 *  If *FieldIdentifier* is a driver-defined field, the application indicates the nature of the field to the Driver Manager by setting the *BufferLength* argument. *BufferLength* can have the following values:  
 *   
 * -   If *\*ValuePtr* is a pointer to a character string, then *BufferLength* is the length of the string or SQL_NTS.  
 *   
 * -   If *\*ValuePtr* is a pointer to a binary buffer, then the application places the result of the SQL_LEN_BINARY_ATTR(*length*) macro in *BufferLength*. This places a negative value in *BufferLength*.  
 *   
 * -   If *\*ValuePtr* is a pointer to a value other than a character string or binary string, then *BufferLength* should have the value SQL_IS_POINTER.  
 *   
 * -   If *\*ValuePtr* is contains a fixed-length data type, then *BufferLength* is either SQL_IS_INTEGER, SQL_IS_UINTEGER, SQL_IS_SMALLINT, or SQL_IS_USMALLINT, as appropriate.
 * @param {Pointer<Integer>} StringLength 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, SQL_NO_DATA, or SQL_INVALID_HANDLE.  
 *   
 *  SQL_NO_DATA is returned if *RecNumber* is greater than the current number of descriptor records.  
 *   
 *  SQL_NO_DATA is returned if *DescriptorHandle* is an IRD handle and the statement is in the prepared or executed state but there was no open cursor associated with it.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetdescfield-function
 */
export SQLGetDescField(DescriptorHandle, RecNumber, FieldIdentifier, Value, BufferLength, StringLength) {
    DescriptorHandleMarshal := DescriptorHandle is VarRef ? "ptr" : "ptr"
    ValueMarshal := Value is VarRef ? "ptr" : "ptr"
    StringLengthMarshal := StringLength is VarRef ? "int*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetDescField", DescriptorHandleMarshal, DescriptorHandle, "short", RecNumber, "short", FieldIdentifier, ValueMarshal, Value, "int", BufferLength, StringLengthMarshal, StringLength, Int16)
    return result
}

/**
 * SQLGetDiagField Function
 * @remarks
 * An application typically calls **SQLGetDiagField** to accomplish one of three goals:  
 *   
 * 1.  To obtain specific error or warning information when a function call has returned SQL_ERROR or SQL_SUCCESS_WITH_INFO (or SQL_NEED_DATA for the **SQLBrowseConnect** function).  
 *   
 * 2.  To determine the number of rows in the data source that were affected when insert, delete, or update operations were performed with a call to **SQLExecute**, **SQLExecDirect**, **SQLBulkOperations**, or **SQLSetPos** (from the SQL_DIAG_ROW_COUNT header field), or to determine the number of rows that exist in the current open cursor, if the driver can provide this information (from the SQL_DIAG_CURSOR_ROW_COUNT header field).  
 *   
 * 3.  To determine which function was executed by a call to **SQLExecDirect** or **SQLExecute** (from the SQL_DIAG_DYNAMIC_FUNCTION and SQL_DIAG_DYNAMIC_FUNCTION_CODE header fields).  
 *   
 *  Any ODBC function can post zero or more diagnostic records every time that it is called, so an application can call **SQLGetDiagField** after any ODBC function call. There is no limit to the number of diagnostic records that can be stored at any one time. **SQLGetDiagField** retrieves only the diagnostic information most recently associated with the diagnostic data structure specified in the *Handle* argument. If the application calls an ODBC function other than **SQLGetDiagField** or **SQLGetDiagRec**, any diagnostic information from a previous call with the same handle is lost.  
 *   
 *  An application can scan all diagnostic records by incrementing *RecNumber*, as long as **SQLGetDiagField** returns SQL_SUCCESS. The number of status records is indicated in the SQL_DIAG_NUMBER header field. Calls to **SQLGetDiagField** are nondestructive to the header and record fields. The application can call **SQLGetDiagField** again later to retrieve a field from a record, as long as a function other than the diagnostic functions has not been called in the interim, which would post records on the same handle.  
 *   
 *  An application can call **SQLGetDiagField** to return any diagnostic field at any time, except for SQL_DIAG_CURSOR_ROW_COUNT or SQL_DIAG_ROW_COUNT, which will return SQL_ERROR if *Handle* is not a statement handle. If any other diagnostic field is undefined, the call to **SQLGetDiagField** will return SQL_SUCCESS (provided no other diagnostic is encountered) and an undefined value is returned for the field.  
 *   
 *  For more information, see [Using SQLGetDiagRec and SQLGetDiagField](../../../odbc/reference/develop-app/using-sqlgetdiagrec-and-sqlgetdiagfield.md) and [Implementing SQLGetDiagRec and SQLGetDiagField](../../../odbc/reference/develop-app/implementing-sqlgetdiagrec-and-sqlgetdiagfield.md).  
 *   
 *  Calling an API other than the one that's being executed asynchronously will generate HY010 "Function sequence error". However, the error record cannot be retrieved before the asynchronous operation completes.
 * @param {Integer} _HandleType [Input] A handle type identifier that describes the type of handle for which diagnostics are required. Must be one of the following:  
 *   
 * -   SQL_HANDLE_DBC  
 *   
 * -   SQL_HANDLE_DBC_INFO_TOKEN  
 *   
 * -   SQL_HANDLE_DESC  
 *   
 * -   SQL_HANDLE_ENV  
 *   
 * -   SQL_HANDLE_STMT  
 *   
 *  SQL_HANDLE_DBC_INFO_TOKEN handle is used only by the Driver Manager and driver. Applications should not use this handle type. For more information about SQL_HANDLE_DBC_INFO_TOKEN, see [Developing Connection-Pool Awareness in an ODBC Driver](../../../odbc/reference/develop-driver/developing-connection-pool-awareness-in-an-odbc-driver.md).
 * @param {Pointer<Void>} _Handle [Input] A handle for the diagnostic data structure, of the type indicated by *HandleType*. If *HandleType* is SQL_HANDLE_ENV, *Handle* can be either a shared or an unshared environment handle.
 * @param {Integer} RecNumber [Input] Indicates the status record from which the application seeks information. Status records are numbered from 1. If the *DiagIdentifier* argument indicates any field of the diagnostics header, *RecNumber* is ignored. If not, it should be more than 0.
 * @param {Integer} DiagIdentifier [Input] Indicates the field of the diagnostic whose value is to be returned. For more information, see the "*DiagIdentifier* Argument" section in "Comments."
 * @param {Pointer<Void>} DiagInfo 
 * @param {Integer} BufferLength [Input] If *DiagIdentifier* is an ODBC-defined diagnostic and *DiagInfoPtr* points to a character string or a binary buffer, this argument should be the length of \**DiagInfoPtr*. If *DiagIdentifier* is an ODBC-defined field and \**DiagInfoPtr* is an integer, *BufferLength* is ignored. If the value in *\*DiagInfoPtr* is a Unicode string (when calling **SQLGetDiagFieldW**), the *BufferLength* argument must be an even number.  
 *   
 *  If *DiagIdentifier* is a driver-defined field, the application indicates the nature of the field to the Driver Manager by setting the *BufferLength* argument. *BufferLength* can have the following values:  
 *   
 * -   If *DiagInfoPtr* is a pointer to a character string, *BufferLength* is the length of the string or SQL_NTS.  
 *   
 * -   If *DiagInfoPtr* is a pointer to a binary buffer, the application places the result of the SQL_LEN_BINARY_ATTR(*length*) macro in *BufferLength*. This places a negative value in *BufferLength*.  
 *   
 * -   If *DiagInfoPtr* is a pointer to a value other than a character string or binary string, *BufferLength* should have the value SQL_IS_POINTER.  
 *   
 * -   If *\*DiagInfoPtr* contains a fixed-length data type, *BufferLength* is SQL_IS_INTEGER, SQL_IS_UINTEGER, SQL_IS_SMALLINT, or SQL_IS_USMALLINT, as appropriate.
 * @param {Pointer<Integer>} StringLength 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, SQL_INVALID_HANDLE, or SQL_NO_DATA.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetdiagfield-function
 */
export SQLGetDiagField(_HandleType, _Handle, RecNumber, DiagIdentifier, DiagInfo, BufferLength, StringLength) {
    _HandleMarshal := _Handle is VarRef ? "ptr" : "ptr"
    DiagInfoMarshal := DiagInfo is VarRef ? "ptr" : "ptr"
    StringLengthMarshal := StringLength is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetDiagField", "short", _HandleType, _HandleMarshal, _Handle, "short", RecNumber, "short", DiagIdentifier, DiagInfoMarshal, DiagInfo, "short", BufferLength, StringLengthMarshal, StringLength, Int16)
    return result
}

/**
 * SQLGetDiagRec Function
 * @remarks
 * An application typically calls **SQLGetDiagRec** when a previous call to an ODBC function has returned SQL_ERROR or SQL_SUCCESS_WITH_INFO. However, because any ODBC function can post zero or more diagnostic records each time it is called, an application can call **SQLGetDiagRec** after any ODBC function call. An application can call **SQLGetDiagRec** multiple times to return some or all of the records in the diagnostic data structure. ODBC imposes no limit to the number of diagnostic records that can be stored at any one time.  
 *   
 *  **SQLGetDiagRec** cannot be used to return fields from the header of the diagnostic data structure. (The *RecNumber* argument must be greater than 0.) The application should call **SQLGetDiagField** for this purpose.  
 *   
 *  **SQLGetDiagRec** retrieves only the diagnostic information most recently associated with the handle specified in the *Handle* argument. If the application calls another ODBC function, except **SQLGetDiagRec**, **SQLGetDiagField**, or **SQLError**, any diagnostic information from the previous calls on the same handle is lost.  
 *   
 *  An application can scan all diagnostic records by looping, incrementing *RecNumber*, as long as **SQLGetDiagRec** returns SQL_SUCCESS. Calls to **SQLGetDiagRec** are nondestructive to the header and record fields. The application can call **SQLGetDiagRec** again at a later time to retrieve a field from a record as long as no other function, except **SQLGetDiagRec**, **SQLGetDiagField**, or **SQLError**, has been called in the interim. The application can also retrieve a count of the total number of diagnostic records available by calling **SQLGetDiagField** to retrieve the value of the SQL_DIAG_NUMBER field, and then calling **SQLGetDiagRec** that many times.  
 *   
 *  For a description of the fields of the diagnostic data structure, see [SQLGetDiagField](../../../odbc/reference/syntax/sqlgetdiagfield-function.md). For more information, see [Using SQLGetDiagRec and SQLGetDiagField](../../../odbc/reference/develop-app/using-sqlgetdiagrec-and-sqlgetdiagfield.md) and [Implementing SQLGetDiagRec and SQLGetDiagField](../../../odbc/reference/develop-app/implementing-sqlgetdiagrec-and-sqlgetdiagfield.md).  
 *   
 *  Calling an API other than the one that's being executed asynchronously will generate HY010 "Function sequence error". However, the error record cannot be retrieved before the asynchronous operation completes.
 * @param {Integer} _HandleType [Input] A handle type identifier that describes the type of handle for which diagnostics are required. Must be one of the following:  
 *   
 * -   SQL_HANDLE_DBC  
 *   
 * -   SQL_HANDLE_DBC_INFO_TOKEN  
 *   
 * -   SQL_HANDLE_DESC  
 *   
 * -   SQL_HANDLE_ENV  
 *   
 * -   SQL_HANDLE_STMT  
 *   
 *  SQL_HANDLE_DBC_INFO_TOKEN handle is used only by the Driver Manager and driver. Applications should not use this handle type. For more information about SQL_HANDLE_DBC_INFO_TOKEN, see [Developing Connection-Pool Awareness in an ODBC Driver](../../../odbc/reference/develop-driver/developing-connection-pool-awareness-in-an-odbc-driver.md).
 * @param {Pointer<Void>} _Handle [Input] A handle for the diagnostic data structure, of the type indicated by *HandleType*. If *HandleType* is SQL_HANDLE_ENV, *Handle* can be either a shared or an unshared environment handle.
 * @param {Integer} RecNumber [Input] Indicates the status record from which the application seeks information. Status records are numbered from 1.
 * @param {Pointer<Integer>} Sqlstate 
 * @param {Pointer<Integer>} NativeError 
 * @param {Pointer<Integer>} MessageText [Output] Pointer to a buffer in which to return the diagnostic message text string. This information is contained in the SQL_DIAG_MESSAGE_TEXT diagnostic field. For the format of the string, see [Diagnostic Messages](../../../odbc/reference/develop-app/diagnostic-messages.md).  
 *   
 *  If *MessageText* is NULL, *TextLengthPtr* will still return the total number of characters (excluding the null-termination character for character data) available to return in the buffer pointed to by *MessageText*.
 * @param {Integer} BufferLength [Input] Length of the **MessageText* buffer in characters. There is no maximum length of the diagnostic message text.
 * @param {Pointer<Integer>} TextLength 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, SQL_NO_DATA, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetdiagrec-function
 */
export SQLGetDiagRec(_HandleType, _Handle, RecNumber, Sqlstate, NativeError, MessageText, BufferLength, TextLength) {
    _HandleMarshal := _Handle is VarRef ? "ptr" : "ptr"
    SqlstateMarshal := Sqlstate is VarRef ? "char*" : "ptr"
    NativeErrorMarshal := NativeError is VarRef ? "int*" : "ptr"
    MessageTextMarshal := MessageText is VarRef ? "char*" : "ptr"
    TextLengthMarshal := TextLength is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetDiagRec", "short", _HandleType, _HandleMarshal, _Handle, "short", RecNumber, SqlstateMarshal, Sqlstate, NativeErrorMarshal, NativeError, MessageTextMarshal, MessageText, "short", BufferLength, TextLengthMarshal, TextLength, Int16)
    return result
}

/**
 * SQLGetEnvAttr Function
 * @remarks
 * For a list of attributes, see [SQLSetEnvAttr](../../../odbc/reference/syntax/sqlsetenvattr-function.md). There are no driver-specific environment attributes. If *Attribute* specifies an attribute that returns a string, *ValuePtr* must be a pointer to a buffer in which to return the string. The maximum length of the string, including the null-termination byte, will be *BufferLength* bytes.  
 *   
 *  **SQLGetEnvAttr** can be called at any time between the allocation and the freeing of an environment handle. All environment attributes successfully set by the application for the environment persist until **SQLFreeHandle** is called on the *EnvironmentHandle* with a *HandleType* of SQL_HANDLE_ENV. More than one environment handle can be allocated simultaneously in ODBC 3*.x*. An environment attribute on one environment is not affected when another environment has been allocated.  
 *   
 * > [!NOTE]
 * >  The SQL_ATTR_OUTPUT_NTS environment attribute is supported by standards-compliant applications. When **SQLGetEnvAttr** is called, the ODBC 3*.x* Driver Manager always returns SQL_TRUE for this attribute. SQL_ATTR_OUTPUT_NTS can be set to SQL_TRUE only by a call to **SQLSetEnvAttr**.
 * @param {Pointer<Void>} EnvironmentHandle [Input] Environment handle.
 * @param {Integer} Attribute [Input] Attribute to retrieve.
 * @param {Pointer<Void>} Value 
 * @param {Integer} BufferLength [Input] If *ValuePtr* points to a character string, this argument should be the length of \**ValuePtr*. If \**ValuePtr* is an integer, *BufferLength* is ignored. If *\*ValuePtr* is a Unicode string (when calling **SQLGetEnvAttrW**), the *BufferLength* argument must be an even number. If the attribute value is not a character string, *BufferLength* is unused.
 * @param {Pointer<Integer>} StringLength 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetenvattr-function
 */
export SQLGetEnvAttr(EnvironmentHandle, Attribute, Value, BufferLength, StringLength) {
    EnvironmentHandleMarshal := EnvironmentHandle is VarRef ? "ptr" : "ptr"
    ValueMarshal := Value is VarRef ? "ptr" : "ptr"
    StringLengthMarshal := StringLength is VarRef ? "int*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetEnvAttr", EnvironmentHandleMarshal, EnvironmentHandle, "int", Attribute, ValueMarshal, Value, "int", BufferLength, StringLengthMarshal, StringLength, Int16)
    return result
}

/**
 * SQLGetFunctions Function
 * @remarks
 * **SQLGetFunctions** always returns that **SQLGetFunctions**, **SQLDataSources**, and **SQLDrivers** are supported. It does this because these functions are implemented in the Driver Manager. The Driver Manager will map an ANSI function to the corresponding Unicode function if the Unicode function exists and will map a Unicode function to the corresponding ANSI function if the ANSI function exists. For information about how applications use **SQLGetFunctions**, see [Interface Conformance Levels](../../../odbc/reference/develop-app/interface-conformance-levels.md).  
 *   
 *  The following is a list of valid values for *FunctionId* for functions that conform to the ISO 92 standards-compliance level:  
 *   
 * |FunctionId Value|FunctionId Value|  
 * |----------|----------|  
 * |SQL_API_SQLALLOCHANDLE|SQL_API_SQLGETDESCFIELD|  
 * |SQL_API_SQLBINDCOL|SQL_API_SQLGETDESCREC|  
 * |SQL_API_SQLCANCEL|SQL_API_SQLGETDIAGFIELD|  
 * |SQL_API_SQLCLOSECURSOR|SQL_API_SQLGETDIAGREC|  
 * |SQL_API_SQLCOLATTRIBUTE|SQL_API_SQLGETENVATTR|  
 * |SQL_API_SQLCONNECT|SQL_API_SQLGETFUNCTIONS|  
 * |SQL_API_SQLCOPYDESC|SQL_API_SQLGETINFO|  
 * |SQL_API_SQLDATASOURCES|SQL_API_SQLGETSTMTATTR|  
 * |SQL_API_SQLDESCRIBECOL|SQL_API_SQLGETTYPEINFO|  
 * |SQL_API_SQLDISCONNECT|SQL_API_SQLNUMRESULTCOLS|  
 * |SQL_API_SQLDRIVERS|SQL_API_SQLPARAMDATA|  
 * |SQL_API_SQLENDTRAN|SQL_API_SQLPREPARE|  
 * |SQL_API_SQLEXECDIRECT|SQL_API_SQLPUTDATA|  
 * |SQL_API_SQLEXECUTE|SQL_API_SQLROWCOUNT|  
 * |SQL_API_SQLFETCH|SQL_API_SQLSETCONNECTATTR|  
 * |SQL_API_SQLFETCHSCROLL|SQL_API_SQLSETCURSORNAME|  
 * |SQL_API_SQLFREEHANDLE|SQL_API_SQLSETDESCFIELD|  
 * |SQL_API_SQLFREESTMT|SQL_API_SQLSETDESCREC|  
 * |SQL_API_SQLGETCONNECTATTR|SQL_API_SQLSETENVATTR|  
 * |SQL_API_SQLGETCURSORNAME|SQL_API_SQLSETSTMTATTR|  
 * |SQL_API_SQLGETDATA| |  
 *   
 *  The following is a list of valid values for *FunctionId* for functions conforming to the Open Group standards-compliance level:  
 *   
 * |FunctionId Value|FunctionId Value|  
 * |-|-|  
 * |SQL_API_SQLCOLUMNS|SQL_API_SQLSTATISTICS|  
 * |SQL_API_SQLSPECIALCOLUMNS|SQL_API_SQLTABLES|  
 *   
 *  The following is a list of valid values for *FunctionId* for functions conforming to the ODBC standards-compliance level.  
 *   
 * |FunctionId Value|FunctionId Value|  
 * |-|-|  
 * |SQL_API_SQLBINDPARAMETER|SQL_API_SQLNATIVESQL|  
 * |SQL_API_SQLBROWSECONNECT|SQL_API_SQLNUMPARAMS|  
 * |SQL_API_SQLBULKOPERATIONS[1]|SQL_API_SQLPRIMARYKEYS|  
 * |SQL_API_SQLCOLUMNPRIVILEGES|SQL_API_SQLPROCEDURECOLUMNS|  
 * |SQL_API_SQLDESCRIBEPARAM|SQL_API_SQLPROCEDURES|  
 * |SQL_API_SQLDRIVERCONNECT|SQL_API_SQLSETPOS|  
 * |SQL_API_SQLFOREIGNKEYS|SQL_API_SQLTABLEPRIVILEGES|  
 * |SQL_API_SQLMORERESULTS| |  
 *   
 *  [1]   When working with an ODBC 2*.x* driver, **SQLBulkOperations** will be returned as supported only if both of the following are true: the ODBC 2*.x* driver supports **SQLSetPos**, and the information type SQL_POS_OPERATIONS returns the SQL_POS_ADD bit as set.  
 *   
 *  The following is a list of valid values for *FunctionId* for functions introduced in ODBC 3.8 or later:  
 *   
 * |FunctionId Value|  
 * |-|  
 * |SQL_API_SQLCANCELHANDLE [2]|  
 *   
 *  [2]   **SQLCancelHandle** will be returned as supported only if the driver supports both **SQLCancel** and **SQLCancelHandle**. If **SQLCancel** is supported but **SQLCancelHandle** is not, the application can still call **SQLCancelHandle** on a statement handle, because it will be mapped to **SQLCancel**.
 * @param {Pointer<Void>} ConnectionHandle [Input] Connection handle.
 * @param {Integer} FunctionId [Input] A **#define** value that identifies the ODBC function of interest; **SQL_API_ODBC3_ALL_FUNCTIONS orSQL_API_ALL_FUNCTIONS**. **SQL_API_ODBC3_ALL_FUNCTIONS** is used by an ODBC 3*.x* application to determine support of ODBC 3*.x* and earlier functions. **SQL_API_ALL_FUNCTIONS** is used by an ODBC 2*.x* application to determine support of ODBC 2*.x* and earlier functions.  
 *   
 *  For a list of **#define** values that identify ODBC functions, see the tables in "Comments."
 * @param {Pointer<Integer>} Supported 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetfunctions-function
 */
export SQLGetFunctions(ConnectionHandle, FunctionId, Supported) {
    ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"
    SupportedMarshal := Supported is VarRef ? "ushort*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetFunctions", ConnectionHandleMarshal, ConnectionHandle, "ushort", FunctionId, SupportedMarshal, Supported, Int16)
    return result
}

/**
 * SQLGetInfo Function
 * @remarks
 * The currently defined information types are shown in "Information Types," later in this section; it is expected that more will be defined to take advantage of different data sources. A range of information types is reserved by ODBC; driver developers must reserve values for their own driver-specific use from Open Group. **SQLGetInfo** performs no Unicode conversion or *thunking* (see [Appendix A: ODBC Error Codes](../appendixes/appendix-a-odbc-error-codes.md) of the *ODBC Programmer's Reference*) for driver-defined *InfoTypes*. For more information, see [Driver-Specific Data Types, Descriptor Types, Information Types, Diagnostic Types, and Attributes](../develop-app/driver-specific-data-types-descriptor-information-diagnostic.md). The format of the information returned in \**InfoValuePtr* depends on the *InfoType* requested. **SQLGetInfo** will return information in one of five different formats:  
 *   
 * - A null-terminated character string  
 *   
 * - An SQLUSMALLINT value  
 *   
 * - An SQLUINTEGER bitmask  
 *   
 * - An SQLUINTEGER value  
 *   
 * - A SQLUINTEGER binary value  
 *   
 *  The format of each of the following information types is noted in the type's description. The application must cast the value returned in **InfoValuePtr* accordingly. For an example of how an application could retrieve data from a SQLUINTEGER bitmask, see "Code Example."  
 *   
 *  A driver must return a value for each information type that is defined in the following tables. If an information type does not apply to the driver or data source, the driver returns one of the values listed in the following table.  
 * 
 * |Information type|Value|
 * |-|-|
 * |Character string ("Y" or "N")|"N"|
 * |Character string (not "Y" or "N")|Empty string|
 * |SQLUSMALLINT|0|
 * |SQLUINTEGER bitmask or SQLUINTEGER binary value|0L|
 *   
 *  For example, if a data source does not support procedures, **SQLGetInfo** returns the values listed in the following table for the values of *InfoType* that are related to procedures.  
 * 
 * |InfoType|Value|
 * |-|-|
 * |SQL_PROCEDURES|"N"|
 * |SQL_ACCESSIBLE_PROCEDURES|"N"|
 * |SQL_MAX_PROCEDURE_NAME_LEN|0|
 * |SQL_PROCEDURE_TERM|Empty string|
 *   
 *  **SQLGetInfo** returns SQLSTATE HY096 (Invalid argument value) for values of *InfoType* that are in the range of information types reserved for use by ODBC but are not defined by the version of ODBC supported by the driver. To determine what version of ODBC a driver complies with, an application calls **SQLGetInfo** with the SQL_DRIVER_ODBC_VER information type. **SQLGetInfo** returns SQLSTATE HYC00 (Optional feature not implemented) for values of *InfoType* that are in the range of information types reserved for driver-specific use but are not supported by the driver.  
 *   
 *  All calls to **SQLGetInfo** require an open connection, except when the *InfoType* is SQL_ODBC_VER, which returns the version of the Driver Manager.
 * @param {Pointer<Void>} ConnectionHandle [Input] Connection handle.
 * @param {Integer} InfoType [Input] Type of information.
 * @param {Integer} InfoValue 
 * @param {Integer} BufferLength [Input] Length of the \**InfoValuePtr* buffer. If the value in *\*InfoValuePtr* is not a character string or if *InfoValuePtr* is a null pointer, the *BufferLength* argument is ignored. The driver assumes that the size of *\*InfoValuePtr* is SQLUSMALLINT or SQLUINTEGER, based on the *InfoType*. If *\*InfoValuePtr* is a Unicode string (when calling **SQLGetInfoW**), the *BufferLength* argument must be an even number; if not, SQLSTATE HY090 (Invalid string or buffer length) is returned.
 * @param {Pointer<Integer>} StringLengthPtr [Output] Pointer to a buffer in which to return the total number of bytes (excluding the null-termination character for character data) available to return in **InfoValuePtr*.  
 *   
 *  For character data, if the number of bytes available to return is greater than or equal to *BufferLength*, the information in \**InfoValuePtr* is truncated to *BufferLength* bytes minus the length of a null-termination character and is null-terminated by the driver.  
 *   
 *  For all other types of data, the value of *BufferLength* is ignored and the driver assumes the size of \**InfoValuePtr* is SQLUSMALLINT or SQLUINTEGER, depending on the *InfoType*.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetinfo-function
 */
export SQLGetInfo(ConnectionHandle, InfoType, InfoValue, BufferLength, StringLengthPtr) {
    ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"
    StringLengthPtrMarshal := StringLengthPtr is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetInfo", ConnectionHandleMarshal, ConnectionHandle, "ushort", InfoType, "ptr", InfoValue, "short", BufferLength, StringLengthPtrMarshal, StringLengthPtr, Int16)
    return result
}

/**
 * SQLGetStmtAttr Function
 * @remarks
 * For general information about statement attributes, see [Statement Attributes](../../../odbc/reference/develop-app/statement-attributes.md).  
 *   
 *  A call to **SQLGetStmtAttr** returns in *\*ValuePtr* the value of the statement attribute specified in *Attribute*. That value can either be a SQLULEN value or a null-terminated character string. If the value is a SQLULEN value, some drivers may only write the lower 32-bit or 16-bit of a buffer and leave the higher-order bit unchanged. Therefore, applications should use a buffer of SQLULEN and initialize the value to 0 before calling this function. Also, the *BufferLength* and *StringLengthPtr* arguments are not used. If the value is a null-terminated string, the application specifies the maximum length of that string in the *BufferLength* argument, and the driver returns the length of that string in the *\*StringLengthPtr* buffer.  
 *   
 *  To allow applications calling **SQLGetStmtAttr** to work with ODBC 2.*x* drivers, a call to **SQLGetStmtAttr** is mapped in the Driver Manager to **SQLGetStmtOption**.  
 *   
 *  The following statement attributes are read-only, so can be retrieved by **SQLGetStmtAttr**, but not set by **SQLSetStmtAttr**:  
 *   
 * -   SQL_ATTR_IMP_PARAM_DESC  
 *   
 * -   SQL_ATTR_IMP_ROW_DESC  
 *   
 * -   SQL_ATTR_ROW_NUMBER  
 *   
 *  For a list of attributes that can be set and retrieved, see [SQLSetStmtAttr](../../../odbc/reference/syntax/sqlsetstmtattr-function.md).
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Integer} Attribute [Input] Attribute to retrieve.
 * @param {Pointer<Void>} Value 
 * @param {Integer} BufferLength [Input] If *Attribute* is an ODBC-defined attribute and *ValuePtr* points to a character string or a binary buffer, this argument should be the length of \**ValuePtr*. If *Attribute* is an ODBC-defined attribute and \**ValuePtr* is an integer, *BufferLength* is ignored. If the value returned in *\*ValuePtr* is a Unicode string (when calling **SQLGetStmtAttrW**), the *BufferLength* argument must be an even number.  
 *   
 *  If *Attribute* is a driver-defined attribute, the application indicates the nature of the attribute to the Driver Manager by setting the *BufferLength* argument. *BufferLength* can have the following values:  
 *   
 * -   If *\*ValuePtr* is a pointer to a character string, then *BufferLength* is the length of the string or SQL_NTS.  
 *   
 * -   If *\*ValuePtr* is a pointer to a binary buffer, then the application places the result of the SQL_LEN_BINARY_ATTR(*length*) macro in *BufferLength*. This places a negative value in *BufferLength*.  
 *   
 * -   If *\*ValuePtr* is a pointer to a value other than a character string or binary string, then *BufferLength* should have the value SQL_IS_POINTER.  
 *   
 * -   If *\*ValuePtr* is contains a fixed-length data type, then *BufferLength* is either SQL_IS_INTEGER or SQL_IS_UINTEGER, as appropriate.
 * @param {Pointer<Integer>} StringLength 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetstmtattr-function
 */
export SQLGetStmtAttr(StatementHandle, Attribute, Value, BufferLength, StringLength) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    ValueMarshal := Value is VarRef ? "ptr" : "ptr"
    StringLengthMarshal := StringLength is VarRef ? "int*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetStmtAttr", StatementHandleMarshal, StatementHandle, "int", Attribute, ValueMarshal, Value, "int", BufferLength, StringLengthMarshal, StringLength, Int16)
    return result
}

/**
 * SQLGetStmtOption Function
 * @param {Pointer<Void>} StatementHandle 
 * @param {Integer} Option 
 * @param {Pointer<Void>} Value 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgetstmtoption-function
 * @deprecated ODBC API: SQLGetStmtOption is deprecated. Please use SQLGetStmtAttr instead.
 */
export SQLGetStmtOption(StatementHandle, Option, Value) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    ValueMarshal := Value is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetStmtOption", StatementHandleMarshal, StatementHandle, "ushort", Option, ValueMarshal, Value, Int16)
    return result
}

/**
 * SQLGetTypeInfo Function
 * @remarks
 * **SQLGetTypeInfo** returns the results as a standard result set, ordered by DATA_TYPE and then by how closely the data type maps to the corresponding ODBC SQL data type. Data types defined by the data source take precedence over user-defined data types. Consequently, the sort order is not necessarily consistent but can be generalized as DATA_TYPE first, followed by TYPE_NAME, both ascending. For example, suppose that a data source defined INTEGER and COUNTER data types, where COUNTER is auto-incrementing, and that a user-defined data type WHOLENUM has also been defined. These would be returned in the order INTEGER, WHOLENUM, and COUNTER, because WHOLENUM maps closely to the ODBC SQL data type SQL_INTEGER, while the auto-incrementing data type, even though supported by the data source, does not map closely to an ODBC SQL data type. For information about how this information might be used, see [DDL Statements](../../../odbc/reference/develop-app/ddl-statements.md).  
 *   
 *  If the *DataType* argument specifies a data type which is valid for the version of ODBC supported by the driver, but is not supported by the driver, then it will return an empty result set.  
 *   
 * > [!NOTE]  
 * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
 *   
 *  The following columns have been renamed for ODBC 3.*x*. The column name changes do not affect backward compatibility because applications bind by column number.  
 *   
 * |ODBC 2.0 column|ODBC 3.*x* column|  
 * |---------------------|-----------------------|  
 * |PRECISION|COLUMN_SIZE|  
 * |MONEY|FIXED_PREC_SCALE|  
 * |AUTO_INCREMENT|AUTO_UNIQUE_VALUE|  
 *   
 *  The following columns have been added to the results set returned by **SQLGetTypeInfo** for ODBC 3.*x*:  
 *   
 * -   SQL_DATA_TYPE  
 *   
 * -   INTERVAL_PRECISION  
 *   
 * -   SQL_DATETIME_SUB  
 *   
 * -   NUM_PREC_RADIX  
 *   
 *  The following table lists the columns in the result set. Additional columns beyond column 19 (INTERVAL_PRECISION) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set rather than specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
 *   
 * > [!NOTE]  
 * >  **SQLGetTypeInfo** might not return all data types. For example, a driver might not return user-defined data types. Applications can use any valid data type, regardless of whether it is returned by **SQLGetTypeInfo**. The data types returned by **SQLGetTypeInfo** are those supported by the data source. They are intended for use in Data Definition Language (DDL) statements. Drivers can return result-set data using data types other than the types returned by **SQLGetTypeInfo**. In creating the result set for a catalog function, the driver might use a data type that is not supported by the data source.  
 *   
 * |Column name|Column<br /><br /> number|Data type|Comments|  
 * |-----------------|-----------------------|---------------|--------------|  
 * |TYPE_NAME (ODBC 2.0)|1|Varchar not NULL|Data source-dependent data-type name; for example, "CHAR()", "VARCHAR()", "MONEY", "LONG VARBINARY", or "CHAR ( ) FOR BIT DATA". Applications must use this name in **CREATE TABLE** and **ALTER TABLE** statements.|  
 * |DATA_TYPE (ODBC 2.0)|2|Smallint not NULL|SQL data type. This can be an ODBC SQL data type or a driver-specific SQL data type. For datetime or interval data types, this column returns the concise data type (such as SQL_TYPE_TIME or SQL_INTERVAL_YEAR_TO_MONTH). For a list of valid ODBC SQL data types, see [SQL Data Types](../../../odbc/reference/appendixes/sql-data-types.md) in Appendix D: Data Types. For information about driver-specific SQL data types, see the driver's documentation.|  
 * |COLUMN_SIZE (ODBC 2.0)|3|Integer|The maximum column size that the server supports for this data type. For numeric data, this is the maximum precision. For string data, this is the length in characters. For datetime data types, this is the length in characters of the string representation (assuming the maximum allowed precision of the fractional seconds component). NULL is returned for data types where column size is not applicable. For interval data types, this is the number of characters in the character representation of the interval literal (as defined by the interval leading precision; see [Interval Data Type Length](../../../odbc/reference/appendixes/interval-data-type-length.md) in Appendix D: Data Types).<br /><br /> For more information on column size, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md) in Appendix D: Data Types.|  
 * |LITERAL_PREFIX (ODBC 2.0)|4|Varchar|Character or characters used to prefix a literal; for example, a single quotation mark (') for character data types or 0x for binary data types; NULL is returned for data types where a literal prefix is not applicable.|  
 * |LITERAL_SUFFIX (ODBC 2.0)|5|Varchar|Character or characters used to terminate a literal; for example, a single quotation mark (') for character data types; NULL is returned for data types where a literal suffix is not applicable.|  
 * |CREATE_PARAMS (ODBC 2.0)|6|Varchar|A list of keywords, separated by commas, corresponding to each parameter that the application may specify in parentheses when using the name that is returned in the TYPE_NAME field. The keywords in the list can be any of the following: length, precision, or scale. They appear in the order that the syntax requires them to be used. For example, CREATE_PARAMS for DECIMAL would be "precision,scale"; CREATE_PARAMS for VARCHAR would equal "length." NULL is returned if there are no parameters for the data type definition; for example, INTEGER.<br /><br /> The driver supplies the CREATE_PARAMS text in the language of the country/region where it is used.|  
 * |NULLABLE (ODBC 2.0)|7|Smallint not NULL|Whether the data type accepts a NULL value:<br /><br /> SQL_NO_NULLS if the data type does not accept NULL values.<br /><br /> SQL_NULLABLE if the data type accepts NULL values.<br /><br /> SQL_NULLABLE_UNKNOWN if it is not known whether the column accepts NULL values.|  
 * |CASE_SENSITIVE (ODBC 2.0)|8|Smallint not NULL|Whether a character data type is case-sensitive in collations and comparisons:<br /><br /> SQL_TRUE if the data type is a character data type and is case-sensitive.<br /><br /> SQL_FALSE if the data type is not a character data type or is not case-sensitive.|  
 * |SEARCHABLE (ODBC 2.0)|9|Smallint not NULL|How the data type is used in a **WHERE** clause:<br /><br /> SQL_PRED_NONE if the column cannot be used in a **WHERE** clause. (This is the same as the SQL_UNSEARCHABLE value in ODBC 2.*x*.)<br /><br /> SQL_PRED_CHAR if the column can be used in a **WHERE** clause, but only with the **LIKE** predicate. (This is the same as the SQL_LIKE_ONLY value in ODBC 2.*x*.)<br /><br /> SQL_PRED_BASIC if the column can be used in a **WHERE** clause with all the comparison operators except **LIKE** (comparison, quantified comparison, **BETWEEN**, **DISTINCT**, **IN**, **MATCH**, and **UNIQUE**). (This is the same as the SQL_ALL_EXCEPT_LIKE value in ODBC 2.*x*.)<br /><br /> SQL_SEARCHABLE if the column can be used in a **WHERE** clause with any comparison operator.|  
 * |UNSIGNED_ATTRIBUTE (ODBC 2.0)|10|Smallint|Whether the data type is unsigned:<br /><br /> SQL_TRUE if the data type is unsigned.<br /><br /> SQL_FALSE if the data type is signed.<br /><br /> NULL is returned if the attribute is not applicable to the data type or the data type is not numeric.|  
 * |FIXED_PREC_SCALE (ODBC 2.0)|11|Smallint not NULL|Whether the data type has predefined fixed precision and scale (which are data source-specific), such as a money data type:<br /><br /> SQL_TRUE if it has predefined fixed precision and scale.<br /><br /> SQL_FALSE if it does not have predefined fixed precision and scale.|  
 * |AUTO_UNIQUE_VALUE (ODBC 2.0)|12|Smallint|Whether the data type is autoincrementing:<br /><br /> SQL_TRUE if the data type is autoincrementing.<br /><br /> SQL_FALSE if the data type is not autoincrementing.<br /><br /> NULL is returned if the attribute is not applicable to the data type or the data type is not numeric.<br /><br /> An application can insert values into a column having this attribute, but typically cannot update the values in the column.<br /><br /> When an insert is made into an auto-increment column, a unique value is inserted into the column at insert time. The increment is not defined, but is data source-specific. An application should not assume that an auto-increment column starts at any particular point or increments by any particular value.|  
 * |LOCAL_TYPE_NAME (ODBC 2.0)|13|Varchar|Localized version of the data source-dependent name of the data type. NULL is returned if a localized name is not supported by the data source. This name is intended for display only, such as in dialog boxes.|  
 * |MINIMUM_SCALE (ODBC 2.0)|14|Smallint|The minimum scale of the data type on the data source. If a data type has a fixed scale, the MINIMUM_SCALE and MAXIMUM_SCALE columns both contain this value. For example, an SQL_TYPE_TIMESTAMP column might have a fixed scale for fractional seconds. NULL is returned where scale is not applicable. For more information, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md) in Appendix D: Data Types.|  
 * |MAXIMUM_SCALE (ODBC 2.0)|15|Smallint|The maximum scale of the data type on the data source. NULL is returned where scale is not applicable. If the maximum scale is not defined separately on the data source, but is instead defined to be the same as the maximum precision, this column contains the same value as the COLUMN_SIZE column. For more information, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md) in Appendix D: Data Types.|  
 * |SQL_DATA_TYPE (ODBC 3.0)|16|Smallint NOT NULL|The value of the SQL data type as it appears in the SQL_DESC_TYPE field of the descriptor. This column is the same as the DATA_TYPE column, except for interval and datetime data types.<br /><br /> For interval and datetime data types, the SQL_DATA_TYPE field in the result set will return SQL_INTERVAL or SQL_DATETIME, and the SQL_DATETIME_SUB field will return the subcode for the specific interval or datetime data type. (See [Appendix D: Data Types](../../../odbc/reference/appendixes/appendix-d-data-types.md).)|  
 * |SQL_DATETIME_SUB (ODBC 3.0)|17|Smallint|When the value of SQL_DATA_TYPE is SQL_DATETIME or SQL_INTERVAL, this column contains the datetime/interval subcode. For data types other than datetime and interval, this field is NULL.<br /><br /> For interval or datetime data types, the SQL_DATA_TYPE field in the result set will return SQL_INTERVAL or SQL_DATETIME, and the SQL_DATETIME_SUB field will return the subcode for the specific interval or datetime data type. (See [Appendix D: Data Types](../../../odbc/reference/appendixes/appendix-d-data-types.md).)|  
 * |NUM_PREC_RADIX (ODBC 3.0)|18|Integer|If the data type is an approximate numeric type, this column contains the value 2 to indicate that COLUMN_SIZE specifies a number of bits. For exact numeric types, this column contains the value 10 to indicate that COLUMN_SIZE specifies a number of decimal digits. Otherwise, this column is NULL.|  
 * |INTERVAL_PRECISION (ODBC 3.0)|19|Smallint|If the data type is an interval data type, then this column contains the value of the interval leading precision. (See [Interval Data Type Precision](../../../odbc/reference/appendixes/interval-data-type-precision.md) in Appendix D: Data Types.) Otherwise, this column is NULL.|  
 *   
 *  Attribute information can apply to data types or to specific columns in a result set. **SQLGetTypeInfo** returns information about attributes associated with data types; **SQLColAttribute** returns information about attributes associated with columns in a result set.
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle for the result set.
 * @param {Integer} DataType [Input] The SQL data type. This must be one of the values in the [SQL Data Types](../../../odbc/reference/appendixes/sql-data-types.md) section of Appendix D: Data Types, or a driver-specific SQL data type. SQL_ALL_TYPES specifies that information about all data types should be returned.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlgettypeinfo-function
 */
export SQLGetTypeInfo(StatementHandle, DataType) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetTypeInfo", StatementHandleMarshal, StatementHandle, "short", DataType, Int16)
    return result
}

/**
 * SQLNumResultCols Function
 * @remarks
 * **SQLNumResultCols** can be called successfully only when the statement is in the prepared, executed, or positioned state.  
 *   
 *  If the statement associated with *StatementHandle* does not return columns, **SQLNumResultCols** sets **ColumnCountPtr* to 0.  
 *   
 *  The number of columns returned by **SQLNumResultCols** is the same value as the SQL_DESC_COUNT field of the IRD.  
 *   
 *  For more information, see [Was a Result Set Created?](../../../odbc/reference/develop-app/was-a-result-set-created.md) and [How is Metadata Used?](../../../odbc/reference/develop-app/how-is-metadata-used.md).
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Pointer<Integer>} ColumnCount 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlnumresultcols-function
 */
export SQLNumResultCols(StatementHandle, ColumnCount) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    ColumnCountMarshal := ColumnCount is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLNumResultCols", StatementHandleMarshal, StatementHandle, ColumnCountMarshal, ColumnCount, Int16)
    return result
}

/**
 * SQLParamData Function
 * @remarks
 * **SQLParamData** can be called to supply data-at-execution data for two uses: parameter data that will be used in a call to **SQLExecute** or **SQLExecDirect**, or column data that will be used when a row is updated or added by a call to **SQLBulkOperations** or updated by a call to **SQLSetPos**. At execution time, **SQLParamData** returns to the application an indicator of which data the driver requires.  
 *   
 *  When an application calls **SQLExecute**, **SQLExecDirect**, **SQLBulkOperations**, or **SQLSetPos**, the driver returns SQL_NEED_DATA if it needs data-at-execution data. An application then calls **SQLParamData** to determine which data to send. If the driver requires parameter data, the driver returns in the *\*ValuePtrPtr* output buffer the value that the application put in the rowset buffer. The application can use this value to determine which parameter data the driver is requesting. If the driver requires column data, the driver returns in the *\*ValuePtrPtr* buffer the address that the column was originally bound to, as follows:  
 *   
 *  *Bound Address* + *Binding Offset* + ((*Row Number* - 1) x *Element Size*)  
 *   
 *  where the variables are defined as indicated in the following table.  
 *   
 * |Variable|Description|  
 * |--------------|-----------------|  
 * |*Bound Address*|The address specified with the *TargetValuePtr* argument in **SQLBindCol**.|  
 * |*Binding Offset*|The value stored at the address specified with the SQL_ATTR_ROW_BIND_OFFSET_PTR statement attribute.|  
 * |*Row Number*|The 1-based number of the row in the rowset. For single-row fetches, which are the default, this is 1.|  
 * |*Element Size*|The value of the SQL_ATTR_ROW_BIND_TYPE statement attribute for both data and length/indicator buffers.|  
 *   
 *  It also returns SQL_NEED_DATA, which is an indicator to the application that it should call **SQLPutData** to send the data.  
 *   
 *  The application calls **SQLPutData** as many times as necessary to send the data-at-execution data for the column or parameter. After all the data has been sent for the column or parameter, the application calls **SQLParamData** again. If **SQLParamData** again returns SQL_NEED_DATA, data must be sent for another parameter or column. Therefore, the application again calls **SQLPutData**. If all data-at-execution data has been sent for all parameters or columns, then **SQLParamData** returns SQL_SUCCESS or SQL_SUCCESS_WITH_INFO, the value in *\*ValuePtrPtr* is undefined, and the SQL statement can be executed or the **SQLBulkOperations** or **SQLSetPos** call can be processed.  
 *   
 *  If **SQLParamData** supplies parameter data for a searched update or delete statement that does not affect any rows at the data source, the call to **SQLParamData** returns SQL_NO_DATA.  
 *   
 *  For more information about how data-at-execution parameter data is passed at statement execution time, see "Passing Parameter Values" in [SQLBindParameter](../../../odbc/reference/syntax/sqlbindparameter-function.md) and [Sending Long Data](../../../odbc/reference/develop-app/sending-long-data.md). For more information about how data-at-execution column data is updated or added, see the section "Using SQLSetPos" in [SQLSetPos](../../../odbc/reference/syntax/sqlsetpos-function.md), "Performing Bulk Updates Using Bookmarks" in [SQLBulkOperations](../../../odbc/reference/syntax/sqlbulkoperations-function.md), and [Long Data and SQLSetPos and SQLBulkOperations](../../../odbc/reference/develop-app/long-data-and-sqlsetpos-and-sqlbulkoperations.md).  
 *   
 *  **SQLParamData** can be called to retrieve streamed output parameters. When **SQLMoreResults**, **SQLExecute**, **SQLGetData**, or **SQLExecDirect** returns SQL_PARAM_DATA_AVAILABLE, call **SQLParamData** to determine which parameter has a value available. For more information about SQL_PARAM_DATA_AVAILABLE and streamed output parameters, see [Retrieving Output Parameters Using SQLGetData](../../../odbc/reference/develop-app/retrieving-output-parameters-using-sqlgetdata.md).
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Pointer<Pointer<Void>>} Value 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NEED_DATA, SQL_NO_DATA, SQL_STILL_EXECUTING, SQL_ERROR, SQL_INVALID_HANDLE, or SQL_PARAM_DATA_AVAILABLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlparamdata-function
 */
export SQLParamData(StatementHandle, Value) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    ValueMarshal := Value is VarRef ? "ptr*" : "ptr"

    result := DllCall("ODBC32.dll\SQLParamData", StatementHandleMarshal, StatementHandle, ValueMarshal, Value, Int16)
    return result
}

/**
 * SQLPrepare Function
 * @remarks
 * The application calls **SQLPrepare** to send an SQL statement to the data source for preparation. For more information about prepared execution, see [Prepared Execution](../../../odbc/reference/develop-app/prepared-execution-odbc.md). The application can include one or more parameter markers in the SQL statement. To include a parameter marker, the application embeds a question mark (?) into the SQL string at the appropriate position. For information about parameters, see [Statement Parameters](../../../odbc/reference/develop-app/statement-parameters.md).  
 *   
 * > [!NOTE]  
 * >  If an application uses **SQLPrepare** to prepare and **SQLExecute** to submit a **COMMIT** or **ROLLBACK** statement, it will not be interoperable between DBMS products. To commit or roll back a transaction, call **SQLEndTran**.  
 *   
 *  The driver can modify the statement to use the form of SQL used by the data source and then submit it to the data source for preparation. In particular, the driver modifies the escape sequences used to define SQL syntax for certain features. (For a description of SQL statement grammar, see [Escape Sequences in ODBC](../../../odbc/reference/develop-app/escape-sequences-in-odbc.md) and [Appendix C: SQL Grammar](../../../odbc/reference/appendixes/appendix-c-sql-grammar.md).) For the driver, a statement handle is similar to a statement identifier in embedded SQL code. If the data source supports statement identifiers, the driver can send a statement identifier and parameter values to the data source.  
 *   
 *  After a statement is prepared, the application uses the statement handle to refer to the statement in later function calls. The prepared statement associated with the statement handle can be re-executed by calling **SQLExecute** until the application frees the statement with a call to **SQLFreeStmt** with the SQL_DROP option or until the statement handle is used in a call to **SQLPrepare**, **SQLExecDirect**, or one of the catalog functions (**SQLColumns**, **SQLTables**, and so on). Once the application prepares a statement, it can request information about the format of the result set. For some implementations, calling **SQLDescribeCol** or **SQLDescribeParam** after **SQLPrepare** might not be as efficient as calling the function after **SQLExecute** or **SQLExecDirect**.  
 *   
 *  Some drivers cannot return syntax errors or access violations when the application calls **SQLPrepare**. A driver can handle syntax errors and access violations, only syntax errors, or neither syntax errors nor access violations. Therefore, an application must be able to handle these conditions when calling subsequent related functions such as **SQLNumResultCols**, **SQLDescribeCol**, **SQLColAttribute**, and **SQLExecute**.  
 *   
 *  Depending on the capabilities of the driver and data source, parameter information (such as data types) might be checked when the statement is prepared (if all parameters have been bound) or when it is executed (if all parameters have not been bound). For maximum interoperability, an application should unbind all parameters that applied to an old SQL statement before preparing a new SQL statement on the same statement. This prevents errors that are due to old parameter information being applied to the new statement.  
 *   
 * > [!IMPORTANT]  
 * >  Committing a transaction, either by explicitly calling **SQLEndTran** or by working in autocommit mode, can cause the data source to delete the access plans for all statements on a connection. For more information, see the SQL_CURSOR_COMMIT_BEHAVIOR and SQL_CURSOR_ROLLBACK_BEHAVIOR information types in [SQLGetInfo](../../../odbc/reference/syntax/sqlgetinfo-function.md) and [Effect of Transactions on Cursors and Prepared Statements](../../../odbc/reference/develop-app/effect-of-transactions-on-cursors-and-prepared-statements.md).
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Pointer<Integer>} StatementText [Input] SQL text string.
 * @param {Integer} TextLength [Input] Length of **StatementText* in characters.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlprepare-function
 */
export SQLPrepare(StatementHandle, StatementText, TextLength) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    StatementTextMarshal := StatementText is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLPrepare", StatementHandleMarshal, StatementHandle, StatementTextMarshal, StatementText, "int", TextLength, Int16)
    return result
}

/**
 * SQLSetConnectAttr Function
 * @remarks
 * For general information about connection attributes, see [Connection Attributes](../../../odbc/reference/develop-app/connection-attributes.md).  
 *   
 *  The currently defined attributes and the version of ODBC in which they were introduced are shown in the table later in this section; it is expected that more attributes will be defined to take advantage of different data sources. A range of attributes is reserved by ODBC; driver developers must reserve values for their own driver-specific use from Open Group.  
 *   
 * > [!NOTE]
 * >  The ability to set statement attributes at the connection level by calling **SQLSetConnectAttr** has been deprecated in ODBC 3*.x*. ODBC 3*.x* applications should never set statement attributes at the connection level. ODBC 3*.x* statement attributes cannot be set at the connection level, with the exception of the SQL_ATTR_METADATA_ID and SQL_ATTR_ASYNC_ENABLE attributes, which are both connection attributes and statement attributes and can be set at either the connection level or the statement level.  
 * > 
 * >  ODBC 3*.x* drivers need only support this functionality if they should work with ODBC 2*.x* applications that set ODBC 2*.x* statement options at the connection level. For more information, see [SQLSetConnectOption Mapping](../../../odbc/reference/appendixes/sqlsetconnectoption-mapping.md) in Appendix G: Driver Guidelines for Backward Compatibility.  
 *   
 *  An application can call **SQLSetConnectAttr** at any time between the time the connection is allocated and freed. All connection and statement attributes successfully set by the application for the connection persist until **SQLFreeHandle** is called on the connection. For example, if an application calls **SQLSetConnectAttr** before connecting to a data source, the attribute persists even if **SQLSetConnectAttr** fails in the driver when the application connects to the data source; if an application sets a driver-specific attribute, the attribute persists even if the application connects to a different driver on the connection.  
 *   
 *  Some connection attributes can be set only before a connection has been made; others can be set only after a connection has been made. The following table indicates those connection attributes that must be set either before or after a connection has been made. *Either* indicates that the attribute can be set either before or after connection.  
 *   
 * |Attribute|Set before or after connection?|  
 * |---------------|-------------------------------------|  
 * |SQL_ATTR_ACCESS_MODE|Either[1]|  
 * |SQL_ATTR_ASYNC_DBC_EVENT|Either|  
 * |SQL_ATTR_ASYNC_DBC_FUNCTIONS_ENABLE|Either[4]|  
 * |SQL_ATTR_ASYNC_DBC_PCALLBACK|Either|  
 * |SQL_ATTR_ASYNC_DBC_PCONTEXT|Either|  
 * |SQL_ATTR_ASYNC_ENABLE|Either[2]|  
 * |SQL_ATTR_AUTO_IPD|Either|  
 * |SQL_ATTR_AUTOCOMMIT|Either[5]|  
 * |SQL_ATTR_CONNECTION_DEAD|After|  
 * |SQL_ATTR_CONNECTION_TIMEOUT|Either|  
 * |SQL_ATTR_CURRENT_CATALOG|Either[1]|  
 * |SQL_ATTR_DBC_INFO_TOKEN|After|  
 * |SQL_ATTR_ENLIST_IN_DTC|After|  
 * |SQL_ATTR_LOGIN_TIMEOUT|Before|  
 * |SQL_ATTR_METADATA_ID|Either|  
 * |SQL_ATTR_ODBC_CURSORS|Before|  
 * |SQL_ATTR_PACKET_SIZE|Before|  
 * |SQL_ATTR_QUIET_MODE|Either|  
 * |SQL_ATTR_TRACE|Either|  
 * |SQL_ATTR_TRACEFILE|Either|  
 * |SQL_ATTR_TRANSLATE_LIB|After|  
 * |SQL_ATTR_TRANSLATE_OPTION|After|  
 * |SQL_ATTR_TXN_ISOLATION|Either[3]|  
 *   
 *  [1]   SQL_ATTR_ACCESS_MODE and SQL_ATTR_CURRENT_CATALOG can be set before or after connecting, depending on the driver. However, interoperable applications set them before connecting because some drivers do not support changing these after connecting.  
 *   
 *  [2]   SQL_ATTR_ASYNC_ENABLE must be set before there is an active statement.  
 *   
 *  [3]   SQL_ATTR_TXN_ISOLATION can be set only if there are no open transactions on the connection. Some connection attributes support substitution of a similar value if the data source does not support the value specified in \**ValuePtr*. In such cases, the driver returns SQL_SUCCESS_WITH_INFO and SQLSTATE 01S02 (Option value changed). For example, if *Attribute* is SQL_ATTR_PACKET_SIZE and \**ValuePtr* exceeds the maximum packet size, the driver substitutes the maximum size. To determine the substituted value, an application calls **SQLGetConnectAttr**.  
 *   
 *  [4]    If SQL_ATTR_ASYNC_DBC_FUNCTIONS_ENABLE is set before a connection is open, the Driver Manager will set the driver's attribute when the driver is loaded during a call to **SQLBrowseConnect**, **SQLConnect**, or **SQLDriverConnect**. Before a call to **SQLBrowseConnect**, **SQLConnect**, or **SQLDriverConnect**, the Driver Manager does not know which driver to connect to and does not know whether the driver supports asynchronous connection operations. Therefore, the Driver Manager always returns SQL_SUCCESS. But, in case the driver does not support asynchronous connection operations, the call to **SQLBrowseConnect**, **SQLConnect**, or **SQLDriverConnect** will fail.  
 *   
 *  [5]    When SQL_ATTR_AUTOCOMMIT is set to FALSE, applications should call SQLEndTran(SQL_ROLLBACK) if any API returns SQL_ERROR to ensure transactional consistency.  
 *   
 *  The format of information set in the \**ValuePtr* buffer depends on the specified *Attribute*. **SQLSetConnectAttr** will accept attribute information in one of two different formats: a null-terminated character string or an integer value. The format of each is noted in the attribute's description. Character strings pointed to by the *ValuePtr* argument of **SQLSetConnectAttr** have a length of *StringLength* bytes.  
 *   
 *  The *StringLength* argument is ignored if the length is defined by the attribute, as is the case for all attributes introduced in ODBC 2*.x* or earlier.  
 *   
 * |*Attribute*|*ValuePtr* contents|  
 * |-----------------|-------------------------|  
 * |SQL_ATTR_ACCESS_MODE (ODBC 1.0)|An SQLUINTEGER value. SQL_MODE_READ_ONLY is used by the driver or data source as an indicator that the connection is not required to support SQL statements that cause updates to occur. This mode can be used to optimize locking strategies, transaction management, or other areas as appropriate to the driver or data source. The driver is not required to prevent such statements from being submitted to the data source. The behavior of the driver and data source when asked to process SQL statements that are not read-only during a read-only connection is implementation-defined. SQL_MODE_READ_WRITE is the default.|  
 * |SQL_ATTR_ASYNC_DBC_EVENT (ODBC 3.8)|A SQLPOINTER value that is an event handle.<br /><br /> Notification of the completion of asynchronous functions is enabled by calling **SQLSetConnectAttr** with the SQL_ATTR_ASYNC_STMT_EVENT attribute and specifying the event handle. **Note:**  The notification method is not supported with cursor library. An application will receive error message if it attempts to enable cursor library via SQLSetConnectAttr, when the notification method is enabled.|  
 * |SQL_ATTR_ASYNC_DBC_FUNCTIONS_ENABLE (ODBC 3.8)|A SQLUINTEGER value that enables or disables asynchronous execution of selected functions on the connection handle. For more information, see [Asynchronous Execution (Polling Method)](../../../odbc/reference/develop-app/asynchronous-execution-polling-method.md).<br /><br /> SQL_ASYNC_DBC_ENABLE_ON = Enable asynchronous operation for specified connection-related functions.<br /><br /> SQL_ASYNC_DBC_ENABLE_OFF = (Default) Disable asynchronous operation for specified connection-related functions.<br /><br /> Setting SQL_ATTR_ASYNC_DBC_FUNCTIONS_ENABLE is always synchronous (that is, it will never return SQL_STILL_EXECUTING).<br /><br /> Asynchronous execution of statement operations are enabled with SQL_ATTR_ASYNC_ENABLE.|  
 * |SQL_ATTR_ASYNC_DBC_PCALLBACK (ODBC 3.8)|A SQLPOINTER value that points to context structure.<br /><br /> Only the Driver Manager can call a driver's **SQLSetStmtAttr** function with this attribute.|  
 * |SQL_ATTR_ASYNC_DBC_PCONTEXT (ODBC 3.8)|A SQLPOINTER value that points to the context structure.<br /><br /> Only the Driver Manager can call a driver's **SQLSetStmtAttr** function with this attribute.|  
 * |SQL_ATTR_ASYNC_ENABLE (ODBC 3.0)|A SQLULEN value that specifies whether a function called with a statement on the specified connection is executed asynchronously:<br /><br /> SQL_ASYNC_ENABLE_OFF = Disable connection level asynchronous execution support for statement operations (the default).<br /><br /> SQL_ASYNC_ENABLE_ON = Enable connection level asynchronous execution support for statement operations.<br /><br /> This attribute can be set whether **SQLGetInfo** with the SQL_ASYNC_MODE information type returns SQL_AM_CONNECTION or SQL_AM_STATEMENT.|  
 * |SQL_ATTR_AUTO_IPD (ODBC 3.0)|A read-only SQLUINTEGER value that specifies whether automatic population of the IPD after a call to **SQLPrepare** is supported:<br /><br /> SQL_TRUE = Automatic population of the IPD after a call to **SQLPrepare** is supported by the driver.<br /><br /> SQL_FALSE = Automatic population of the IPD after a call to **SQLPrepare** is not supported by the driver. Servers that do not support prepared statements will not be able to populate the IPD automatically.<br /><br /> If SQL_TRUE is returned for the SQL_ATTR_AUTO_IPD connection attribute, the statement attribute SQL_ATTR_ENABLE_AUTO_IPD can be set to turn automatic population of the IPD on or off. If SQL_ATTR_AUTO_IPD is SQL_FALSE, SQL_ATTR_ENABLE_AUTO_IPD cannot be set to SQL_TRUE. The default value of SQL_ATTR_ENABLE_AUTO_IPD is equal to the value of SQL_ATTR_AUTO_IPD.<br /><br /> This connection attribute can be returned by **SQLGetConnectAttr** but cannot be set by **SQLSetConnectAttr**.|  
 * |SQL_ATTR_AUTOCOMMIT (ODBC 1.0)|A SQLUINTEGER value that specifies whether to use autocommit or manual-commit mode:<br /><br /> SQL_AUTOCOMMIT_OFF = The driver uses manual-commit mode, and the application must explicitly commit or roll back transactions with **SQLEndTran**.<br /><br /> SQL_AUTOCOMMIT_ON = The driver uses autocommit mode. Each statement is committed immediately after it is executed. This is the default. Any open transactions on the connection are committed when SQL_ATTR_AUTOCOMMIT is set to SQL_AUTOCOMMIT_ON to change from manual-commit mode to autocommit mode.<br /><br /> For more information, see [Commit Mode](../../../odbc/reference/develop-app/commit-mode.md). **Important:**  Some data sources delete the access plans and close the cursors for all statements on a connection each time a statement is committed; autocommit mode can cause this to happen after each nonquery statement is executed or when the cursor is closed for a query. For more information, see the SQL_CURSOR_COMMIT_BEHAVIOR and SQL_CURSOR_ROLLBACK_BEHAVIOR information types in [SQLGetInfo](../../../odbc/reference/syntax/sqlgetinfo-function.md) and [Effect of Transactions on Cursors and Prepared Statements](../../../odbc/reference/develop-app/effect-of-transactions-on-cursors-and-prepared-statements.md). <br /><br /> When a batch is executed in autocommit mode, two things are possible. The entire batch can be treated as an autocommitable unit, or each statement in a batch is treated as an autocommitable unit. Certain data sources can support both these behaviors and may provide a way of choosing one or the other. It is driver-defined whether a batch is treated as an autocommitable unit or whether each individual statement within the batch is autocommitable.|  
 * |SQL_ATTR_CONNECTION_DEAD<br /><br /> (ODBC 3.5)|A read-only SQLUINTEGER value that indicates the state of the connection. If SQL_CD_TRUE, the connection has been lost. If SQL_CD_FALSE, the connection is still active.|  
 * |SQL_ATTR_CONNECTION_TIMEOUT (ODBC 3.0)|An SQLUINTEGER value corresponding to the number of seconds to wait for any request on the connection to complete before returning to the application. The driver should return SQLSTATE HYT00 (Timeout expired) anytime that it is possible to time out in a situation not associated with query execution or login.<br /><br /> If *ValuePtr* is equal to 0 (the default), there is no timeout.|  
 * |SQL_ATTR_CURRENT_CATALOG (ODBC 2.0)|A character string containing the name of the catalog to be used by the data source. For example, in SQL Server, the catalog is a database, so the driver sends a **USE** _database_ statement to the data source, where *database* is the database specified in \**ValuePtr*. For a single-tier driver, the catalog might be a directory, so the driver changes its current directory to the directory specified in **ValuePtr*.|  
 * |SQL_ATTR_DBC_INFO_TOKEN (ODBC 3.8|A SQLPOINTER value used to set back the connection info token into the DBC handle when [SQLRateConnection](../../../odbc/reference/syntax/sqlrateconnection-function.md)'s (\**pRating*) parameter is not equal to 100.<br /><br /> SQL_ATTR_DBC_INFO_TOKEN is set-only. It is not possible to use **SQLGetConnectAttr** or **SQLGetConnectOption** to retrieve this value. The Driver Manager's **SQLSetConnectAttr** will not accept SQL_ATTR_DBC_INFO_TOKEN, since an application should not set this attribute.<br /><br /> If a driver returns SQL_ERROR after setting SQL_ATTR_DBC_INFO_TOKEN, the connection just obtained from the pool will be freed. The Driver Manager will then try to obtain another connection from the pool. See [Developing Connection-Pool Awareness in an ODBC Driver](../../../odbc/reference/develop-driver/developing-connection-pool-awareness-in-an-odbc-driver.md) for more information.|  
 * |SQL_ATTR_ENLIST_IN_DTC (ODBC 3.0)|A SQLPOINTER value that specifies whether to use the ODBC driver in distributed transactions coordinated by Microsoft Component Services.<br /><br /> Pass a DTC OLE transaction object that specifies the transaction to export to SQL Server, or SQL_DTC_DONE to end the connection's DTC association.<br /><br /> The client calls the Microsoft Distributed Transaction Coordinator (MS DTC) OLE ITransactionDispenser::BeginTransaction method to begin an MS DTC transaction and create an MS DTC transaction object that represents the transaction. The application then calls SQLSetConnectAttr with the SQL_ATTR_ENLIST_IN_DTC option to associate the transaction object with the ODBC connection. All related database activity will be performed under the protection of the MS DTC transaction. The application calls SQLSetConnectAttr with SQL_DTC_DONE to end the connection's DTC association. For more information, see the MS DTC documentation.|  
 * |SQL_ATTR_LOGIN_TIMEOUT (ODBC 1.0)|An SQLUINTEGER value corresponding to the number of seconds to wait for a login request to complete before returning to the application. The default is driver-dependent. If *ValuePtr* is 0, the timeout is disabled and a connection attempt will wait indefinitely.<br /><br /> If the specified timeout exceeds the maximum login timeout in the data source, the driver substitutes that value and returns SQLSTATE 01S02 (Option value changed).|  
 * |SQL_ATTR_METADATA_ID (ODBC 3.0)|An SQLUINTEGER value that determines how the string arguments of catalog functions are treated.<br /><br /> If SQL_TRUE, the string argument of catalog functions are treated as identifiers. The case is not significant. For nondelimited strings, the driver removes any trailing spaces and the string is folded to uppercase. For delimited strings, the driver removes any leading or trailing spaces and takes literally whatever is between the delimiters. If one of these arguments is set to a null pointer, the function returns SQL_ERROR and SQLSTATE HY009 (Invalid use of null pointer).<br /><br /> If SQL_FALSE, the string arguments of catalog functions are not treated as identifiers. The case is significant. They can either contain a string search pattern or not, depending on the argument.<br /><br /> The default value is SQL_FALSE.<br /><br /> The *TableType* argument of **SQLTables**, which takes a list of values, is not affected by this attribute.<br /><br /> SQL_ATTR_METADATA_ID can also be set on the statement level. (It is the only connection attribute that is also a statement attribute.)<br /><br /> For more information, see [Arguments in Catalog Functions](../../../odbc/reference/develop-app/arguments-in-catalog-functions.md).|  
 * |SQL_ATTR_ODBC_CURSORS (ODBC 2.0)|An SQLULEN  value specifying how the Driver Manager uses the ODBC cursor library:<br /><br /> SQL_CUR_USE_IF_NEEDED = The Driver Manager uses the ODBC cursor library only if it is needed. If the driver supports the SQL_FETCH_PRIOR option in **SQLFetchScroll**, the Driver Manager uses the scrolling capabilities of the driver. Otherwise, it uses the ODBC cursor library.<br /><br /> SQL_CUR_USE_ODBC = The Driver Manager uses the ODBC cursor library.<br /><br /> SQL_CUR_USE_DRIVER = The Driver Manager uses the scrolling capabilities of the driver. This is the default setting.<br /><br /> For more information about the ODBC cursor library, see [Appendix F: ODBC Cursor Library](../../../odbc/reference/appendixes/appendix-f-odbc-cursor-library.md). **Warning:**  The cursor library will be removed in a future version of Windows. Avoid using this feature in new development work and plan to modify applications that currently use this feature. Microsoft recommends using the driver's cursor functionality.|  
 * |SQL_ATTR_PACKET_SIZE (ODBC 2.0)|An SQLUINTEGER value specifying the network packet size in bytes. **Note:**  Many data sources either do not support this option or only can return but not set the network packet size. <br /><br /> If the specified size exceeds the maximum packet size or is smaller than the minimum packet size, the driver substitutes that value and returns SQLSTATE 01S02 (Option value changed).<br /><br /> If the application sets packet size after a connection has already been made, the driver will return SQLSTATE HY011 (Attribute cannot be set now).|  
 * |SQL_ATTR_QUIET_MODE (ODBC 2.0)|A window handle (HWND).<br /><br /> If the window handle is a null pointer, the driver does not display any dialog boxes.<br /><br /> If the window handle is not a null pointer, it should be the parent window handle of the application. This is the default. The driver uses this handle to display dialog boxes. **Note:**  The SQL_ATTR_QUIET_MODE connection attribute does not apply to dialog boxes displayed by **SQLDriverConnect**.|  
 * |SQL_ATTR_TRACE (ODBC 1.0)|An SQLUINTEGER value telling the Driver Manager whether to perform tracing:<br /><br /> SQL_OPT_TRACE_OFF = Tracing off (the default)<br /><br /> SQL_OPT_TRACE_ON = Tracing on<br /><br /> When tracing is on, the Driver Manager writes each ODBC function call to the trace file. **Note:**  When tracing is on, the Driver Manager can return SQLSTATE IM013 (Trace file error) from any function. <br /><br /> An application specifies a trace file with the SQL_ATTR_TRACEFILE option. If the file already exists, the Driver Manager appends to the file. Otherwise, it creates the file. If tracing is on and no trace file has been specified, the Driver Manager writes to the file SQL.LOG in the root directory.<br /><br /> An application can set the variable **ODBCSharedTraceFlag** to enable tracing dynamically. Tracing is then enabled for all ODBC applications currently running. If an application turns tracing off, it is turned off only for that application.<br /><br /> If the **Trace** keyword in the system information is set to 1 when an application calls **SQLAllocHandle** with a *HandleType* of SQL_HANDLE_ENV, tracing is enabled for all handles. It is enabled only for the application that called **SQLAllocHandle**.<br /><br /> Calling **SQLSetConnectAttr** with an *Attribute* of SQL_ATTR_TRACE does not require that the *ConnectionHandle* argument be valid and will not return SQL_ERROR if *ConnectionHandle* is NULL. This attribute applies to all connections.|  
 * |SQL_ATTR_TRACEFILE (ODBC 1.0)|A null-terminated character string containing the name of the trace file.<br /><br /> The default value of the SQL_ATTR_TRACEFILE attribute is specified with the **TraceFile** keyword in the system information. For more information, see [ODBC Subkey](../../../odbc/reference/install/odbc-subkey.md).<br /><br /> Calling **SQLSetConnectAttr** with an *Attribute* of SQL_ATTR_TRACEFILE does not require the *ConnectionHandle* argument to be valid and will not return SQL_ERROR if *ConnectionHandle* is invalid. This attribute applies to all connections.|  
 * |SQL_ATTR_TRANSLATE_LIB (ODBC 1.0)|A null-terminated character string containing the name of a library containing the functions **SQLDriverToDataSource** and **SQLDataSourceToDriver** that the driver accesses to perform tasks such as character set translation. This option may be specified only if the driver has connected to the data source. The setting of this attribute will persist across connections. For more information about translating data, see [Translation DLLs](../../../odbc/reference/develop-app/translation-dlls.md) and [Translation DLL Function Reference](../../../odbc/reference/syntax/translation-dll-api-reference.md).|  
 * |SQL_ATTR_TRANSLATE_OPTION (ODBC 1.0)|A 32-bit flag value that is passed to the translation DLL. This attribute can be specified only if the driver has connected to the data source. For information about translating data, see [Translation DLLs](../../../odbc/reference/develop-app/translation-dlls.md).|  
 * |SQL_ATTR_TXN_ISOLATION (ODBC 1.0)|A 32-bit bitmask that sets the transaction isolation level for the current connection. An application must call **SQLEndTran** to commit or roll back all open transactions on a connection, before calling **SQLSetConnectAttr** with this option.<br /><br /> The valid values for *ValuePtr* can be determined by calling **SQLGetInfo** with *InfoType* equal to SQL_TXN_ISOLATION_OPTIONS.<br /><br /> For a description of transaction isolation levels, see the description of the SQL_DEFAULT_TXN_ISOLATION information type in [SQLGetInfo](../../../odbc/reference/syntax/sqlgetinfo-function.md) and [Transaction Isolation Levels](../../../odbc/reference/develop-app/transaction-isolation-levels.md).|  
 *   
 *  [1]   These functions can be called asynchronously only if the descriptor is an implementation descriptor, not an application descriptor.
 * @param {Pointer<Void>} ConnectionHandle [Input] Connection handle.
 * @param {Integer} Attribute [Input] Attribute to set, listed in "Comments."
 * @param {Integer} Value 
 * @param {Integer} StringLength [Input] If *Attribute* is an ODBC-defined attribute and *ValuePtr* points to a character string or a binary buffer, this argument should be the length of **ValuePtr*. For character string data, this argument should contain the number of bytes in the string.  
 *   
 *  If *Attribute* is an ODBC-defined attribute and *ValuePtr* is an integer, *StringLength* is ignored.  
 *   
 *  If *Attribute* is a driver-defined attribute, the application indicates the nature of the attribute to the Driver Manager by setting the *StringLength* argument. *StringLength* can have the following values:  
 *   
 * -   If *ValuePtr* is a pointer to a character string, then *StringLength* is the length of the string or SQL_NTS.  
 *   
 * -   If *ValuePtr* is a pointer to a binary buffer, then the application places the result of the SQL_LEN_BINARY_ATTR(*length*) macro in *StringLength*. This places a negative value in *StringLength*.  
 *   
 * -   If *ValuePtr* is a pointer to a value other than a character string or a binary string, then *StringLength* should have the value SQL_IS_POINTER.  
 *   
 * -   If *ValuePtr* contains a fixed-length value, then *StringLength* is either SQL_IS_INTEGER or SQL_IS_UINTEGER, as appropriate.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, SQL_INVALID_HANDLE, or SQL_STILL_EXECUTING.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetconnectattr-function
 */
export SQLSetConnectAttr(ConnectionHandle, Attribute, Value, StringLength) {
    ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetConnectAttr", ConnectionHandleMarshal, ConnectionHandle, "int", Attribute, "ptr", Value, "int", StringLength, Int16)
    return result
}

/**
 * SQLSetCursorName Function
 * @remarks
 * Cursor names are used only in positioned update and delete statements (for example, **UPDATE** _table-name_ ...**WHERE CURRENT OF** _cursor-name_). For more information, see [Positioned Update and Delete Statements](../../../odbc/reference/develop-app/positioned-update-and-delete-statements.md). If the application does not call **SQLSetCursorName** to define a cursor name, on execution of a query statement the driver generates a name that begins with the letters SQL_CUR and does not exceed 18 characters in length.  
 *   
 *  All cursor names within the connection must be unique. The maximum length of a cursor name is defined by the driver. For maximum interoperability, it is recommended that applications limit cursor names to no more than 18 characters. In ODBC 3*.x*, if a cursor name is a quoted identifier, it is treated in a case-sensitive manner and it can contain characters that the syntax of SQL would not permit or would treat specially, such as blanks or reserved keywords. If a cursor name must be treated in a case-sensitive manner, it must be passed as a quoted identifier.  
 *   
 *  A cursor name that is set either explicitly or implicitly remains set until the statement with which it is associated is dropped, using **SQLFreeHandle**. **SQLSetCursorName** can be called to rename a cursor on a statement as long as the cursor is in an allocated or prepared state.
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Pointer<Integer>} CursorName [Input] Cursor name. For efficient processing, the cursor name should not include any leading or trailing spaces in the cursor name, and if the cursor name includes a delimited identifier, the delimiter should be positioned as the first character in the cursor name.
 * @param {Integer} NameLength [Input] Length in characters of **CursorName*.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetcursorname-function
 */
export SQLSetCursorName(StatementHandle, CursorName, NameLength) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    CursorNameMarshal := CursorName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetCursorName", StatementHandleMarshal, StatementHandle, CursorNameMarshal, CursorName, "short", NameLength, Int16)
    return result
}

/**
 * SQLSetDescField Function
 * @remarks
 * An application can call **SQLSetDescField** to set any descriptor field one at a time. One call to **SQLSetDescField** sets a single field in a single descriptor. This function can be called to set any field in any descriptor type, provided the field can be set. (See the table later in this section.)  
 *   
 * > [!NOTE]  
 * >  If a call to **SQLSetDescField** fails, the contents of the descriptor record identified by the *RecNumber* argument are undefined.  
 *   
 *  Other functions can be called to set multiple descriptor fields with a single call of the function. The **SQLSetDescRec** function sets a variety of fields that affect the data type and buffer bound to a column or parameter (the SQL_DESC_TYPE, SQL_DESC_DATETIME_INTERVAL_CODE, SQL_DESC_OCTET_LENGTH, SQL_DESC_PRECISION, SQL_DESC_SCALE, SQL_DESC_DATA_PTR, SQL_DESC_OCTET_LENGTH_PTR, and SQL_DESC_INDICATOR_PTR fields). **SQLBindCol** or **SQLBindParameter** can be used to make a complete specification for the binding of a column or parameter. These functions set a specific group of descriptor fields with one function call.  
 *   
 *  **SQLSetDescField** can be called to change the binding buffers by adding an offset to the binding pointers (SQL_DESC_DATA_PTR, SQL_DESC_INDICATOR_PTR, or SQL_DESC_OCTET_LENGTH_PTR). This changes the binding buffers without calling **SQLBindCol** or **SQLBindParameter**, which allows an application to change SQL_DESC_DATA_PTR without changing other fields, such as SQL_DESC_DATA_TYPE.  
 *   
 *  If an application calls **SQLSetDescField** to set any field other than SQL_DESC_COUNT or the deferred fields SQL_DESC_DATA_PTR, SQL_DESC_OCTET_LENGTH_PTR, or SQL_DESC_INDICATOR_PTR, the record becomes unbound.  
 *   
 *  Descriptor header fields are set by calling **SQLSetDescField** with the appropriate *FieldIdentifier*. Many header fields are also statement attributes, so they can also be set by a call to **SQLSetStmtAttr**. This allows applications to set a descriptor field without first obtaining a descriptor handle. When **SQLSetDescField** is called to set a header field, the *RecNumber* argument is ignored.  
 *   
 *  A *RecNumber* of 0 is used to set bookmark fields.  
 *   
 * > [!NOTE]  
 * >  The statement attribute SQL_ATTR_USE_BOOKMARKS should always be set before calling **SQLSetDescField** to set bookmark fields. While this is not mandatory, it is strongly recommended.
 * @param {Pointer<Void>} DescriptorHandle [Input] Descriptor handle.
 * @param {Integer} RecNumber [Input] Indicates the descriptor record containing the field that the application seeks to set. Descriptor records are numbered from 0, with record number 0 being the bookmark record. The *RecNumber* argument is ignored for header fields.
 * @param {Integer} FieldIdentifier [Input] Indicates the field of the descriptor whose value is to be set. For more information, see "*FieldIdentifier* Argument" in the "Comments" section.
 * @param {Pointer<Void>} Value 
 * @param {Integer} BufferLength [Input] If *FieldIdentifier* is an ODBC-defined field and *ValuePtr* points to a character string or a binary buffer, this argument should be the length of **ValuePtr*. For character string data, this argument should contain the number of bytes in the string.  
 *   
 *  If *FieldIdentifier* is an ODBC-defined field and *ValuePtr* is an integer, *BufferLength* is ignored.  
 *   
 *  If *FieldIdentifier* is a driver-defined field, the application indicates the nature of the field to the Driver Manager by setting the *BufferLength* argument. *BufferLength* can have the following values:  
 *   
 * -   If *ValuePtr* is a pointer to a character string, then *BufferLength* is the length of the string or SQL_NTS.  
 *   
 * -   If *ValuePtr* is a pointer to a binary buffer, then the application places the result of the SQL_LEN_BINARY_ATTR(*length*) macro in *BufferLength*. This places a negative value in *BufferLength*.  
 *   
 * -   If *ValuePtr* is a pointer to a value other than a character string or a binary string, then *BufferLength* should have the value SQL_IS_POINTER.  
 *   
 * -   If *ValuePtr* contains a fixed-length value, then *BufferLength* is either SQL_IS_INTEGER, SQL_IS_UINTEGER, SQL_IS_SMALLINT, or SQL_IS_USMALLINT, as appropriate.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetdescfield-function
 */
export SQLSetDescField(DescriptorHandle, RecNumber, FieldIdentifier, Value, BufferLength) {
    DescriptorHandleMarshal := DescriptorHandle is VarRef ? "ptr" : "ptr"
    ValueMarshal := Value is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetDescField", DescriptorHandleMarshal, DescriptorHandle, "short", RecNumber, "short", FieldIdentifier, ValueMarshal, Value, "int", BufferLength, Int16)
    return result
}

/**
 * SQLSetEnvAttr Function
 * @remarks
 * An application can call **SQLSetEnvAttr** only if no connection handle is allocated on the environment. All environment attributes successfully set by the application for the environment persist until **SQLFreeHandle** is called on the environment. More than one environment handle can be allocated simultaneously in ODBC *3.x*.  
 *   
 *  The format of information set through *ValuePtr* depends on the specified *Attribute*. **SQLSetEnvAttr** will accept attribute information in one of two different formats: a null-terminated character string or a 32-bit integer value. The format of each is noted in the attribute's description.  
 *   
 *  There are no driver-specific environment attributes.  
 *   
 *  Connection attributes cannot be set by a call to **SQLSetEnvAttr**. Trying to do this will return SQLSTATE HY092 (Invalid attribute/option identifier).  
 *   
 * |*Attribute*|*ValuePtr* contents|  
 * |-----------------|-------------------------|  
 * |SQL_ATTR_CONNECTION_POOLING (ODBC 3.8)|A 32-bit SQLUINTEGER value that enables or disables connection pooling at the environment level. The following values are used:<br /><br /> SQL_CP_OFF = Connection pooling is turned off. This is the default.<br /><br /> SQL_CP_ONE_PER_DRIVER = A single connection pool is supported for each driver. Every connection in a pool is associated with one driver.<br /><br /> SQL_CP_ONE_PER_HENV = A single connection pool is supported for each environment. Every connection in a pool is associated with one environment.<br /><br /> SQL_CP_DRIVER_AWARE = Use the connection-pool awareness feature of the driver, if it is available. If the driver does not support connection-pool awareness, SQL_CP_DRIVER_AWARE is ignored and SQL_CP_ONE_PER_HENV is used. For more information, see [Driver-Aware Connection Pooling](../../../odbc/reference/develop-app/driver-aware-connection-pooling.md). In an environment where some drivers support and some drivers do not support connection-pool awareness, SQL_CP_DRIVER_AWARE can enable the connection-pool awareness feature on those supporting drivers, but it is equivalent to setting to SQL_CP_ONE_PER_HENV on those drivers that do not support connection-pool awareness feature.<br /><br /> Connection pooling is enabled by calling **SQLSetEnvAttr** to set the SQL_ATTR_CONNECTION_POOLING attribute to SQL_CP_ONE_PER_DRIVER or SQL_CP_ONE_PER_HENV. This call must be made before the application allocates the shared environment for which connection pooling is to be enabled. The environment handle in the call to **SQLSetEnvAttr** is set to null, which makes SQL_ATTR_CONNECTION_POOLING a process-level attribute. After connection pooling is enabled, the application then allocates an implicit shared environment by calling **SQLAllocHandle** with the *InputHandle* argument set to SQL_HANDLE_ENV.<br /><br /> After connection pooling has been enabled and a shared environment has been selected for an application, SQL_ATTR_CONNECTION_POOLING cannot be reset for that environment, because **SQLSetEnvAttr** is called with a null environment handle when setting this attribute. If this attribute is set while connection pooling is already enabled on a shared environment, the attribute affects only shared environments that are allocated subsequently.<br /><br /> It is also possible to enable connection pooling on an environment. Note the following about environment connection pooling:<br /><br /> -   Enabling connection pooling on a NULL handle is a process-level attribute. Subsequently allocated environments will be a shared environment, and will inherit the process-level connection pooling setting.<br />-   After an environment is allocated, an application can still change its connection pool setting.<br />-   If environment connection pooling is enabled and the connection's driver uses driver pooling, environment pooling takes preference.<br /><br /> SQL_ATTR_CONNECTION_POOLING is implemented inside the Driver Manager. A driver does not need to implement SQL_ATTR_CONNECTION_POOLING. ODBC 2.0 and 3.0 applications can set this environment attribute.<br /><br /> For more information, see [ODBC Connection Pooling](../../../odbc/reference/develop-app/driver-manager-connection-pooling.md).|  
 * |SQL_ATTR_CP_MATCH (ODBC 3.0)|A 32-bit SQLUINTEGER value that determines how a connection is chosen from a connection pool. When **SQLConnect** or **SQLDriverConnect** is called, the Driver Manager determines which connection is reused from the pool. The Driver Manager tries to match the connection options in the call and the connection attributes set by the application to the keywords and connection attributes of the connections in the pool. The value of this attribute determines the level of precision of the matching criteria.<br /><br /> The following values are used to set the value of this attribute:<br /><br /> SQL_CP_STRICT_MATCH = Only connections that exactly match the connection options in the call and the connection attributes set by the application are reused. This is the default.<br /><br /> SQL_CP_RELAXED_MATCH = Connections with matching connection string keywords can be used. Keywords must match, but not all connection attributes must match.<br /><br /> For more information about how the Driver Manager performs the match in connecting to a pooled connection, see [SQLConnect](../../../odbc/reference/syntax/sqlconnect-function.md). For more information about connection pooling, see [ODBC Connection Pooling](../../../odbc/reference/develop-app/driver-manager-connection-pooling.md).|  
 * |SQL_ATTR_ODBC_VERSION (ODBC 3.0)|A 32-bit integer that determines whether certain functionality exhibits ODBC *2.x* behavior or ODBC *3.x* behavior. The following values are used to set the value of this attribute:<br /><br /> SQL_OV_ODBC3_80 = The Driver Manager and driver exhibit the following ODBC 3.8 behavior:<br /><br /> -   The driver returns and expects ODBC *3.x* codes for date, time, and timestamp.<br />-   The driver returns ODBC *3.x* SQLSTATE codes when **SQLError**, **SQLGetDiagField**, or **SQLGetDiagRec** is called.<br />-   The *CatalogName* argument in a call to **SQLTables** accepts a search pattern.<br />-   The Driver Manager supports C data type extensibility. For more information about C data type extensibility, see [C Data Types in ODBC](../../../odbc/reference/develop-app/c-data-types-in-odbc.md).<br /><br /> For more information, see [What's New in ODBC 3.8](../../../odbc/reference/what-s-new-in-odbc-3-8.md).<br /><br /> SQL_OV_ODBC3 = The Driver Manager and driver exhibit the following ODBC *3.x* behavior:<br /><br /> -   The driver returns and expects ODBC *3.x* codes for date, time, and timestamp.<br />-   The driver returns ODBC *3.x* SQLSTATE codes when **SQLError**, **SQLGetDiagField**, or **SQLGetDiagRec** is called.<br />-   The *CatalogName* argument in a call to **SQLTables** accepts a search pattern.<br />-   The Driver Manager does not support C data type extensibility.<br /><br /> SQL_OV_ODBC2 = The Driver Manager and driver exhibit the following ODBC *2.x* behavior. This is especially useful for an ODBC *2.x* application working with an ODBC *3.x* driver.<br /><br /> -   The driver returns and expects ODBC *2.x* codes for date, time, and timestamp.<br />-   The driver returns ODBC *2.x* SQLSTATE codes when **SQLError**, **SQLGetDiagField**, or **SQLGetDiagRec** is called.<br />-   The *CatalogName* argument in a call to **SQLTables** does not accept a search pattern.<br />-   The Driver Manager does not support C data type extensibility.<br /><br /> An application must set this environment attribute before it calls any function that has an SQLHENV argument, or the call will return SQLSTATE HY010 (Function sequence error). It is driver-specific whether additional behavior exists for these environmental flags.<br /><br /> -   For more information, see [Declaring the Application's ODBC Version](../../../odbc/reference/develop-app/declaring-the-application-s-odbc-version.md) and [Behavioral Changes](../../../odbc/reference/develop-app/behavioral-changes.md).|  
 * |SQL_ATTR_OUTPUT_NTS (ODBC 3.0)|A 32-bit integer that determines how the driver returns string data. If SQL_TRUE, the driver returns string data null-terminated. If SQL_FALSE, the driver does not return string data null-terminated.<br /><br /> This attribute defaults to SQL_TRUE. A call to **SQLSetEnvAttr** to set it to SQL_TRUE returns SQL_SUCCESS. A call to **SQLSetEnvAttr** to set it to SQL_FALSE returns SQL_ERROR and SQLSTATE HYC00 (Optional feature not implemented).|
 * @param {Pointer<Void>} EnvironmentHandle [Input] Environment handle.
 * @param {Integer} Attribute [Input] Attribute to set, listed in "Comments."
 * @param {Integer} Value 
 * @param {Integer} StringLength [Input] If *ValuePtr* points to a character string or a binary buffer, this argument should be the length of **ValuePtr*. For character string data, this argument should contain the number of bytes in the string.  
 *   
 *  If *ValuePtr* is an integer, *StringLength* is ignored.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetenvattr-function
 */
export SQLSetEnvAttr(EnvironmentHandle, Attribute, Value, StringLength) {
    EnvironmentHandleMarshal := EnvironmentHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetEnvAttr", EnvironmentHandleMarshal, EnvironmentHandle, "int", Attribute, "ptr", Value, "int", StringLength, Int16)
    return result
}

/**
 * SQLSetStmtAttr Function
 * @remarks
 * Statement attributes for a statement remain in effect until they are changed by another call to **SQLSetStmtAttr** or until the statement is dropped by calling **SQLFreeHandle**. Calling **SQLFreeStmt** with the SQL_CLOSE, SQL_UNBIND, or SQL_RESET_PARAMS option does not reset statement attributes.  
 *   
 *  Some statement attributes support substitution of a similar value if the data source does not support the value specified in *ValuePtr*. In such cases, the driver returns SQL_SUCCESS_WITH_INFO and SQLSTATE 01S02 (Option value changed). For example, if *Attribute* is SQL_ATTR_CONCURRENCY and *ValuePtr* is SQL_CONCUR_ROWVER, and if the data source does not support this, the driver substitutes SQL_CONCUR_VALUES and returns SQL_SUCCESS_WITH_INFO. To determine the substituted value, an application calls **SQLGetStmtAttr**.  
 *   
 *  The format of information set with *ValuePtr* depends on the specified *Attribute*. **SQLSetStmtAttr** accepts attribute information in one of two different formats: a character string or an integer value. The format of each is noted in the attribute's description. This format applies to the information returned for each attribute in **SQLGetStmtAttr**. Character strings pointed to by the *ValuePtr* argument of **SQLSetStmtAttr** have a length of *StringLength*.  
 *   
 * > [!NOTE]
 * >  The ability to set statement attributes at the connection level by calling **SQLSetConnectAttr** has been deprecated in ODBC *3.x*. ODBC *3.x* applications should never set statement attributes at the connection level. ODBC *3.x* statement attributes cannot be set at the connection level, with the exception of the SQL_ATTR_METADATA_ID and SQL_ATTR_ASYNC_ENABLE attributes, which are both connection attributes and statement attributes, and can be set at either the connection level or the statement level.  
 * > 
 * > [!NOTE]
 * >  ODBC *3.x* drivers need only support this functionality if they should work with ODBC *2.x* applications that set ODBC *2.x* statement options at the connection level. For more information, see "Setting Statement Options on the Connection Level" under [SQLSetConnectOption Mapping](../../../odbc/reference/appendixes/sqlsetconnectoption-mapping.md) in Appendix G: Driver Guidelines for Backward Compatibility.
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Integer} Attribute [Input] Option to set, listed in "Comments."
 * @param {Pointer<Void>} Value 
 * @param {Integer} StringLength [Input] If *Attribute* is an ODBC-defined attribute and *ValuePtr* points to a character string or a binary buffer, this argument should be the length of \**ValuePtr*. If *Attribute* is an ODBC-defined attribute and *ValuePtr* is an integer, *StringLength* is ignored.  
 *   
 *  If *Attribute* is a driver-defined attribute, the application indicates the nature of the attribute to the Driver Manager by setting the *StringLength* argument. *StringLength* can have the following values:  
 *   
 * -   If *ValuePtr* is a pointer to a character string, then *StringLength* is the length of the string or SQL_NTS.  
 *   
 * -   If *ValuePtr* is a pointer to a binary buffer, then the application places the result of the SQL_LEN_BINARY_ATTR(*length*) macro in *StringLength*. This places a negative value in *StringLength*.  
 *   
 * -   If *ValuePtr* is a pointer to a value other than a character string or a binary string, then *StringLength* should have the value SQL_IS_POINTER.  
 *   
 * -   If *ValuePtr* contains a fixed-length value, then *StringLength* is either SQL_IS_INTEGER or SQL_IS_UINTEGER, as appropriate.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlsetstmtattr-function
 */
export SQLSetStmtAttr(StatementHandle, Attribute, Value, StringLength) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    ValueMarshal := Value is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetStmtAttr", StatementHandleMarshal, StatementHandle, "int", Attribute, ValueMarshal, Value, "int", StringLength, Int16)
    return result
}

/**
 * SQLSpecialColumns Function
 * @remarks
 * When the *IdentifierType* argument is SQL_BEST_ROWID, **SQLSpecialColumns** returns the column or columns that uniquely identify each row in the table. These columns can always be used in a *select-list* or **WHERE** clause. **SQLColumns**, which is used to return a variety of information on the columns of a table, does not necessarily return the columns that uniquely identify each row, or columns that are automatically updated when any value in the row is updated by a transaction. For example, **SQLColumns** might not return the Oracle pseudo-column ROWID. This is why **SQLSpecialColumns** is used to return these columns. For more information, see [Uses of Catalog Data](../../../odbc/reference/develop-app/uses-of-catalog-data.md).  
 *   
 * > [!NOTE]  
 * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
 *   
 *  If there are no columns that uniquely identify each row in the table, **SQLSpecialColumns** returns a rowset with no rows; a subsequent call to **SQLFetch** or **SQLFetchScroll** on the statement returns SQL_NO_DATA.  
 *   
 *  If the *IdentifierType*, *Scope*, or *Nullable* arguments specify characteristics that are not supported by the data source, **SQLSpecialColumns** returns an empty result set.  
 *   
 *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, the *CatalogName*, *SchemaName*, and *TableName* arguments are treated as identifiers, so they cannot be set to a null pointer in certain situations. (For more information, see [Arguments in Catalog Functions](../../../odbc/reference/develop-app/arguments-in-catalog-functions.md).)  
 *   
 *  **SQLSpecialColumns** returns the results as a standard result set, ordered by SCOPE.  
 *   
 *  The following columns have been renamed for ODBC *3.x*. The column name changes do not affect backward compatibility because applications bind by column number.  
 *   
 * |ODBC 2.0 column|ODBC *3.x* column|  
 * |---------------------|-----------------------|  
 * |PRECISION|COLUMN_SIZE|  
 * |LENGTH|BUFFER_LENGTH|  
 * |SCALE|DECIMAL_DIGITS|  
 *   
 *  To determine the actual length of the COLUMN_NAME column, an application can call **SQLGetInfo** with the SQL_MAX_COLUMN_NAME_LEN option.  
 *   
 *  The following table lists the columns in the result set. Additional columns beyond column 8 (PSEUDO_COLUMN) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set rather than specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
 *   
 * |Column name|Column number|Data type|Comments|  
 * |-----------------|-------------------|---------------|--------------|  
 * |SCOPE (ODBC 1.0)|1|Smallint|Actual scope of the rowid. Contains one of the following values:<br /><br /> SQL_SCOPE_CURROW SQL_SCOPE_TRANSACTION SQL_SCOPE_SESSION<br /><br /> NULL is returned when *IdentifierType* is SQL_ROWVER. For a description of each value, see the description of *Scope* in "Syntax," earlier in this section.|  
 * |COLUMN_NAME (ODBC 1.0)|2|Varchar not NULL|Column name. The driver returns an empty string for a column that does not have a name.|  
 * |DATA_TYPE (ODBC 1.0)|3|Smallint not NULL|SQL data type. This can be an ODBC SQL data type or a driver-specific SQL data type. For a list of valid ODBC SQL data types, see [SQL Data Types](../../../odbc/reference/appendixes/sql-data-types.md). For information about driver-specific SQL data types, see the driver's documentation.|  
 * |TYPE_NAME (ODBC 1.0)|4|Varchar not NULL|Data source-dependent data type name; for example, "CHAR", "VARCHAR", "MONEY", "LONG VARBINARY", or "CHAR ( ) FOR BIT DATA".|  
 * |COLUMN_SIZE (ODBC 1.0)|5|Integer|The size of the column on the data source. For more information concerning column size, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md).|  
 * |BUFFER_LENGTH (ODBC 1.0)|6|Integer|The length in bytes of data transferred on an **SQLGetData** or **SQLFetch** operation if SQL_C_DEFAULT is specified. For numeric data, this size may be different than the size of the data stored on the data source. This value is the same as the COLUMN_SIZE column for character or binary data. For more information, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md).|  
 * |DECIMAL_DIGITS (ODBC 1.0)|7|Smallint|The decimal digits of the column on the data source. NULL is returned for data types where decimal digits are not applicable. For more information concerning decimal digits, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md).|  
 * |PSEUDO_COLUMN (ODBC 2.0)|8|Smallint|Indicates whether the column is a pseudo-column, such as Oracle ROWID:<br /><br /> SQL_PC_UNKNOWN SQL_PC_NOT_PSEUDO SQL_PC_PSEUDO **Note:**  For maximum interoperability, pseudo-columns should not be quoted with the identifier quote character returned by **SQLGetInfo**.|  
 *   
 *  After the application retrieves values for SQL_BEST_ROWID, the application can use these values to reselect that row within the defined scope. The **SELECT** statement is guaranteed to return either no rows or one row.  
 *   
 *  If an application reselects a row based on the rowid column or columns and the row is not found, the application can assume that the row was deleted or the rowid columns were modified. The opposite is not true: even if the rowid has not changed, the other columns in the row may have changed.  
 *   
 *  Columns returned for column type SQL_BEST_ROWID are useful for applications that need to scroll forward and back within a result set to retrieve the most recent data from a set of rows. The column or columns of the rowid are guaranteed not to change while positioned on that row.  
 *   
 *  The column or columns of the rowid may remain valid even when the cursor is not positioned on the row; the application can determine this by checking the SCOPE column in the result set.  
 *   
 *  Columns returned for column type SQL_ROWVER are useful for applications that need the ability to check whether any columns in a given row have been updated while the row was reselected using the rowid. For example, after reselecting a row using rowid, the application can compare the previous values in the SQL_ROWVER columns to the ones just fetched. If the value in a SQL_ROWVER column differs from the previous value, the application can alert the user that data on the display has changed.
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Integer} IdentifierType [Input] Type of column to return. Must be one of the following values:  
 *   
 *  SQL_BEST_ROWID: Returns the optimal column or set of columns that, by retrieving values from the column or columns, allows any row in the specified table to be uniquely identified. A column can be either a pseudo-column specifically designed for this purpose (as in Oracle ROWID or Ingres TID) or the column or columns of any unique index for the table.  
 *   
 *  SQL_ROWVER: Returns the column or columns in the specified table, if any, that are automatically updated by the data source when any value in the row is updated by any transaction (as in SQLBase ROWID or Sybase TIMESTAMP).
 * @param {Pointer<Integer>} CatalogName [Input] Catalog name for the table. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, an empty string ("") denotes those tables that do not have catalogs. *CatalogName* cannot contain a string search pattern.  
 *   
 *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *CatalogName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *CatalogName* is an ordinary argument; it is treated literally, and its case is significant. For more information, see [Arguments in Catalog Functions](../../../odbc/reference/develop-app/arguments-in-catalog-functions.md).
 * @param {Integer} NameLength1 [Input] Length in characters of **CatalogName*.
 * @param {Pointer<Integer>} SchemaName [Input] Schema name for the table. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, an empty string ("") denotes those tables that do not have schemas. *SchemaName* cannot contain a string search pattern.  
 *   
 *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *SchemaName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *SchemaName* is an ordinary argument; it is treated literally, and its case is significant.
 * @param {Integer} NameLength2 [Input] Length in characters of **SchemaName*.
 * @param {Pointer<Integer>} TableName [Input] Table name. This argument cannot be a null pointer. *TableName* cannot contain a string search pattern.  
 *   
 *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *TableName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *TableName* is an ordinary argument; it is treated literally, and its case is significant.
 * @param {Integer} NameLength3 [Input] Length in characters of **TableName*.
 * @param {Integer} Scope [Input] Minimum required scope of the rowid. The returned rowid may be of greater scope. Must be one of the following:  
 *   
 *  SQL_SCOPE_CURROW: The rowid is guaranteed to be valid only while positioned on that row. A later reselect using rowid may not return a row if the row was updated or deleted by another transaction.  
 *   
 *  SQL_SCOPE_TRANSACTION: The rowid is guaranteed to be valid for the duration of the current transaction.  
 *   
 *  SQL_SCOPE_SESSION: The rowid is guaranteed to be valid for the duration of the session (across transaction boundaries).
 * @param {Integer} Nullable [Input] Determines whether to return special columns that can have a NULL value. Must be one of the following:  
 *   
 *  SQL_NO_NULLS: Exclude special columns that can have NULL values. Some drivers cannot support SQL_NO_NULLS, and these drivers will return an empty result set if SQL_NO_NULLS was specified. Applications should be prepared for this case and request SQL_NO_NULLS only if it is absolutely required.  
 *   
 *  SQL_NULLABLE: Return special columns even if they can have NULL values.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlspecialcolumns-function
 */
export SQLSpecialColumns(StatementHandle, IdentifierType, CatalogName, NameLength1, SchemaName, NameLength2, TableName, NameLength3, Scope, Nullable) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    CatalogNameMarshal := CatalogName is VarRef ? "char*" : "ptr"
    SchemaNameMarshal := SchemaName is VarRef ? "char*" : "ptr"
    TableNameMarshal := TableName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLSpecialColumns", StatementHandleMarshal, StatementHandle, "ushort", IdentifierType, CatalogNameMarshal, CatalogName, "short", NameLength1, SchemaNameMarshal, SchemaName, "short", NameLength2, TableNameMarshal, TableName, "short", NameLength3, "ushort", Scope, "ushort", Nullable, Int16)
    return result
}

/**
 * SQLStatistics Function
 * @remarks
 * **SQLStatistics** returns information about a single table as a standard result set, ordered by NON_UNIQUE, TYPE, INDEX_QUALIFIER, INDEX_NAME, and ORDINAL_POSITION. The result set combines statistics information (in the CARDINALITY and PAGES columns of the result set) for the table with information about each index. For information about how this information might be used, see [Uses of Catalog Data](../../../odbc/reference/develop-app/uses-of-catalog-data.md).  
 *   
 *  To determine the actual lengths of the TABLE_CAT, TABLE_SCHEM, TABLE_NAME, and COLUMN_NAME columns, an application can call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, SQL_MAX_TABLE_NAME_LEN, and SQL_MAX_COLUMN_NAME_LEN options.  
 *   
 * > [!NOTE]  
 * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
 *   
 *  The following columns have been renamed for ODBC *3.x*. The column name changes do not affect backward compatibility because applications bind by column number.  
 *   
 * |ODBC 2.0 column|ODBC *3.x* column|  
 * |---------------------|-----------------------|  
 * |TABLE_QUALIFIER|TABLE_CAT|  
 * |TABLE_OWNER|TABLE_SCHEM|  
 * |SEQ_IN_INDEX|ORDINAL_POSITION|  
 * |COLLATION|ASC_OR_DESC|  
 *   
 *  The following table lists the columns in the result set. Additional columns beyond column 13 (FILTER_CONDITION) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set instead of specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
 *   
 * |Column name|Column number|Data type|Comments|  
 * |-----------------|-------------------|---------------|--------------|  
 * |TABLE_CAT (ODBC 1.0)|1|Varchar|Catalog name of the table to which the statistic or index applies; NULL if not applicable to the data source. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have catalogs.|  
 * |TABLE_SCHEM (ODBC 1.0)|2|Varchar|Schema name of the table to which the statistic or index applies; NULL if not applicable to the data source. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have schemas.|  
 * |TABLE_NAME (ODBC 1.0)|3|Varchar not NULL|Table name of the table to which the statistic or index applies.|  
 * |NON_UNIQUE (ODBC 1.0)|4|Smallint|Indicates whether the index does not allow duplicate values:<br /><br /> SQL_TRUE if the index values can be nonunique.<br /><br /> SQL_FALSE if the index values must be unique.<br /><br /> NULL is returned if TYPE is SQL_TABLE_STAT.|  
 * |INDEX_QUALIFIER (ODBC 1.0)|5|Varchar|The identifier that is used to qualify the index name doing a **DROP INDEX**; NULL is returned if an index qualifier is not supported by the data source or if TYPE is SQL_TABLE_STAT. If a non-null value is returned in this column, it must be used to qualify the index name on a **DROP INDEX** statement; otherwise, the TABLE_SCHEM should be used to qualify the index name.|  
 * |INDEX_NAME (ODBC 1.0)|6|Varchar|Index name; NULL is returned if TYPE is SQL_TABLE_STAT.|  
 * |TYPE (ODBC 1.0)|7|Smallint not NULL|Type of information being returned:<br /><br /> SQL_TABLE_STAT indicates a statistic for the table (in the CARDINALITY or PAGES column).<br /><br /> SQL_INDEX_BTREE indicates a B-Tree index.<br /><br /> SQL_INDEX_CLUSTERED indicates a clustered index.<br /><br /> SQL_INDEX_CONTENT indicates a content index.<br /><br /> SQL_INDEX_HASHED indicates a hashed index.<br /><br /> SQL_INDEX_OTHER indicates another type of index.|  
 * |ORDINAL_POSITION (ODBC 1.0)|8|Smallint|Column sequence number in index (starting with 1); NULL is returned if TYPE is SQL_TABLE_STAT.|  
 * |COLUMN_NAME (ODBC 1.0)|9|Varchar|Column name. If the column is based on an expression, such as SALARY + BENEFITS, the expression is returned; if the expression cannot be determined, an empty string is returned. NULL is returned if TYPE is SQL_TABLE_STAT.|  
 * |ASC_OR_DESC (ODBC 1.0)|10|Char(1)|Sort sequence for the column: "A" for ascending; "D" for descending; NULL is returned if column sort sequence is not supported by the data source or if TYPE is SQL_TABLE_STAT.|  
 * |CARDINALITY (ODBC 1.0)|11|Integer|Cardinality of table or index; number of rows in table if TYPE is SQL_TABLE_STAT; number of unique values in the index if TYPE is not SQL_TABLE_STAT; NULL is returned if the value is not available from the data source.|  
 * |PAGES (ODBC 1.0)|12|Integer|Number of pages used to store the index or table; number of pages for the table if TYPE is SQL_TABLE_STAT; number of pages for the index if TYPE is not SQL_TABLE_STAT; NULL is returned if the value is not available from the data source or if not applicable to the data source.|  
 * |FILTER_CONDITION (ODBC 2.0)|13|Varchar|If the index is a filtered index, this is the filter condition, such as SALARY > 30000; if the filter condition cannot be determined, this is an empty string.<br /><br /> NULL if the index is not a filtered index, it cannot be determined whether the index is a filtered index, or TYPE is SQL_TABLE_STAT.|  
 *   
 *  If the row in the result set corresponds to a table, the driver sets TYPE to SQL_TABLE_STAT and sets NON_UNIQUE, INDEX_QUALIFIER, INDEX_NAME, ORDINAL_POSITION, COLUMN_NAME, and ASC_OR_DESC to NULL. If CARDINALITY or PAGES are not available from the data source, the driver sets them to NULL.
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Pointer<Integer>} CatalogName [Input] Catalog name. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, an empty string ("") indicates those tables that do not have catalogs. *CatalogName* cannot contain a string search pattern.  
 *   
 *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *CatalogName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *CatalogName* is an ordinary argument; it is treated literally, and its case is significant. For more information, see [Arguments in Catalog Functions](../../../odbc/reference/develop-app/arguments-in-catalog-functions.md).
 * @param {Integer} NameLength1 [Input] Length in characters of **CatalogName*.
 * @param {Pointer<Integer>} SchemaName [Input] Schema name. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, an empty string ("") indicates those tables that do not have schemas. *SchemaName* cannot contain a string search pattern.  
 *   
 *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *SchemaName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *SchemaName* is an ordinary argument; it is treated literally, and its case is significant.
 * @param {Integer} NameLength2 [Input] Length in characters of **SchemaName*.
 * @param {Pointer<Integer>} TableName [Input] Table name. This argument cannot be a null pointer. *SchemaName* cannot contain a string search pattern.  
 *   
 *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *TableName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *TableName* is an ordinary argument; it is treated literally, and its case is significant.
 * @param {Integer} NameLength3 [Input] Length in characters of **TableName*.
 * @param {Integer} Unique [Input] Type of index: SQL_INDEX_UNIQUE or SQL_INDEX_ALL.
 * @param {Integer} Reserved [Input] Indicates the importance of the CARDINALITY and PAGES columns in the result set. The following options affect the return of the CARDINALITY and PAGES columns only; index information is returned even if CARDINALITY and PAGES are not returned.  
 *   
 *  SQL_ENSURE requests that the driver unconditionally retrieve the statistics. (Drivers that conform only to the Open Group standard and do not support ODBC extensions will not be able to support SQL_ENSURE.)  
 *   
 *  SQL_QUICK requests that the driver retrieve the CARDINALITY and PAGES only if they are readily available from the server. In this case, the driver does not ensure that the values are current. (Applications that are written to the Open Group standard will always get SQL_QUICK behavior from ODBC *3.x*-compliant drivers.)
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlstatistics-function
 */
export SQLStatistics(StatementHandle, CatalogName, NameLength1, SchemaName, NameLength2, TableName, NameLength3, Unique, Reserved) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    CatalogNameMarshal := CatalogName is VarRef ? "char*" : "ptr"
    SchemaNameMarshal := SchemaName is VarRef ? "char*" : "ptr"
    TableNameMarshal := TableName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLStatistics", StatementHandleMarshal, StatementHandle, CatalogNameMarshal, CatalogName, "short", NameLength1, SchemaNameMarshal, SchemaName, "short", NameLength2, TableNameMarshal, TableName, "short", NameLength3, "ushort", Unique, "ushort", Reserved, Int16)
    return result
}

/**
 * SQLTables Function
 * @remarks
 * **SQLTables** lists all tables in the requested range. A user may or may not have SELECT privileges to any of these tables. To check accessibility, an application can:  
 *   
 * -   Call **SQLGetInfo** and check the SQL_ACCESSIBLE_TABLES information type.  
 *   
 * -   Call **SQLTablePrivileges** to check the privileges for each table.  
 *   
 *  Otherwise, the application must be able to handle a situation where the user selects a table for which **SELECT** privileges are not granted.  
 *   
 *  The *SchemaName* and *TableName* arguments accept search patterns. The *CatalogName* argument accepts search patterns if the SQL_ODBC_VERSION environment attribute is SQL_OV_ODBC3; it does not accept search patterns if SQL_OV_ODBC2 is set. If SQL_OV_ODBC3 is set, an ODBC 3*.x* driver will require that wildcard characters in the *CatalogName* argument be escaped to be treated literally. For more information about valid search patterns, see [Pattern Value Arguments](../../../odbc/reference/develop-app/pattern-value-arguments.md).  
 *   
 * > [!NOTE]  
 * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
 *   
 *  To support enumeration of catalogs, schemas, and table types, the following special semantics are defined for the *CatalogName*, *SchemaName*, *TableName*, and *TableType* arguments of **SQLTables**:  
 *   
 * -   If *CatalogName* is SQL_ALL_CATALOGS and *SchemaName* and *TableName* are empty strings, the result set contains a list of valid catalogs for the data source. (All columns except the TABLE_CAT column contain NULLs.)  
 *   
 * -   If *SchemaName* is SQL_ALL_SCHEMAS and *CatalogName* and *TableName* are empty strings, the result set contains a list of valid schemas for the data source. (All columns except the TABLE_SCHEM column contain NULLs.)  
 *   
 * -   If *TableType* is SQL_ALL_TABLE_TYPES and *CatalogName*, *SchemaName*, and *TableName* are empty strings, the result set contains a list of valid table types for the data source. (All columns except the TABLE_TYPE column contain NULLs.)  
 *   
 *  If *TableType* is not an empty string, it must contain a list of comma-separated values for the types of interest; each value can be enclosed in single quotation marks (') or unquoted, for example, 'TABLE', 'VIEW' or TABLE, VIEW. An application should always specify the table type in uppercase; the driver should convert the table type to whatever case is needed by the data source. If the data source does not support a specified table type, **SQLTables** does not return any results for that type.  
 *   
 *  **SQLTables** returns the results as a standard result set, ordered by TABLE_TYPE, TABLE_CAT, TABLE_SCHEM, and TABLE_NAME. For information about how this information might be used, see [Uses of Catalog Data](../../../odbc/reference/develop-app/uses-of-catalog-data.md).  
 *   
 *  To determine the actual lengths of the TABLE_CAT, TABLE_SCHEM, and TABLE_NAME columns, an application can call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, and SQL_MAX_TABLE_NAME_LEN information types.  
 *   
 *  The following columns have been renamed for ODBC 3*.x*. The column name changes do not affect backward compatibility because applications bind by column number.  
 *   
 * |ODBC 2.0 column|ODBC 3*.x* column|  
 * |---------------------|-----------------------|  
 * |TABLE_QUALIFIER|TABLE_CAT|  
 * |TABLE_OWNER|TABLE_SCHEM|  
 *   
 *  The following table lists the columns in the result set. Additional columns beyond column 5 (REMARKS) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set instead of specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
 *   
 * |Column name|Column number|Data type|Comments|  
 * |-----------------|-------------------|---------------|--------------|  
 * |TABLE_CAT (ODBC 1.0)|1|Varchar|Catalog name; NULL if not applicable to the data source. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have catalogs.|  
 * |TABLE_SCHEM (ODBC 1.0)|2|Varchar|Schema name; NULL if not applicable to the data source. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have schemas.|  
 * |TABLE_NAME (ODBC 1.0)|3|Varchar|Table name.|  
 * |TABLE_TYPE (ODBC 1.0)|4|Varchar|Table type name; one of the following: "TABLE", "VIEW", "SYSTEM TABLE", "GLOBAL TEMPORARY", "LOCAL TEMPORARY", "ALIAS", "SYNONYM", or a data source-specific type name.<br /><br /> The meanings of "ALIAS" and "SYNONYM" are driver-specific.|  
 * |REMARKS (ODBC 1.0)|5|Varchar|A description of the table.|
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle for retrieved results.
 * @param {Pointer<Integer>} CatalogName [Input] Catalog name. The *CatalogName* argument accepts search patterns if the SQL_ODBC_VERSION environment attribute is SQL_OV_ODBC3; it does not accept search patterns if SQL_OV_ODBC2 is set. If a driver supports catalogs for some tables but not for others, such as when a driver retrieves data from different DBMSs, an empty string ("") indicates those tables that do not have catalogs.  
 *   
 *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *CatalogName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *CatalogName* is a pattern value argument; it is treated literally, and its case is significant. For more information, see [Arguments in Catalog Functions](../../../odbc/reference/develop-app/arguments-in-catalog-functions.md).
 * @param {Integer} NameLength1 [Input] Length in characters of **CatalogName*.
 * @param {Pointer<Integer>} SchemaName [Input] String search pattern for schema names. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, an empty string ("") indicates those tables that do not have schemas.  
 *   
 *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *SchemaName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *SchemaName* is a pattern value argument; it is treated literally, and its case is significant.
 * @param {Integer} NameLength2 [Input] Length in characters of **SchemaName*.
 * @param {Pointer<Integer>} TableName [Input] String search pattern for table names.  
 *   
 *  If the SQL_ATTR_METADATA_ID statement attribute is set to SQL_TRUE, *TableName* is treated as an identifier and its case is not significant. If it is SQL_FALSE, *TableName* is a pattern value argument; it is treated literally, and its case is significant.
 * @param {Integer} NameLength3 [Input] Length in characters of **TableName*.
 * @param {Pointer<Integer>} TableType [Input] List of table types to match.  
 *   
 *  Notice that the SQL_ATTR_METADATA_ID statement attribute has no effect upon the *TableType* argument. *TableType* is a value list argument, regardless of the setting of SQL_ATTR_METADATA_ID.
 * @param {Integer} NameLength4 [Input] Length in characters of **TableType*.
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqltables-function
 */
export SQLTables(StatementHandle, CatalogName, NameLength1, SchemaName, NameLength2, TableName, NameLength3, TableType, NameLength4) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"
    CatalogNameMarshal := CatalogName is VarRef ? "char*" : "ptr"
    SchemaNameMarshal := SchemaName is VarRef ? "char*" : "ptr"
    TableNameMarshal := TableName is VarRef ? "char*" : "ptr"
    TableTypeMarshal := TableType is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLTables", StatementHandleMarshal, StatementHandle, CatalogNameMarshal, CatalogName, "short", NameLength1, SchemaNameMarshal, SchemaName, "short", NameLength2, TableNameMarshal, TableName, "short", NameLength3, TableTypeMarshal, TableType, "short", NameLength4, Int16)
    return result
}

/**
 * SQLTransact Function
 * @param {Pointer<Void>} EnvironmentHandle 
 * @param {Pointer<Void>} ConnectionHandle 
 * @param {Integer} CompletionType 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqltransact-function
 */
export SQLTransact(EnvironmentHandle, ConnectionHandle, CompletionType) {
    EnvironmentHandleMarshal := EnvironmentHandle is VarRef ? "ptr" : "ptr"
    ConnectionHandleMarshal := ConnectionHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLTransact", EnvironmentHandleMarshal, EnvironmentHandle, ConnectionHandleMarshal, ConnectionHandle, "ushort", CompletionType, Int16)
    return result
}

/**
 * bcp_batch
 * @remarks
 * Bulk copy batches define transactions. When an application uses [bcp_bind](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-bind.md) and **bcp_sendrow** to bulk copy rows from program variables to SQL Server tables, the rows are committed only when the program calls **bcp_batch** or [bcp_done](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-done.md).  
 *   
 *  You can call **bcp_batch** once every *n* rows or when there is a lull in incoming data (as in a telemetry application). If an application does not call **bcp_batch** the bulk copied rows are committed only when **bcp_done** is called.
 * @param {Pointer<Void>} param0 
 * @returns {Integer} The number of rows saved after the last call to **bcp_batch**, or -1 in case of error.
 * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-batch
 */
export bcp_batch(param0) {
    param0Marshal := param0 is VarRef ? "ptr" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_batch", param0Marshal, param0, Int32)
    return result
}

/**
 * bcp_bind
 * @remarks
 * Use **bcp_bind** for a fast, efficient way to copy data from a program variable into a table in [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)].  
 * 
 * Call [bcp_init](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-init.md) before calling this or any other bulk-copy function. Calling **bcp_init** sets the [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] target table for bulk copy. When calling **bcp_init** for use with **bcp_bind** and [bcp_sendrow](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-sendrow.md), the **bcp_init** _szDataFile_ parameter, indicating the data file, is set to NULL; the **bcp_init**_eDirection_ parameter is set to DB_IN.  
 * 
 * Make a separate **bcp_bind** call for every column in the [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] table into which you want to copy. After the necessary **bcp_bind** calls have been made, then call **bcp_sendrow** to send a row of data from your program variables to [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)]. Rebinding a column is not supported.
 * 
 * Whenever you want [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] to commit the rows already received, call [bcp_batch](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-batch.md). For example, call **bcp_batch** once for every 1000 rows inserted or at any other interval.  
 * 
 * When there are no more rows to be inserted, call [bcp_done](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-done.md). Failure to do so results in an error.
 * 
 * Control parameter settings, specified with [bcp_control](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-control.md), have no effect on **bcp_bind** row transfers.  
 * 
 * If *pData* for a column is set to NULL because its value will be supplied by calls to [bcp_moretext](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-moretext.md), any subsequent columns with *eDataType* set to SQLTEXT, SQLNTEXT, SQLXML, SQLUDT, SQLCHARACTER, SQLVARCHAR, SQLVARBINARY, SQLBINARY, SQLNCHAR, or SQLIMAGE must also be bound with *pData* set to NULL, and their values must also be supplied by calls to **bcp_moretext**.  
 * 
 * For new large value types, such as **varchar(max)**, **varbinary(max)**, or **nvarchar(max)**, you can use SQLCHARACTER, SQLVARCHAR, SQLVARBINARY, SQLBINARY, and SQLNCHAR as type indicators in the *eDataType* parameter.  
 * 
 * If *cbTerm* is not 0, any value (1, 2, 4, or 8) is valid for the prefix (*cbIndicator*). In this situation, [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] Native Client will search for the terminator, calculate data length with respect to the terminator (*i*), and set the *cbData* to the smaller value of i and the value of prefix.  
 * 
 * If *cbTerm* is 0 and *cbIndicator* (the prefix) is not 0, *cbIndicator* must be 8. The 8-byte prefix can take the following values:  
 * 
 * - 0xFFFFFFFFFFFFFFFF means a null value for the field  
 * 
 * - 0xFFFFFFFFFFFFFFFE is treated as a special prefix value, which is used for efficiently sending data in chunks to the server. The format of data with this special prefix is:  
 * 
 * - <SPECIAL_PREFIX> \<0 or more  DATA CHUNKS> <ZERO_CHUNK> where:  
 * 
 * - SPECIAL_PREFIX is 0xFFFFFFFFFFFFFFFE  
 * 
 * - DATA_CHUNK is a 4-byte prefix containing length of the chunk, followed by the actual data whose length is specified in the 4-byte prefix.  
 * 
 * - ZERO_CHUNK is a 4-byte value containing all zeros (00000000) indicating the end of data.  
 * 
 * - Any other valid 8-byte length is treated as a regular data length.  
 * 
 *  Calling [bcp_columns](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-columns.md) when using **bcp_bind** results in an error.
 * @param {Pointer<Void>} param0 
 * @param {Pointer<Integer>} param1 
 * @param {Integer} param2 
 * @param {Integer} param3 
 * @param {Pointer<Integer>} param4 
 * @param {Integer} param5 
 * @param {Integer} param6 
 * @param {Integer} param7 
 * @returns {Integer} SUCCEED or FAIL.
 * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-bind
 */
export bcp_bind(param0, param1, param2, param3, param4, param5, param6, param7) {
    param0Marshal := param0 is VarRef ? "ptr" : "ptr"
    param1Marshal := param1 is VarRef ? "char*" : "ptr"
    param4Marshal := param4 is VarRef ? "char*" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_bind", param0Marshal, param0, param1Marshal, param1, "int", param2, "int", param3, param4Marshal, param4, "int", param5, "int", param6, "int", param7, Int16)
    return result
}

/**
 * bcp_colfmt
 * @remarks
 * The **bcp_colfmt** function allows you to specify the user-file format for bulk copies. For bulk copy, a format contains the following parts:  
 *   
 * -   A mapping from user-file columns to database columns.  
 *   
 * -   The data type of each user-file column.  
 *   
 * -   The length of the optional indicator for each column.  
 *   
 * -   The maximum length of data per user-file column.  
 *   
 * -   The optional terminating byte sequence for each column.  
 *   
 * -   The length of the optional terminating byte sequence.  
 *   
 *  Each call to **bcp_colfmt** specifies the format for one user-file column. For example, to change the default settings for three columns in a five-column user data file, first call [bcp_columns](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-columns.md)**(5)**, and then call **bcp_colfmt** five times, with three of those calls setting your custom format. For the remaining two calls, set *eUserDataType* to 0, and set *cbIndicator*, *cbUserData*, and *cbUserDataTerm* to 0, SQL_VARLEN_DATA, and 0 respectively. This procedure copies all five columns, three with your customized format and two with the default format.  
 *   
 *  For *cbIndicator*, a value of 8 to indicate a large value type is now valid. If the prefix is specified for a field whose corresponding column is a new max type, it can only be set to 8. For details, see [bcp_bind](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-bind.md).  
 *   
 *  The **bcp_columns** function must be called before any calls to **bcp_colfmt**.  
 *   
 *  You must call **bcp_colfmt** once for each column in the user file.  
 *   
 *  Calling **bcp_colfmt** more than once for any user-file column causes an error.  
 *   
 *  You do not need to copy all data in a user file to the [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] table. To skip a column, specify the format of the data for the column, setting the *idxServerCol* parameter to 0. If you want to skip a column, you must specify its type.  
 *   
 *  The [bcp_writefmt](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-writefmt.md) function can be used to persist the format specification.
 * @param {Pointer<Void>} param0 
 * @param {Integer} param1 
 * @param {Integer} param2 
 * @param {Integer} param3 
 * @param {Integer} param4 
 * @param {Pointer<Integer>} param5 
 * @param {Integer} param6 
 * @param {Integer} param7 
 * @returns {Integer} SUCCEED or FAIL.
 * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-colfmt
 */
export bcp_colfmt(param0, param1, param2, param3, param4, param5, param6, param7) {
    param0Marshal := param0 is VarRef ? "ptr" : "ptr"
    param5Marshal := param5 is VarRef ? "char*" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_colfmt", param0Marshal, param0, "int", param1, "char", param2, "int", param3, "int", param4, param5Marshal, param5, "int", param6, "int", param7, Int16)
    return result
}

/**
 * bcp_collen
 * @remarks
 * The **bcp_collen** function allows you to change the data length in the program variable for a particular column when copying data to [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] with [bcp_sendrow](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-sendrow.md).  
 *   
 *  Initially, the data length is determined when [bcp_bind](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-bind.md) is called. If the data length changes between calls to **bcp_sendrow** and no length prefix or terminator is being used, you can call **bcp_collen** to reset the length. The next call to **bcp_sendrow** uses the length set by the call to **bcp_collen**.  
 *   
 *  You must call **bcp_collen** once for each column in the table whose data length you want to modify.
 * @param {Pointer<Void>} param0 
 * @param {Integer} param1 
 * @param {Integer} param2 
 * @returns {Integer} SUCCEED or FAIL.
 * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-collen
 */
export bcp_collen(param0, param1, param2) {
    param0Marshal := param0 is VarRef ? "ptr" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_collen", param0Marshal, param0, "int", param1, "int", param2, Int16)
    return result
}

/**
 * bcp_colptr
 * @remarks
 * The **bcp_colptr** function allows you to change the address of source data for a particular column when copying data to SQL Server with [bcp_sendrow](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-sendrow.md).  
 *   
 *  Initially, the pointer to user data is set by a call to **bcp_bind**. If the program variable data address changes between calls to **bcp_sendrow**, you can call **bcp_colptr** to reset the pointer to the data. The next call to **bcp_sendrow** sends the data addressed by the call to **bcp_colptr**.  
 *   
 *  There must be a separate **bcp_colptr** call for every column in the table whose data address you want to modify.
 * @param {Pointer<Void>} param0 
 * @param {Pointer<Integer>} param1 
 * @param {Integer} param2 
 * @returns {Integer} SUCCEED or FAIL.
 * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-colptr
 */
export bcp_colptr(param0, param1, param2) {
    param0Marshal := param0 is VarRef ? "ptr" : "ptr"
    param1Marshal := param1 is VarRef ? "char*" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_colptr", param0Marshal, param0, param1Marshal, param1, "int", param2, Int16)
    return result
}

/**
 * bcp_columns
 * @remarks
 * This function can be called only after [bcp_init](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-init.md) has been called with a valid file name.  
 *   
 *  You should call this function only if you intend to use a user-file format that differs from the default. For more information about a description of the default user-file format, see **bcp_init**.  
 *   
 *  After calling **bcp_columns**, you must call [bcp_colfmt](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-colfmt.md) for each column in the user file to completely define a custom file format.
 * @param {Pointer<Void>} param0 
 * @param {Integer} param1 
 * @returns {Integer} SUCCEED or FAIL.
 * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-columns
 */
export bcp_columns(param0, param1) {
    param0Marshal := param0 is VarRef ? "ptr" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_columns", param0Marshal, param0, "int", param1, Int16)
    return result
}

/**
 * bcp_control
 * @remarks
 * This function sets various control parameters for bulk-copy operations, including the number of errors allowed before canceling a bulk copy, the numbers of the first and last rows to copy from a data file, and the batch size.  
 *   
 *  This function is also used to specify the SELECT statement when bulk copying out from [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] the result set of a SELECT. Set *eOption* to BCPHINTS and set *iValue* to have a pointer to an SQLTCHAR string containing the SELECT statement.  
 *   
 *  These control parameters are only meaningful when copying between a user file and an [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] table. Control parameter settings have no effect on rows copied to [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] with [bcp_sendrow](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-sendrow.md).
 * @param {Pointer<Void>} param0 
 * @param {Integer} param1 
 * @param {Pointer<Void>} param2 
 * @returns {Integer} SUCCEED or FAIL.
 * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-control
 */
export bcp_control(param0, param1, param2) {
    param0Marshal := param0 is VarRef ? "ptr" : "ptr"
    param2Marshal := param2 is VarRef ? "ptr" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_control", param0Marshal, param0, "int", param1, param2Marshal, param2, Int16)
    return result
}

/**
 * bcp_done
 * @remarks
 * Call **bcp_done** after the last call to [bcp_sendrow](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-sendrow.md) or [bcp_moretext](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-moretext.md). Failure to call **bcp_done** after copying all data results in errors.
 * @param {Pointer<Void>} param0 
 * @returns {Integer} The number of rows permanently saved after the last call to [bcp_batch](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-batch.md) or -1 in case of error.
 * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-done
 */
export bcp_done(param0) {
    param0Marshal := param0 is VarRef ? "ptr" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_done", param0Marshal, param0, Int32)
    return result
}

/**
 * bcp_exec
 * @remarks
 * This function copies data from a user file to a database table or vice versa, depending on the value of the *eDirection* parameter in [bcp_init](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-init.md).  
 *   
 *  Before calling **bcp_exec**, call **bcp_init** with a valid user file name. Failure to do so results in an error.  
 *   
 *  **bcp_exec** is the only bulk copy function that is likely to be outstanding for any length of time. It is therefore the only bulk copy function that supports asynchronous mode. To set asynchronous mode, use [SQLSetConnectAttr](../../relational-databases/native-client-odbc-api/sqlsetconnectattr.md) to set SQL_ATTR_ASYNC_ENABLE to SQL_ASYNC_ENABLE_ON before calling **bcp_exec**. To test for completion, call **bcp_exec** with the same parameters. If the bulk copy has not yet completed, **bcp_exec** returns SUCCEED_ASYNC. It also returns in *pnRowsProcessed* a status count of the number of rows that have been sent to the server. Rows sent to the server are not committed until the end of a batch has been reached.  
 *   
 *  For information about a breaking change in bulk-copying beginning in [!INCLUDE[ssVersion2005](../../includes/ssversion2005-md.md)], see [Performing Bulk Copy Operations &#40;ODBC&#41;](../../relational-databases/native-client-odbc-bulk-copy-operations/performing-bulk-copy-operations-odbc.md).
 * @param {Pointer<Void>} param0 
 * @param {Pointer<Integer>} param1 
 * @returns {Integer} SUCCEED, SUCCEED_ASYNC, or FAIL. The **bcp_exec** function returns SUCCEED if all rows are copied. **bcp_exec** returns SUCCEED_ASYNC if an asynchronous bulk copy operation is still outstanding. **bcp_exec** returns FAIL if a complete failure occurs, or if the number of rows generating errors reaches the value specified for BCPMAXERRS using [bcp_control](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-control.md). BCPMAXERRS defaults to 10. The BCPMAXERRS option affects only the syntax errors detected by the provider while reading the rows from the data file (and not the rows sent to the server). Server aborts the batch when it detects an error with a row. Check the *pnRowsProcessed* parameter for the number of rows successfully copied.
 * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-exec
 */
export bcp_exec(param0, param1) {
    param0Marshal := param0 is VarRef ? "ptr" : "ptr"
    param1Marshal := param1 is VarRef ? "int*" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_exec", param0Marshal, param0, param1Marshal, param1, Int16)
    return result
}

/**
 * bcp_getcolfmt
 * @remarks
 * Column format property values are listed in the [bcp_setcolfmt](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-setcolfmt.md) topic. The column format property values are set by calling the **bcp_setcolfmt** function, and the **bcp_getcolfmt** function is used to find the column format property value.  
 *   
 *  Behavior changes may be observed when connecting to a [!INCLUDE[ssSQL11](../../includes/sssql11-md.md)] (or later) server computer, compared to earlier [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] versions. For more information, see [Metadata Discovery](../../relational-databases/native-client/features/metadata-discovery.md).
 * @param {Pointer<Void>} param0 
 * @param {Integer} param1 
 * @param {Integer} param2 
 * @param {Pointer<Void>} param3 
 * @param {Integer} param4 
 * @param {Pointer<Integer>} param5 
 * @returns {Integer} SUCCEED or FAIL.
 * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-getcolfmt
 */
export bcp_getcolfmt(param0, param1, param2, param3, param4, param5) {
    param0Marshal := param0 is VarRef ? "ptr" : "ptr"
    param3Marshal := param3 is VarRef ? "ptr" : "ptr"
    param5Marshal := param5 is VarRef ? "int*" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_getcolfmt", param0Marshal, param0, "int", param1, "int", param2, param3Marshal, param3, "int", param4, param5Marshal, param5, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} param0 
 * @param {PSTR} param1 
 * @param {PSTR} param2 
 * @param {PSTR} param3 
 * @param {Integer} param4 
 * @returns {Integer} 
 */
export bcp_initA(param0, param1, param2, param3, param4) {
    param1 := param1 is String ? StrPtr(param1) : param1
    param2 := param2 is String ? StrPtr(param2) : param2
    param3 := param3 is String ? StrPtr(param3) : param3

    param0Marshal := param0 is VarRef ? "ptr" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_initA", param0Marshal, param0, "ptr", param1, "ptr", param2, "ptr", param3, "int", param4, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} param0 
 * @param {PWSTR} param1 
 * @param {PWSTR} param2 
 * @param {PWSTR} param3 
 * @param {Integer} param4 
 * @returns {Integer} 
 */
export bcp_initW(param0, param1, param2, param3, param4) {
    param1 := param1 is String ? StrPtr(param1) : param1
    param2 := param2 is String ? StrPtr(param2) : param2
    param3 := param3 is String ? StrPtr(param3) : param3

    param0Marshal := param0 is VarRef ? "ptr" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_initW", param0Marshal, param0, "ptr", param1, "ptr", param2, "ptr", param3, "int", param4, Int16)
    return result
}

/**
 * bcp_moretext
 * @remarks
 * This function can be used in conjunction with [bcp_bind](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-bind.md) and [bcp_sendrow](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-sendrow.md) to copy long, variable-length data values to SQL Server in a number of smaller chunks. **bcp_moretext** can be used with columns that have the following SQL Server data types: **text**, **ntext**, **image**, **varchar(max)**, **nvarchar(max)**, **varbinary(max)**, user-defined type (UDT), and XML. **bcp_moretext** does not support data conversions, the data supplied must match the data type of the target column.  
 *   
 *  If **bcp_bind** is called with a non-NULL *pData* parameter for data types that are supported by **bcp_moretext**, **bcp_sendrow** sends the entire data value, regardless of length. If, however, **bcp_bind** has a NULL *pData* parameter for supported data types, **bcp_moretext** can be used to copy data immediately after a successful return from **bcp_sendrow** indicating that any bound columns with data present have been processed.  
 *   
 *  If you use **bcp_moretext** to send one supported data type column in a row, you must also use it to send all other supported data type columns in the row. No columns may be skipped. Supported data types are SQLTEXT, SQLNTEXT, SQLIMAGE, SQLUDT and SQLXML. SQLCHARACTER, SQLVARCHAR, SQNCHAR, SQLBINARY and SQLVARBINARY also fall into this category if the column is a varchar(max), nvarchar(max) or varbinary(max), respectively.  
 *   
 *  Calling either **bcp_bind** or [bcp_collen](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-collen.md) sets the total length of all data parts to be copied to the SQL Server column. An attempt to send SQL Server more bytes than specified in the call to **bcp_bind** or **bcp_collen** generates an error. This error would arise, for example, in an application which used **bcp_collen** to set the length of available data for an SQL Server **text** column to 4500, then called **bcp_moretext** five times while indicating on each call that the data buffer length was 1000 bytes long.  
 *   
 *  If a copied row contains more than one long, variable-length column, **bcp_moretext** first sends its data to the lowest ordinally numbered column, followed by the next lowest ordinally numbered column, and so on. Correct setting of the total length of expected data is important. There is no way to signal, outside of the length setting, that all data for a column has been received by bulk copy.  
 *   
 *  When **var(max)** values are sent to the server using bcp_sendrow and bcp_moretext, it is not necessary to call bcp_collen to set the column length. Instead, for these types only, the value is terminated by calling bcp_sendrow with a length of zero.  
 *   
 *  An application normally calls **bcp_sendrow** and **bcp_moretext** within loops to send a number of rows of data. Here's an outline of how to do this for a table containing two **text** columns:  
 *   
 * ```  
 * while (there are still rows to send)  
 * {  
 * bcp_sendrow(...);  
 *   
 * for (all the data in the first varbinary(max) column)  
 * bcp_moretext(...);  
 * bcp_moretext(hdbc, 0, NULL);  
 *   
 * for (all the data in the second varbinary(max) column)  
 * bcp_moretext(...);  
 * bcp_moretext(hdbc, 0, NULL);  
 *   
 * }  
 *   
 * ```
 * @param {Pointer<Void>} param0 
 * @param {Integer} param1 
 * @param {Pointer<Integer>} param2 
 * @returns {Integer} SUCCEED or FAIL.
 * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-moretext
 */
export bcp_moretext(param0, param1, param2) {
    param0Marshal := param0 is VarRef ? "ptr" : "ptr"
    param2Marshal := param2 is VarRef ? "char*" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_moretext", param0Marshal, param0, "int", param1, param2Marshal, param2, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} param0 
 * @param {PSTR} param1 
 * @returns {Integer} 
 */
export bcp_readfmtA(param0, param1) {
    param1 := param1 is String ? StrPtr(param1) : param1

    param0Marshal := param0 is VarRef ? "ptr" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_readfmtA", param0Marshal, param0, "ptr", param1, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} param0 
 * @param {PWSTR} param1 
 * @returns {Integer} 
 */
export bcp_readfmtW(param0, param1) {
    param1 := param1 is String ? StrPtr(param1) : param1

    param0Marshal := param0 is VarRef ? "ptr" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_readfmtW", param0Marshal, param0, "ptr", param1, Int16)
    return result
}

/**
 * bcp_sendrow
 * @remarks
 * The **bcp_sendrow** function builds a row from program variables and sends it to [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)].  
 *   
 *  Before calling **bcp_sendrow**, you must make calls to [bcp_bind](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-bind.md) to specify the program variables containing row data.  
 *   
 *  If **bcp_bind** is called specifying a long, variable-length data type, for example, an *eDataType* parameter of SQLTEXT and a non-NULL *pData* parameter, **bcp_sendrow** sends the entire data value, just as it does for any other data type. If, however, **bcp_bind** has a NULL *pData* parameter, **bcp_sendrow** returns control to the application immediately after all columns with data specified are sent to [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)]. The application can then call [bcp_moretext](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-moretext.md) repeatedly to send the long, variable-length data to [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)], a chunk at a time. For more information, see [bcp_moretext](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-moretext.md).  
 *   
 *  When **bcp_sendrow** is used to bulk copy rows from program variables into [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] tables, rows are committed only when the user calls [bcp_batch](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-batch.md) or [bcp_done](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-done.md). The user can choose to call **bcp_batch** once every *n* rows or when there is a lull between periods of incoming data. If **bcp_batch** is never called, the rows are committed when **bcp_done** is called.  
 *   
 *  For information about a breaking change in bulk-copying beginning in [!INCLUDE[ssVersion2005](../../includes/ssversion2005-md.md)], see [Performing Bulk Copy Operations &#40;ODBC&#41;](../../relational-databases/native-client-odbc-bulk-copy-operations/performing-bulk-copy-operations-odbc.md).
 * @param {Pointer<Void>} param0 
 * @returns {Integer} SUCCEED or FAIL.
 * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-sendrow
 */
export bcp_sendrow(param0) {
    param0Marshal := param0 is VarRef ? "ptr" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_sendrow", param0Marshal, param0, Int16)
    return result
}

/**
 * bcp_setcolfmt
 * @remarks
 * This function supersedes the **bcp_colfmt** function. All the functionality of **bcp_colfmt** is provided in **bcp_setcolfmt** function. In addition, support for column collation is also provided. It is recommended that the following column format attributes be set in the order given below:  
 *   
 *  BCP_FMT_SERVER_COL  
 *   
 *  BCP_FMT_DATA_LEN  
 *   
 *  BCP_FMT_TYPE  
 *   
 *  The **bcp_setcolfmt** function allows you to specify the user-file format for bulk copies. For bulk copy, a format contains the following parts:  
 *   
 * -   A mapping from user-file columns to database columns.  
 *   
 * -   The data type of each user-file column.  
 *   
 * -   The length of the optional indicator for each column.  
 *   
 * -   The maximum length of data per user-file column.  
 *   
 * -   The optional terminating byte sequence for each column.  
 *   
 * -   The length of the optional terminating byte sequence.  
 *   
 *  Each call to **bcp_setcolfmt** specifies the format for one user-file column. For example, to change the default settings for three columns in a five-column user data file, first call [bcp_columns](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-columns.md)**(5)**, and then call **bcp_setcolfmt** five times, with three of those calls setting your custom format. For the remaining two calls, set BCP_FMT_TYPE to 0, and set BCP_FMT_INDICATOR_LENGTH, BCP_FMT_DATA_LEN, and *cbValue* to 0, SQL_VARLEN_DATA, and 0 respectively. This procedure copies all five columns, three with your customized format and two with the default format.  
 *   
 *  The **bcp_columns** function must be called before calling **bcp_setcolfmt**.  
 *   
 *  You must call **bcp_setcolfmt** once for each property of each column in the user file.  
 *   
 *  You do not need to copy all data in a user file to the SQL Server table. To skip a column, specify the format of the data for the column, setting the BCP_FMT_SERVER_COL parameter to 0. If you want to skip a column, you must specify its type.  
 *   
 *  The [bcp_writefmt](../../relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-writefmt.md) function can be used to persist the format specification.
 * @param {Pointer<Void>} param0 
 * @param {Integer} param1 
 * @param {Integer} param2 
 * @param {Pointer<Void>} param3 
 * @param {Integer} param4 
 * @returns {Integer} SUCCEED or FAIL.
 * @see https://learn.microsoft.com/sql/relational-databases/native-client-odbc-extensions-bulk-copy-functions/bcp-setcolfmt
 */
export bcp_setcolfmt(param0, param1, param2, param3, param4) {
    param0Marshal := param0 is VarRef ? "ptr" : "ptr"
    param3Marshal := param3 is VarRef ? "ptr" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_setcolfmt", param0Marshal, param0, "int", param1, "int", param2, param3Marshal, param3, "int", param4, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} param0 
 * @param {PSTR} param1 
 * @returns {Integer} 
 */
export bcp_writefmtA(param0, param1) {
    param1 := param1 is String ? StrPtr(param1) : param1

    param0Marshal := param0 is VarRef ? "ptr" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_writefmtA", param0Marshal, param0, "ptr", param1, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} param0 
 * @param {PWSTR} param1 
 * @returns {Integer} 
 */
export bcp_writefmtW(param0, param1) {
    param1 := param1 is String ? StrPtr(param1) : param1

    param0Marshal := param0 is VarRef ? "ptr" : "ptr"

    result := DllCall("odbcbcp.dll\bcp_writefmtW", param0Marshal, param0, "ptr", param1, Int16)
    return result
}

/**
 * 
 * @param {Integer} param0 
 * @returns {PSTR} 
 */
export dbprtypeA(param0) {
    result := DllCall("odbcbcp.dll\dbprtypeA", "int", param0, PSTR)
    return result
}

/**
 * 
 * @param {Integer} param0 
 * @returns {PWSTR} 
 */
export dbprtypeW(param0) {
    result := DllCall("odbcbcp.dll\dbprtypeW", "int", param0, PWSTR)
    return result
}

/**
 * 
 * @param {Pointer<Void>} param0 
 * @returns {Integer} 
 */
export SQLLinkedServers(param0) {
    param0Marshal := param0 is VarRef ? "ptr" : "ptr"

    result := DllCall("odbcbcp.dll\SQLLinkedServers", param0Marshal, param0, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} param0 
 * @param {PSTR} param1 
 * @param {Integer} param2 
 * @returns {Integer} 
 */
export SQLLinkedCatalogsA(param0, param1, param2) {
    param1 := param1 is String ? StrPtr(param1) : param1

    param0Marshal := param0 is VarRef ? "ptr" : "ptr"

    result := DllCall("odbcbcp.dll\SQLLinkedCatalogsA", param0Marshal, param0, "ptr", param1, "short", param2, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} param0 
 * @param {PWSTR} param1 
 * @param {Integer} param2 
 * @returns {Integer} 
 */
export SQLLinkedCatalogsW(param0, param1, param2) {
    param1 := param1 is String ? StrPtr(param1) : param1

    param0Marshal := param0 is VarRef ? "ptr" : "ptr"

    result := DllCall("odbcbcp.dll\SQLLinkedCatalogsW", param0Marshal, param0, "ptr", param1, "short", param2, Int16)
    return result
}

/**
 * 
 * @param {PWSTR} pwchServerName 
 * @param {PWSTR} pwchInstanceName 
 * @returns {HANDLE} 
 */
export SQLInitEnumServers(pwchServerName, pwchInstanceName) {
    pwchServerName := pwchServerName is String ? StrPtr(pwchServerName) : pwchServerName
    pwchInstanceName := pwchInstanceName is String ? StrPtr(pwchInstanceName) : pwchInstanceName

    result := DllCall("odbcbcp.dll\SQLInitEnumServers", "ptr", pwchServerName, "ptr", pwchInstanceName, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {HANDLE} hEnumHandle 
 * @param {Pointer<Integer>} prgEnumData 
 * @param {Pointer<Integer>} piEnumLength 
 * @returns {Integer} 
 */
export SQLGetNextEnumeration(hEnumHandle, prgEnumData, piEnumLength) {
    prgEnumDataMarshal := prgEnumData is VarRef ? "char*" : "ptr"
    piEnumLengthMarshal := piEnumLength is VarRef ? "int*" : "ptr"

    result := DllCall("odbcbcp.dll\SQLGetNextEnumeration", HANDLE, hEnumHandle, prgEnumDataMarshal, prgEnumData, piEnumLengthMarshal, piEnumLength, Int16)
    return result
}

/**
 * 
 * @param {HANDLE} hEnumHandle 
 * @returns {Integer} 
 */
export SQLCloseEnumServers(hEnumHandle) {
    result := DllCall("odbcbcp.dll\SQLCloseEnumServers", HANDLE, hEnumHandle, Int16)
    return result
}

/**
 * The SQLDriverConnect function is part of the ODBC API standard and this reference documentation provides information on its syntax.
 * @remarks
 * A connection string has the following syntax:  
 *   
 *  *connection-string* ::= *empty-string*[;] &#124; *attribute*[;] &#124; *attribute*; *connection-string*  
 *   
 *  *empty-string* ::=*attribute* ::= *attribute-keyword*=*attribute-value* &#124; DRIVER=[{]*attribute-value*[}]  
 *   
 *  *attribute-keyword* ::= DSN &#124; UID &#124; PWD &#124; *driver-defined-attribute-keyword*  
 *   
 *  *attribute-value* ::= *character-string*  
 *   
 *  *driver-defined-attribute-keyword* ::= *identifier*  
 *   
 *  where *character-string* has zero or more characters; *identifier* has one or more characters; *attribute-keyword* is not case-sensitive; *attribute-value* may be case-sensitive; and the value of the **DSN** keyword does not consist solely of blanks.  
 *   
 *  Because of connection string and initialization file grammar, keywords and attribute values that contain the characters **[]{}(),;?\*=!@** not enclosed with braces should be avoided. The value of the **DSN** keyword cannot consist only of blanks and should not contain leading blanks. Because of the grammar of the system information, keywords and data source names cannot contain the backslash (\\) character.  
 *   
 *  Applications do not have to add braces around the attribute value after the **DRIVER** keyword unless the attribute contains a semicolon (;), in which case the braces are required. If the attribute value that the driver receives includes braces, the driver should not remove them but they should be part of the returned connection string.  
 *   
 *  A DSN or connection string value enclosed with braces ({}) containing any of the characters **[]{}(),;?\*=!@** is passed intact to the driver. However, when using these characters in a keyword, the Driver Manager returns an error when working with file DSNs but passes the connection string to the driver for regular connection strings. Avoid using embedded braces in a keyword value.  
 *   
 *  The connection string may include any number of driver-defined keywords. Because the **DRIVER** keyword does not use information from the system information, the driver must define enough keywords so that a driver can connect to a data source using only the information in the connection string. (For more information, see "Driver Guidelines," later in this section.) The driver defines which keywords are required to connect to the data source.  
 *   
 *  The following table describes the attribute values of the **DSN**, **FILEDSN**, **DRIVER**, **UID**, **PWD**, and **SAVEFILE** keywords.  
 *   
 * |Keyword|Attribute value description|  
 * |-------------|---------------------------------|  
 * |**DSN**|Name of a data source as returned by **SQLDataSources** or the data sources dialog box of **SQLDriverConnect**.|  
 * |**FILEDSN**|Name of a .dsn file from which a connection string will be built for the data source. These data sources are called file data sources.|  
 * |**DRIVER**|Description of the driver as returned by the **SQLDrivers** function. For example, Rdb or SQL Server.|  
 * |**UID**|A user ID.|  
 * |**PWD**|The password corresponding to the user ID, or an empty string if there is no password for the user ID (PWD=;).|  
 * |**SAVEFILE**|The file name of a .dsn file in which the attribute values of keywords used in making the present, successful connection should be saved.|  
 *   
 *  For information about how an application chooses a data source or driver, see [Choosing a Data Source or Driver](../../../odbc/reference/develop-app/choosing-a-data-source-or-driver.md).  
 *   
 *  If any keywords are repeated in the connection string, the driver uses the value associated with the first occurrence of the keyword. If the **DSN** and **DRIVER** keywords are included in the same connection string, the Driver Manager and the driver use whichever keyword appears first.  
 *   
 *  The **FILEDSN** and **DSN** keywords are mutually exclusive: whichever keyword appears first is used, and the one that appears second is ignored. The **FILEDSN** and **DRIVER** keywords, on the other hand, are not mutually exclusive. If any keyword appears in a connection string with **FILEDSN**, then the attribute value of the keyword in the connection string is used rather than the attribute value of the same keyword in the .dsn file.  
 *   
 *  If the **FILEDSN** keyword is used, the keywords specified in a .dsn file are used to create a connection string. (For more information, see "File Data Sources," later in this section.) The **UID** keyword is optional; a .dsn file may be created with only the **DRIVER** keyword. The **PWD** keyword is not stored in a .dsn file. The default directory for saving and loading a .dsn file will be a combination of the path specified by **CommonFileDir** in HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ Windows\CurrentVersion and "ODBC\DataSources". (If CommonFileDir were "C:\Program Files\Common Files", the default directory would be "C:\Program Files\Common Files\ODBC\Data Sources".)  
 *   
 * > [!NOTE]  
 * >  A .dsn file can be manipulated directly by calling the [SQLReadFileDSN](../../../odbc/reference/syntax/sqlreadfiledsn-function.md) and [SQLWriteFileDSN](../../../odbc/reference/syntax/sqlwritefiledsn-function.md) functions in the installer DLL.  
 *   
 *  If the **SAVEFILE** keyword is used, the attribute values of keywords used in making the present, successful connection will be saved as a .dsn file with the name of the attribute value of the **SAVEFILE** keyword. The **SAVEFILE** keyword must be used in conjunction with the **DRIVER** keyword, the **FILEDSN** keyword, or both, or the function returns SQL_SUCCESS_WITH_INFO with SQLSTATE 01S09 (Invalid keyword). The **SAVEFILE** keyword must appear before the **DRIVER** keyword in the connection string, or the results will be undefined.
 * @param {Pointer<Void>} hdbc 
 * @param {Pointer} _hwnd 
 * @param {Pointer<Integer>} szConnStrIn 
 * @param {Integer} cchConnStrIn 
 * @param {Pointer<Integer>} szConnStrOut 
 * @param {Integer} cchConnStrOutMax 
 * @param {Pointer<Integer>} pcchConnStrOut 
 * @param {Integer} fDriverCompletion 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_ERROR, SQL_INVALID_HANDLE, or SQL_STILL_EXECUTING.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldriverconnect-function
 */
export SQLDriverConnect(hdbc, _hwnd, szConnStrIn, cchConnStrIn, szConnStrOut, cchConnStrOutMax, pcchConnStrOut, fDriverCompletion) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    szConnStrInMarshal := szConnStrIn is VarRef ? "char*" : "ptr"
    szConnStrOutMarshal := szConnStrOut is VarRef ? "char*" : "ptr"
    pcchConnStrOutMarshal := pcchConnStrOut is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLDriverConnect", hdbcMarshal, hdbc, "ptr", _hwnd, szConnStrInMarshal, szConnStrIn, "short", cchConnStrIn, szConnStrOutMarshal, szConnStrOut, "short", cchConnStrOutMax, pcchConnStrOutMarshal, pcchConnStrOut, "ushort", fDriverCompletion, Int16)
    return result
}

/**
 * SQLBrowseConnect Function
 * @param {Pointer<Void>} hdbc 
 * @param {Pointer<Integer>} szConnStrIn 
 * @param {Integer} cchConnStrIn 
 * @param {Pointer<Integer>} szConnStrOut 
 * @param {Integer} cchConnStrOutMax 
 * @param {Pointer<Integer>} pcchConnStrOut 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NEED_DATA, SQL_ERROR, SQL_INVALID_HANDLE, or SQL_STILL_EXECUTING.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlbrowseconnect-function
 */
export SQLBrowseConnect(hdbc, szConnStrIn, cchConnStrIn, szConnStrOut, cchConnStrOutMax, pcchConnStrOut) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    szConnStrInMarshal := szConnStrIn is VarRef ? "char*" : "ptr"
    szConnStrOutMarshal := szConnStrOut is VarRef ? "char*" : "ptr"
    pcchConnStrOutMarshal := pcchConnStrOut is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLBrowseConnect", hdbcMarshal, hdbc, szConnStrInMarshal, szConnStrIn, "short", cchConnStrIn, szConnStrOutMarshal, szConnStrOut, "short", cchConnStrOutMax, pcchConnStrOutMarshal, pcchConnStrOut, Int16)
    return result
}

/**
 * SQLBulkOperations Function
 * @remarks
 * > [!CAUTION]  
 * >  For information about what statement states **SQLBulkOperations** can be called in and what it must do for compatibility with ODBC 2.*x* applications, see the [Block Cursors, Scrollable Cursors, and Backward Compatibility](../../../odbc/reference/appendixes/block-cursors-scrollable-cursors-and-backward-compatibility.md) section in Appendix G: Driver Guidelines for Backward Compatibility.  
 *   
 *  An application uses **SQLBulkOperations** to perform the following operations on the base table or view that corresponds to the current query:  
 *   
 * -   Add new rows.  
 *   
 * -   Update a set of rows where each row is identified by a bookmark.  
 *   
 * -   Delete a set of rows where each row is identified by a bookmark.  
 *   
 * -   Fetch a set of rows where each row is identified by a bookmark.  
 *   
 *  After a call to **SQLBulkOperations**, the block cursor position is undefined. The application has to call **SQLFetchScroll** to set the cursor position. An application should call **SQLFetchScroll** only with a *FetchOrientation* argument of SQL_FETCH_FIRST, SQL_FETCH_LAST, SQL_FETCH_ABSOLUTE, or SQL_FETCH_BOOKMARK. The cursor position is undefined if the application calls **SQLFetch** or **SQLFetchScroll** with a *FetchOrientation* argument of SQL_FETCH_PRIOR, SQL_FETCH_NEXT, or SQL_FETCH_RELATIVE.  
 *   
 *  A column can be ignored in bulk operations performed by a call to **SQLBulkOperations** by setting the column length/indicator buffer specified in the call to **SQLBindCol**, to SQL_COLUMN_IGNORE.  
 *   
 *  It is not necessary for the application to set the SQL_ATTR_ROW_OPERATION_PTR statement attribute when it calls **SQLBulkOperations** because rows cannot be ignored when performing bulk operations with this function.  
 *   
 *  The buffer pointed to by the SQL_ATTR_ROWS_FETCHED_PTR statement attribute contains the number of rows affected by a call to **SQLBulkOperations**.  
 *   
 *  When the *Operation* argument is SQL_ADD or SQL_UPDATE_BY_BOOKMARK and the select-list of the query specification associated with the cursor contains more than one reference to the same column, it is driver-defined whether an error is generated or the driver ignores the duplicated references and performs the requested operations.  
 *   
 *  For more information about how to use **SQLBulkOperations**, see [Updating Data with SQLBulkOperations](../../../odbc/reference/develop-app/updating-data-with-sqlbulkoperations.md).
 * @param {Pointer<Void>} StatementHandle [Input] Statement handle.
 * @param {Integer} Operation [Input] Operation to perform:  
 *   
 *  SQL_ADD SQL_UPDATE_BY_BOOKMARK SQL_DELETE_BY_BOOKMARK SQL_FETCH_BY_BOOKMARK  
 *   
 *  For more information, see "Comments."
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NEED_DATA, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlbulkoperations-function
 */
export SQLBulkOperations(StatementHandle, Operation) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLBulkOperations", StatementHandleMarshal, StatementHandle, "short", Operation, Int16)
    return result
}

/**
 * SQLColumnPrivileges Function
 * @remarks
 * **SQLColumnPrivileges** returns the results as a standard result set, ordered by TABLE_CAT, TABLE_SCHEM, TABLE_NAME, COLUMN_NAME, and PRIVILEGE.  
 *   
 * > [!NOTE]  
 * >  **SQLColumnPrivileges** might not return privileges for all columns. For example, a driver might not return information about privileges for pseudo-columns, such as Oracle ROWID. Applications can use any valid column, regardless of whether it is returned by **SQLColumnPrivileges**.  
 *   
 *  The lengths of VARCHAR columns are not shown in the table; the actual lengths depend on the data source. To determine the actual lengths of the CATALOG_NAME, SCHEMA_NAME, TABLE_NAME, and COLUMN_NAME columns, an application can call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, SQL_MAX_TABLE_NAME_LEN, and SQL_MAX_COLUMN_NAME_LEN options.  
 *   
 * > [!NOTE]  
 * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
 *   
 *  The following columns have been renamed for ODBC 3.*x*. The column name changes do not affect backward compatibility because applications bind by column number.  
 *   
 * |ODBC 2.0 column|ODBC 3.*x* column|  
 * |---------------------|-----------------------|  
 * |TABLE_QUALIFIER|TABLE_CAT|  
 * |TABLE_OWNER|TABLE_SCHEM|  
 *   
 *  The following table lists the columns in the result set. Additional columns beyond column 8 (IS_GRANTABLE) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set rather than specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
 *   
 * |Column name|Column number|Data type|Comments|  
 * |-----------------|-------------------|---------------|--------------|  
 * |TABLE_CAT  (ODBC 1.0)|1|Varchar|Catalog identifier; NULL if not applicable to the data source. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have catalogs.|  
 * |TABLE_SCHEM (ODBC 1.0)|2|Varchar|Schema identifier; NULL if not applicable to the data source. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have schemas.|  
 * |TABLE_NAME (ODBC 1.0)|3|Varchar not NULL|Table identifier.|  
 * |COLUMN_NAME (ODBC 1.0)|4|Varchar not NULL|Column name. The driver returns an empty string for a column that does not have a name.|  
 * |GRANTOR (ODBC 1.0)|5|Varchar|Name of the user who granted the privilege; NULL if not applicable to the data source.<br /><br /> For all rows in which the value in the GRANTEE column is the owner of the object, the GRANTOR column will be "_SYSTEM".|  
 * |GRANTEE (ODBC 1.0)|6|Varchar not NULL|Name of the user to whom the privilege was granted.|  
 * |PRIVILEGE (ODBC 1.0)|7|Varchar not NULL|Identifies the column privilege. May be one of the following (or others supported by the data source when implementation-defined):<br /><br /> SELECT: The grantee is permitted to retrieve data for the column.<br /><br /> INSERT: The grantee is permitted to provide data for the column in new rows that are inserted into the associated table.<br /><br /> UPDATE: The grantee is permitted to update data in the column.<br /><br /> REFERENCES: The grantee is permitted to refer to the column within a constraint (for example, a unique, referential, or table check constraint).|  
 * |IS_GRANTABLE (ODBC 1.0)|8|Varchar|Indicates whether the grantee is permitted to grant the privilege to other users; "YES", "NO", or "NULL" if unknown or not applicable to the data source.<br /><br /> A privilege is either grantable or not grantable, but not both. The result set returned by **SQLColumnPrivileges** will never contain two rows for which all columns except the IS_GRANTABLE column contain the same value.|
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cchCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cchSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cchTableName 
 * @param {Pointer<Integer>} szColumnName 
 * @param {Integer} cchColumnName 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlcolumnprivileges-function
 */
export SQLColumnPrivileges(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, szColumnName, cchColumnName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"
    szColumnNameMarshal := szColumnName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLColumnPrivileges", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, szColumnNameMarshal, szColumnName, "short", cchColumnName, Int16)
    return result
}

/**
 * SQLForeignKeys Function
 * @remarks
 * For information about how the information returned by this function might be used, see [Uses of Catalog Data](../../../odbc/reference/develop-app/uses-of-catalog-data.md).  
 *   
 *  If \**PKTableName* contains a table name, **SQLForeignKeys** returns a result set that contains the primary key of the specified table and all the foreign keys that refer to it. The list of foreign keys in other tables does not include foreign keys that point to unique constraints in the specified table.  
 *   
 *  If \**FKTableName* contains a table name, **SQLForeignKeys** returns a result set that contains all the foreign keys in the specified table that point to primary keys in other tables, and the primary keys in the other tables to which they refer. The list of foreign keys in the specified table does not contain foreign keys that refer to unique constraints in other tables.  
 *   
 *  If both \**PKTableName* and \**FKTableName* contain table names, **SQLForeignKeys** returns the foreign keys in the table specified in \**FKTableName* that refer to the primary key of the table specified in **PKTableName*. This should be one key at most.  
 *   
 * > [!NOTE]  
 * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
 *   
 *  **SQLForeignKeys** returns results as a standard result set. If the foreign keys associated with a primary key are requested, the result set is ordered by FKTABLE_CAT, FKTABLE_SCHEM, FKTABLE_NAME, and KEY_SEQ. If the primary keys associated with a foreign key are requested, the result set is ordered by PKTABLE_CAT, PKTABLE_SCHEM, PKTABLE_NAME, and KEY_SEQ. The following table lists the columns in the result set.  
 *   
 *  The lengths of VARCHAR columns are not shown in the table; the actual lengths depend on the data source. To determine the actual lengths of the PKTABLE_CAT or FKTABLE_CAT, PKTABLE_SCHEM or FKTABLE_SCHEM, PKTABLE_NAME or FKTABLE_NAME, and PKCOLUMN_NAME or FKCOLUMN_NAME columns, an application can call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, SQL_MAX_TABLE_NAME_LEN, and SQL_MAX_COLUMN_NAME_LEN options.  
 *   
 *  The following columns have been renamed for ODBC 3*.x.* The column name changes do not affect backward compatibility because applications bind by column number.  
 *   
 * |ODBC 2.0 column|ODBC 3*.x* column|  
 * |---------------------|-----------------------|  
 * |PKTABLE_QUALIFIER|PKTABLE_CAT|  
 * |PKTABLE_OWNER|PKTABLE_SCHEM|  
 * |FKTABLE_QUALIFIER|FK_TABLE_CAT|  
 * |FKTABLE_OWNER|FKTABLE_SCHEM|  
 *   
 *  The following table lists the columns in the result set. Additional columns beyond column 14 (REMARKS) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set instead of specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
 *   
 * |Column name|Column number|Data type|Comments|  
 * |-----------------|-------------------|---------------|--------------|  
 * |PKTABLE_CAT (ODBC 1.0)|1|Varchar|Primary key table catalog name; NULL if not applicable to the data source. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have catalogs.|  
 * |PKTABLE_SCHEM (ODBC 1.0)|2|Varchar|Primary key table schema name; NULL if not applicable to the data source. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have schemas.|  
 * |PKTABLE_NAME (ODBC 1.0)|3|Varchar not NULL|Primary key table name.|  
 * |PKCOLUMN_NAME (ODBC 1.0)|4|Varchar not NULL|Primary key column name. The driver returns an empty string for a column that does not have a name.|  
 * |FKTABLE_CAT (ODBC 1.0)|5|Varchar|Foreign key table catalog name; NULL if not applicable to the data source. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have catalogs.|  
 * |FKTABLE_SCHEM (ODBC 1.0)|6|Varchar|Foreign key table schema name; NULL if not applicable to the data source. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have schemas.|  
 * |FKTABLE_NAME (ODBC 1.0)|7|Varchar not NULL|Foreign key table name.|  
 * |FKCOLUMN_NAME (ODBC 1.0)|8|Varchar not NULL|Foreign key column name. The driver returns an empty string for a column that does not have a name.|  
 * |KEY_SEQ (ODBC 1.0)|9|Smallint not NULL|Column sequence number in key (starting with 1).|  
 * |UPDATE_RULE (ODBC 1.0)|10|Smallint|Action to be applied to the foreign key when the SQL operation is **UPDATE**. Can have one of the following values. (The referenced table is the table that has the primary key; the referencing table is the table that has the foreign key.)<br /><br /> SQL_CASCADE: When the primary key of the referenced table is updated, the foreign key of the referencing table is also updated.<br /><br /> SQL_NO_ACTION: If an update of the primary key of the referenced table would cause a "dangling reference" in the referencing table (that is, rows in the referencing table would have no counterparts in the referenced table), the update is rejected. If an update of the foreign key of the referencing table would introduce a value that does not exist as a value of the primary key of the referenced table, the update is rejected. (This action is the same as the SQL_RESTRICT action in ODBC 2*.x*.)<br /><br /> SQL_SET_NULL: When one or more rows in the referenced table are updated in such a way that one or more components of the primary key are changed, the components of the foreign key in the referencing table that correspond to the changed components of the primary key are set to NULL in all matching rows of the referencing table.<br /><br /> SQL_SET_DEFAULT: When one or more rows in the referenced table are updated in such a way that one or more components of the primary key are changed, the components of the foreign key in the referencing table that correspond to the changed components of the primary key are set to the applicable default values in all matching rows of the referencing table.<br /><br /> NULL if not applicable to the data source.|  
 * |DELETE_RULE (ODBC 1.0)|11|Smallint|Action to be applied to the foreign key when the SQL operation is **DELETE**. Can have one of the following values. (The referenced table is the table that has the primary key; the referencing table is the table that has the foreign key.)<br /><br /> SQL_CASCADE: When a row in the referenced table is deleted, all the matching rows in the referencing tables are also deleted.<br /><br /> SQL_NO_ACTION: If a delete of a row in the referenced table would cause a "dangling reference" in the referencing table (that is, rows in the referencing table would have no counterparts in the referenced table), the update is rejected. (This action is the same as the SQL_RESTRICT action in ODBC 2*.x*.)<br /><br /> SQL_SET_NULL: When one or more rows in the referenced table are deleted, each component of the foreign key of the referencing table is set to NULL in all matching rows of the referencing table.<br /><br /> SQL_SET_DEFAULT: When one or more rows in the referenced table are deleted, each component of the foreign key of the referencing table is set to the applicable default in all matching rows of the referencing table.<br /><br /> NULL if not applicable to the data source.|  
 * |FK_NAME (ODBC 2.0)|12|Varchar|Foreign key name. NULL if not applicable to the data source.|  
 * |PK_NAME (ODBC 2.0)|13|Varchar|Primary key name. NULL if not applicable to the data source.|  
 * |DEFERRABILITY (ODBC 3.0)|14|Smallint|SQL_INITIALLY_DEFERRED, SQL_INITIALLY_IMMEDIATE, SQL_NOT_DEFERRABLE.|
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szPkCatalogName 
 * @param {Integer} cchPkCatalogName 
 * @param {Pointer<Integer>} szPkSchemaName 
 * @param {Integer} cchPkSchemaName 
 * @param {Pointer<Integer>} szPkTableName 
 * @param {Integer} cchPkTableName 
 * @param {Pointer<Integer>} szFkCatalogName 
 * @param {Integer} cchFkCatalogName 
 * @param {Pointer<Integer>} szFkSchemaName 
 * @param {Integer} cchFkSchemaName 
 * @param {Pointer<Integer>} szFkTableName 
 * @param {Integer} cchFkTableName 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlforeignkeys-function
 */
export SQLForeignKeys(hstmt, szPkCatalogName, cchPkCatalogName, szPkSchemaName, cchPkSchemaName, szPkTableName, cchPkTableName, szFkCatalogName, cchFkCatalogName, szFkSchemaName, cchFkSchemaName, szFkTableName, cchFkTableName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szPkCatalogNameMarshal := szPkCatalogName is VarRef ? "char*" : "ptr"
    szPkSchemaNameMarshal := szPkSchemaName is VarRef ? "char*" : "ptr"
    szPkTableNameMarshal := szPkTableName is VarRef ? "char*" : "ptr"
    szFkCatalogNameMarshal := szFkCatalogName is VarRef ? "char*" : "ptr"
    szFkSchemaNameMarshal := szFkSchemaName is VarRef ? "char*" : "ptr"
    szFkTableNameMarshal := szFkTableName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLForeignKeys", hstmtMarshal, hstmt, szPkCatalogNameMarshal, szPkCatalogName, "short", cchPkCatalogName, szPkSchemaNameMarshal, szPkSchemaName, "short", cchPkSchemaName, szPkTableNameMarshal, szPkTableName, "short", cchPkTableName, szFkCatalogNameMarshal, szFkCatalogName, "short", cchFkCatalogName, szFkSchemaNameMarshal, szFkSchemaName, "short", cchFkSchemaName, szFkTableNameMarshal, szFkTableName, "short", cchFkTableName, Int16)
    return result
}

/**
 * SQLMoreResults Function
 * @remarks
 * **SELECT** statements return result sets. **UPDATE**, **INSERT**, and **DELETE** statements return a count of affected rows. If any of these statements are batched, submitted with arrays of parameters (numbered in increasing parameter order, in the order that they appear in the batch), or in procedures, they can return multiple result sets or row counts. For information about batches of statements and arrays of parameters, see [Batches of SQL Statements](../../../odbc/reference/develop-app/batches-of-sql-statements.md) and [Arrays of Parameter Values](../../../odbc/reference/develop-app/arrays-of-parameter-values.md).  
 *   
 *  After executing the batch, the application is positioned on the first result set. The application can call **SQLBindCol**, **SQLBulkOperations**, **SQLFetch**, **SQLGetData**, **SQLFetchScroll**, **SQLSetPos**, and all the metadata functions, on the first or any subsequent result sets, just as it would if there were just a single result set. Once it is done with the first result set, the application calls **SQLMoreResults** to move to the next result set. If another result set or count is available, **SQLMoreResults** returns SQL_SUCCESS and initializes the result set or count for additional processing. If any row count-generating statements appear in between result set-generating statements, they can be stepped over by calling **SQLMoreResults**.After calling **SQLMoreResults** for **UPDATE**, **INSERT**, or **DELETE** statements, an application can call **SQLRowCount**.  
 *   
 *  If there was a current result set with unfetched rows, **SQLMoreResults** discards that result set and makes the next result set or count available. If all results have been processed, **SQLMoreResults** returns SQL_NO_DATA. For some drivers, output parameters and return values are not available until all result sets and row counts have been processed. For such drivers, output parameters and return values become available when **SQLMoreResults** returns SQL_NO_DATA.  
 *   
 *  Any bindings that were established for the previous result set still remain valid. If the column structures are different for this result set, then calling **SQLFetch** or **SQLFetchScroll** may result in an error or truncation. To prevent this, the application has to call **SQLBindCol** to explicitly rebind as appropriate (or do so by setting descriptor fields). Alternatively, the application can call **SQLFreeStmt** with an *Option* of SQL_UNBIND to unbind all the column buffers.  
 *   
 *  The values of statement attributes, such as cursor type, cursor concurrency, keyset size, or maximum length, may change as the application navigates through the batch by calls to **SQLMoreResults**. If this happens, **SQLMoreResults** will return SQL_SUCCESS_WITH_INFO and SQLSTATE 01S02 (Option value has changed).  
 *   
 *  Calling **SQLCloseCursor**, or **SQLFreeStmt** with an *Option* of SQL_CLOSE, discards all the result sets and row counts that were available as a result of the execution of the batch. The statement handle returns to either the allocated or prepared state. Calling **SQLCancel** to cancel an asynchronously executing function when a batch has been executed and the statement handle is in the executed, cursor-positioned, or asynchronous state results in all the results sets and row counts generated by the batch being discarded if the cancel call was successful. The statement then returns to the prepared or allocated state.  
 *   
 *  If a batch of statements or a procedure mixes other SQL statements with **SELECT**, **UPDATE**, **INSERT**, and **DELETE** statements, these other statements do not affect **SQLMoreResults**.  
 *   
 *  For more information, see [Multiple Results](../../../odbc/reference/develop-app/multiple-results.md).  
 *   
 *  If a searched update, insert, or delete statement in a batch of statements does not affect any rows at the data source, **SQLMoreResults** returns SQL_SUCCESS. This is different from the case of a searched update, insert, or delete statement that is executed through **SQLExecDirect**, **SQLExecute**, or **SQLParamData**, which returns SQL_NO_DATA if it does not affect any rows at the data source. If an application calls **SQLRowCount** to retrieve the row count after a call to **SQLMoreResults** has not affected any rows, **SQLRowCount** will return SQL_NO_DATA.  
 *   
 *  For additional information about the valid sequencing of result-processing functions, see [Appendix B: ODBC State Transition Tables](../../../odbc/reference/appendixes/appendix-b-odbc-state-transition-tables.md).  
 *   
 *  For more information about SQL_PARAM_DATA_AVAILABLE and streamed output parameters, see [Retrieving Output Parameters Using SQLGetData](../../../odbc/reference/develop-app/retrieving-output-parameters-using-sqlgetdata.md).
 * @param {Pointer<Void>} hstmt 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_NO_DATA, SQL_ERROR, SQL_INVALID_HANDLE, OR SQL_PARAM_DATA_AVAILABLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlmoreresults-function
 */
export SQLMoreResults(hstmt) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLMoreResults", hstmtMarshal, hstmt, Int16)
    return result
}

/**
 * SQLNativeSql Function
 * @remarks
 * The following are examples of what **SQLNativeSql** might return for the following input SQL string containing the scalar function CONVERT. Assume that the column empid is of type INTEGER in the data source:  
 *   
 * ```sql  
 * SELECT { fn CONVERT (empid, SQL_SMALLINT) } FROM employee  
 * ```  
 *   
 *  A driver for Microsoft SQL Server might return the following translated SQL string:  
 *   
 * ```sql  
 * SELECT convert (smallint, empid) FROM employee  
 * ```  
 *   
 *  A driver for ORACLE Server might return the following translated SQL string:  
 *   
 * ```sql  
 * SELECT to_number (empid) FROM employee  
 * ```  
 *   
 *  A driver for Ingres might return the following translated SQL string:  
 *   
 * ```sql  
 * SELECT int2 (empid) FROM employee  
 * ```  
 *   
 *  For more information, see [Direct Execution](../../../odbc/reference/develop-app/direct-execution-odbc.md) and [Prepared Execution](../../../odbc/reference/develop-app/prepared-execution-odbc.md).
 * @param {Pointer<Void>} hdbc 
 * @param {Pointer<Integer>} szSqlStrIn 
 * @param {Integer} cchSqlStrIn 
 * @param {Pointer<Integer>} szSqlStr 
 * @param {Integer} cchSqlStrMax 
 * @param {Pointer<Integer>} pcbSqlStr 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlnativesql-function
 */
export SQLNativeSql(hdbc, szSqlStrIn, cchSqlStrIn, szSqlStr, cchSqlStrMax, pcbSqlStr) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    szSqlStrInMarshal := szSqlStrIn is VarRef ? "char*" : "ptr"
    szSqlStrMarshal := szSqlStr is VarRef ? "char*" : "ptr"
    pcbSqlStrMarshal := pcbSqlStr is VarRef ? "int*" : "ptr"

    result := DllCall("ODBC32.dll\SQLNativeSql", hdbcMarshal, hdbc, szSqlStrInMarshal, szSqlStrIn, "int", cchSqlStrIn, szSqlStrMarshal, szSqlStr, "int", cchSqlStrMax, pcbSqlStrMarshal, pcbSqlStr, Int16)
    return result
}

/**
 * SQLNumParams Function
 * @remarks
 * **SQLNumParams** can be called only after **SQLPrepare** has been called.  
 *   
 *  If the statement associated with *StatementHandle* does not contain parameters, **SQLNumParams** sets **ParameterCountPtr* to 0.  
 *   
 *  The number of parameters returned by **SQLNumParams** is the same value as the SQL_DESC_COUNT field of the IPD.  
 *   
 *  For more information, see [Describing Parameters](../../../odbc/reference/develop-app/describing-parameters.md).
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} pcpar 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlnumparams-function
 */
export SQLNumParams(hstmt, pcpar) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    pcparMarshal := pcpar is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLNumParams", hstmtMarshal, hstmt, pcparMarshal, pcpar, Int16)
    return result
}

/**
 * SQLPrimaryKeys Function
 * @remarks
 * **SQLPrimaryKeys** returns the results as a standard result set, ordered by TABLE_CAT, TABLE_SCHEM, TABLE_NAME, and KEY_SEQ. For information about how this information might be used, see [Uses of Catalog Data](../../../odbc/reference/develop-app/uses-of-catalog-data.md).  
 *   
 *  The following columns have been renamed for ODBC 3.*x*. The column name changes do not affect backward compatibility because applications bind by column number.  
 *   
 * |ODBC 2.0 column|ODBC 3.*x* column|  
 * |---------------------|-----------------------|  
 * |TABLE_QUALIFIER|TABLE_CAT|  
 * |TABLE_OWNER|TABLE_SCHEM|  
 *   
 *  To determine the actual lengths of the TABLE_CAT, TABLE_SCHEM, TABLE_NAME, and COLUMN_NAME columns, call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, SQL_MAX_TABLE_NAME_LEN, and SQL_MAX_COLUMN_NAME_LEN options.  
 *   
 * > [!NOTE]  
 * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
 *   
 *  The following table lists the columns in the result set. Additional columns beyond column 6 (PK_NAME) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set rather than specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
 *   
 * |Column name|Column number|Data type|Comments|  
 * |-----------------|-------------------|---------------|--------------|  
 * |TABLE_CAT (ODBC 1.0)|1|Varchar|Primary key table catalog name; NULL if not applicable to the data source. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have catalogs.|  
 * |TABLE_SCHEM (ODBC 1.0)|2|Varchar|Primary key table schema name; NULL if not applicable to the data source. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have schemas.|  
 * |TABLE_NAME (ODBC 1.0)|3|Varchar not NULL|Primary key table name.|  
 * |COLUMN_NAME (ODBC 1.0)|4|Varchar not NULL|Primary key column name. The driver returns an empty string for a column that does not have a name.|  
 * |KEY_SEQ (ODBC 1.0)|5|Smallint not NULL|Column sequence number in key (starting with 1).|  
 * |PK_NAME (ODBC 2.0)|6|Varchar|Primary key name. NULL if not applicable to the data source.|
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cchCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cchSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cchTableName 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlprimarykeys-function
 */
export SQLPrimaryKeys(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLPrimaryKeys", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, Int16)
    return result
}

/**
 * SQLProcedureColumns Function
 * @remarks
 * This function is typically used before statement execution to retrieve information about procedure parameters and the columns that make up the result set or sets returned by the procedure, if any. For more information, see [Procedures](../../../odbc/reference/develop-app/procedures-odbc.md).  
 *   
 * > [!NOTE]  
 * >  **SQLProcedureColumns** might not return all columns used by a procedure. For example, a driver might return only information about the parameters used by a procedure and not the columns in a result set it generates.  
 *   
 *  The *SchemaName*, *ProcName*, and *ColumnName* arguments accept search patterns. For more information about valid search patterns, see [Pattern Value Arguments](../../../odbc/reference/develop-app/pattern-value-arguments.md).  
 *   
 * > [!NOTE]  
 * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
 *   
 *  **SQLProcedureColumns** returns the results as a standard result set, ordered by PROCEDURE_CAT, PROCEDURE_SCHEM, PROCEDURE_NAME, and COLUMN_TYPE. Column names are returned for each procedure in the following order: the name of the return value, the names of each parameter in the procedure invocation (in call order), and then the names of each column in the result set returned by the procedure (in column order).  
 *   
 *  Applications should bind driver-specific columns relative to the end of the result set. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
 *   
 *  To determine the actual lengths of the PROCEDURE_CAT, PROCEDURE_SCHEM, PROCEDURE_NAME, and COLUMN_NAME columns, an application can call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, SQL_MAX_PROCEDURE_NAME_LEN, and SQL_MAX_COLUMN_NAME_LEN options.  
 *   
 *  The following columns have been renamed for ODBC 3.*x*. The column name changes do not affect backward compatibility because applications bind by column number.  
 *   
 * |ODBC 2.0 column|ODBC 3.*x* column|  
 * |---------------------|-----------------------|  
 * |PROCEDURE_QUALIFIER|PROCEDURE_CAT|  
 * |PROCEDURE _OWNER|PROCEDURE_SCHEM|  
 * |PRECISION|COLUMN_SIZE|  
 * |LENGTH|BUFFER_LENGTH|  
 * |SCALE|DECIMAL_DIGITS|  
 * |RADIX|NUM_PREC_RADIX|  
 *   
 *  The following columns have been added to the results set returned by **SQLProcedureColumns** for ODBC 3.*x*:  
 *   
 * -   COLUMN_DEF  
 *   
 * -   DATETIME_CODE  
 *   
 * -   CHAR_OCTET_LENGTH  
 *   
 * -   ORDINAL_POSITION  
 *   
 * -   IS_NULLABLE  
 *   
 *  The following table lists the columns in the result set. Additional columns beyond column 19 (IS_NULLABLE) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set rather than specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
 *   
 * |Column name|Column number|Data type|Comments|  
 * |-----------------|-------------------|---------------|--------------|  
 * |PROCEDURE_CAT (ODBC 2.0)|1|Varchar|Procedure catalog name; NULL if not applicable to the data source. If a driver supports catalogs for some procedures but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those procedures that do not have catalogs.|  
 * |PROCEDURE_SCHEM (ODBC 2.0)|2|Varchar|Procedure schema name; NULL if not applicable to the data source. If a driver supports schemas for some procedures but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those procedures that do not have schemas.|  
 * |PROCEDURE_NAME (ODBC 2.0)|3|Varchar not NULL|Procedure name. An empty string is returned for a procedure that does not have a name.|  
 * |COLUMN_NAME (ODBC 2.0)|4|Varchar not NULL|Procedure column name. The driver returns an empty string for a procedure column that does not have a name.|  
 * |COLUMN_TYPE (ODBC 2.0)|5|Smallint not NULL|Defines the procedure column as a parameter or a result set column:<br /><br /> SQL_PARAM_TYPE_UNKNOWN: The procedure column is a parameter whose type is unknown. (ODBC 1.0)<br /><br /> SQL_PARAM_INPUT: The procedure column is an input parameter. (ODBC 1.0)<br /><br /> SQL_PARAM_INPUT_OUTPUT: The procedure column is an input/output parameter. (ODBC 1.0)<br /><br /> SQL_PARAM_OUTPUT: The procedure column is an output parameter. (ODBC 2.0)<br /><br /> SQL_RETURN_VALUE: The procedure column is the return value of the procedure. (ODBC 2.0)<br /><br /> SQL_RESULT_COL: The procedure column is a result set column. (ODBC 1.0)|  
 * |DATA_TYPE (ODBC 2.0)|6|Smallint not NULL|SQL data type. This can be an ODBC SQL data type or a driver-specific SQL data type. For datetime and interval data types, this column returns the concise data types (for example, SQL_TYPE_TIME or SQL_INTERVAL_YEAR_TO_MONTH). For a list of valid ODBC SQL data types, see [SQL Data Types](../../../odbc/reference/appendixes/sql-data-types.md) in Appendix D: Data Types. For information about driver-specific SQL data types, see the driver's documentation.|  
 * |TYPE_NAME (ODBC 2.0)|7|Varchar not NULL|Data source-dependent data type name; for example, "CHAR", "VARCHAR", "MONEY", "LONG VARBINARY", or "CHAR ( ) FOR BIT DATA".|  
 * |COLUMN_SIZE (ODBC 2.0)|8|Integer|The column size of the procedure column on the data source. NULL is returned for data types where column size is not applicable. For more information concerning precision, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md) in Appendix D: Data Types.|  
 * |BUFFER_LENGTH (ODBC 2.0)|9|Integer|The length in bytes of data transferred on an **SQLGetData** or **SQLFetch** operation if SQL_C_DEFAULT is specified. For numeric data, this size may be different than the size of the data stored on the data source. For more information, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md), in Appendix D: Data Types.|  
 * |DECIMAL_DIGITS (ODBC 2.0)|10|Smallint|The decimal digits of the procedure column on the data source. NULL is returned for data types where decimal digits is not applicable. For more information concerning decimal digits, see [Column Size, Decimal Digits, Transfer Octet Length, and Display Size](../../../odbc/reference/appendixes/column-size-decimal-digits-transfer-octet-length-and-display-size.md), in Appendix D: Data Types.|  
 * |NUM_PREC_RADIX (ODBC 2.0)|11|Smallint|For numeric data types, either 10 or 2.<br /><br /> If 10, the values in COLUMN_SIZE and DECIMAL_DIGITS give the number of decimal digits allowed for the column. For example, a DECIMAL(12,5) column would return a NUM_PREC_RADIX of 10, a COLUMN_SIZE of 12, and a DECIMAL_DIGITS of 5; a FLOAT column could return a NUM_PREC_RADIX of 10, a COLUMN_SIZE of 15, and a DECIMAL_DIGITS of NULL.<br /><br /> If 2, the values in COLUMN_SIZE and DECIMAL_DIGITS give the number of bits allowed in the column. For example, a FLOAT column could return a NUM_PREC_RADIX of 2, a COLUMN_SIZE of 53, and a DECIMAL_DIGITS of NULL.<br /><br /> NULL is returned for data types where NUM_PREC_RADIX is not applicable.|  
 * |NULLABLE (ODBC 2.0)|12|Smallint not NULL|Whether the procedure column accepts a NULL value:<br /><br /> SQL_NO_NULLS: The procedure column does not accept NULL values.<br /><br /> SQL_NULLABLE: The procedure column accepts NULL values.<br /><br /> SQL_NULLABLE_UNKNOWN: It is not known if the procedure column accepts NULL values.|  
 * |REMARKS (ODBC 2.0)|13|Varchar|A description of the procedure column.|  
 * |COLUMN_DEF (ODBC 3.0)|14|Varchar|The default value of the column.<br /><br /> If NULL was specified as the default value, this column is the word NULL, not enclosed in quotation marks. If the default value cannot be represented without truncation, this column contains TRUNCATED, with no enclosing single quotation marks. If no default value was specified, this column is NULL.<br /><br /> The value of COLUMN_DEF can be used in generating a new column definition, except when it contains the value TRUNCATED.|  
 * |SQL_DATA_TYPE (ODBC 3.0)|15|Smallint not NULL|The value of the SQL data type as it appears in the SQL_DESC_TYPE field of the descriptor. This column is the same as the DATA_TYPE column, except for datetime and interval data types.<br /><br /> For datetime and interval data types, the SQL_DATA_TYPE field in the result set will return SQL_INTERVAL or SQL_DATETIME, and the SQL_DATETIME_SUB field will return the subcode for the specific interval or datetime data type. (See [Appendix D: Data Types](../../../odbc/reference/appendixes/appendix-d-data-types.md).)|  
 * |SQL_DATETIME_SUB (ODBC 3.0)|16|Smallint|The subtype code for datetime and interval data types. For other data types, this column returns a NULL.|  
 * |CHAR_OCTET_LENGTH (ODBC 3.0)|17|Integer|The maximum length in bytes of a character or binary data type column. For all other data types, this column returns a NULL.|  
 * |ORDINAL_POSITION (ODBC 3.0)|18|Integer not NULL|For input and output parameters, the ordinal position of the parameter in the procedure definition (in increasing parameter order, starting at 1). For a return value (if any), 0 is returned. For result-set columns, the ordinal position of the column in the result set, with the first column in the result set being number 1. If there are multiple result sets, column ordinal positions are returned in a driver-specific manner.|  
 * |IS_NULLABLE (ODBC 3.0)|19|Varchar|"NO" if the column does not include NULLs.<br /><br /> "YES" if the column can include NULLs.<br /><br /> This column returns a zero-length string if nullability is unknown.<br /><br /> ISO rules are followed to determine nullability. An ISO SQL-compliant DBMS cannot return an empty string.<br /><br /> The value returned for this column is different from the value returned for the NULLABLE column. (See the description of the NULLABLE column.)|
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cchCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cchSchemaName 
 * @param {Pointer<Integer>} szProcName 
 * @param {Integer} cchProcName 
 * @param {Pointer<Integer>} szColumnName 
 * @param {Integer} cchColumnName 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlprocedurecolumns-function
 */
export SQLProcedureColumns(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szProcName, cchProcName, szColumnName, cchColumnName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
    szProcNameMarshal := szProcName is VarRef ? "char*" : "ptr"
    szColumnNameMarshal := szColumnName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLProcedureColumns", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szProcNameMarshal, szProcName, "short", cchProcName, szColumnNameMarshal, szColumnName, "short", cchColumnName, Int16)
    return result
}

/**
 * SQLProcedures Function
 * @remarks
 * **SQLProcedures** lists all procedures in the requested range. A user may or may not have permission to execute any of these procedures. To check accessibility, an application can call **SQLGetInfo** and check the SQL_ACCESSIBLE_PROCEDURES information value. Otherwise, the application must be able to handle a situation where the user selects a procedure that it cannot execute. For information about how this information might be used, see [Procedures](../../../odbc/reference/develop-app/procedures-odbc.md).  
 *   
 * > [!NOTE]  
 * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
 *   
 *  **SQLProcedures** returns the results as a standard result set, ordered by PROCEDURE_CAT, PROCEDURE_SCHEMA, and PROCEDURE_NAME.  
 *   
 * > [!NOTE]  
 * >  **SQLProcedures** might not return all procedures. Applications can use any valid procedure, regardless of whether it is returned by **SQLProcedures**.  
 *   
 *  The following columns have been renamed for ODBC 3*.x*. The column name changes do not affect backward compatibility because applications bind by column number.  
 *   
 * |ODBC 2.0 column|ODBC 3*.x* column|  
 * |---------------------|-----------------------|  
 * |PROCEDURE_QUALIFIER|PROCEDURE_CAT|  
 * |PROCEDURE _OWNER|PROCEDURE _SCHEM|  
 *   
 *  To determine the actual lengths of the PROCEDURE_CAT, PROCEDURE_SCHEM, and PROCEDURE_NAME columns, an application can call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, and SQL_MAX_PROCEDURE_NAME_LEN options.  
 *   
 *  The following table lists the columns in the result set. Additional columns beyond column 8 (PROCEDURE_TYPE) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set rather than specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
 *   
 * |Column name|Column number|Data type|Comments|  
 * |-----------------|-------------------|---------------|--------------|  
 * |PROCEDURE_CAT (ODBC 2.0)|1|Varchar|Procedure catalog identifier; NULL if not applicable to the data source. If a driver supports catalogs for some procedures but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those procedures that do not have catalogs.|  
 * |PROCEDURE_SCHEM (ODBC 2.0)|2|Varchar|Procedure schema identifier; NULL if not applicable to the data source. If a driver supports schemas for some procedures but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those procedures that do not have schemas.|  
 * |PROCEDURE_NAME (ODBC 2.0)|3|Varchar not NULL|Procedure identifier.|  
 * |NUM_INPUT_PARAMS (ODBC 2.0)|4|N/A|Reserved for future use. Applications should not rely on the data returned in these result columns.|  
 * |NUM_OUTPUT_PARAMS (ODBC 2.0)|5|N/A|Reserved for future use. Applications should not rely on the data returned in these result columns.|  
 * |NUM_RESULT_SETS (ODBC 2.0)|6|N/A|Reserved for future use. Applications should not rely on the data returned in these result columns.|  
 * |REMARKS (ODBC 2.0)|7|Varchar|A description of the procedure.|  
 * |PROCEDURE_TYPE (ODBC 2.0)|8|Smallint|Defines the procedure type:<br /><br /> SQL_PT_UNKNOWN: It cannot be determined whether the procedure returns a value.<br /><br /> SQL_PT_PROCEDURE: The returned object is a procedure; that is, it does not have a return value.<br /><br /> SQL_PT_FUNCTION: The returned object is a function; that is, it has a return value.|  
 *   
 *  The *SchemaName* and *ProcName* arguments accept search patterns. For more information about valid search patterns, see [Pattern Value Arguments](../../../odbc/reference/develop-app/pattern-value-arguments.md).
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cchCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cchSchemaName 
 * @param {Pointer<Integer>} szProcName 
 * @param {Integer} cchProcName 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqlprocedures-function
 */
export SQLProcedures(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szProcName, cchProcName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
    szProcNameMarshal := szProcName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLProcedures", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szProcNameMarshal, szProcName, "short", cchProcName, Int16)
    return result
}

/**
 * SQLTablePrivileges Function
 * @remarks
 * The *SchemaName* and *TableName* arguments accept search patterns. For more information about valid search patterns, see [Pattern Value Arguments](../../../odbc/reference/develop-app/pattern-value-arguments.md).  
 *   
 *  **SQLTablePrivileges** returns the results as a standard result set, ordered by TABLE_CAT, TABLE_SCHEM, TABLE_NAME, PRIVILEGE, and GRANTEE.  
 *   
 *  To determine the actual lengths of the TABLE_CAT, TABLE_SCHEM, and TABLE_NAME columns, an application can call **SQLGetInfo** with the SQL_MAX_CATALOG_NAME_LEN, SQL_MAX_SCHEMA_NAME_LEN, and SQL_MAX_TABLE_NAME_LEN options.  
 *   
 * > [!NOTE]  
 * >  For more information about the general use, arguments, and returned data of ODBC catalog functions, see [Catalog Functions](../../../odbc/reference/develop-app/catalog-functions.md).  
 *   
 *  The following columns have been renamed for ODBC *3.x*. The column name changes do not affect backward compatibility because applications bind by column number.  
 *   
 * |ODBC 2.0 column|ODBC *3.x* column|  
 * |---------------------|-----------------------|  
 * |TABLE_QUALIFIER|TABLE_CAT|  
 * |TABLE_OWNER|TABLE_SCHEM|  
 *   
 *  The following table lists the columns in the result set. Additional columns beyond column 7 (IS_GRANTABLE) can be defined by the driver. An application should gain access to driver-specific columns by counting down from the end of the result set rather than specifying an explicit ordinal position. For more information, see [Data Returned by Catalog Functions](../../../odbc/reference/develop-app/data-returned-by-catalog-functions.md).  
 *   
 * |Column name|Column number|Data type|Comments|  
 * |-----------------|-------------------|---------------|--------------|  
 * |TABLE_CAT (ODBC 1.0)|1|Varchar|Catalog name; NULL if not applicable to the data source. If a driver supports catalogs for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have catalogs.|  
 * |TABLE_SCHEM  (ODBC 1.0)|2|Varchar|Schema name; NULL if not applicable to the data source. If a driver supports schemas for some tables but not for others, such as when the driver retrieves data from different DBMSs, it returns an empty string ("") for those tables that do not have schemas.|  
 * |TABLE_NAME (ODBC 1.0)|3|Varchar not NULL|Table name.|  
 * |GRANTOR (ODBC 1.0)|4|Varchar|Name of the user who granted the privilege; NULL if not applicable to the data source.<br /><br /> For all rows in which the value in the GRANTEE column is the owner of the object, the GRANTOR column will be "_SYSTEM".|  
 * |GRANTEE (ODBC 1.0)|5|Varchar not NULL|Name of the user to whom the privilege was granted.|  
 * |PRIVILEGE (ODBC 1.0)|6|Varchar not NULL|The table privilege. May be one of the following or a data source-specific privilege.<br /><br /> SELECT: The grantee is permitted to retrieve data for one or more columns of the table.<br /><br /> INSERT: The grantee is permitted to insert new rows containing data for one or more columns into the table.<br /><br /> UPDATE: The grantee is permitted to update the data in one or more columns of the table.<br /><br /> DELETE: The grantee is permitted to delete rows of data from the table.<br /><br /> REFERENCES: The grantee is permitted to refer to one or more columns of the table within a constraint (for example, a unique, referential, or table check constraint).<br /><br /> The scope of action permitted the grantee by a given table privilege is data source-dependent. For example, the UPDATE privilege might permit the grantee to update all columns in a table on one data source and only those columns for which the grantor has the UPDATE privilege on another data source.|  
 * |IS_GRANTABLE (ODBC 1.0)|7|Varchar|Indicates whether the grantee is permitted to grant the privilege to other users; "YES", "NO", or NULL if unknown or not applicable to the data source.<br /><br /> A privilege is either grantable or not grantable but not both. The result set returned by **SQLColumnPrivileges** will never contain two rows for which all columns except the IS_GRANTABLE column contain the same value.|
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cchCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cchSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cchTableName 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_STILL_EXECUTING, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqltableprivileges-function
 */
export SQLTablePrivileges(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLTablePrivileges", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, Int16)
    return result
}

/**
 * SQLDrivers Function
 * @remarks
 * **SQLDrivers** returns the driver description in the \**DriverDescription* buffer. It returns additional information about the driver in the \**DriverAttributes* buffer as a list of keyword-value pairs. All keywords listed in the system information for drivers will be returned for all drivers, except for **CreateDSN**, which is used to prompt creation of data sources and therefore is optional. Each pair is terminated with a null byte, and the complete list is terminated with a null byte (that is, two null bytes mark the end of the list). For example, a file-based driver using C syntax might return the following list of attributes ("\0" represents a null character):  
 *   
 * ```  
 * FileUsage=1\0FileExtns=*.dbf\0\0  
 * ```  
 *   
 *  If \**DriverAttributes* is not large enough to hold the entire list, the list is truncated, **SQLDrivers** returns SQLSTATE 01004 (Data truncated), and the length of the list (excluding the final null-termination byte) is returned in **AttributesLengthPtr*.  
 *   
 *  Driver attribute keywords are added from the system information when the driver is installed. For more information, see [Installing ODBC Components](../../../odbc/reference/install/installing-odbc-components.md).  
 *   
 *  An application can call **SQLDrivers** multiple times to retrieve all driver descriptions. The Driver Manager retrieves this information from the system information. When there are no more driver descriptions, **SQLDrivers** returns SQL_NO_DATA. If **SQLDrivers** is called with SQL_FETCH_NEXT immediately after it returns SQL_NO_DATA, it returns the first driver description. For information about how an application uses the information returned by **SQLDrivers**, see [Choosing a Data Source or Driver](../../../odbc/reference/develop-app/choosing-a-data-source-or-driver.md).  
 *   
 *  If SQL_FETCH_NEXT is passed to **SQLDrivers** the very first time it is called, **SQLDrivers** returns the first data source name.  
 *   
 *  Because **SQLDrivers** is implemented in the Driver Manager, it is supported for all drivers regardless of a particular driver's standards compliance.
 * @param {Pointer<Void>} henv 
 * @param {Integer} fDirection 
 * @param {Pointer<Integer>} szDriverDesc 
 * @param {Integer} cchDriverDescMax 
 * @param {Pointer<Integer>} pcchDriverDesc 
 * @param {Pointer<Integer>} szDriverAttributes 
 * @param {Integer} cchDrvrAttrMax 
 * @param {Pointer<Integer>} pcchDrvrAttr 
 * @returns {Integer} SQL_SUCCESS, SQL_SUCCESS_WITH_INFO, SQL_NO_DATA, SQL_ERROR, or SQL_INVALID_HANDLE.
 * @see https://learn.microsoft.com/sql/odbc/reference/syntax/sqldrivers-function
 */
export SQLDrivers(henv, fDirection, szDriverDesc, cchDriverDescMax, pcchDriverDesc, szDriverAttributes, cchDrvrAttrMax, pcchDrvrAttr) {
    henvMarshal := henv is VarRef ? "ptr" : "ptr"
    szDriverDescMarshal := szDriverDesc is VarRef ? "char*" : "ptr"
    pcchDriverDescMarshal := pcchDriverDesc is VarRef ? "short*" : "ptr"
    szDriverAttributesMarshal := szDriverAttributes is VarRef ? "char*" : "ptr"
    pcchDrvrAttrMarshal := pcchDrvrAttr is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLDrivers", henvMarshal, henv, "ushort", fDirection, szDriverDescMarshal, szDriverDesc, "short", cchDriverDescMax, pcchDriverDescMarshal, pcchDriverDesc, szDriverAttributesMarshal, szDriverAttributes, "short", cchDrvrAttrMax, pcchDrvrAttrMarshal, pcchDrvrAttr, Int16)
    return result
}

/**
 * 
 * @param {Integer} fHandleType 
 * @param {Pointer<Void>} hInput 
 * @param {Pointer<Pointer<Void>>} phOutput 
 * @returns {Integer} 
 */
export SQLAllocHandleStd(fHandleType, hInput, phOutput) {
    hInputMarshal := hInput is VarRef ? "ptr" : "ptr"
    phOutputMarshal := phOutput is VarRef ? "ptr*" : "ptr"

    result := DllCall("ODBC32.dll\SQLAllocHandleStd", "short", fHandleType, hInputMarshal, hInput, phOutputMarshal, phOutput, Int16)
    return result
}

/**
 * 
 * @param {Integer} dwValue 
 * @returns {BOOL} 
 */
export ODBCSetTryWaitValue(dwValue) {
    result := DllCall("ODBC32.dll\ODBCSetTryWaitValue", "uint", dwValue, BOOL)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export ODBCGetTryWaitValue() {
    result := DllCall("ODBC32.dll\ODBCGetTryWaitValue", UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Pointer<Integer>} szDSN 
 * @param {Integer} cchDSN 
 * @param {Pointer<Integer>} szUID 
 * @param {Integer} cchUID 
 * @param {Pointer<Integer>} szAuthStr 
 * @param {Integer} cchAuthStr 
 * @returns {Integer} 
 */
export SQLConnectW(hdbc, szDSN, cchDSN, szUID, cchUID, szAuthStr, cchAuthStr) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    szDSNMarshal := szDSN is VarRef ? "ushort*" : "ptr"
    szUIDMarshal := szUID is VarRef ? "ushort*" : "ptr"
    szAuthStrMarshal := szAuthStr is VarRef ? "ushort*" : "ptr"

    result := DllCall("ODBC32.dll\SQLConnectW", hdbcMarshal, hdbc, szDSNMarshal, szDSN, "short", cchDSN, szUIDMarshal, szUID, "short", cchUID, szAuthStrMarshal, szAuthStr, "short", cchAuthStr, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} henv 
 * @param {Pointer<Void>} hdbc 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} wszSqlState 
 * @param {Pointer<Integer>} pfNativeError 
 * @param {Pointer<Integer>} wszErrorMsg 
 * @param {Integer} cchErrorMsgMax 
 * @param {Pointer<Integer>} pcchErrorMsg 
 * @returns {Integer} 
 */
export SQLErrorW(henv, hdbc, hstmt, wszSqlState, pfNativeError, wszErrorMsg, cchErrorMsgMax, pcchErrorMsg) {
    henvMarshal := henv is VarRef ? "ptr" : "ptr"
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    wszSqlStateMarshal := wszSqlState is VarRef ? "ushort*" : "ptr"
    pfNativeErrorMarshal := pfNativeError is VarRef ? "int*" : "ptr"
    wszErrorMsgMarshal := wszErrorMsg is VarRef ? "ushort*" : "ptr"
    pcchErrorMsgMarshal := pcchErrorMsg is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLErrorW", henvMarshal, henv, hdbcMarshal, hdbc, hstmtMarshal, hstmt, wszSqlStateMarshal, wszSqlState, pfNativeErrorMarshal, pfNativeError, wszErrorMsgMarshal, wszErrorMsg, "short", cchErrorMsgMax, pcchErrorMsgMarshal, pcchErrorMsg, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szSqlStr 
 * @param {Integer} TextLength 
 * @returns {Integer} 
 */
export SQLExecDirectW(hstmt, szSqlStr, TextLength) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szSqlStrMarshal := szSqlStr is VarRef ? "ushort*" : "ptr"

    result := DllCall("ODBC32.dll\SQLExecDirectW", hstmtMarshal, hstmt, szSqlStrMarshal, szSqlStr, "int", TextLength, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Integer} fAttribute 
 * @param {Pointer<Void>} rgbValue 
 * @param {Integer} cbValueMax 
 * @param {Pointer<Integer>} pcbValue 
 * @returns {Integer} 
 */
export SQLGetConnectAttrW(hdbc, fAttribute, rgbValue, cbValueMax, pcbValue) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    rgbValueMarshal := rgbValue is VarRef ? "ptr" : "ptr"
    pcbValueMarshal := pcbValue is VarRef ? "int*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetConnectAttrW", hdbcMarshal, hdbc, "int", fAttribute, rgbValueMarshal, rgbValue, "int", cbValueMax, pcbValueMarshal, pcbValue, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCursor 
 * @param {Integer} cchCursorMax 
 * @param {Pointer<Integer>} pcchCursor 
 * @returns {Integer} 
 */
export SQLGetCursorNameW(hstmt, szCursor, cchCursorMax, pcchCursor) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCursorMarshal := szCursor is VarRef ? "ushort*" : "ptr"
    pcchCursorMarshal := pcchCursor is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetCursorNameW", hstmtMarshal, hstmt, szCursorMarshal, szCursor, "short", cchCursorMax, pcchCursorMarshal, pcchCursor, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} DescriptorHandle 
 * @param {Integer} RecNumber 
 * @param {Integer} FieldIdentifier 
 * @param {Pointer<Void>} Value 
 * @param {Integer} BufferLength 
 * @returns {Integer} 
 */
export SQLSetDescFieldW(DescriptorHandle, RecNumber, FieldIdentifier, Value, BufferLength) {
    DescriptorHandleMarshal := DescriptorHandle is VarRef ? "ptr" : "ptr"
    ValueMarshal := Value is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetDescFieldW", DescriptorHandleMarshal, DescriptorHandle, "short", RecNumber, "short", FieldIdentifier, ValueMarshal, Value, "int", BufferLength, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdesc 
 * @param {Integer} iRecord 
 * @param {Integer} iField 
 * @param {Pointer<Void>} rgbValue 
 * @param {Integer} cbBufferLength 
 * @param {Pointer<Integer>} StringLength 
 * @returns {Integer} 
 */
export SQLGetDescFieldW(hdesc, iRecord, iField, rgbValue, cbBufferLength, StringLength) {
    hdescMarshal := hdesc is VarRef ? "ptr" : "ptr"
    rgbValueMarshal := rgbValue is VarRef ? "ptr" : "ptr"
    StringLengthMarshal := StringLength is VarRef ? "int*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetDescFieldW", hdescMarshal, hdesc, "short", iRecord, "short", iField, rgbValueMarshal, rgbValue, "int", cbBufferLength, StringLengthMarshal, StringLength, Int16)
    return result
}

/**
 * 
 * @param {Integer} fHandleType 
 * @param {Pointer<Void>} _handle 
 * @param {Integer} iRecord 
 * @param {Integer} fDiagField 
 * @param {Pointer<Void>} rgbDiagInfo 
 * @param {Integer} cbBufferLength 
 * @param {Pointer<Integer>} pcbStringLength 
 * @returns {Integer} 
 */
export SQLGetDiagFieldW(fHandleType, _handle, iRecord, fDiagField, rgbDiagInfo, cbBufferLength, pcbStringLength) {
    _handleMarshal := _handle is VarRef ? "ptr" : "ptr"
    rgbDiagInfoMarshal := rgbDiagInfo is VarRef ? "ptr" : "ptr"
    pcbStringLengthMarshal := pcbStringLength is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetDiagFieldW", "short", fHandleType, _handleMarshal, _handle, "short", iRecord, "short", fDiagField, rgbDiagInfoMarshal, rgbDiagInfo, "short", cbBufferLength, pcbStringLengthMarshal, pcbStringLength, Int16)
    return result
}

/**
 * 
 * @param {Integer} fHandleType 
 * @param {Pointer<Void>} _handle 
 * @param {Integer} iRecord 
 * @param {Pointer<Integer>} szSqlState 
 * @param {Pointer<Integer>} pfNativeError 
 * @param {Pointer<Integer>} szErrorMsg 
 * @param {Integer} cchErrorMsgMax 
 * @param {Pointer<Integer>} pcchErrorMsg 
 * @returns {Integer} 
 */
export SQLGetDiagRecW(fHandleType, _handle, iRecord, szSqlState, pfNativeError, szErrorMsg, cchErrorMsgMax, pcchErrorMsg) {
    _handleMarshal := _handle is VarRef ? "ptr" : "ptr"
    szSqlStateMarshal := szSqlState is VarRef ? "ushort*" : "ptr"
    pfNativeErrorMarshal := pfNativeError is VarRef ? "int*" : "ptr"
    szErrorMsgMarshal := szErrorMsg is VarRef ? "ushort*" : "ptr"
    pcchErrorMsgMarshal := pcchErrorMsg is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetDiagRecW", "short", fHandleType, _handleMarshal, _handle, "short", iRecord, szSqlStateMarshal, szSqlState, pfNativeErrorMarshal, pfNativeError, szErrorMsgMarshal, szErrorMsg, "short", cchErrorMsgMax, pcchErrorMsgMarshal, pcchErrorMsg, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szSqlStr 
 * @param {Integer} cchSqlStr 
 * @returns {Integer} 
 */
export SQLPrepareW(hstmt, szSqlStr, cchSqlStr) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szSqlStrMarshal := szSqlStr is VarRef ? "ushort*" : "ptr"

    result := DllCall("ODBC32.dll\SQLPrepareW", hstmtMarshal, hstmt, szSqlStrMarshal, szSqlStr, "int", cchSqlStr, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Integer} fAttribute 
 * @param {Integer} rgbValue 
 * @param {Integer} cbValue 
 * @returns {Integer} 
 */
export SQLSetConnectAttrW(hdbc, fAttribute, rgbValue, cbValue) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetConnectAttrW", hdbcMarshal, hdbc, "int", fAttribute, "ptr", rgbValue, "int", cbValue, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCursor 
 * @param {Integer} cchCursor 
 * @returns {Integer} 
 */
export SQLSetCursorNameW(hstmt, szCursor, cchCursor) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCursorMarshal := szCursor is VarRef ? "ushort*" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetCursorNameW", hstmtMarshal, hstmt, szCursorMarshal, szCursor, "short", cchCursor, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cchCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cchSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cchTableName 
 * @param {Pointer<Integer>} szColumnName 
 * @param {Integer} cchColumnName 
 * @returns {Integer} 
 */
export SQLColumnsW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, szColumnName, cchColumnName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"
    szColumnNameMarshal := szColumnName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ODBC32.dll\SQLColumnsW", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, szColumnNameMarshal, szColumnName, "short", cchColumnName, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Integer} fOption 
 * @param {Pointer<Void>} pvParam 
 * @returns {Integer} 
 */
export SQLGetConnectOptionW(hdbc, fOption, pvParam) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetConnectOptionW", hdbcMarshal, hdbc, "ushort", fOption, pvParamMarshal, pvParam, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Integer} fInfoType 
 * @param {Integer} rgbInfoValue 
 * @param {Integer} cbInfoValueMax 
 * @param {Pointer<Integer>} pcbInfoValue 
 * @returns {Integer} 
 */
export SQLGetInfoW(hdbc, fInfoType, rgbInfoValue, cbInfoValueMax, pcbInfoValue) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    pcbInfoValueMarshal := pcbInfoValue is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetInfoW", hdbcMarshal, hdbc, "ushort", fInfoType, "ptr", rgbInfoValue, "short", cbInfoValueMax, pcbInfoValueMarshal, pcbInfoValue, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} StatementHandle 
 * @param {Integer} DataType 
 * @returns {Integer} 
 */
export SQLGetTypeInfoW(StatementHandle, DataType) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetTypeInfoW", StatementHandleMarshal, StatementHandle, "short", DataType, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} fColType 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cchCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cchSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cchTableName 
 * @param {Integer} fScope 
 * @param {Integer} fNullable 
 * @returns {Integer} 
 */
export SQLSpecialColumnsW(hstmt, fColType, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, fScope, fNullable) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ODBC32.dll\SQLSpecialColumnsW", hstmtMarshal, hstmt, "ushort", fColType, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, "ushort", fScope, "ushort", fNullable, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cchCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cchSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cchTableName 
 * @param {Integer} fUnique 
 * @param {Integer} fAccuracy 
 * @returns {Integer} 
 */
export SQLStatisticsW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, fUnique, fAccuracy) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ODBC32.dll\SQLStatisticsW", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, "ushort", fUnique, "ushort", fAccuracy, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cchCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cchSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cchTableName 
 * @param {Pointer<Integer>} szTableType 
 * @param {Integer} cchTableType 
 * @returns {Integer} 
 */
export SQLTablesW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, szTableType, cchTableType) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"
    szTableTypeMarshal := szTableType is VarRef ? "ushort*" : "ptr"

    result := DllCall("ODBC32.dll\SQLTablesW", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, szTableTypeMarshal, szTableType, "short", cchTableType, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} henv 
 * @param {Integer} fDirection 
 * @param {Pointer<Integer>} szDSN 
 * @param {Integer} cchDSNMax 
 * @param {Pointer<Integer>} pcchDSN 
 * @param {Pointer<Integer>} wszDescription 
 * @param {Integer} cchDescriptionMax 
 * @param {Pointer<Integer>} pcchDescription 
 * @returns {Integer} 
 */
export SQLDataSourcesW(henv, fDirection, szDSN, cchDSNMax, pcchDSN, wszDescription, cchDescriptionMax, pcchDescription) {
    henvMarshal := henv is VarRef ? "ptr" : "ptr"
    szDSNMarshal := szDSN is VarRef ? "ushort*" : "ptr"
    pcchDSNMarshal := pcchDSN is VarRef ? "short*" : "ptr"
    wszDescriptionMarshal := wszDescription is VarRef ? "ushort*" : "ptr"
    pcchDescriptionMarshal := pcchDescription is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLDataSourcesW", henvMarshal, henv, "ushort", fDirection, szDSNMarshal, szDSN, "short", cchDSNMax, pcchDSNMarshal, pcchDSN, wszDescriptionMarshal, wszDescription, "short", cchDescriptionMax, pcchDescriptionMarshal, pcchDescription, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Pointer} _hwnd 
 * @param {Pointer<Integer>} szConnStrIn 
 * @param {Integer} cchConnStrIn 
 * @param {Pointer<Integer>} szConnStrOut 
 * @param {Integer} cchConnStrOutMax 
 * @param {Pointer<Integer>} pcchConnStrOut 
 * @param {Integer} fDriverCompletion 
 * @returns {Integer} 
 */
export SQLDriverConnectW(hdbc, _hwnd, szConnStrIn, cchConnStrIn, szConnStrOut, cchConnStrOutMax, pcchConnStrOut, fDriverCompletion) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    szConnStrInMarshal := szConnStrIn is VarRef ? "ushort*" : "ptr"
    szConnStrOutMarshal := szConnStrOut is VarRef ? "ushort*" : "ptr"
    pcchConnStrOutMarshal := pcchConnStrOut is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLDriverConnectW", hdbcMarshal, hdbc, "ptr", _hwnd, szConnStrInMarshal, szConnStrIn, "short", cchConnStrIn, szConnStrOutMarshal, szConnStrOut, "short", cchConnStrOutMax, pcchConnStrOutMarshal, pcchConnStrOut, "ushort", fDriverCompletion, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Pointer<Integer>} szConnStrIn 
 * @param {Integer} cchConnStrIn 
 * @param {Pointer<Integer>} szConnStrOut 
 * @param {Integer} cchConnStrOutMax 
 * @param {Pointer<Integer>} pcchConnStrOut 
 * @returns {Integer} 
 */
export SQLBrowseConnectW(hdbc, szConnStrIn, cchConnStrIn, szConnStrOut, cchConnStrOutMax, pcchConnStrOut) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    szConnStrInMarshal := szConnStrIn is VarRef ? "ushort*" : "ptr"
    szConnStrOutMarshal := szConnStrOut is VarRef ? "ushort*" : "ptr"
    pcchConnStrOutMarshal := pcchConnStrOut is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLBrowseConnectW", hdbcMarshal, hdbc, szConnStrInMarshal, szConnStrIn, "short", cchConnStrIn, szConnStrOutMarshal, szConnStrOut, "short", cchConnStrOutMax, pcchConnStrOutMarshal, pcchConnStrOut, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cchCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cchSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cchTableName 
 * @param {Pointer<Integer>} szColumnName 
 * @param {Integer} cchColumnName 
 * @returns {Integer} 
 */
export SQLColumnPrivilegesW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName, szColumnName, cchColumnName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"
    szColumnNameMarshal := szColumnName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ODBC32.dll\SQLColumnPrivilegesW", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, szColumnNameMarshal, szColumnName, "short", cchColumnName, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} fAttribute 
 * @param {Pointer<Void>} rgbValue 
 * @param {Integer} cbValueMax 
 * @param {Pointer<Integer>} pcbValue 
 * @returns {Integer} 
 */
export SQLGetStmtAttrW(hstmt, fAttribute, rgbValue, cbValueMax, pcbValue) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    rgbValueMarshal := rgbValue is VarRef ? "ptr" : "ptr"
    pcbValueMarshal := pcbValue is VarRef ? "int*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetStmtAttrW", hstmtMarshal, hstmt, "int", fAttribute, rgbValueMarshal, rgbValue, "int", cbValueMax, pcbValueMarshal, pcbValue, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} fAttribute 
 * @param {Pointer<Void>} rgbValue 
 * @param {Integer} cbValueMax 
 * @returns {Integer} 
 */
export SQLSetStmtAttrW(hstmt, fAttribute, rgbValue, cbValueMax) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    rgbValueMarshal := rgbValue is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetStmtAttrW", hstmtMarshal, hstmt, "int", fAttribute, rgbValueMarshal, rgbValue, "int", cbValueMax, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szPkCatalogName 
 * @param {Integer} cchPkCatalogName 
 * @param {Pointer<Integer>} szPkSchemaName 
 * @param {Integer} cchPkSchemaName 
 * @param {Pointer<Integer>} szPkTableName 
 * @param {Integer} cchPkTableName 
 * @param {Pointer<Integer>} szFkCatalogName 
 * @param {Integer} cchFkCatalogName 
 * @param {Pointer<Integer>} szFkSchemaName 
 * @param {Integer} cchFkSchemaName 
 * @param {Pointer<Integer>} szFkTableName 
 * @param {Integer} cchFkTableName 
 * @returns {Integer} 
 */
export SQLForeignKeysW(hstmt, szPkCatalogName, cchPkCatalogName, szPkSchemaName, cchPkSchemaName, szPkTableName, cchPkTableName, szFkCatalogName, cchFkCatalogName, szFkSchemaName, cchFkSchemaName, szFkTableName, cchFkTableName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szPkCatalogNameMarshal := szPkCatalogName is VarRef ? "ushort*" : "ptr"
    szPkSchemaNameMarshal := szPkSchemaName is VarRef ? "ushort*" : "ptr"
    szPkTableNameMarshal := szPkTableName is VarRef ? "ushort*" : "ptr"
    szFkCatalogNameMarshal := szFkCatalogName is VarRef ? "ushort*" : "ptr"
    szFkSchemaNameMarshal := szFkSchemaName is VarRef ? "ushort*" : "ptr"
    szFkTableNameMarshal := szFkTableName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ODBC32.dll\SQLForeignKeysW", hstmtMarshal, hstmt, szPkCatalogNameMarshal, szPkCatalogName, "short", cchPkCatalogName, szPkSchemaNameMarshal, szPkSchemaName, "short", cchPkSchemaName, szPkTableNameMarshal, szPkTableName, "short", cchPkTableName, szFkCatalogNameMarshal, szFkCatalogName, "short", cchFkCatalogName, szFkSchemaNameMarshal, szFkSchemaName, "short", cchFkSchemaName, szFkTableNameMarshal, szFkTableName, "short", cchFkTableName, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Pointer<Integer>} szSqlStrIn 
 * @param {Integer} cchSqlStrIn 
 * @param {Pointer<Integer>} szSqlStr 
 * @param {Integer} cchSqlStrMax 
 * @param {Pointer<Integer>} pcchSqlStr 
 * @returns {Integer} 
 */
export SQLNativeSqlW(hdbc, szSqlStrIn, cchSqlStrIn, szSqlStr, cchSqlStrMax, pcchSqlStr) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    szSqlStrInMarshal := szSqlStrIn is VarRef ? "ushort*" : "ptr"
    szSqlStrMarshal := szSqlStr is VarRef ? "ushort*" : "ptr"
    pcchSqlStrMarshal := pcchSqlStr is VarRef ? "int*" : "ptr"

    result := DllCall("ODBC32.dll\SQLNativeSqlW", hdbcMarshal, hdbc, szSqlStrInMarshal, szSqlStrIn, "int", cchSqlStrIn, szSqlStrMarshal, szSqlStr, "int", cchSqlStrMax, pcchSqlStrMarshal, pcchSqlStr, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cchCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cchSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cchTableName 
 * @returns {Integer} 
 */
export SQLPrimaryKeysW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ODBC32.dll\SQLPrimaryKeysW", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cchCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cchSchemaName 
 * @param {Pointer<Integer>} szProcName 
 * @param {Integer} cchProcName 
 * @param {Pointer<Integer>} szColumnName 
 * @param {Integer} cchColumnName 
 * @returns {Integer} 
 */
export SQLProcedureColumnsW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szProcName, cchProcName, szColumnName, cchColumnName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
    szProcNameMarshal := szProcName is VarRef ? "ushort*" : "ptr"
    szColumnNameMarshal := szColumnName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ODBC32.dll\SQLProcedureColumnsW", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szProcNameMarshal, szProcName, "short", cchProcName, szColumnNameMarshal, szColumnName, "short", cchColumnName, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cchCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cchSchemaName 
 * @param {Pointer<Integer>} szProcName 
 * @param {Integer} cchProcName 
 * @returns {Integer} 
 */
export SQLProceduresW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szProcName, cchProcName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
    szProcNameMarshal := szProcName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ODBC32.dll\SQLProceduresW", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szProcNameMarshal, szProcName, "short", cchProcName, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cchCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cchSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cchTableName 
 * @returns {Integer} 
 */
export SQLTablePrivilegesW(hstmt, szCatalogName, cchCatalogName, szSchemaName, cchSchemaName, szTableName, cchTableName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "ushort*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "ushort*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ODBC32.dll\SQLTablePrivilegesW", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cchCatalogName, szSchemaNameMarshal, szSchemaName, "short", cchSchemaName, szTableNameMarshal, szTableName, "short", cchTableName, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} henv 
 * @param {Integer} fDirection 
 * @param {Pointer<Integer>} szDriverDesc 
 * @param {Integer} cchDriverDescMax 
 * @param {Pointer<Integer>} pcchDriverDesc 
 * @param {Pointer<Integer>} szDriverAttributes 
 * @param {Integer} cchDrvrAttrMax 
 * @param {Pointer<Integer>} pcchDrvrAttr 
 * @returns {Integer} 
 */
export SQLDriversW(henv, fDirection, szDriverDesc, cchDriverDescMax, pcchDriverDesc, szDriverAttributes, cchDrvrAttrMax, pcchDrvrAttr) {
    henvMarshal := henv is VarRef ? "ptr" : "ptr"
    szDriverDescMarshal := szDriverDesc is VarRef ? "ushort*" : "ptr"
    pcchDriverDescMarshal := pcchDriverDesc is VarRef ? "short*" : "ptr"
    szDriverAttributesMarshal := szDriverAttributes is VarRef ? "ushort*" : "ptr"
    pcchDrvrAttrMarshal := pcchDrvrAttr is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLDriversW", henvMarshal, henv, "ushort", fDirection, szDriverDescMarshal, szDriverDesc, "short", cchDriverDescMax, pcchDriverDescMarshal, pcchDriverDesc, szDriverAttributesMarshal, szDriverAttributes, "short", cchDrvrAttrMax, pcchDrvrAttrMarshal, pcchDrvrAttr, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Pointer<Integer>} szDSN 
 * @param {Integer} cbDSN 
 * @param {Pointer<Integer>} szUID 
 * @param {Integer} cbUID 
 * @param {Pointer<Integer>} szAuthStr 
 * @param {Integer} cbAuthStr 
 * @returns {Integer} 
 */
export SQLConnectA(hdbc, szDSN, cbDSN, szUID, cbUID, szAuthStr, cbAuthStr) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    szDSNMarshal := szDSN is VarRef ? "char*" : "ptr"
    szUIDMarshal := szUID is VarRef ? "char*" : "ptr"
    szAuthStrMarshal := szAuthStr is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLConnectA", hdbcMarshal, hdbc, szDSNMarshal, szDSN, "short", cbDSN, szUIDMarshal, szUID, "short", cbUID, szAuthStrMarshal, szAuthStr, "short", cbAuthStr, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} henv 
 * @param {Pointer<Void>} hdbc 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szSqlState 
 * @param {Pointer<Integer>} pfNativeError 
 * @param {Pointer<Integer>} szErrorMsg 
 * @param {Integer} cbErrorMsgMax 
 * @param {Pointer<Integer>} pcbErrorMsg 
 * @returns {Integer} 
 */
export SQLErrorA(henv, hdbc, hstmt, szSqlState, pfNativeError, szErrorMsg, cbErrorMsgMax, pcbErrorMsg) {
    henvMarshal := henv is VarRef ? "ptr" : "ptr"
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szSqlStateMarshal := szSqlState is VarRef ? "char*" : "ptr"
    pfNativeErrorMarshal := pfNativeError is VarRef ? "int*" : "ptr"
    szErrorMsgMarshal := szErrorMsg is VarRef ? "char*" : "ptr"
    pcbErrorMsgMarshal := pcbErrorMsg is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLErrorA", henvMarshal, henv, hdbcMarshal, hdbc, hstmtMarshal, hstmt, szSqlStateMarshal, szSqlState, pfNativeErrorMarshal, pfNativeError, szErrorMsgMarshal, szErrorMsg, "short", cbErrorMsgMax, pcbErrorMsgMarshal, pcbErrorMsg, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szSqlStr 
 * @param {Integer} cbSqlStr 
 * @returns {Integer} 
 */
export SQLExecDirectA(hstmt, szSqlStr, cbSqlStr) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szSqlStrMarshal := szSqlStr is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLExecDirectA", hstmtMarshal, hstmt, szSqlStrMarshal, szSqlStr, "int", cbSqlStr, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Integer} fAttribute 
 * @param {Pointer<Void>} rgbValue 
 * @param {Integer} cbValueMax 
 * @param {Pointer<Integer>} pcbValue 
 * @returns {Integer} 
 */
export SQLGetConnectAttrA(hdbc, fAttribute, rgbValue, cbValueMax, pcbValue) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    rgbValueMarshal := rgbValue is VarRef ? "ptr" : "ptr"
    pcbValueMarshal := pcbValue is VarRef ? "int*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetConnectAttrA", hdbcMarshal, hdbc, "int", fAttribute, rgbValueMarshal, rgbValue, "int", cbValueMax, pcbValueMarshal, pcbValue, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCursor 
 * @param {Integer} cbCursorMax 
 * @param {Pointer<Integer>} pcbCursor 
 * @returns {Integer} 
 */
export SQLGetCursorNameA(hstmt, szCursor, cbCursorMax, pcbCursor) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCursorMarshal := szCursor is VarRef ? "char*" : "ptr"
    pcbCursorMarshal := pcbCursor is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetCursorNameA", hstmtMarshal, hstmt, szCursorMarshal, szCursor, "short", cbCursorMax, pcbCursorMarshal, pcbCursor, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdesc 
 * @param {Integer} iRecord 
 * @param {Integer} iField 
 * @param {Pointer<Void>} rgbValue 
 * @param {Integer} cbBufferLength 
 * @param {Pointer<Integer>} StringLength 
 * @returns {Integer} 
 */
export SQLGetDescFieldA(hdesc, iRecord, iField, rgbValue, cbBufferLength, StringLength) {
    hdescMarshal := hdesc is VarRef ? "ptr" : "ptr"
    rgbValueMarshal := rgbValue is VarRef ? "ptr" : "ptr"
    StringLengthMarshal := StringLength is VarRef ? "int*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetDescFieldA", hdescMarshal, hdesc, "short", iRecord, "short", iField, rgbValueMarshal, rgbValue, "int", cbBufferLength, StringLengthMarshal, StringLength, Int16)
    return result
}

/**
 * 
 * @param {Integer} fHandleType 
 * @param {Pointer<Void>} _handle 
 * @param {Integer} iRecord 
 * @param {Integer} fDiagField 
 * @param {Pointer<Void>} rgbDiagInfo 
 * @param {Integer} cbDiagInfoMax 
 * @param {Pointer<Integer>} pcbDiagInfo 
 * @returns {Integer} 
 */
export SQLGetDiagFieldA(fHandleType, _handle, iRecord, fDiagField, rgbDiagInfo, cbDiagInfoMax, pcbDiagInfo) {
    _handleMarshal := _handle is VarRef ? "ptr" : "ptr"
    rgbDiagInfoMarshal := rgbDiagInfo is VarRef ? "ptr" : "ptr"
    pcbDiagInfoMarshal := pcbDiagInfo is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetDiagFieldA", "short", fHandleType, _handleMarshal, _handle, "short", iRecord, "short", fDiagField, rgbDiagInfoMarshal, rgbDiagInfo, "short", cbDiagInfoMax, pcbDiagInfoMarshal, pcbDiagInfo, Int16)
    return result
}

/**
 * 
 * @param {Integer} fHandleType 
 * @param {Pointer<Void>} _handle 
 * @param {Integer} iRecord 
 * @param {Pointer<Integer>} szSqlState 
 * @param {Pointer<Integer>} pfNativeError 
 * @param {Pointer<Integer>} szErrorMsg 
 * @param {Integer} cbErrorMsgMax 
 * @param {Pointer<Integer>} pcbErrorMsg 
 * @returns {Integer} 
 */
export SQLGetDiagRecA(fHandleType, _handle, iRecord, szSqlState, pfNativeError, szErrorMsg, cbErrorMsgMax, pcbErrorMsg) {
    _handleMarshal := _handle is VarRef ? "ptr" : "ptr"
    szSqlStateMarshal := szSqlState is VarRef ? "char*" : "ptr"
    pfNativeErrorMarshal := pfNativeError is VarRef ? "int*" : "ptr"
    szErrorMsgMarshal := szErrorMsg is VarRef ? "char*" : "ptr"
    pcbErrorMsgMarshal := pcbErrorMsg is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetDiagRecA", "short", fHandleType, _handleMarshal, _handle, "short", iRecord, szSqlStateMarshal, szSqlState, pfNativeErrorMarshal, pfNativeError, szErrorMsgMarshal, szErrorMsg, "short", cbErrorMsgMax, pcbErrorMsgMarshal, pcbErrorMsg, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} fAttribute 
 * @param {Pointer<Void>} rgbValue 
 * @param {Integer} cbValueMax 
 * @param {Pointer<Integer>} pcbValue 
 * @returns {Integer} 
 */
export SQLGetStmtAttrA(hstmt, fAttribute, rgbValue, cbValueMax, pcbValue) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    rgbValueMarshal := rgbValue is VarRef ? "ptr" : "ptr"
    pcbValueMarshal := pcbValue is VarRef ? "int*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetStmtAttrA", hstmtMarshal, hstmt, "int", fAttribute, rgbValueMarshal, rgbValue, "int", cbValueMax, pcbValueMarshal, pcbValue, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} StatementHandle 
 * @param {Integer} DataType 
 * @returns {Integer} 
 */
export SQLGetTypeInfoA(StatementHandle, DataType) {
    StatementHandleMarshal := StatementHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetTypeInfoA", StatementHandleMarshal, StatementHandle, "short", DataType, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szSqlStr 
 * @param {Integer} cbSqlStr 
 * @returns {Integer} 
 */
export SQLPrepareA(hstmt, szSqlStr, cbSqlStr) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szSqlStrMarshal := szSqlStr is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLPrepareA", hstmtMarshal, hstmt, szSqlStrMarshal, szSqlStr, "int", cbSqlStr, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Integer} fAttribute 
 * @param {Integer} rgbValue 
 * @param {Integer} cbValue 
 * @returns {Integer} 
 */
export SQLSetConnectAttrA(hdbc, fAttribute, rgbValue, cbValue) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetConnectAttrA", hdbcMarshal, hdbc, "int", fAttribute, "ptr", rgbValue, "int", cbValue, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCursor 
 * @param {Integer} cbCursor 
 * @returns {Integer} 
 */
export SQLSetCursorNameA(hstmt, szCursor, cbCursor) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCursorMarshal := szCursor is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLSetCursorNameA", hstmtMarshal, hstmt, szCursorMarshal, szCursor, "short", cbCursor, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cbCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cbSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cbTableName 
 * @param {Pointer<Integer>} szColumnName 
 * @param {Integer} cbColumnName 
 * @returns {Integer} 
 */
export SQLColumnsA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName, szColumnName, cbColumnName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"
    szColumnNameMarshal := szColumnName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLColumnsA", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szTableNameMarshal, szTableName, "short", cbTableName, szColumnNameMarshal, szColumnName, "short", cbColumnName, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Integer} fOption 
 * @param {Pointer<Void>} pvParam 
 * @returns {Integer} 
 */
export SQLGetConnectOptionA(hdbc, fOption, pvParam) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetConnectOptionA", hdbcMarshal, hdbc, "ushort", fOption, pvParamMarshal, pvParam, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Integer} fInfoType 
 * @param {Integer} rgbInfoValue 
 * @param {Integer} cbInfoValueMax 
 * @param {Pointer<Integer>} pcbInfoValue 
 * @returns {Integer} 
 */
export SQLGetInfoA(hdbc, fInfoType, rgbInfoValue, cbInfoValueMax, pcbInfoValue) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    pcbInfoValueMarshal := pcbInfoValue is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLGetInfoA", hdbcMarshal, hdbc, "ushort", fInfoType, "ptr", rgbInfoValue, "short", cbInfoValueMax, pcbInfoValueMarshal, pcbInfoValue, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Integer} fColType 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cbCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cbSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cbTableName 
 * @param {Integer} fScope 
 * @param {Integer} fNullable 
 * @returns {Integer} 
 */
export SQLSpecialColumnsA(hstmt, fColType, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName, fScope, fNullable) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLSpecialColumnsA", hstmtMarshal, hstmt, "ushort", fColType, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szTableNameMarshal, szTableName, "short", cbTableName, "ushort", fScope, "ushort", fNullable, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cbCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cbSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cbTableName 
 * @param {Integer} fUnique 
 * @param {Integer} fAccuracy 
 * @returns {Integer} 
 */
export SQLStatisticsA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName, fUnique, fAccuracy) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLStatisticsA", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szTableNameMarshal, szTableName, "short", cbTableName, "ushort", fUnique, "ushort", fAccuracy, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cbCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cbSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cbTableName 
 * @param {Pointer<Integer>} szTableType 
 * @param {Integer} cbTableType 
 * @returns {Integer} 
 */
export SQLTablesA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName, szTableType, cbTableType) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"
    szTableTypeMarshal := szTableType is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLTablesA", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szTableNameMarshal, szTableName, "short", cbTableName, szTableTypeMarshal, szTableType, "short", cbTableType, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} henv 
 * @param {Integer} fDirection 
 * @param {Pointer<Integer>} szDSN 
 * @param {Integer} cbDSNMax 
 * @param {Pointer<Integer>} pcbDSN 
 * @param {Pointer<Integer>} szDescription 
 * @param {Integer} cbDescriptionMax 
 * @param {Pointer<Integer>} pcbDescription 
 * @returns {Integer} 
 */
export SQLDataSourcesA(henv, fDirection, szDSN, cbDSNMax, pcbDSN, szDescription, cbDescriptionMax, pcbDescription) {
    henvMarshal := henv is VarRef ? "ptr" : "ptr"
    szDSNMarshal := szDSN is VarRef ? "char*" : "ptr"
    pcbDSNMarshal := pcbDSN is VarRef ? "short*" : "ptr"
    szDescriptionMarshal := szDescription is VarRef ? "char*" : "ptr"
    pcbDescriptionMarshal := pcbDescription is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLDataSourcesA", henvMarshal, henv, "ushort", fDirection, szDSNMarshal, szDSN, "short", cbDSNMax, pcbDSNMarshal, pcbDSN, szDescriptionMarshal, szDescription, "short", cbDescriptionMax, pcbDescriptionMarshal, pcbDescription, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Pointer} _hwnd 
 * @param {Pointer<Integer>} szConnStrIn 
 * @param {Integer} cbConnStrIn 
 * @param {Pointer<Integer>} szConnStrOut 
 * @param {Integer} cbConnStrOutMax 
 * @param {Pointer<Integer>} pcbConnStrOut 
 * @param {Integer} fDriverCompletion 
 * @returns {Integer} 
 */
export SQLDriverConnectA(hdbc, _hwnd, szConnStrIn, cbConnStrIn, szConnStrOut, cbConnStrOutMax, pcbConnStrOut, fDriverCompletion) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    szConnStrInMarshal := szConnStrIn is VarRef ? "char*" : "ptr"
    szConnStrOutMarshal := szConnStrOut is VarRef ? "char*" : "ptr"
    pcbConnStrOutMarshal := pcbConnStrOut is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLDriverConnectA", hdbcMarshal, hdbc, "ptr", _hwnd, szConnStrInMarshal, szConnStrIn, "short", cbConnStrIn, szConnStrOutMarshal, szConnStrOut, "short", cbConnStrOutMax, pcbConnStrOutMarshal, pcbConnStrOut, "ushort", fDriverCompletion, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Pointer<Integer>} szConnStrIn 
 * @param {Integer} cbConnStrIn 
 * @param {Pointer<Integer>} szConnStrOut 
 * @param {Integer} cbConnStrOutMax 
 * @param {Pointer<Integer>} pcbConnStrOut 
 * @returns {Integer} 
 */
export SQLBrowseConnectA(hdbc, szConnStrIn, cbConnStrIn, szConnStrOut, cbConnStrOutMax, pcbConnStrOut) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    szConnStrInMarshal := szConnStrIn is VarRef ? "char*" : "ptr"
    szConnStrOutMarshal := szConnStrOut is VarRef ? "char*" : "ptr"
    pcbConnStrOutMarshal := pcbConnStrOut is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLBrowseConnectA", hdbcMarshal, hdbc, szConnStrInMarshal, szConnStrIn, "short", cbConnStrIn, szConnStrOutMarshal, szConnStrOut, "short", cbConnStrOutMax, pcbConnStrOutMarshal, pcbConnStrOut, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cbCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cbSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cbTableName 
 * @param {Pointer<Integer>} szColumnName 
 * @param {Integer} cbColumnName 
 * @returns {Integer} 
 */
export SQLColumnPrivilegesA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName, szColumnName, cbColumnName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"
    szColumnNameMarshal := szColumnName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLColumnPrivilegesA", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szTableNameMarshal, szTableName, "short", cbTableName, szColumnNameMarshal, szColumnName, "short", cbColumnName, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szPkCatalogName 
 * @param {Integer} cbPkCatalogName 
 * @param {Pointer<Integer>} szPkSchemaName 
 * @param {Integer} cbPkSchemaName 
 * @param {Pointer<Integer>} szPkTableName 
 * @param {Integer} cbPkTableName 
 * @param {Pointer<Integer>} szFkCatalogName 
 * @param {Integer} cbFkCatalogName 
 * @param {Pointer<Integer>} szFkSchemaName 
 * @param {Integer} cbFkSchemaName 
 * @param {Pointer<Integer>} szFkTableName 
 * @param {Integer} cbFkTableName 
 * @returns {Integer} 
 */
export SQLForeignKeysA(hstmt, szPkCatalogName, cbPkCatalogName, szPkSchemaName, cbPkSchemaName, szPkTableName, cbPkTableName, szFkCatalogName, cbFkCatalogName, szFkSchemaName, cbFkSchemaName, szFkTableName, cbFkTableName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szPkCatalogNameMarshal := szPkCatalogName is VarRef ? "char*" : "ptr"
    szPkSchemaNameMarshal := szPkSchemaName is VarRef ? "char*" : "ptr"
    szPkTableNameMarshal := szPkTableName is VarRef ? "char*" : "ptr"
    szFkCatalogNameMarshal := szFkCatalogName is VarRef ? "char*" : "ptr"
    szFkSchemaNameMarshal := szFkSchemaName is VarRef ? "char*" : "ptr"
    szFkTableNameMarshal := szFkTableName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLForeignKeysA", hstmtMarshal, hstmt, szPkCatalogNameMarshal, szPkCatalogName, "short", cbPkCatalogName, szPkSchemaNameMarshal, szPkSchemaName, "short", cbPkSchemaName, szPkTableNameMarshal, szPkTableName, "short", cbPkTableName, szFkCatalogNameMarshal, szFkCatalogName, "short", cbFkCatalogName, szFkSchemaNameMarshal, szFkSchemaName, "short", cbFkSchemaName, szFkTableNameMarshal, szFkTableName, "short", cbFkTableName, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hdbc 
 * @param {Pointer<Integer>} szSqlStrIn 
 * @param {Integer} cbSqlStrIn 
 * @param {Pointer<Integer>} szSqlStr 
 * @param {Integer} cbSqlStrMax 
 * @param {Pointer<Integer>} pcbSqlStr 
 * @returns {Integer} 
 */
export SQLNativeSqlA(hdbc, szSqlStrIn, cbSqlStrIn, szSqlStr, cbSqlStrMax, pcbSqlStr) {
    hdbcMarshal := hdbc is VarRef ? "ptr" : "ptr"
    szSqlStrInMarshal := szSqlStrIn is VarRef ? "char*" : "ptr"
    szSqlStrMarshal := szSqlStr is VarRef ? "char*" : "ptr"
    pcbSqlStrMarshal := pcbSqlStr is VarRef ? "int*" : "ptr"

    result := DllCall("ODBC32.dll\SQLNativeSqlA", hdbcMarshal, hdbc, szSqlStrInMarshal, szSqlStrIn, "int", cbSqlStrIn, szSqlStrMarshal, szSqlStr, "int", cbSqlStrMax, pcbSqlStrMarshal, pcbSqlStr, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cbCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cbSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cbTableName 
 * @returns {Integer} 
 */
export SQLPrimaryKeysA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLPrimaryKeysA", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szTableNameMarshal, szTableName, "short", cbTableName, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cbCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cbSchemaName 
 * @param {Pointer<Integer>} szProcName 
 * @param {Integer} cbProcName 
 * @param {Pointer<Integer>} szColumnName 
 * @param {Integer} cbColumnName 
 * @returns {Integer} 
 */
export SQLProcedureColumnsA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szProcName, cbProcName, szColumnName, cbColumnName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
    szProcNameMarshal := szProcName is VarRef ? "char*" : "ptr"
    szColumnNameMarshal := szColumnName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLProcedureColumnsA", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szProcNameMarshal, szProcName, "short", cbProcName, szColumnNameMarshal, szColumnName, "short", cbColumnName, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cbCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cbSchemaName 
 * @param {Pointer<Integer>} szProcName 
 * @param {Integer} cbProcName 
 * @returns {Integer} 
 */
export SQLProceduresA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szProcName, cbProcName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
    szProcNameMarshal := szProcName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLProceduresA", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szProcNameMarshal, szProcName, "short", cbProcName, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} hstmt 
 * @param {Pointer<Integer>} szCatalogName 
 * @param {Integer} cbCatalogName 
 * @param {Pointer<Integer>} szSchemaName 
 * @param {Integer} cbSchemaName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} cbTableName 
 * @returns {Integer} 
 */
export SQLTablePrivilegesA(hstmt, szCatalogName, cbCatalogName, szSchemaName, cbSchemaName, szTableName, cbTableName) {
    hstmtMarshal := hstmt is VarRef ? "ptr" : "ptr"
    szCatalogNameMarshal := szCatalogName is VarRef ? "char*" : "ptr"
    szSchemaNameMarshal := szSchemaName is VarRef ? "char*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"

    result := DllCall("ODBC32.dll\SQLTablePrivilegesA", hstmtMarshal, hstmt, szCatalogNameMarshal, szCatalogName, "short", cbCatalogName, szSchemaNameMarshal, szSchemaName, "short", cbSchemaName, szTableNameMarshal, szTableName, "short", cbTableName, Int16)
    return result
}

/**
 * 
 * @param {Pointer<Void>} henv 
 * @param {Integer} fDirection 
 * @param {Pointer<Integer>} szDriverDesc 
 * @param {Integer} cbDriverDescMax 
 * @param {Pointer<Integer>} pcbDriverDesc 
 * @param {Pointer<Integer>} szDriverAttributes 
 * @param {Integer} cbDrvrAttrMax 
 * @param {Pointer<Integer>} pcbDrvrAttr 
 * @returns {Integer} 
 */
export SQLDriversA(henv, fDirection, szDriverDesc, cbDriverDescMax, pcbDriverDesc, szDriverAttributes, cbDrvrAttrMax, pcbDrvrAttr) {
    henvMarshal := henv is VarRef ? "ptr" : "ptr"
    szDriverDescMarshal := szDriverDesc is VarRef ? "char*" : "ptr"
    pcbDriverDescMarshal := pcbDriverDesc is VarRef ? "short*" : "ptr"
    szDriverAttributesMarshal := szDriverAttributes is VarRef ? "char*" : "ptr"
    pcbDrvrAttrMarshal := pcbDrvrAttr is VarRef ? "short*" : "ptr"

    result := DllCall("ODBC32.dll\SQLDriversA", henvMarshal, henv, "ushort", fDirection, szDriverDescMarshal, szDriverDesc, "short", cbDriverDescMax, pcbDriverDescMarshal, pcbDriverDesc, szDriverAttributesMarshal, szDriverAttributes, "short", cbDrvrAttrMax, pcbDrvrAttrMarshal, pcbDrvrAttr, Int16)
    return result
}

;@endregion Functions
