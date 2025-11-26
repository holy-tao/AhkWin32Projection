#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods to create, initialize, and change options for an IQueryParser object.
 * @remarks
 * 
 * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-iqueryparsermanager
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IQueryParserManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQueryParserManager
     * @type {Guid}
     */
    static IID => Guid("{a879e3c4-af77-44fb-8f37-ebd1487cf920}")

    /**
     * The class identifier for QueryParserManager
     * @type {Guid}
     */
    static CLSID => Guid("{5088b39a-29b4-4d9d-8245-4ee289222f66}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateLoadedParser", "InitializeOptions", "SetOption"]

    /**
     * Creates a new instance of a IQueryParser interface implementation. This instance of the query parser is loaded with the schema for the specified catalog and is localized to a specified language. All other settings are initialized to default settings.
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
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iqueryparsermanager-createloadedparser
     */
    CreateLoadedParser(pszCatalog, langidForKeywords, riid) {
        pszCatalog := pszCatalog is String ? StrPtr(pszCatalog) : pszCatalog

        result := ComCall(3, this, "ptr", pszCatalog, "ushort", langidForKeywords, "ptr", riid, "ptr*", &ppQueryParser := 0, "HRESULT")
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iqueryparsermanager-initializeoptions
     */
    InitializeOptions(fUnderstandNQS, fAutoWildCard, pQueryParser) {
        result := ComCall(4, this, "int", fUnderstandNQS, "int", fAutoWildCard, "ptr", pQueryParser, "HRESULT")
        return result
    }

    /**
     * Changes a single option in this IQueryParserManager object. For example, this method could change the name of the schema binary to load or the location of localized schema binaries.
     * @param {Integer} option Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-query_parser_manager_option">QUERY_PARSER_MANAGER_OPTION</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-query_parser_manager_option">QUERY_PARSER_MANAGER_OPTION</a> to be changed.
     * @param {Pointer<PROPVARIANT>} pOptionValue Type: <b>PROPVARIANT const*</b>
     * 
     * A pointer to the value to use for the option selected.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iqueryparsermanager-setoption
     */
    SetOption(option, pOptionValue) {
        result := ComCall(5, this, "int", option, "ptr", pOptionValue, "HRESULT")
        return result
    }
}
