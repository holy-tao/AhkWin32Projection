#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IWinInetHttpTimeouts extends IUnknown {
    /**
     * The interface identifier for IWinInetHttpTimeouts
     * @type {Guid}
     */
    static IID := Guid("{f286fa56-c1fd-4270-8e67-b3eb790a81e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWinInetHttpTimeouts interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRequestTimeouts : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWinInetHttpTimeouts.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwConnectTimeout 
     * @param {Pointer<Integer>} pdwSendTimeout 
     * @param {Pointer<Integer>} pdwReceiveTimeout 
     * @returns {HRESULT} 
     */
    GetRequestTimeouts(pdwConnectTimeout, pdwSendTimeout, pdwReceiveTimeout) {
        pdwConnectTimeoutMarshal := pdwConnectTimeout is VarRef ? "uint*" : "ptr"
        pdwSendTimeoutMarshal := pdwSendTimeout is VarRef ? "uint*" : "ptr"
        pdwReceiveTimeoutMarshal := pdwReceiveTimeout is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwConnectTimeoutMarshal, pdwConnectTimeout, pdwSendTimeoutMarshal, pdwSendTimeout, pdwReceiveTimeoutMarshal, pdwReceiveTimeout, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWinInetHttpTimeouts.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRequestTimeouts := CallbackCreate(GetMethod(implObj, "GetRequestTimeouts"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRequestTimeouts)
    }
}
