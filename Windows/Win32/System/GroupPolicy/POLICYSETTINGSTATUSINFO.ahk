#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * The POLICYSETTINGSTATUSINFO structure provides information about a policy-setting event.
 * @see https://learn.microsoft.com/windows/win32/api/userenv/ns-userenv-policysettingstatusinfo
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class POLICYSETTINGSTATUSINFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * This member is optional. If it is <b>NULL</b>, the system generates a value.
     * @type {Pointer<Ptr>}
     */
    szKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a string specifying the name of the source (application, service, driver, subsystem) that generated the log entry.
     * @type {Pointer<Ptr>}
     */
    szEventSource {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a string specifying the name of the event log.
     * @type {Pointer<Ptr>}
     */
    szEventLogName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the event log message ID.
     * @type {Integer}
     */
    dwEventID {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a> that indicates an error that occurred during the application of the policy setting.
     * @type {Integer}
     */
    dwErrorCode {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * 
     * @type {Integer}
     */
    status {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Specifies a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that indicates the time at which the source generated the event.
     * @type {SYSTEMTIME}
     */
    timeLogged{
        get {
            if(!this.HasProp("__timeLogged"))
                this.__timeLogged := SYSTEMTIME(this.ptr + 40)
            return this.__timeLogged
        }
    }
}
