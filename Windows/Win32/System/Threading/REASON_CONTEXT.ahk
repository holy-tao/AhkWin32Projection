#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HMODULE.ahk

/**
 * Contains information about a power request. This structure is used by the PowerCreateRequest and SetWaitableTimerEx functions.
 * @see https://docs.microsoft.com/windows/win32/api//minwinbase/ns-minwinbase-reason_context
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class REASON_CONTEXT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class _Reason_e__Union extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        class _Detailed extends Win32Struct {
            static sizeof => 24
            static packingSize => 8
    
            /**
             * @type {HMODULE}
             */
            LocalizedReasonModule{
                get {
                    if(!this.HasProp("__LocalizedReasonModule"))
                        this.__LocalizedReasonModule := HMODULE(0, this)
                    return this.__LocalizedReasonModule
                }
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
             * @type {Pointer<PWSTR>}
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
                    this.__Detailed := %this.__Class%._Detailed(0, this)
                return this.__Detailed
            }
        }
    
        /**
         * @type {PWSTR}
         */
        SimpleReasonString {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

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
     * A union that consists of either a <b>Detailed</b> structure or a string.
     * @type {_Reason_e__Union}
     */
    Reason{
        get {
            if(!this.HasProp("__Reason"))
                this.__Reason := %this.__Class%._Reason_e__Union(8, this)
            return this.__Reason
        }
    }
}
