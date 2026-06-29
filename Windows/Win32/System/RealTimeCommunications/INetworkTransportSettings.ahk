#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Networking\WinSock\TRANSPORT_SETTING_ID.ahk" { TRANSPORT_SETTING_ID }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct INetworkTransportSettings extends IUnknown {
    /**
     * The interface identifier for INetworkTransportSettings
     * @type {Guid}
     */
    static IID := Guid("{5e7abb2c-f2c1-4a61-bd35-deb7a08ab0f1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetworkTransportSettings interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ApplySetting : IntPtr
        QuerySetting : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetworkTransportSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<TRANSPORT_SETTING_ID>} SettingId 
     * @param {Integer} LengthIn 
     * @param {Pointer<Integer>} ValueIn 
     * @param {Pointer<Integer>} LengthOut 
     * @param {Pointer<Pointer<Integer>>} ValueOut 
     * @returns {HRESULT} 
     */
    ApplySetting(SettingId, LengthIn, ValueIn, LengthOut, ValueOut) {
        ValueInMarshal := ValueIn is VarRef ? "char*" : "ptr"
        LengthOutMarshal := LengthOut is VarRef ? "uint*" : "ptr"
        ValueOutMarshal := ValueOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, TRANSPORT_SETTING_ID.Ptr, SettingId, "uint", LengthIn, ValueInMarshal, ValueIn, LengthOutMarshal, LengthOut, ValueOutMarshal, ValueOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TRANSPORT_SETTING_ID>} SettingId 
     * @param {Integer} LengthIn 
     * @param {Pointer<Integer>} ValueIn 
     * @param {Pointer<Integer>} LengthOut 
     * @param {Pointer<Pointer<Integer>>} ValueOut 
     * @returns {HRESULT} 
     */
    QuerySetting(SettingId, LengthIn, ValueIn, LengthOut, ValueOut) {
        ValueInMarshal := ValueIn is VarRef ? "char*" : "ptr"
        LengthOutMarshal := LengthOut is VarRef ? "uint*" : "ptr"
        ValueOutMarshal := ValueOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, TRANSPORT_SETTING_ID.Ptr, SettingId, "uint", LengthIn, ValueInMarshal, ValueIn, LengthOutMarshal, LengthOut, ValueOutMarshal, ValueOut, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetworkTransportSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ApplySetting := CallbackCreate(GetMethod(implObj, "ApplySetting"), flags, 6)
        this.vtbl.QuerySetting := CallbackCreate(GetMethod(implObj, "QuerySetting"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ApplySetting)
        CallbackFree(this.vtbl.QuerySetting)
    }
}
