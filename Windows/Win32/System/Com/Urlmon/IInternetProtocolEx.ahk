#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IInternetProtocolSink.ahk" { IInternetProtocolSink }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUri.ahk" { IUri }
#Import ".\IInternetProtocol.ahk" { IInternetProtocol }
#Import ".\IInternetBindInfo.ahk" { IInternetBindInfo }
#Import "..\..\..\Foundation\HANDLE_PTR.ahk" { HANDLE_PTR }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetProtocolEx extends IInternetProtocol {
    /**
     * The interface identifier for IInternetProtocolEx
     * @type {Guid}
     */
    static IID := Guid("{c7a98e66-1010-492c-a1c8-c809e1f75905}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetProtocolEx interfaces
    */
    struct Vtbl extends IInternetProtocol.Vtbl {
        StartEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetProtocolEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUri} pUri 
     * @param {IInternetProtocolSink} pOIProtSink 
     * @param {IInternetBindInfo} pOIBindInfo 
     * @param {Integer} grfPI 
     * @param {HANDLE_PTR} dwReserved 
     * @returns {HRESULT} 
     */
    StartEx(pUri, pOIProtSink, pOIBindInfo, grfPI, dwReserved) {
        result := ComCall(13, this, "ptr", pUri, "ptr", pOIProtSink, "ptr", pOIBindInfo, "uint", grfPI, HANDLE_PTR, dwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInternetProtocolEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartEx := CallbackCreate(GetMethod(implObj, "StartEx"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartEx)
    }
}
