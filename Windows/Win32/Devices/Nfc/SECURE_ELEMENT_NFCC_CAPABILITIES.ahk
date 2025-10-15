#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class SECURE_ELEMENT_NFCC_CAPABILITIES extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * @type {Integer}
     */
    cbMaxRoutingTableSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    IsAidRoutingSupported{
        get {
            if(!this.HasProp("__IsAidRoutingSupported"))
                this.__IsAidRoutingSupported := BOOLEAN(this.ptr + 2)
            return this.__IsAidRoutingSupported
        }
    }

    /**
     * @type {BOOLEAN}
     */
    IsProtocolRoutingSupported{
        get {
            if(!this.HasProp("__IsProtocolRoutingSupported"))
                this.__IsProtocolRoutingSupported := BOOLEAN(this.ptr + 3)
            return this.__IsProtocolRoutingSupported
        }
    }

    /**
     * @type {BOOLEAN}
     */
    IsTechRoutingSupported{
        get {
            if(!this.HasProp("__IsTechRoutingSupported"))
                this.__IsTechRoutingSupported := BOOLEAN(this.ptr + 4)
            return this.__IsTechRoutingSupported
        }
    }
}
