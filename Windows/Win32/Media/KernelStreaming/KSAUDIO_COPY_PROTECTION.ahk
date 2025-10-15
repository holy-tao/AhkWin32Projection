#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSAUDIO_COPY_PROTECTION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    fCopyrighted{
        get {
            if(!this.HasProp("__fCopyrighted"))
                this.__fCopyrighted := BOOL(this.ptr + 0)
            return this.__fCopyrighted
        }
    }

    /**
     * @type {BOOL}
     */
    fOriginal{
        get {
            if(!this.HasProp("__fOriginal"))
                this.__fOriginal := BOOL(this.ptr + 4)
            return this.__fOriginal
        }
    }
}
