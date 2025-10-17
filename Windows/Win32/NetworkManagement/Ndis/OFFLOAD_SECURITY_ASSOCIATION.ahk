#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\OFFLOAD_ALGO_INFO.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class OFFLOAD_SECURITY_ASSOCIATION extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Operation {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SPI {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {OFFLOAD_ALGO_INFO}
     */
    IntegrityAlgo{
        get {
            if(!this.HasProp("__IntegrityAlgo"))
                this.__IntegrityAlgo := OFFLOAD_ALGO_INFO(8, this)
            return this.__IntegrityAlgo
        }
    }

    /**
     * @type {OFFLOAD_ALGO_INFO}
     */
    ConfAlgo{
        get {
            if(!this.HasProp("__ConfAlgo"))
                this.__ConfAlgo := OFFLOAD_ALGO_INFO(24, this)
            return this.__ConfAlgo
        }
    }

    /**
     * @type {OFFLOAD_ALGO_INFO}
     */
    Reserved{
        get {
            if(!this.HasProp("__Reserved"))
                this.__Reserved := OFFLOAD_ALGO_INFO(40, this)
            return this.__Reserved
        }
    }
}
