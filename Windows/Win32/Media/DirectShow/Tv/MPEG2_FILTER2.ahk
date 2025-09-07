#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DSMCC_FILTER_OPTIONS.ahk
#Include .\ATSC_FILTER_OPTIONS.ahk
#Include .\DVB_EIT_FILTER_OPTIONS.ahk

/**
 * The MPEG2_FILTER2 structure specifies criteria for matching MPEG-2 section headers.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg2_filter2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG2_FILTER2 extends Win32Struct
{
    static sizeof => 133

    static packingSize => 1

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
        get => NumGet(this, 1, "ushort")
        set => NumPut("ushort", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    fUseRawFilteringBits {
        get => NumGet(this, 3, "int")
        set => NumPut("int", value, this, 3)
    }

    /**
     * @type {Array<Byte>}
     */
    Filter{
        get {
            if(!this.HasProp("__FilterProxyArray"))
                this.__FilterProxyArray := Win32FixedArray(this.ptr + 7, 1, Primitive, "char")
            return this.__FilterProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Mask{
        get {
            if(!this.HasProp("__MaskProxyArray"))
                this.__MaskProxyArray := Win32FixedArray(this.ptr + 23, 1, Primitive, "char")
            return this.__MaskProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    fSpecifyTableIdExtension {
        get => NumGet(this, 39, "int")
        set => NumPut("int", value, this, 39)
    }

    /**
     * @type {Integer}
     */
    TableIdExtension {
        get => NumGet(this, 43, "ushort")
        set => NumPut("ushort", value, this, 43)
    }

    /**
     * @type {Integer}
     */
    fSpecifyVersion {
        get => NumGet(this, 45, "int")
        set => NumPut("int", value, this, 45)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 49, "char")
        set => NumPut("char", value, this, 49)
    }

    /**
     * @type {Integer}
     */
    fSpecifySectionNumber {
        get => NumGet(this, 50, "int")
        set => NumPut("int", value, this, 50)
    }

    /**
     * @type {Integer}
     */
    SectionNumber {
        get => NumGet(this, 54, "char")
        set => NumPut("char", value, this, 54)
    }

    /**
     * @type {Integer}
     */
    fSpecifyCurrentNext {
        get => NumGet(this, 55, "int")
        set => NumPut("int", value, this, 55)
    }

    /**
     * @type {Integer}
     */
    fNext {
        get => NumGet(this, 59, "int")
        set => NumPut("int", value, this, 59)
    }

    /**
     * @type {Integer}
     */
    fSpecifyDsmccOptions {
        get => NumGet(this, 63, "int")
        set => NumPut("int", value, this, 63)
    }

    /**
     * @type {DSMCC_FILTER_OPTIONS}
     */
    Dsmcc{
        get {
            if(!this.HasProp("__Dsmcc"))
                this.__Dsmcc := DSMCC_FILTER_OPTIONS(this.ptr + 67)
            return this.__Dsmcc
        }
    }

    /**
     * @type {Integer}
     */
    fSpecifyAtscOptions {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * @type {ATSC_FILTER_OPTIONS}
     */
    Atsc{
        get {
            if(!this.HasProp("__Atsc"))
                this.__Atsc := ATSC_FILTER_OPTIONS(this.ptr + 116)
            return this.__Atsc
        }
    }

    /**
     * @type {Array<Byte>}
     */
    bVersion1Bytes{
        get {
            if(!this.HasProp("__bVersion1BytesProxyArray"))
                this.__bVersion1BytesProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__bVersion1BytesProxyArray
        }
    }

    /**
     * If <b>TRUE</b>, the <b>Dvb_Eit</b> member contains additional filtering criteria. Otherwise, the <b>Dvb_Eit</b> member is ignored. <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * @type {Integer}
     */
    fSpecifyDvbEitOptions {
        get => NumGet(this, 124, "int")
        set => NumPut("int", value, this, 124)
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
                this.__DvbEit := DVB_EIT_FILTER_OPTIONS(this.ptr + 128)
            return this.__DvbEit
        }
    }
}
