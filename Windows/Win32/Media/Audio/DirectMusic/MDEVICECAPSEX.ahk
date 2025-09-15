#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The MDEVICECAPSEX structure contains device capability information for Plug and Play (PnP) device drivers.
 * @see https://learn.microsoft.com/windows/win32/api/mmddk/ns-mmddk-mdevicecapsex
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class MDEVICECAPSEX extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the size of the structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the capabilities of the device. The format of this data is device specific.
     * @type {Pointer<Void>}
     */
    pCaps {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 16
    }
}
