#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * When implemented by a derived class, represents a source provider that supports filtered change enumeration, and that can negotiate the type of filter that is used.
 * @remarks
 * 
 * <b>ISupportFilteredSync</b> is typically implemented by a source provider.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isupportfilteredsync
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISupportFilteredSync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISupportFilteredSync
     * @type {Guid}
     */
    static IID => Guid("{3d128ded-d555-4e0d-bf4b-fb213a8a9302}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddFilter"]

    /**
     * 
     * @param {IUnknown} pFilter 
     * @param {Integer} filteringType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isupportfilteredsync-addfilter
     */
    AddFilter(pFilter, filteringType) {
        result := ComCall(3, this, "ptr", pFilter, "int", filteringType, "HRESULT")
        return result
    }
}
