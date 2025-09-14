#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WHEA_ERROR_SOURCE_CONFIGURATION_DD extends Win32Struct
{
    static sizeof => 24

    static packingSize => 1

    /**
     * @type {Pointer<WHEA_ERROR_SOURCE_INITIALIZE_DEVICE_DRIVER>}
     */
    Initialize {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<WHEA_ERROR_SOURCE_UNINITIALIZE_DEVICE_DRIVER>}
     */
    Uninitialize {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<WHEA_ERROR_SOURCE_CORRECT_DEVICE_DRIVER>}
     */
    Correct {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
