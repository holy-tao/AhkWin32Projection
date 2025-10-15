#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSAC3_ERROR_CONCEALMENT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    fRepeatPreviousBlock{
        get {
            if(!this.HasProp("__fRepeatPreviousBlock"))
                this.__fRepeatPreviousBlock := BOOL(this.ptr + 0)
            return this.__fRepeatPreviousBlock
        }
    }

    /**
     * @type {BOOL}
     */
    fErrorInCurrentBlock{
        get {
            if(!this.HasProp("__fErrorInCurrentBlock"))
                this.__fErrorInCurrentBlock := BOOL(this.ptr + 4)
            return this.__fErrorInCurrentBlock
        }
    }
}
