#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class VAL extends Win32Struct
{
    static sizeof => 320

    static packingSize => 8

    /**
     * @type {Integer}
     */
    lVal {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Float}
     */
    dblVal {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    pGuid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<SCANINFO>}
     */
    pScanInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<HGLOBAL>}
     */
    handle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    ppButtonNames {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<HANDLE>}
     */
    pHandle {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    lReserved {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Array<SByte>}
     */
    szVal{
        get {
            if(!this.HasProp("__szValProxyArray"))
                this.__szValProxyArray := Win32FixedArray(this.ptr + 60, 255, Primitive, "char")
            return this.__szValProxyArray
        }
    }
}
