#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains return parameters for the Streams Directive.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_directive_streams_return_parameters
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DIRECTIVE_STREAMS_RETURN_PARAMETERS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * The maximum streams limit.
     * @type {Integer}
     */
    MSL {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The number of available NVM Subsystem streams.
     * @type {Integer}
     */
    NSSA {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The number of NVM Subsystem streams that are open.
     * @type {Integer}
     */
    NSSO {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * 
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 6, 10, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * The stream write size.
     * @type {Integer}
     */
    SWS {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The stream granularity size.
     * @type {Integer}
     */
    SGS {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * The number of namespace streams that are allocated.
     * @type {Integer}
     */
    NSA {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * The number of namespace streams that are open.
     * @type {Integer}
     */
    NSO {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * 
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 26, 6, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
