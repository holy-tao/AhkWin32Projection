#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DSMCC_FILTER_OPTIONS.ahk
#Include .\ATSC_FILTER_OPTIONS.ahk
#Include .\DVB_EIT_FILTER_OPTIONS.ahk

/**
 * The MPEG2_FILTER2 structure specifies criteria for matching MPEG-2 section headers.
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2structs/ns-mpeg2structs-mpeg2_filter2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG2_FILTER2 extends Win32Struct
{
    static sizeof => 168

    static packingSize => 8

    /**
     * @type {Integer}
     */
    bVersionNumber {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wFilterSize {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    fUseRawFilteringBits {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    Filter{
        get {
            if(!this.HasProp("__FilterProxyArray"))
                this.__FilterProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "char")
            return this.__FilterProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Mask{
        get {
            if(!this.HasProp("__MaskProxyArray"))
                this.__MaskProxyArray := Win32FixedArray(this.ptr + 24, 16, Primitive, "char")
            return this.__MaskProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    fSpecifyTableIdExtension {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    TableIdExtension {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    fSpecifyVersion {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 52, "char")
        set => NumPut("char", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    fSpecifySectionNumber {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    SectionNumber {
        get => NumGet(this, 60, "char")
        set => NumPut("char", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    fSpecifyCurrentNext {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    fNext {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    fSpecifyDsmccOptions {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {DSMCC_FILTER_OPTIONS}
     */
    Dsmcc{
        get {
            if(!this.HasProp("__Dsmcc"))
                this.__Dsmcc := DSMCC_FILTER_OPTIONS(this.ptr + 80)
            return this.__Dsmcc
        }
    }

    /**
     * @type {Integer}
     */
    fSpecifyAtscOptions {
        get => NumGet(this, 140, "int")
        set => NumPut("int", value, this, 140)
    }

    /**
     * @type {ATSC_FILTER_OPTIONS}
     */
    Atsc{
        get {
            if(!this.HasProp("__Atsc"))
                this.__Atsc := ATSC_FILTER_OPTIONS(this.ptr + 144)
            return this.__Atsc
        }
    }

    /**
     * @type {Array<Byte>}
     */
    bVersion1Bytes{
        get {
            if(!this.HasProp("__bVersion1BytesProxyArray"))
                this.__bVersion1BytesProxyArray := Win32FixedArray(this.ptr + 0, 124, Primitive, "char")
            return this.__bVersion1BytesProxyArray
        }
    }

    /**
     * If <b>TRUE</b>, the <b>Dvb_Eit</b> member contains additional filtering criteria. Otherwise, the <b>Dvb_Eit</b> member is ignored. <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * @type {Integer}
     */
    fSpecifyDvbEitOptions {
        get => NumGet(this, 156, "int")
        set => NumPut("int", value, this, 156)
    }

    /**
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-dvb_eit_filter_options">DVB_EIT_FILTER_OPTIONS</a> structure that contains additional filtering criteria. 
     * 
     * 
     * 
     *           
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * @type {DVB_EIT_FILTER_OPTIONS}
     */
    DvbEit{
        get {
            if(!this.HasProp("__DvbEit"))
                this.__DvbEit := DVB_EIT_FILTER_OPTIONS(this.ptr + 160)
            return this.__DvbEit
        }
    }
}
