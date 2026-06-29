#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\DIJOYCONFIG.ahk" { DIJOYCONFIG }
#Import ".\DIJOYTYPEINFO.ahk" { DIJOYTYPEINFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DIJOYUSERVALUES.ahk" { DIJOYUSERVALUES }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct IDirectInputJoyConfig extends IUnknown {
    /**
     * The interface identifier for IDirectInputJoyConfig
     * @type {Guid}
     */
    static IID := Guid("{1de12ab1-c9f5-11cf-bfc7-444553540000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectInputJoyConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Acquire             : IntPtr
        Unacquire           : IntPtr
        SetCooperativeLevel : IntPtr
        SendNotify          : IntPtr
        EnumTypes           : IntPtr
        GetTypeInfo         : IntPtr
        SetTypeInfo         : IntPtr
        DeleteType          : IntPtr
        GetConfig           : IntPtr
        SetConfig           : IntPtr
        DeleteConfig        : IntPtr
        GetUserValues       : IntPtr
        SetUserValues       : IntPtr
        AddNewHardware      : IntPtr
        OpenTypeKey         : IntPtr
        OpenConfigKey       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectInputJoyConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Acquire() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unacquire() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetCooperativeLevel(param0, param1) {
        result := ComCall(5, this, HWND, param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SendNotify() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LPDIJOYTYPECALLBACK>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {HRESULT} 
     */
    EnumTypes(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ptr", param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @param {Pointer<DIJOYTYPEINFO>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    GetTypeInfo(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(8, this, "ptr", param0, DIJOYTYPEINFO.Ptr, param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @param {Pointer<DIJOYTYPEINFO>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    SetTypeInfo(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(9, this, "ptr", param0, DIJOYTYPEINFO.Ptr, param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @returns {HRESULT} 
     */
    DeleteType(param0) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(10, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DIJOYCONFIG>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    GetConfig(param0, param1, param2) {
        result := ComCall(11, this, "uint", param0, DIJOYCONFIG.Ptr, param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DIJOYCONFIG>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    SetConfig(param0, param1, param2) {
        result := ComCall(12, this, "uint", param0, DIJOYCONFIG.Ptr, param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     */
    DeleteConfig(param0) {
        result := ComCall(13, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIJOYUSERVALUES>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    GetUserValues(param0, param1) {
        result := ComCall(14, this, DIJOYUSERVALUES.Ptr, param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIJOYUSERVALUES>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetUserValues(param0, param1) {
        result := ComCall(15, this, DIJOYUSERVALUES.Ptr, param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {Pointer<Guid>} param1 
     * @returns {HRESULT} 
     */
    AddNewHardware(param0, param1) {
        result := ComCall(16, this, HWND, param0, Guid.Ptr, param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @param {Integer} param1 
     * @param {Pointer<HKEY>} param2 
     * @returns {HRESULT} 
     */
    OpenTypeKey(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(17, this, "ptr", param0, "uint", param1, HKEY.Ptr, param2, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::OpenConfigKey method opens IDirectInputJoyConfig the registry key associated with a joystick configuration.
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Pointer<HKEY>} param2 
     * @returns {HRESULT} Returns DI_OK if successful; otherwise, returns one of the following COM error values: 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DIERR_NOTACQUIRED </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Joystick configuration has not been acquired. You must call <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/nf-dinputd-idirectinputjoyconfig8-acquire">IDirectInputJoyConfig8::Acquire</a> before you can open a joystick type configuration key for writing. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DIERR_INVALIDPARAM </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters was invalid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DIERR_NOTFOUND </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application attempted to open the configuration key for reading, but no configuration key for the joystick had been created. Applications should proceed as if the key were empty. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIN32, ErrorCode) </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Win32 error code if access to the key is denied because of inappropriate registry permissions or some other external factor. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig-openconfigkey
     */
    OpenConfigKey(param0, param1, param2) {
        result := ComCall(18, this, "uint", param0, "uint", param1, HKEY.Ptr, param2, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectInputJoyConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Acquire := CallbackCreate(GetMethod(implObj, "Acquire"), flags, 1)
        this.vtbl.Unacquire := CallbackCreate(GetMethod(implObj, "Unacquire"), flags, 1)
        this.vtbl.SetCooperativeLevel := CallbackCreate(GetMethod(implObj, "SetCooperativeLevel"), flags, 3)
        this.vtbl.SendNotify := CallbackCreate(GetMethod(implObj, "SendNotify"), flags, 1)
        this.vtbl.EnumTypes := CallbackCreate(GetMethod(implObj, "EnumTypes"), flags, 3)
        this.vtbl.GetTypeInfo := CallbackCreate(GetMethod(implObj, "GetTypeInfo"), flags, 4)
        this.vtbl.SetTypeInfo := CallbackCreate(GetMethod(implObj, "SetTypeInfo"), flags, 4)
        this.vtbl.DeleteType := CallbackCreate(GetMethod(implObj, "DeleteType"), flags, 2)
        this.vtbl.GetConfig := CallbackCreate(GetMethod(implObj, "GetConfig"), flags, 4)
        this.vtbl.SetConfig := CallbackCreate(GetMethod(implObj, "SetConfig"), flags, 4)
        this.vtbl.DeleteConfig := CallbackCreate(GetMethod(implObj, "DeleteConfig"), flags, 2)
        this.vtbl.GetUserValues := CallbackCreate(GetMethod(implObj, "GetUserValues"), flags, 3)
        this.vtbl.SetUserValues := CallbackCreate(GetMethod(implObj, "SetUserValues"), flags, 3)
        this.vtbl.AddNewHardware := CallbackCreate(GetMethod(implObj, "AddNewHardware"), flags, 3)
        this.vtbl.OpenTypeKey := CallbackCreate(GetMethod(implObj, "OpenTypeKey"), flags, 4)
        this.vtbl.OpenConfigKey := CallbackCreate(GetMethod(implObj, "OpenConfigKey"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Acquire)
        CallbackFree(this.vtbl.Unacquire)
        CallbackFree(this.vtbl.SetCooperativeLevel)
        CallbackFree(this.vtbl.SendNotify)
        CallbackFree(this.vtbl.EnumTypes)
        CallbackFree(this.vtbl.GetTypeInfo)
        CallbackFree(this.vtbl.SetTypeInfo)
        CallbackFree(this.vtbl.DeleteType)
        CallbackFree(this.vtbl.GetConfig)
        CallbackFree(this.vtbl.SetConfig)
        CallbackFree(this.vtbl.DeleteConfig)
        CallbackFree(this.vtbl.GetUserValues)
        CallbackFree(this.vtbl.SetUserValues)
        CallbackFree(this.vtbl.AddNewHardware)
        CallbackFree(this.vtbl.OpenTypeKey)
        CallbackFree(this.vtbl.OpenConfigKey)
    }
}
