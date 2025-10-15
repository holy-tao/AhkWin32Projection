#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSAC3_ALTERNATE_AUDIO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    fStereo{
        get {
            if(!this.HasProp("__fStereo"))
                this.__fStereo := BOOL(this.ptr + 0)
            return this.__fStereo
        }
    }

    /**
     * @type {Integer}
     */
    DualMode {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
