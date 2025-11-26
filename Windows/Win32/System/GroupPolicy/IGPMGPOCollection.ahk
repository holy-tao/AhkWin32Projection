#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Ole\IEnumVARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMGPOCollection interface contains methods that enable applications to access a collection of Group Policy Objects (GPOs) when using the Group Policy Management Console (GPMC) interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmgpocollection
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMGPOCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMGPOCollection
     * @type {Guid}
     */
    static IID => Guid("{f0f0d5cf-70ca-4c39-9e29-b642f8726c01}")

    /**
     * The class identifier for GPMGPOCollection
     * @type {Guid}
     */
    static CLSID => Guid("{7a057325-832d-4de3-a41f-c780436a4e09}")

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
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpocollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpocollection-get_item
     */
    get_Item(lIndex) {
        pVal := VARIANT()
        result := ComCall(8, this, "int", lIndex, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {IEnumVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpocollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppIGPMGPOs := 0, "HRESULT")
        return IEnumVARIANT(ppIGPMGPOs)
    }
}
