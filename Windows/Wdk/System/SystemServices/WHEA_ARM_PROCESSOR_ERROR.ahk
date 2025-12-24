#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_ARM_PROCESSOR_ERROR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 1

    /**
     * @type {Pointer<WHEA_ARM_CACHE_ERROR>}
     */
    CacheError {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<WHEA_ARM_TLB_ERROR>}
     */
    TlbError {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<WHEA_ARM_BUS_ERROR>}
     */
    BusError {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AsULONGLONG {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
