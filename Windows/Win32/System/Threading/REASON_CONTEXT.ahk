#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HMODULE.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about a power request. This structure is used by the PowerCreateRequest and SetWaitableTimerEx functions.
 * @remarks
 * It is safe to pass read-only strings as the <i>SimpleReasonString</i> or <i>ReasonStrings</i> because the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-powercreaterequest">PowerCreateRequest</a> and <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-setwaitabletimerex">SetWaitableTimerEx</a> functions read from the strings and do not write to them.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-reason_context
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class REASON_CONTEXT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The version number of the structure. This parameter must be set to 
     *       <b>POWER_REQUEST_CONTEXT_VERSION</b>.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {HMODULE}
     */
    LocalizedReasonModule{
        get {
            if(!this.HasProp("__LocalizedReasonModule"))
                this.__LocalizedReasonModule := HMODULE(this.ptr + 8)
            return this.__LocalizedReasonModule
        }
    }

    /**
     * @type {Integer}
     */
    LocalizedReasonId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ReasonStringCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    ReasonStrings {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {PWSTR}
     */
    SimpleReasonString{
        get {
            if(!this.HasProp("__SimpleReasonString"))
                this.__SimpleReasonString := PWSTR(this.ptr + 8)
            return this.__SimpleReasonString
        }
    }
}
