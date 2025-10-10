#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Provides information about the parameter on the stack.
 * @see https://docs.microsoft.com/windows/win32/api//callobj/ns-callobj-callframeparaminfo
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class CALLFRAMEPARAMINFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * <b>TRUE</b> if this is an [in] parameter; otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    fIn {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * <b>TRUE</b> if this is an [out] parameter; otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    fOut {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Represents the offset in bytes from the stack location of the frame to the start of the parameter.
     * @type {Integer}
     */
    stackOffset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Represents the size in bytes occupied by the parameter on the stack.
     * @type {Integer}
     */
    cbParam {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
