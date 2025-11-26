#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Ole\IEnumVARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMStatusMsgCollection interface contains methods that enable applications to access a collection of status messages when using the Group Policy Management Console (GPMC) interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmstatusmsgcollection
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMStatusMsgCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMStatusMsgCollection
     * @type {Guid}
     */
    static IID => Guid("{9b6e1af0-1a92-40f3-a59d-f36ac1f728b7}")

    /**
     * The class identifier for GPMStatusMsgCollection
     * @type {Guid}
     */
    static CLSID => Guid("{2824e4be-4bcc-4cac-9e60-0e3ed7f12496}")

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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstatusmsgcollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstatusmsgcollection-get_item
     */
    get_Item(lIndex) {
        pVal := VARIANT()
        result := ComCall(8, this, "int", lIndex, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {IEnumVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstatusmsgcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &pVal := 0, "HRESULT")
        return IEnumVARIANT(pVal)
    }
}
