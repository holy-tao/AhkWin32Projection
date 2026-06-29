#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ScriptDebugEvent.ahk" { ScriptDebugEvent }
#Import ".\ScriptDebugPosition.ahk" { ScriptDebugPosition }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct ScriptDebugEventInformation {
    #StructPack 8


    struct _u {

        struct _ExceptionInformation {
            IsUncaught : Int8

        }

        struct _BreakpointInformation {
            BreakpointId : Int64

        }

        ExceptionInformation : ScriptDebugEventInformation._u._ExceptionInformation

        static __New() {
            DefineProp(this.Prototype, 'BreakpointInformation', { type: ScriptDebugEventInformation._u._BreakpointInformation, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    DebugEvent : ScriptDebugEvent

    EventPosition : ScriptDebugPosition

    EventSpanEnd : ScriptDebugPosition

    u : ScriptDebugEventInformation._u

}
