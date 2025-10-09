#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
    static sizeof => 32

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

    class _Detailed extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        LocalizedReasonModule {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        LocalizedReasonId {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        ReasonStringCount {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        ReasonStrings {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    /**
     * @type {_Detailed}
     */
    Detailed{
        get {
            if(!this.HasProp("__Detailed"))
                this.__Detailed := %this.__Class%._Detailed(this.ptr + 8)
            return this.__Detailed
        }
    }

    /**
     * @type {Pointer<Char>}
     */
    SimpleReasonString {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
