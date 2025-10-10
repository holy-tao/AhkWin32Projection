#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the action the service controller should take on each failure of a service. A service is considered failed when it terminates without reporting a status of SERVICE_STOPPED to the service controller.
 * @remarks
 * 
  * The service control manager counts the number of times each service has failed since the system booted. The count is reset to 0 if the service has not failed for <b>dwResetPeriod</b> seconds. When the service fails for the <i>N</i>th time, the service controller performs the action specified in element [<i>N</i>-1] of the <b>lpsaActions</b> array. If <i>N</i> is greater than <i>cActions</i>, the service controller repeats the last action in the array.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winsvc.h header defines SERVICE_FAILURE_ACTIONS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsvc/ns-winsvc-service_failure_actionsw
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 * @charset Unicode
 */
class SERVICE_FAILURE_ACTIONSW extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The time after which to reset the failure count to zero if there are no failures, in seconds. Specify <b>INFINITE</b> to indicate that this value should never be reset.
     * @type {Integer}
     */
    dwResetPeriod {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The message to be broadcast to server users before rebooting in response to the <b>SC_ACTION_REBOOT</b> service controller action. 
     * 
     * 
     * 
     * 
     * If this value is <b>NULL</b>, the reboot message is unchanged. If the value is an empty string (""), the reboot message is deleted and no message is broadcast.
     * 
     * This member can specify a localized string using the following format:
     * 
     * @[<i>path</i>\]<i>dllname</i>,-<i>strID</i>
     * 
     * The string with identifier <i>strID</i> is loaded from <i>dllname</i>; the <i>path</i> is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadmuistringa">RegLoadMUIString</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Localized strings are not supported until Windows Vista.
     * @type {Pointer<Char>}
     */
    lpRebootMsg {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The command line of the process for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function to execute in response to the <b>SC_ACTION_RUN_COMMAND</b> service controller action. This process runs under the same account as the service. 
     * 
     * 
     * 
     * 
     * If this value is <b>NULL</b>, the command is unchanged. If the value is an empty string (""), the command is deleted and no program is run when the service fails.
     * @type {Pointer<Char>}
     */
    lpCommand {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The number of elements in the <b>lpsaActions</b> array. 
     * 
     * 
     * 
     * 
     * If this value is 0, but <b>lpsaActions</b> is not NULL, the reset period and array of failure actions are deleted.
     * @type {Integer}
     */
    cActions {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-sc_action">SC_ACTION</a> structures. 
     * 
     * 
     * 
     * 
     * If this value is NULL, the <b>cActions</b> and <b>dwResetPeriod</b> members are ignored.
     * @type {Pointer<SC_ACTION>}
     */
    lpsaActions {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
