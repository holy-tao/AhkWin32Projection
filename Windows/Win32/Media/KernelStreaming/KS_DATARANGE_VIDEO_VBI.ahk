#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSDATAFORMAT.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include .\KS_VIDEO_STREAM_CONFIG_CAPS.ahk
#Include .\KS_VBIINFOHEADER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_DATARANGE_VIDEO_VBI extends Win32Struct
{
    static sizeof => 232

    static packingSize => 8

    /**
     * @type {KSDATAFORMAT}
     */
    DataRange{
        get {
            if(!this.HasProp("__DataRange"))
                this.__DataRange := KSDATAFORMAT(this.ptr + 0)
            return this.__DataRange
        }
    }

    /**
     * @type {Integer}
     */
    bFixedSizeSamples {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    bTemporalCompression {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    StreamDescriptionFlags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    MemoryAllocationFlags {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {KS_VIDEO_STREAM_CONFIG_CAPS}
     */
    ConfigCaps{
        get {
            if(!this.HasProp("__ConfigCaps"))
                this.__ConfigCaps := KS_VIDEO_STREAM_CONFIG_CAPS(this.ptr + 64)
            return this.__ConfigCaps
        }
    }

    /**
     * @type {KS_VBIINFOHEADER}
     */
    VBIInfoHeader{
        get {
            if(!this.HasProp("__VBIInfoHeader"))
                this.__VBIInfoHeader := KS_VBIINFOHEADER(this.ptr + 184)
            return this.__VBIInfoHeader
        }
    }
}
