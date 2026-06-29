#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IEnumUnknown.ahk" { IEnumUnknown }
#Import ".\ICondition.ahk" { ICondition }
#Import ".\STRUCTURED_QUERY_SINGLE_OPTION.ahk" { STRUCTURED_QUERY_SINGLE_OPTION }
#Import ".\ISchemaProvider.ahk" { ISchemaProvider }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\STRUCTURED_QUERY_MULTIOPTION.ahk" { STRUCTURED_QUERY_MULTIOPTION }
#Import ".\IQuerySolution.ahk" { IQuerySolution }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }

/**
 * Provides methods to parse an input string into an IQuerySolution object.
 * @remarks
 * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nn-structuredquery-iqueryparser
 * @namespace Windows.Win32.System.Search
 */
export default struct IQueryParser extends IUnknown {
    /**
     * The interface identifier for IQueryParser
     * @type {Guid}
     */
    static IID := Guid("{2ebdee67-3505-43f8-9946-ea44abc8e5b0}")

    /**
     * The class identifier for QueryParser
     * @type {Guid}
     */
    static CLSID := Guid("{b72f8fd8-0fab-4dd9-bdbf-245a6ce1485b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IQueryParser interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Parse                        : IntPtr
        SetOption                    : IntPtr
        GetOption                    : IntPtr
        SetMultiOption               : IntPtr
        GetSchemaProvider            : IntPtr
        RestateToString              : IntPtr
        ParsePropertyValue           : IntPtr
        RestatePropertyValueToString : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IQueryParser.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Parses an input string that contains Structured Query keywords and/or contents to produce an IQuerySolution object.
     * @remarks
     * For each <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> object, the position information identifies the character span of the custom property, the string value is the name of an actual property, and the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> is unused. Although any property could be used, these generic properties are included specifically for this purpose:
     *         
     * 
     * <ul>
     * <li>System.StructuredQuery.CustomProperty.Boolean</li>
     * <li>System.StructuredQuery.CustomProperty.DateTime</li>
     * <li>System.StructuredQuery.CustomProperty.Integer</li>
     * <li>System.StructuredQuery.CustomProperty.FloatingPoint</li>
     * <li>System.StructuredQuery.CustomProperty.String</li>
     * </ul>
     * An application can use them in the enumeration passed in the <i>pCustomProperties</i> parameter and look for them in the resulting condition tree.
     * @param {PWSTR} pszInputString Type: <b>LPCWSTR</b>
     * 
     * A pointer to the Unicode input string to be parsed.
     * @param {IEnumUnknown} pCustomProperties Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>*</b>
     * 
     * An enumeration of <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> objects, one for each custom property the application has recognized. This parameter can be <b>NULL</b>, which is equivalent to an empty enumeration.
     * @returns {IQuerySolution} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iquerysolution">IQuerySolution</a>**</b>
     * 
     * Receives an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iquerysolution">IQuerySolution</a> object. The caller must release it by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparser-parse
     */
    Parse(pszInputString, pCustomProperties) {
        pszInputString := pszInputString is String ? StrPtr(pszInputString) : pszInputString

        result := ComCall(3, this, "ptr", pszInputString, "ptr", pCustomProperties, "ptr*", &ppSolution := 0, "HRESULT")
        return IQuerySolution(ppSolution)
    }

    /**
     * Sets a single option, such as a specified wordbreaker, for parsing an input string.
     * @remarks
     * For more information, see <a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_single_option">STRUCTURED_QUERY_SINGLE_OPTION</a>.
     * @param {STRUCTURED_QUERY_SINGLE_OPTION} option Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_single_option">STRUCTURED_QUERY_SINGLE_OPTION</a></b>
     * 
     * Identifies the type of option to be set.
     * @param {Pointer<PROPVARIANT>} pOptionValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> specifying the value to set for the <i>option</i> parameter. This value is interpreted differently depending on the value of the <i>option</i> parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparser-setoption
     */
    SetOption(option, pOptionValue) {
        result := ComCall(4, this, STRUCTURED_QUERY_SINGLE_OPTION, option, PROPVARIANT.Ptr, pOptionValue, "HRESULT")
        return result
    }

    /**
     * Retrieves a specified simple option value for this query parser.
     * @param {STRUCTURED_QUERY_SINGLE_OPTION} option Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_single_option">STRUCTURED_QUERY_SINGLE_OPTION</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_single_option">STRUCTURED_QUERY_SINGLE_OPTION</a> enumerated type that specifies the option to be retrieved.
     * @returns {PROPVARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Receives a pointer to the specified option value. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_single_option">STRUCTURED_QUERY_SINGLE_OPTION</a>.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparser-getoption
     */
    GetOption(option) {
        pOptionValue := PROPVARIANT()
        result := ComCall(5, this, STRUCTURED_QUERY_SINGLE_OPTION, option, PROPVARIANT.Ptr, pOptionValue, "HRESULT")
        return pOptionValue
    }

    /**
     * Sets a complex option, such as a specified condition generator, to use when parsing an input string.
     * @param {STRUCTURED_QUERY_MULTIOPTION} option Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_multioption">STRUCTURED_QUERY_MULTIOPTION</a></b>
     * 
     * The complex option to be set.
     * @param {PWSTR} pszOptionKey Type: <b>LPCWSTR</b>
     * 
     * A Unicode string that is interpreted differently for each value of the <i>option</i> parameter. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_multioption">STRUCTURED_QUERY_MULTIOPTION</a>.
     * @param {Pointer<PROPVARIANT>} pOptionValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_multioption">PROPVARIANT</a> that is interpreted differently for each value of the <i>option</i> parameter. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-structured_query_multioption">STRUCTURED_QUERY_MULTIOPTION</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparser-setmultioption
     */
    SetMultiOption(option, pszOptionKey, pOptionValue) {
        pszOptionKey := pszOptionKey is String ? StrPtr(pszOptionKey) : pszOptionKey

        result := ComCall(6, this, STRUCTURED_QUERY_MULTIOPTION, option, "ptr", pszOptionKey, PROPVARIANT.Ptr, pOptionValue, "HRESULT")
        return result
    }

    /**
     * Retrieves a schema provider for browsing the currently loaded schema.
     * @returns {ISchemaProvider} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ischemaprovider">ISchemaProvider</a>**</b>
     * 
     * Receives the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ischemaprovider">ISchemaProvider</a> object. The calling application must release it by invoking its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparser-getschemaprovider
     */
    GetSchemaProvider() {
        result := ComCall(7, this, "ptr*", &ppSchemaProvider := 0, "HRESULT")
        return ISchemaProvider(ppSchemaProvider)
    }

    /**
     * Restates a condition as a structured query string. If the condition was the result of parsing an original query string, the keywords of that query string are used to a great extent. If not, default keywords are used.
     * @param {ICondition} pCondition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>*</b>
     * 
     * The condition to be restated.
     * @param {BOOL} fUseEnglish Type: <b>BOOL</b>
     * 
     * Reserved. Must be <b>FALSE</b>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives the restated query string. The caller must free the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparser-restatetostring
     */
    RestateToString(pCondition, fUseEnglish) {
        result := ComCall(8, this, "ptr", pCondition, BOOL, fUseEnglish, PWSTR.Ptr, &ppszQueryString := 0, "HRESULT")
        return ppszQueryString
    }

    /**
     * Parses a condition for a specified property.
     * @remarks
     * The input string can be anything that could have been written immediately after a property in a structured query. For example, "from:(bill OR alex)" would be a valid structured query, so passing System.StructuredQuery.Virtual.From (for which From is a keyword) in the <i>pszPropertyName</i> parameter and "(bill OR alex)" or "bill OR alex" in the <i>pszInputString</i> parameter would be valid. This would result in an <b>OR</b> of leaf nodes that relate the System.StructuredQuery.Virtual.From property with the strings "bill" and "alex".
     * @param {PWSTR} pszPropertyName Type: <b>LPCWSTR</b>
     * 
     * Property name.
     * @param {PWSTR} pszInputString Type: <b>LPCWSTR</b>
     * 
     * Query string to be parsed, relative to that property.
     * @returns {IQuerySolution} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iquerysolution">IQuerySolution</a>**</b>
     * 
     * Receives an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iquerysolution">IQuerySolution</a> object. The calling application must release it by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparser-parsepropertyvalue
     */
    ParsePropertyValue(pszPropertyName, pszInputString) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName
        pszInputString := pszInputString is String ? StrPtr(pszInputString) : pszInputString

        result := ComCall(9, this, "ptr", pszPropertyName, "ptr", pszInputString, "ptr*", &ppSolution := 0, "HRESULT")
        return IQuerySolution(ppSolution)
    }

    /**
     * Restates a specified property for a condition as a query string.
     * @remarks
     * If the leaf nodes of the condition contain more than one property name, or no property name at all, E_INVALIDARG is returned.
     * @param {ICondition} pCondition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>*</b>
     * 
     * A condition to be restated as a query string.
     * @param {BOOL} fUseEnglish Type: <b>BOOL</b>
     * 
     * Reserved. Must be <b>FALSE</b>.
     * @param {Pointer<PWSTR>} ppszPropertyName Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to the property name as a Unicode string. The calling application must free the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<PWSTR>} ppszQueryString Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to a query string for that property. The calling application must free the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparser-restatepropertyvaluetostring
     */
    RestatePropertyValueToString(pCondition, fUseEnglish, ppszPropertyName, ppszQueryString) {
        ppszPropertyNameMarshal := ppszPropertyName is VarRef ? "ptr*" : "ptr"
        ppszQueryStringMarshal := ppszQueryString is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ptr", pCondition, BOOL, fUseEnglish, ppszPropertyNameMarshal, ppszPropertyName, ppszQueryStringMarshal, ppszQueryString, "HRESULT")
        return result
    }

    Query(iid) {
        if (IQueryParser.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Parse := CallbackCreate(GetMethod(implObj, "Parse"), flags, 4)
        this.vtbl.SetOption := CallbackCreate(GetMethod(implObj, "SetOption"), flags, 3)
        this.vtbl.GetOption := CallbackCreate(GetMethod(implObj, "GetOption"), flags, 3)
        this.vtbl.SetMultiOption := CallbackCreate(GetMethod(implObj, "SetMultiOption"), flags, 4)
        this.vtbl.GetSchemaProvider := CallbackCreate(GetMethod(implObj, "GetSchemaProvider"), flags, 2)
        this.vtbl.RestateToString := CallbackCreate(GetMethod(implObj, "RestateToString"), flags, 4)
        this.vtbl.ParsePropertyValue := CallbackCreate(GetMethod(implObj, "ParsePropertyValue"), flags, 4)
        this.vtbl.RestatePropertyValueToString := CallbackCreate(GetMethod(implObj, "RestatePropertyValueToString"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Parse)
        CallbackFree(this.vtbl.SetOption)
        CallbackFree(this.vtbl.GetOption)
        CallbackFree(this.vtbl.SetMultiOption)
        CallbackFree(this.vtbl.GetSchemaProvider)
        CallbackFree(this.vtbl.RestateToString)
        CallbackFree(this.vtbl.ParsePropertyValue)
        CallbackFree(this.vtbl.RestatePropertyValueToString)
    }
}
