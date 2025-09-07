#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class WBCL_Iterator extends Win32Struct
{
    static sizeof => 46

    static packingSize => 1

    /**
     * @type {Pointer<Void>}
     */
    firstElementPtr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    logSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    currentElementPtr {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    currentElementSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    digestSize {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    logFormat {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * @type {Integer}
     */
    numberOfDigests {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Pointer<Void>}
     */
    digestSizes {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    supportedAlgorithms {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    hashAlgorithm {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }
}
