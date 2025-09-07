#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\KSP_NODE.ahk
#Include .\MEDIUM_INFO.ahk
#Include .\TRANSPORT_STATE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_EXTXPORT_NODE_S extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {KSP_NODE}
     */
    NodeProperty{
        get {
            if(!this.HasProp("__NodeProperty"))
                this.__NodeProperty := KSP_NODE(this.ptr + 0)
            return this.__NodeProperty
        }
    }

    /**
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    SignalMode {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    LoadMedium {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {MEDIUM_INFO}
     */
    MediumInfo{
        get {
            if(!this.HasProp("__MediumInfo"))
                this.__MediumInfo := MEDIUM_INFO(this.ptr + 16)
            return this.__MediumInfo
        }
    }

    /**
     * @type {TRANSPORT_STATE}
     */
    XPrtState{
        get {
            if(!this.HasProp("__XPrtState"))
                this.__XPrtState := TRANSPORT_STATE(this.ptr + 16)
            return this.__XPrtState
        }
    }

    /**
     * @type {Integer}
     */
    frame {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    second {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * @type {Integer}
     */
    minute {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    hour {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }

    /**
     * @type {Integer}
     */
    dwTimecode {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwAbsTrackNumber {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    PayloadSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    Payload{
        get {
            if(!this.HasProp("__PayloadProxyArray"))
                this.__PayloadProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__PayloadProxyArray
        }
    }
}
