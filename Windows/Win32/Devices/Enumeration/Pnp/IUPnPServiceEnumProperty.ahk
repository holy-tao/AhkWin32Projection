#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Use this interface to delay Service Control Protocol Description (SCPD) download and event subscription on the IUPnPService objects enumerated from the IUPnPServices object.
 * @see https://learn.microsoft.com/windows/win32/api/upnp/nn-upnp-iupnpserviceenumproperty
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPServiceEnumProperty extends IUnknown {
    /**
     * The interface identifier for IUPnPServiceEnumProperty
     * @type {Guid}
     */
    static IID := Guid("{38873b37-91bb-49f4-b249-2e8efbb8a816}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPServiceEnumProperty interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetServiceEnumProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPServiceEnumProperty.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetServiceEnumProperty method is used to indicate opt-in to the delayed Service Control Protocol Description (SCPD) download and event subscription for the IUPnPService objects enumerated from the IUPnPServices object.
     * @param {Integer} dwMask Specifies a bit-wise flag to indicate an opt-in to the delayed SCPD download and even subscription. Possible values include:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td>UPNP_SERVICE_DELAY_SCPD_AND_SUBSCRIPTION</td>
     * <td>0x1</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Returns <b>S_OK</b> on success. Otherwise, this method returns <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpserviceenumproperty-setserviceenumproperty
     */
    SetServiceEnumProperty(dwMask) {
        result := ComCall(3, this, "uint", dwMask, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUPnPServiceEnumProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetServiceEnumProperty := CallbackCreate(GetMethod(implObj, "SetServiceEnumProperty"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetServiceEnumProperty)
    }
}
