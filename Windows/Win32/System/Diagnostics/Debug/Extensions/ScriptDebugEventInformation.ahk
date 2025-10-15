#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include .\ScriptDebugPosition.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class ScriptDebugEventInformation extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    DebugEvent {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {ScriptDebugPosition}
     */
    EventPosition{
        get {
            if(!this.HasProp("__EventPosition"))
                this.__EventPosition := ScriptDebugPosition(this.ptr + 8)
            return this.__EventPosition
        }
    }

    /**
     * @type {ScriptDebugPosition}
     */
    EventSpanEnd{
        get {
            if(!this.HasProp("__EventSpanEnd"))
                this.__EventSpanEnd := ScriptDebugPosition(this.ptr + 16)
            return this.__EventSpanEnd
        }
    }

    class _ExceptionInformation extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        IsUncaught {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
    }

    class _BreakpointInformation extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        BreakpointId {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    /**
     * @type {_ExceptionInformation}
     */
    ExceptionInformation{
        get {
            if(!this.HasProp("__ExceptionInformation"))
                this.__ExceptionInformation := %this.__Class%._ExceptionInformation(this.ptr + 24)
            return this.__ExceptionInformation
        }
    }

    /**
     * @type {_BreakpointInformation}
     */
    BreakpointInformation{
        get {
            if(!this.HasProp("__BreakpointInformation"))
                this.__BreakpointInformation := %this.__Class%._BreakpointInformation(this.ptr + 24)
            return this.__BreakpointInformation
        }
    }
}
