#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_TVTUNER_CHANGE_INFO.ahk
#Include .\KS_VBIINFOHEADER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_VBI_FRAME_INFO extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ExtendedHeaderSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFrameFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    PictureNumber {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DropCount {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwSamplingFrequency {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {KS_TVTUNER_CHANGE_INFO}
     */
    TvTunerChangeInfo{
        get {
            if(!this.HasProp("__TvTunerChangeInfo"))
                this.__TvTunerChangeInfo := KS_TVTUNER_CHANGE_INFO(this.ptr + 32)
            return this.__TvTunerChangeInfo
        }
    }

    /**
     * @type {KS_VBIINFOHEADER}
     */
    VBIInfoHeader{
        get {
            if(!this.HasProp("__VBIInfoHeader"))
                this.__VBIInfoHeader := KS_VBIINFOHEADER(this.ptr + 48)
            return this.__VBIInfoHeader
        }
    }
}
