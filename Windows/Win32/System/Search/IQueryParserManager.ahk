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
     * 
     * @param {PWSTR} pszCatalog 
     * @param {Integer} langidForKeywords 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparsermanager-createloadedparser
     */
    CreateLoadedParser(pszCatalog, langidForKeywords, riid) {
        pszCatalog := pszCatalog is String ? StrPtr(pszCatalog) : pszCatalog

        result := ComCall(3, this, "ptr", pszCatalog, "ushort", langidForKeywords, "ptr", riid, "ptr*", &ppQueryParser := 0, "HRESULT")
        return ppQueryParser
    }

    /**
     * 
     * @param {BOOL} fUnderstandNQS 
     * @param {BOOL} fAutoWildCard 
     * @param {IQueryParser} pQueryParser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparsermanager-initializeoptions
     */
    InitializeOptions(fUnderstandNQS, fAutoWildCard, pQueryParser) {
        result := ComCall(4, this, "int", fUnderstandNQS, "int", fAutoWildCard, "ptr", pQueryParser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} option 
     * @param {Pointer<PROPVARIANT>} pOptionValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iqueryparsermanager-setoption
     */
    SetOption(option, pOptionValue) {
        result := ComCall(5, this, "int", option, "ptr", pOptionValue, "HRESULT")
        return result
    }
}
