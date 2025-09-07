#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\MEDIUM_INFO.ahk
#Include .\TRANSPORT_STATE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_EXTXPORT_S extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(this.ptr + 0)
            return this.__Property
        }
    }

    /**
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SignalMode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    LoadMedium {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {MEDIUM_INFO}
     */
    MediumInfo{
        get {
            if(!this.HasProp("__MediumInfo"))
                this.__MediumInfo := MEDIUM_INFO(this.ptr + 8)
            return this.__MediumInfo
        }
    }

    /**
     * @type {TRANSPORT_STATE}
     */
    XPrtState{
        get {
            if(!this.HasProp("__XPrtState"))
                this.__XPrtState := TRANSPORT_STATE(this.ptr + 8)
            return this.__XPrtState
        }
    }

    /**
     * @type {Integer}
     */
    frame {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    second {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    minute {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    hour {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * @type {Integer}
     */
    dwTimecode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwAbsTrackNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    PayloadSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    Payload{
        get {
            if(!this.HasProp("__PayloadProxyArray"))
                this.__PayloadProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__PayloadProxyArray
        }
    }
}
