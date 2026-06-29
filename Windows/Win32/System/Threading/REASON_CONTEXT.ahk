#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POWER_REQUEST_CONTEXT_FLAGS.ahk" { POWER_REQUEST_CONTEXT_FLAGS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }

/**
 * Contains information about a power request. This structure is used by the PowerCreateRequest and SetWaitableTimerEx functions.
 * @remarks
 * It is safe to pass read-only strings as the <i>SimpleReasonString</i> or <i>ReasonStrings</i> because the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-powercreaterequest">PowerCreateRequest</a> and <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-setwaitabletimerex">SetWaitableTimerEx</a> functions read from the strings and do not write to them.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-reason_context
 * @namespace Windows.Win32.System.Threading
 */
export default struct REASON_CONTEXT {
    #StructPack 8


    struct _Reason {

        struct _Detailed {
            LocalizedReasonModule : HMODULE

            LocalizedReasonId : UInt32

            ReasonStringCount : UInt32

            ReasonStrings : PWSTR.Ptr

        }

        Detailed : REASON_CONTEXT._Reason._Detailed

        static __New() {
            DefineProp(this.Prototype, 'SimpleReasonString', { type: PWSTR, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * The version number of the structure. This parameter must be set to 
     *       <b>POWER_REQUEST_CONTEXT_VERSION</b>.
     */
    Version : UInt32

    Flags : POWER_REQUEST_CONTEXT_FLAGS

    /**
     * A union that consists of either a <b>Detailed</b> structure or a string.
     */
    Reason : REASON_CONTEXT._Reason

}
