#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IQueryParser.ahk" { IQueryParser }
#Import ".\QUERY_PARSER_MANAGER_OPTION.ahk" { QUERY_PARSER_MANAGER_OPTION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods to create, initialize, and change options for an IQueryParser object.
 * @remarks
 * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nn-structuredquery-iqueryparsermanager
 * @namespace Windows.Win32.System.Search
 */
export default struct IQueryParserManager extends IUnknown {
    /**
     * The interface identifier for IQueryParserManager
     * @type {Guid}
     */
    static IID := Guid("{a879e3c4-af77-44fb-8f37-ebd1487cf920}")

    /**
     * The class identifier for QueryParserManager
     * @type {Guid}
     */
    static CLSID := Guid("{5088b39a-29b4-4d9d-8245-4ee289222f66}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IQueryParserManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateLoadedParser : IntPtr
        InitializeOptions  : IntPtr
        SetOption          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IQueryParserManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new instance of a IQueryParser interface implementation. This instance of the query parser is loaded with the schema for the specified catalog and is localized to a specified language. All other settings are initialized to default settings.
     * @remarks
     * If %LOCALAPPDATA% is not available, then this method fails. You should call <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iqueryparsermanager-setoption">IQueryParserManager::SetOption</a> to point to a different folder like %ProgramData%.
     * @param {PWSTR} pszCatalog Type: <b>LPCWSTR</b>
     * 
     * The name of the catalog to use. Permitted values are <c>SystemIndex</c> and an empty string (for a trivial schema with no properties).
     * @param {Integer} langidForKeywords Type: <b>LANGID</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">LANGID</a> used to select the localized language for keywords.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The IID of the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iqueryparser">IQueryParser</a> interface implementation.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to the newly created parser. The calling application must release it by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparsermanager-createloadedparser
     */
    CreateLoadedParser(pszCatalog, langidForKeywords, riid) {
        pszCatalog := pszCatalog is String ? StrPtr(pszCatalog) : pszCatalog

        result := ComCall(3, this, "ptr", pszCatalog, "ushort", langidForKeywords, Guid.Ptr, riid, "ptr*", &ppQueryParser := 0, "HRESULT")
        return ppQueryParser
    }

    /**
     * Sets the flags for Natural Query Syntax (NQS) and automatic wildcard characters for the specified query parser.
     * @param {BOOL} fUnderstandNQS Type: <b>BOOL</b>
     * 
     * <b>BOOL</b> flag that controls whether NQS is supported by this instance of the query parser.
     * @param {BOOL} fAutoWildCard Type: <b>BOOL</b>
     * 
     * <b>BOOL</b> flag that controls whether a wildcard character (*) is to be assumed after each word in the query (unless followed by punctuation other than a parenthesis).
     * @param {IQueryParser} pQueryParser Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iqueryparser">IQueryParser</a>*</b>
     * 
     * Pointer to the query parser object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparsermanager-initializeoptions
     */
    InitializeOptions(fUnderstandNQS, fAutoWildCard, pQueryParser) {
        result := ComCall(4, this, BOOL, fUnderstandNQS, BOOL, fAutoWildCard, "ptr", pQueryParser, "HRESULT")
        return result
    }

    /**
     * Changes a single option in this IQueryParserManager object. For example, this method could change the name of the schema binary to load or the location of localized schema binaries.
     * @param {QUERY_PARSER_MANAGER_OPTION} option Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-query_parser_manager_option">QUERY_PARSER_MANAGER_OPTION</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-query_parser_manager_option">QUERY_PARSER_MANAGER_OPTION</a> to be changed.
     * @param {Pointer<PROPVARIANT>} pOptionValue Type: <b>PROPVARIANT const*</b>
     * 
     * A pointer to the value to use for the option selected.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparsermanager-setoption
     */
    SetOption(option, pOptionValue) {
        result := ComCall(5, this, QUERY_PARSER_MANAGER_OPTION, option, PROPVARIANT.Ptr, pOptionValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IQueryParserManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateLoadedParser := CallbackCreate(GetMethod(implObj, "CreateLoadedParser"), flags, 5)
        this.vtbl.InitializeOptions := CallbackCreate(GetMethod(implObj, "InitializeOptions"), flags, 4)
        this.vtbl.SetOption := CallbackCreate(GetMethod(implObj, "SetOption"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateLoadedParser)
        CallbackFree(this.vtbl.InitializeOptions)
        CallbackFree(this.vtbl.SetOption)
    }
}
