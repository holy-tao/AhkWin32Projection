#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DIJOYCONFIG.ahk
#Include .\DIJOYTYPEINFO.ahk
#Include .\DIJOYUSERVALUES.ahk
#Include .\LPDIJOYTYPECALLBACK.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Registry\HKEY.ahk

/**
 * IDirectInputJoyConfig8 interface contains methods that allow hardware developers who are writing property sheets to write and read information to and from the registry.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/nn-dinputd-idirectinputjoyconfig8
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
class IDirectInputJoyConfig8 extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectInputJoyConfig8
     * @type {Guid}
     */
    static IID => Guid("{eb0d7dfa-1990-4f27-b4d6-edf2eec4a44c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Acquire", "Unacquire", "SetCooperativeLevel", "SendNotify", "EnumTypes", "GetTypeInfo", "SetTypeInfo", "DeleteType", "GetConfig", "SetConfig", "DeleteConfig", "GetUserValues", "SetUserValues", "AddNewHardware", "OpenTypeKey", "OpenAppStatusKey"]

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
     * @param {HWND} param0 Handle to the window associated with the interface. This parameter must be non-NULL and must be a top-level window. It is an error to destroy the window while it is still associated with an <b>IDirectInputJoyConfig8</b> interface.
     * @param {Integer} param1 Specifies one of a set of flags that describe the  level of cooperation associated with the device. The value must be DISCL_EXCLUSIVE | DISCL_BACKGROUND.
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
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(5, this, "ptr", param0, "uint", param1, "HRESULT")
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
     * @param {Pointer<LPDIJOYTYPECALLBACK>} param0 Points to an application-defined callback function that receives the DirectInput joystick types. See the Remarks section for the function prototype.
     * @param {Pointer<Void>} param1 Specifies a 32-bit application-defined value to be passed to the callback function. This value can be any 32-bit value; it is prototyped as an LPVOID for convenience.
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
     * @param {PWSTR} param0 Points to the name of the type, previously obtained from a call to <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/nf-dinputd-idirectinputjoyconfig8-enumtypes">IDirectInputJoyConfig8::EnumTypes</a>.
     * @param {Pointer<DIJOYTYPEINFO>} param1 Points to a structure that receives information about the joystick type. The caller must initialize the <b>dwSize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/ns-dinputd-dijoytypeinfo">DIJOYTYPEINFO</a> structure before calling this method.
     * @param {Integer} param2 Specifies the parts of the DIJOYTYPEINFO structure pointed to by <i>pjti</i> that are to be filled. There may be zero, one, or more of the following:
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

        result := ComCall(8, this, "ptr", param0, "ptr", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::SetTypeInfo method creates a new joystick type or redefines information about an existing joystick type.
     * @param {PWSTR} param0 Points to the name of the type. The name of the type cannot exceed MAX_JOYSTRING characters, including the terminating null character. If the type name does not already exist, then it is created. You cannot change the type information for a predefined type. The name cannot begin with a "#" character. Types beginning with "#" are reserved by DirectInput.
     * @param {Pointer<DIJOYTYPEINFO>} param1 Points to a structure that receives information about the joystick type.
     * @param {Integer} param2 Specifies the parts of the <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/ns-dinputd-dijoytypeinfo">DIJOYTYPEINFO</a> structure pointed to by <i>pjti</i> that contain values to be set.
     * @param {PWSTR} param3 If the type name is an OEM type not in VID_xxxx&PID_yyyy format, this parameter will return the name in VID_xxxx&PID_yyyy format that is assigned by Dinput. 
     * This VID_xxxx&PID_yyyy name should be used in DIJOYCONFIG.wszType field when calling SetConfig.
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

        result := ComCall(9, this, "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::DeleteType method removes information about a joystick type. Use this method with caution; it is the caller's responsibility to ensure that no joystick refers to the deleted type.
     * @param {PWSTR} param0 Points to the name of the type. The name of the type cannot exceed MAX_PATH characters, including the terminating null character. Also, the name cannot begin with a "#" character. Types beginning with "#" are reserved by DirectInput.
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
     * @param {Integer} param0 Indicates a joystick identification number. This is a nonnegative integer. To enumerate joysticks, begin with joystick zero and increment the joystick number by one until the function returns DIERR_NOMOREITEMS.
     * @param {Pointer<DIJOYCONFIG>} param1 Points to a structure that receives information about the joystick configuration. The caller "must" initialize the <b>dwSize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/ns-dinputd-dijoyconfig">DIJOYCONFIG</a> structure before calling this method.
     * @param {Integer} param2 Specifies the members of the structure pointed to by <i>pjc</i> that are to be filled in.  This parameter can be zero, one, or more of the following:
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
        result := ComCall(11, this, "uint", param0, "ptr", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::SetConfig method creates or redefines configuration information about a joystick.
     * @param {Integer} param0 Indicates a zero-based joystick identification number.
     * @param {Pointer<DIJOYCONFIG>} param1 Contains information about the joystick.
     * @param {Integer} param2 Specifies the parts of the <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/ns-dinputd-dijoyconfig">DIJOYCONFIG</a> structure pointed to by <i>pcfg</i> that contain information to be set. There may be zero, one, or more of the following:
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
        result := ComCall(12, this, "uint", param0, "ptr", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::DeleteConfig method deletes configuration information about a joystick.
     * @param {Integer} param0 Indicates a zero-based joystick identification number.
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
     * @param {Pointer<DIJOYUSERVALUES>} param0 Points to a structure that receives information about the user joystick configuration. The caller must initialize the <b>dwSize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/ns-dinputd-dijoyuservalues">DIJOYUSERVALUES</a> structure before calling this method.
     * @param {Integer} param1 Specifies which members of the DIJOYUSERVALUES structure contain values to be retrieved. There may be zero, one, or more of the following:
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
        result := ComCall(14, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::SetUserValues method sets the user settings for the joystick.
     * @param {Pointer<DIJOYUSERVALUES>} param0 Points to a structure that receives information about the new user joystick settings.
     * @param {Integer} param1 Specifies the parts of the <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/ns-dinputd-dijoyuservalues">DIJOYUSERVALUES</a> structure that contain values to be set.  There may be zero, one, or more of the following:
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
        result := ComCall(15, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::AddNewHardware method displays the Add New Hardware dialog box which guides the user through installing a new input device.
     * @param {HWND} param0 Handle to the window that functions as the owner window for the user interface.
     * @param {Pointer<Guid>} param1 GUID that specifies the class of the hardware device to be added. DirectInput comes with the following class GUIDs already defined:
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
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(16, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::OpenTypeKey method opens the registry key associated with a joystick type.
     * @remarks
     * Control panel applications can use the registry key opened by this method to store per-type persistent information, such as global configuration parameters. Such private information should be kept in a subkey named <b>OEM</b>; do not store private information in the main type key. Control panel applications can also use this key to read configuration information, such as the strings to use for device calibration prompts. The application should use <b>RegCloseKey</b> to close the registry key.
     * @param {PWSTR} param0 Points to the name of the type. The name of the type cannot exceed MAX_PATH characters, including the terminating null character. The name cannot begin with a "#" character. Types beginning with "#" are reserved by DirectInput.
     * @param {Integer} param1 Specifies a registry security access mask. This can be any of the values permitted by the <b>RegOpenKeyEx</b> function. If write access is requested, then joystick configuration must first have been acquired. If only read access is requested, then acquisition is not required.
     * @param {Pointer<HKEY>} param2 Points to the opened registry key, on success.
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

        result := ComCall(17, this, "ptr", param0, "uint", param1, "ptr", param2, "HRESULT")
        return result
    }

    /**
     * The IDirectInputJoyConfig8::OpenAppStatusKey method opens the root key of the application status registry keys, and obtains a handle to the key as a return parameter.
     * @remarks
     * The registry key handle returned in the <i>phKey</i> parameter can be used with the standard Win32 registry functions. The Dinputd.h header file defines the following string constants for use in accessing subkeys and named values contained by the application status root key.
     * @param {Pointer<HKEY>} param0 Points to the address of a variable (of type HKEY) that will contain a registry key handle if the method succeeds. See Remarks for additional usage details.
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
        result := ComCall(18, this, "ptr", param0, "HRESULT")
        return result
    }
}
