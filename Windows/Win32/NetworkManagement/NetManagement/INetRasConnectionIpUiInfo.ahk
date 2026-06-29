#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RASCON_IPUI.ahk" { RASCON_IPUI }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetRasConnectionIpUiInfo extends IUnknown {
    /**
     * The interface identifier for INetRasConnectionIpUiInfo
     * @type {Guid}
     */
    static IID := Guid("{faedcf58-31fe-11d1-aad2-00805fc1270e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetRasConnectionIpUiInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetUiInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetRasConnectionIpUiInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {RASCON_IPUI} 
     */
    GetUiInfo() {
        pInfo := RASCON_IPUI()
        result := ComCall(3, this, RASCON_IPUI.Ptr, pInfo, "HRESULT")
        return pInfo
    }

    Query(iid) {
        if (INetRasConnectionIpUiInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetUiInfo := CallbackCreate(GetMethod(implObj, "GetUiInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetUiInfo)
    }
}
