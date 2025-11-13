#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISearchCatalogManager2.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchCatalogManager3 extends ISearchCatalogManager2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchCatalogManager3
     * @type {Guid}
     */
    static IID => Guid("{de837e8f-634f-4ab0-bdfc-9fc3a1fc50dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsContainsSemanticSupported"]

    /**
     * 
     * @returns {BOOL} 
     */
    IsContainsSemanticSupported() {
        result := ComCall(30, this, "int*", &isContainsSemanticSupported := 0, "HRESULT")
        return isContainsSemanticSupported
    }
}
