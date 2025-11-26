#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IQuerySolution.ahk
#Include ..\Com\StructuredStorage\PROPVARIANT.ahk
#Include .\ISchemaProvider.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods to parse an input string into an IQuerySolution object.
 * @remarks
 * 
 * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-iqueryparser
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IQueryParser extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQueryParser
     * @type {Guid}
     */
    static IID => Guid("{2ebdee67-3505-43f8-9946-ea44abc8e5b0}")

    /**
     * The class identifier for QueryParser
     * @type {Guid}
     */
    static CLSID => Guid("{b72f8fd8-0fab-4dd9-bdbf-245a6ce1485b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Parse", "SetOption", "GetOption", "SetMultiOption", "GetSchemaProvider", "RestateToString", "ParsePropertyValue", "RestatePropertyValueToString"]

    /**
     * Parses an input string that contains Structured Query keywords and/or contents to produce an IQuerySolution object.
     * @param {PWSTR} pszInputString Type: <b>LPCWSTR</b>
     * 
     * A pointer to the Unicode input string to be parsed.
     * @param {IEnumUnknown} pCustomProperties Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>*</b>
     * 
     * An enumeration of <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> objects, one for each custom property the application has recognized. This parameter can be <b>NULL</b>, which is equivalent to an empty enumeration.
     * @returns {IQuerySolution} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iquerysolution">IQuerySolution</a>**</b>
     * 
     * Receives an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iquerysolution">IQuerySolution</a> object. The caller must release it by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iqueryparser-parse
     */
    Parse(pszInputString, pCustomProperties) {
        pszInputString := pszInputString is String ? StrPtr(pszInputString) : pszInputString

        result := ComCall(3, this, "ptr", pszInputString, "ptr", pCustomProperties, "ptr*", &ppSolution := 0, "HRESULT")
        return IQuerySolution(ppSolution)
    }

    /**
     * Sets a single option, such as a specified wordbreaker, for parsing an input string.
     * @param {Integer} option Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_single_option">STRUCTURED_QUERY_SINGLE_OPTION</a></b>
     * 
     * Identifies the type of option to be set.
     * @param {Pointer<PROPVARIANT>} pOptionValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> specifying the value to set for the <i>option</i> parameter. This value is interpreted differently depending on the value of the <i>option</i> parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iqueryparser-setoption
     */
    SetOption(option, pOptionValue) {
        result := ComCall(4, this, "int", option, "ptr", pOptionValue, "HRESULT")
        return result
    }

    /**
     * Retrieves a specified simple option value for this query parser.
     * @param {Integer} option Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_single_option">STRUCTURED_QUERY_SINGLE_OPTION</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_single_option">STRUCTURED_QUERY_SINGLE_OPTION</a> enumerated type that specifies the option to be retrieved.
     * @returns {PROPVARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Receives a pointer to the specified option value. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_single_option">STRUCTURED_QUERY_SINGLE_OPTION</a>.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iqueryparser-getoption
     */
    GetOption(option) {
        pOptionValue := PROPVARIANT()
        result := ComCall(5, this, "int", option, "ptr", pOptionValue, "HRESULT")
        return pOptionValue
    }

    /**
     * Sets a complex option, such as a specified condition generator, to use when parsing an input string.
     * @param {Integer} option Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_multioption">STRUCTURED_QUERY_MULTIOPTION</a></b>
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iqueryparser-setmultioption
     */
    SetMultiOption(option, pszOptionKey, pOptionValue) {
        pszOptionKey := pszOptionKey is String ? StrPtr(pszOptionKey) : pszOptionKey

        result := ComCall(6, this, "int", option, "ptr", pszOptionKey, "ptr", pOptionValue, "HRESULT")
        return result
    }

    /**
     * Retrieves a schema provider for browsing the currently loaded schema.
     * @returns {ISchemaProvider} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ischemaprovider">ISchemaProvider</a>**</b>
     * 
     * Receives the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ischemaprovider">ISchemaProvider</a> object. The calling application must release it by invoking its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iqueryparser-getschemaprovider
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
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iqueryparser-restatetostring
     */
    RestateToString(pCondition, fUseEnglish) {
        result := ComCall(8, this, "ptr", pCondition, "int", fUseEnglish, "ptr*", &ppszQueryString := 0, "HRESULT")
        return ppszQueryString
    }

    /**
     * Parses a condition for a specified property.
     * @param {PWSTR} pszPropertyName Type: <b>LPCWSTR</b>
     * 
     * Property name.
     * @param {PWSTR} pszInputString Type: <b>LPCWSTR</b>
     * 
     * Query string to be parsed, relative to that property.
     * @returns {IQuerySolution} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iquerysolution">IQuerySolution</a>**</b>
     * 
     * Receives an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iquerysolution">IQuerySolution</a> object. The calling application must release it by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iqueryparser-parsepropertyvalue
     */
    ParsePropertyValue(pszPropertyName, pszInputString) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName
        pszInputString := pszInputString is String ? StrPtr(pszInputString) : pszInputString

        result := ComCall(9, this, "ptr", pszPropertyName, "ptr", pszInputString, "ptr*", &ppSolution := 0, "HRESULT")
        return IQuerySolution(ppSolution)
    }

    /**
     * Restates a specified property for a condition as a query string.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iqueryparser-restatepropertyvaluetostring
     */
    RestatePropertyValueToString(pCondition, fUseEnglish, ppszPropertyName, ppszQueryString) {
        ppszPropertyNameMarshal := ppszPropertyName is VarRef ? "ptr*" : "ptr"
        ppszQueryStringMarshal := ppszQueryString is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ptr", pCondition, "int", fUseEnglish, ppszPropertyNameMarshal, ppszPropertyName, ppszQueryStringMarshal, ppszQueryString, "HRESULT")
        return result
    }
}
