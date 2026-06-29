#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TRANSPORT_SETTING.ahk" { TRANSPORT_SETTING }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct ITransportSettingsInternal extends IUnknown {
    /**
     * The interface identifier for ITransportSettingsInternal
     * @type {Guid}
     */
    static IID := Guid("{5123e076-29e3-4bfd-84fe-0192d411e3e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransportSettingsInternal interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ApplySetting : IntPtr
        QuerySetting : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransportSettingsInternal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<TRANSPORT_SETTING>} Setting 
     * @returns {HRESULT} 
     */
    ApplySetting(Setting) {
        result := ComCall(3, this, TRANSPORT_SETTING.Ptr, Setting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TRANSPORT_SETTING>} Setting 
     * @returns {HRESULT} 
     */
    QuerySetting(Setting) {
        result := ComCall(4, this, TRANSPORT_SETTING.Ptr, Setting, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransportSettingsInternal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ApplySetting := CallbackCreate(GetMethod(implObj, "ApplySetting"), flags, 2)
        this.vtbl.QuerySetting := CallbackCreate(GetMethod(implObj, "QuerySetting"), flags, 2)
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
