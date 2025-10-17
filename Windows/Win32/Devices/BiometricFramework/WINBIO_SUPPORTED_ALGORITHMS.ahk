#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_DATA.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_SUPPORTED_ALGORITHMS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    PayloadSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HRESULT}
     */
    WinBioHresult {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    NumberOfAlgorithms {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {WINBIO_DATA}
     */
    AlgorithmData{
        get {
            if(!this.HasProp("__AlgorithmData"))
                this.__AlgorithmData := WINBIO_DATA(16, this)
            return this.__AlgorithmData
        }
    }
}
