#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_P2P_PARAM_CONFIG extends Win32Struct
{
    static sizeof => 56

    static packingSize => 4

    /**
     * @type {Integer}
     */
    eP2pMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cbGeneralBytes {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    pbGeneralBytes{
        get {
            if(!this.HasProp("__pbGeneralBytesProxyArray"))
                this.__pbGeneralBytesProxyArray := Win32FixedArray(this.ptr + 5, 1, Primitive, "char")
            return this.__pbGeneralBytesProxyArray
        }
    }
}
