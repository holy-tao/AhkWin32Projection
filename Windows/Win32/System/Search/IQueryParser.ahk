#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {PWSTR} pszInputString 
     * @param {IEnumUnknown} pCustomProperties 
     * @param {Pointer<IQuerySolution>} ppSolution 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparser-parse
     */
    Parse(pszInputString, pCustomProperties, ppSolution) {
        pszInputString := pszInputString is String ? StrPtr(pszInputString) : pszInputString

        result := ComCall(3, this, "ptr", pszInputString, "ptr", pCustomProperties, "ptr*", ppSolution, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} option 
     * @param {Pointer<PROPVARIANT>} pOptionValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparser-setoption
     */
    SetOption(option, pOptionValue) {
        result := ComCall(4, this, "int", option, "ptr", pOptionValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} option 
     * @param {Pointer<PROPVARIANT>} pOptionValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparser-getoption
     */
    GetOption(option, pOptionValue) {
        result := ComCall(5, this, "int", option, "ptr", pOptionValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} option 
     * @param {PWSTR} pszOptionKey 
     * @param {Pointer<PROPVARIANT>} pOptionValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparser-setmultioption
     */
    SetMultiOption(option, pszOptionKey, pOptionValue) {
        pszOptionKey := pszOptionKey is String ? StrPtr(pszOptionKey) : pszOptionKey

        result := ComCall(6, this, "int", option, "ptr", pszOptionKey, "ptr", pOptionValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaProvider>} ppSchemaProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparser-getschemaprovider
     */
    GetSchemaProvider(ppSchemaProvider) {
        result := ComCall(7, this, "ptr*", ppSchemaProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICondition} pCondition 
     * @param {BOOL} fUseEnglish 
     * @param {Pointer<PWSTR>} ppszQueryString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparser-restatetostring
     */
    RestateToString(pCondition, fUseEnglish, ppszQueryString) {
        result := ComCall(8, this, "ptr", pCondition, "int", fUseEnglish, "ptr", ppszQueryString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPropertyName 
     * @param {PWSTR} pszInputString 
     * @param {Pointer<IQuerySolution>} ppSolution 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparser-parsepropertyvalue
     */
    ParsePropertyValue(pszPropertyName, pszInputString, ppSolution) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName
        pszInputString := pszInputString is String ? StrPtr(pszInputString) : pszInputString

        result := ComCall(9, this, "ptr", pszPropertyName, "ptr", pszInputString, "ptr*", ppSolution, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICondition} pCondition 
     * @param {BOOL} fUseEnglish 
     * @param {Pointer<PWSTR>} ppszPropertyName 
     * @param {Pointer<PWSTR>} ppszQueryString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparser-restatepropertyvaluetostring
     */
    RestatePropertyValueToString(pCondition, fUseEnglish, ppszPropertyName, ppszQueryString) {
        result := ComCall(10, this, "ptr", pCondition, "int", fUseEnglish, "ptr", ppszPropertyName, "ptr", ppszQueryString, "HRESULT")
        return result
    }
}
