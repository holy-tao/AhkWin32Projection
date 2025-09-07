#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_DVBT2_L1_SIGNALLING_DATA extends Win32Struct
{
    static sizeof => 26

    static packingSize => 1

    /**
     * @type {Integer}
     */
    L1Pre_TYPE {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    L1Pre_BWT_S1_S2 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    L1Pre_REPETITION_GUARD_PAPR {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    L1Pre_MOD_COD_FEC {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Array<Byte>}
     */
    L1Pre_POSTSIZE_INFO_PILOT{
        get {
            if(!this.HasProp("__L1Pre_POSTSIZE_INFO_PILOTProxyArray"))
                this.__L1Pre_POSTSIZE_INFO_PILOTProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__L1Pre_POSTSIZE_INFO_PILOTProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    L1Pre_TX_ID_AVAIL {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Array<Byte>}
     */
    L1Pre_CELL_ID{
        get {
            if(!this.HasProp("__L1Pre_CELL_IDProxyArray"))
                this.__L1Pre_CELL_IDProxyArray := Win32FixedArray(this.ptr + 10, 1, Primitive, "char")
            return this.__L1Pre_CELL_IDProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    L1Pre_NETWORK_ID{
        get {
            if(!this.HasProp("__L1Pre_NETWORK_IDProxyArray"))
                this.__L1Pre_NETWORK_IDProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__L1Pre_NETWORK_IDProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    L1Pre_T2SYSTEM_ID{
        get {
            if(!this.HasProp("__L1Pre_T2SYSTEM_IDProxyArray"))
                this.__L1Pre_T2SYSTEM_IDProxyArray := Win32FixedArray(this.ptr + 14, 1, Primitive, "char")
            return this.__L1Pre_T2SYSTEM_IDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    L1Pre_NUM_T2_FRAMES {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    L1Pre_NUM_DATA_REGENFLAG_L1POSTEXT{
        get {
            if(!this.HasProp("__L1Pre_NUM_DATA_REGENFLAG_L1POSTEXTProxyArray"))
                this.__L1Pre_NUM_DATA_REGENFLAG_L1POSTEXTProxyArray := Win32FixedArray(this.ptr + 17, 1, Primitive, "char")
            return this.__L1Pre_NUM_DATA_REGENFLAG_L1POSTEXTProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    L1Pre_NUMRF_CURRENTRF_RESERVED{
        get {
            if(!this.HasProp("__L1Pre_NUMRF_CURRENTRF_RESERVEDProxyArray"))
                this.__L1Pre_NUMRF_CURRENTRF_RESERVEDProxyArray := Win32FixedArray(this.ptr + 19, 1, Primitive, "char")
            return this.__L1Pre_NUMRF_CURRENTRF_RESERVEDProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    L1Pre_CRC32{
        get {
            if(!this.HasProp("__L1Pre_CRC32ProxyArray"))
                this.__L1Pre_CRC32ProxyArray := Win32FixedArray(this.ptr + 21, 1, Primitive, "char")
            return this.__L1Pre_CRC32ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    L1PostData{
        get {
            if(!this.HasProp("__L1PostDataProxyArray"))
                this.__L1PostDataProxyArray := Win32FixedArray(this.ptr + 25, 1, Primitive, "char")
            return this.__L1PostDataProxyArray
        }
    }
}
