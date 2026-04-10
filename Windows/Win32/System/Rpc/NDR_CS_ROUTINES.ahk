#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDR_CS_SIZE_CONVERT_ROUTINES.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class NDR_CS_ROUTINES extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<NDR_CS_SIZE_CONVERT_ROUTINES>}
     */
    pSizeConvertRoutines {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Pointer<CS_TAG_GETTING_ROUTINE>>}
     */
    pTagGettingRoutines {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
