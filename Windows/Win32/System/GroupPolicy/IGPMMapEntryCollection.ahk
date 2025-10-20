#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMMapEntryCollection interface enables applications to access map entry objects.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmmapentrycollection
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMMapEntryCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMMapEntryCollection
     * @type {Guid}
     */
    static IID => Guid("{bb0bf49b-e53f-443f-b807-8be22bfb6d42}")

    /**
     * The class identifier for GPMMapEntryCollection
     * @type {Guid}
     */
    static CLSID => Guid("{0cf75d5b-a3a1-4c55-b4fe-9e149c41f66d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum"]

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmapentrycollection-get_count
     */
    get_Count(pVal) {
        result := ComCall(7, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmapentrycollection-get_item
     */
    get_Item(lIndex, pVal) {
        result := ComCall(8, this, "int", lIndex, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmmapentrycollection-get__newenum
     */
    get__NewEnum(pVal) {
        result := ComCall(9, this, "ptr*", pVal, "HRESULT")
        return result
    }
}
