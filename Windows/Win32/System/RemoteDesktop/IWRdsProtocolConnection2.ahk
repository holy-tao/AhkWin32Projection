#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WTS_SERIALIZED_USER_CREDENTIAL.ahk" { WTS_SERIALIZED_USER_CREDENTIAL }
#Import ".\IWRdsProtocolConnection.ahk" { IWRdsProtocolConnection }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWRdsProtocolConnection2 extends IWRdsProtocolConnection {
    /**
     * The interface identifier for IWRdsProtocolConnection2
     * @type {Guid}
     */
    static IID := Guid("{c2bd9b66-4a76-4701-b6a3-bfafc1482169}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWRdsProtocolConnection2 interfaces
    */
    struct Vtbl extends IWRdsProtocolConnection.Vtbl {
        GetSerializedUserCredential : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWRdsProtocolConnection2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Pointer<WTS_SERIALIZED_USER_CREDENTIAL>} 
     */
    GetSerializedUserCredential() {
        result := ComCall(27, this, "ptr*", &userCredential := 0, "HRESULT")
        return userCredential
    }

    Query(iid) {
        if (IWRdsProtocolConnection2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSerializedUserCredential := CallbackCreate(GetMethod(implObj, "GetSerializedUserCredential"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSerializedUserCredential)
    }
}
