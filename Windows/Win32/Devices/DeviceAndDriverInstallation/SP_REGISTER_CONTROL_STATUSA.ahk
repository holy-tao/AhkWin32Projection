#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The SP_REGISTER_CONTROL_STATUS structure contains information about a file being registered or unregistered using the RegisterDlls INF directive to self-register DLLs on Windows 2000. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The setupapi.h header defines SP_REGISTER_CONTROL_STATUS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_register_control_statusa
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset ANSI
 * @architecture X64, Arm64
 */
export default struct SP_REGISTER_CONTROL_STATUSA {
    #StructPack 8

    cbSize : UInt32 := this.Size

    /**
     * Fully qualified path of the file being registered or unregistered.
     */
    FileName : PSTR

    /**
     * For an SPFILENOTIFY_STARTREGISTRATION notification, this member is not used and should be set to NO_ERROR. For a SPFILENOTIFY_ENDREGISTRATION notification, set to a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
     */
    Win32Error : UInt32

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
     */
    FailureCode : UInt32

}
