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
 * IDirectInputJoyConfig8 interface contains methods that allow hardware developers who are writing property sheets to write and read information to and from the registry.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/nn-dinputd-idirectinputjoyconfig8
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct IDirectInputJoyConfig8 extends IUnknown {
    /**
     * The interface identifier for IDirectInputJoyConfig8
     * @type {Guid}
     */
    static IID := Guid("{eb0d7dfa-1990-4f27-b4d6-edf2eec4a44c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectInputJoyConfig8 interfaces
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
        OpenAppStatusKey    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectInputJoyConfig8.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDirectInputJoyConfig8::Acquire method acquires &quot;joystick configuration mode.&quot; Only one application can be in joystick configuration mode at a time; subsequent attempts by other applications to acquire this mode should receive the error DIERR_OTHERAPPHASPRIO. After entering configuration mode, the application can make alterations to the global joystick configuration settings. The application should check the existing settings before installing the new ones in case another application changed the settings in the interim.
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
     * <dt><b>DIERR_OTHERAPPHASPRIO </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another application is already in joystick configuration mode. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DIERR_INSUFFICIENTPRIVS </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current user does not have the necessary permissions to alter the joystick configuration. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DIERR_DEVICECHANGE </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another application has changed the global joystick configuration. The interface needs to be reinitialized. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-acquire
     */
    Acquire() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::Unacquire method unacquires &quot;joystick configuration mode&quot;.
     * @remarks
     * Before unacquiring configuration mode, the application performs an <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/nf-dinputd-idirectinputjoyconfig8-sendnotify">IDirectInputJoyConfig8::SendNotify</a> to propagate the changes in the joystick configuration to all device drivers and applications. Applications that hold interfaces to a joystick that is materially affected by a change in configuration should receive the DIERR_DEVICECHANGE error code until the device is reinitialized. Examples of material changes to configuration include altering the number of axes or the number of buttons. In comparison, changes to device calibration are handled internally by DirectInput and are transparent to the application.
     * @returns {HRESULT} Returns DI_OK if successful; otherwise, returns a COM error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-unacquire
     */
    Unacquire() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::SetCooperativeLevel method establishes the cooperation level for the instance of the device. The only cooperative levels supported for the IDirectInputJoyConfig8 interface are DISCL_EXCLUSIVE and DISCL_BACKGROUND.
     * @param {HWND} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} Returns DI_OK if successful; otherwise, returns the following COM error value (this value is intended to be illustrative and is not necessarily comprehensive): 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-setcooperativelevel
     */
    SetCooperativeLevel(param0, param1) {
        result := ComCall(5, this, HWND, param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::SendNotify method notifies device drivers and applications that changes to the device configuration have been made.
     * @returns {HRESULT} Returns DI_OK if successful; otherwise, returns the following COM error value (this value is intended to be illustrative and is not necessarily comprehensive): 
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
     * Joystick configuration has not been acquired. You must call <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/nf-dinputd-idirectinputjoyconfig8-acquire">IDirectInputJoyConfig8::Acquire</a> before you can notify applications and drivers of changes to joystick configuration. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-sendnotify
     */
    SendNotify() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::EnumTypes method enumerates the joystick types currently supported by DirectInput.
     * @remarks
     * This callback receives DirectInput joystick types as a result of a call to the IDirectInputJoyConfig8::EnumTypes method.
     * 
     * 
     * ``` syntax
     * 
     * 
     * //
     * Parameters
     * pwszTypeName 
     * Points to the name of the joystick type. A buffer of MAX_JOYSTRING characters is sufficient to hold the type name. The type name should never be shown to the end user; instead, the "display name" should be shown. Use IDirectInputJoyConfig8::GetTypeInfo to obtain the display name of a joystick type. Type names that begin with a pound sign ("#") represent predefined types that cannot be modified or deleted. 
     * 
     * pvRef 
     * Points to the application-defined value given in the IDirectInputJoyConfig8::EnumTypes method.
     * 
     * Return value
     * Returns a BOOL value, DIENUM_CONTINUE, to continue the enumeration, or DIENUM_STOP to stop the enumeration. 
     * 
     * 
     * 
     * 
     * BOOL DIEnumJoyTypeProc(
     *    LPCWSTR pwszTypeName,
     *    LPVOID  pvRef
     * );
     *  
     * 
     * 
     * 
     * ```
     * @param {Pointer<LPDIJOYTYPECALLBACK>} param0 
     * @param {Pointer<Void>} param1 
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
     * <dt><b>DIERR_INVALIDPARAM </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters was invalid. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-enumtypes
     */
    EnumTypes(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ptr", param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::GetTypeInfo method obtains information about a joystick type.
     * @param {PWSTR} param0 
     * @param {Pointer<DIJOYTYPEINFO>} param1 
     * @param {Integer} param2 
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
     * The joystick type was not found. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-gettypeinfo
     */
    GetTypeInfo(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(8, this, "ptr", param0, DIJOYTYPEINFO.Ptr, param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::SetTypeInfo method creates a new joystick type or redefines information about an existing joystick type.
     * @param {PWSTR} param0 
     * @param {Pointer<DIJOYTYPEINFO>} param1 
     * @param {Integer} param2 
     * @param {PWSTR} param3 
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
     * Joystick configuration has not been acquired. You must call <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/nf-dinputd-idirectinputjoyconfig8-acquire">IDirectInputJoyConfig8::Acquire</a> before you can notify applications and drivers of changes to joystick configuration. 
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
     * <dt><b>DIERR_READONLY </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attempted to change a predefined type. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-settypeinfo
     */
    SetTypeInfo(param0, param1, param2, param3) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param3 := param3 is String ? StrPtr(param3) : param3

        result := ComCall(9, this, "ptr", param0, DIJOYTYPEINFO.Ptr, param1, "uint", param2, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::DeleteType method removes information about a joystick type. Use this method with caution; it is the caller's responsibility to ensure that no joystick refers to the deleted type.
     * @param {PWSTR} param0 
     * @returns {HRESULT} Returns DI_OK if successful; otherwise, returns one of the following COM error values (these values are intended to be illustrative and are not necessarily comprehensive): 
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
     * Joystick configuration has not been acquired. You must call <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/nf-dinputd-idirectinputjoyconfig8-acquire">IDirectInputJoyConfig8::Acquire</a> before you can alter joystick configuration settings. 
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-deletetype
     */
    DeleteType(param0) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(10, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::GetConfig method obtains information about a joystick's configuration.
     * @param {Integer} param0 
     * @param {Pointer<DIJOYCONFIG>} param1 
     * @param {Integer} param2 
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
     * <dt><b>S_FALSE </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified joystick has not yet been configured. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DIERR_NOMOREITEMS </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more joysticks are available. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-getconfig
     */
    GetConfig(param0, param1, param2) {
        result := ComCall(11, this, "uint", param0, DIJOYCONFIG.Ptr, param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::SetConfig method creates or redefines configuration information about a joystick.
     * @param {Integer} param0 
     * @param {Pointer<DIJOYCONFIG>} param1 
     * @param {Integer} param2 
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
     * Joystick configuration has not been acquired. You must call <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/nf-dinputd-idirectinputjoyconfig8-acquire">IDirectInputJoyConfig8::Acquire</a> before you can notify applications and drivers of changes to joystick configuration. 
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-setconfig
     */
    SetConfig(param0, param1, param2) {
        result := ComCall(12, this, "uint", param0, DIJOYCONFIG.Ptr, param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::DeleteConfig method deletes configuration information about a joystick.
     * @param {Integer} param0 
     * @returns {HRESULT} Returns DI_OK if successful; otherwise, returns one of the following COM error values (these values are intended to be illustrative and are not necessarily comprehensive): 
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
     * Joystick configuration has not been acquired. You must call <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/nf-dinputd-idirectinputjoyconfig8-acquire">IDirectInputJoyConfig8::Acquire</a> before you can alter joystick configuration settings. 
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-deleteconfig
     */
    DeleteConfig(param0) {
        result := ComCall(13, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::GetUserValues method obtains information about user settings for the joystick.
     * @param {Pointer<DIJOYUSERVALUES>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} Returns DI_OK if successful; otherwise, returns the following COM error value: 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-getuservalues
     */
    GetUserValues(param0, param1) {
        result := ComCall(14, this, DIJOYUSERVALUES.Ptr, param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::SetUserValues method sets the user settings for the joystick.
     * @param {Pointer<DIJOYUSERVALUES>} param0 
     * @param {Integer} param1 
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
     * Joystick configuration has not been acquired. You must call <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/nf-dinputd-idirectinputjoyconfig8-acquire">IDirectInputJoyConfig8::Acquire</a> before you can notify applications and drivers of changes to joystick configuration. 
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-setuservalues
     */
    SetUserValues(param0, param1) {
        result := ComCall(15, this, DIJOYUSERVALUES.Ptr, param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::AddNewHardware method displays the Add New Hardware dialog box which guides the user through installing a new input device.
     * @param {HWND} param0 
     * @param {Pointer<Guid>} param1 
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
     * <dt><b>DIERR_INVALIDPARAM </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (E_INVALIDARG). One or more parameters was invalid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DIERR_INVALIDCLASSINSTALLER </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The class installer for the specified device could not be found or is invalid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DIERR_CANCELLED </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user canceled the operation. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DIERR_BADINF </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The INF file for the device that the user selected could not be found or is invalid or damaged. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DirectInput could not determine whether the operation completed successfully. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-addnewhardware
     */
    AddNewHardware(param0, param1) {
        result := ComCall(16, this, HWND, param0, Guid.Ptr, param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::OpenTypeKey method opens the registry key associated with a joystick type.
     * @remarks
     * Control panel applications can use the registry key opened by this method to store per-type persistent information, such as global configuration parameters. Such private information should be kept in a subkey named <b>OEM</b>; do not store private information in the main type key. Control panel applications can also use this key to read configuration information, such as the strings to use for device calibration prompts. The application should use <b>RegCloseKey</b> to close the registry key.
     * @param {PWSTR} param0 
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
     * <dt><b>MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WIN32, ErrorCode) </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Win32 error code if access to the key is denied by registry permissions or some other external factor. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-opentypekey
     */
    OpenTypeKey(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(17, this, "ptr", param0, "uint", param1, HKEY.Ptr, param2, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::OpenAppStatusKey method opens the root key of the application status registry keys, and obtains a handle to the key as a return parameter.
     * @remarks
     * The registry key handle returned in the <i>phKey</i> parameter can be used with the standard Win32 registry functions. The Dinputd.h header file defines the following string constants for use in accessing subkeys and named values contained by the application status root key.
     * @param {Pointer<HKEY>} param0 
     * @returns {HRESULT} Returns DI_OK if successful; otherwise, returns one of the following COM error values. The following error codes are intended to be illustrative and not necessarily comprehensive.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DIERR_INVALIDPARAM</b></dt>
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
     * <dt><b>DIERR_NOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is missing on this system. Applications should proceed as if the key were empty. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputjoyconfig8-openappstatuskey
     */
    OpenAppStatusKey(param0) {
        result := ComCall(18, this, HKEY.Ptr, param0, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectInputJoyConfig8.IID.Equals(iid)) {
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
        this.vtbl.SetTypeInfo := CallbackCreate(GetMethod(implObj, "SetTypeInfo"), flags, 5)
        this.vtbl.DeleteType := CallbackCreate(GetMethod(implObj, "DeleteType"), flags, 2)
        this.vtbl.GetConfig := CallbackCreate(GetMethod(implObj, "GetConfig"), flags, 4)
        this.vtbl.SetConfig := CallbackCreate(GetMethod(implObj, "SetConfig"), flags, 4)
        this.vtbl.DeleteConfig := CallbackCreate(GetMethod(implObj, "DeleteConfig"), flags, 2)
        this.vtbl.GetUserValues := CallbackCreate(GetMethod(implObj, "GetUserValues"), flags, 3)
        this.vtbl.SetUserValues := CallbackCreate(GetMethod(implObj, "SetUserValues"), flags, 3)
        this.vtbl.AddNewHardware := CallbackCreate(GetMethod(implObj, "AddNewHardware"), flags, 3)
        this.vtbl.OpenTypeKey := CallbackCreate(GetMethod(implObj, "OpenTypeKey"), flags, 4)
        this.vtbl.OpenAppStatusKey := CallbackCreate(GetMethod(implObj, "OpenAppStatusKey"), flags, 2)
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
        CallbackFree(this.vtbl.OpenAppStatusKey)
    }
}
