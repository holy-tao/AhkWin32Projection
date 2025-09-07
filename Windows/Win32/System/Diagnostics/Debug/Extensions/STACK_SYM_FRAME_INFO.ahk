#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include .\DEBUG_STACK_FRAME_EX.ahk
#Include .\STACK_SRC_INFO.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class STACK_SYM_FRAME_INFO extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * @type {DEBUG_STACK_FRAME_EX}
     */
    StackFrameEx{
        get {
            if(!this.HasProp("__StackFrameEx"))
                this.__StackFrameEx := DEBUG_STACK_FRAME_EX(this.ptr + 0)
            return this.__StackFrameEx
        }
    }

    /**
     * @type {STACK_SRC_INFO}
     */
    SrcInfo{
        get {
            if(!this.HasProp("__SrcInfo"))
                this.__SrcInfo := STACK_SRC_INFO(this.ptr + 136)
            return this.__SrcInfo
        }
    }
}
