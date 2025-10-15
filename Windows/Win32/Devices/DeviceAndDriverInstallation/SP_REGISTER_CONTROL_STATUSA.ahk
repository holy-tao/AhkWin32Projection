#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The SP_REGISTER_CONTROL_STATUS structure contains information about a file being registered or unregistered using the RegisterDlls INF directive to self-register DLLs on Windows 2000.
 * @remarks
 * 
  * > [!NOTE]
  * > The setupapi.h header defines SP_REGISTER_CONTROL_STATUS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//setupapi/ns-setupapi-sp_register_control_statusa
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_REGISTER_CONTROL_STATUSA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Fully qualified path of the file being registered or unregistered.
     * @type {PSTR}
     */
    FileName{
        get {
            if(!this.HasProp("__FileName"))
                this.__FileName := PSTR(this.ptr + 8)
            return this.__FileName
        }
    }

    /**
     * For an SPFILENOTIFY_STARTREGISTRATION notification, this member is not used and should be set to NO_ERROR. For a SPFILENOTIFY_ENDREGISTRATION notification, set to a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @type {Integer}
     */
    Win32Error {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * For a SPFILENOTIFY_STARTREGISTRATION notification, this member is not used and should be set to SPREG_SUCCESS. For a SPFILENOTIFY_ENDREGISTRATION notification, set to one of the following failure codes that indicate the result of registration. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SPREG_SUCCESS"></a><a id="spreg_success"></a><dl>
     * <dt><b>SPREG_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file was successfully registered or unregistered. <b>WinError</b> not used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SPREG_LOADLIBRARY"></a><a id="spreg_loadlibrary"></a><dl>
     * <dt><b>SPREG_LOADLIBRARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>LoadLibrary</b> failed for the file. <b>WinError</b> contains an extended error code from the component.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SPREG_GETPROCADDR"></a><a id="spreg_getprocaddr"></a><dl>
     * <dt><b>SPREG_GETPROCADDR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>GetProcAddress</b> failed for the file. <b>WinError</b> contains an extended error code from the component.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SPREG_REGSVR"></a><a id="spreg_regsvr"></a><dl>
     * <dt><b>SPREG_REGSVR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>DLLRegisterServer</b> entry point returned failure. <b>WinError</b> contains an extended error code from the component.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SPREG_DLLINSTALL"></a><a id="spreg_dllinstall"></a><dl>
     * <dt><b>SPREG_DLLINSTALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>DLLInstall</b> entry point returned failure. <b>WinError</b> contains an extended error code from the component.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SPREG_TIMEOUT"></a><a id="spreg_timeout"></a><dl>
     * <dt><b>SPREG_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file registration or unregistration exceeded the specified timeout. <b>WinError</b> is set to ERROR_TIMEOUT.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SPREG_UNKNOWN"></a><a id="spreg_unknown"></a><dl>
     * <dt><b>SPREG_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * File registration or unregistration failed for an unknown reason. <b>WinError</b> indicates an extended error code from the component.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    FailureCode {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 24
    }
}
