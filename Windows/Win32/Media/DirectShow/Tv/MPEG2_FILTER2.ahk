#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOL.ahk
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
     * @type {BOOL}
     */
    fUseRawFilteringBits{
        get {
            if(!this.HasProp("__fUseRawFilteringBits"))
                this.__fUseRawFilteringBits := BOOL(this.ptr + 4)
            return this.__fUseRawFilteringBits
        }
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
     * @type {BOOL}
     */
    fSpecifyTableIdExtension{
        get {
            if(!this.HasProp("__fSpecifyTableIdExtension"))
                this.__fSpecifyTableIdExtension := BOOL(this.ptr + 40)
            return this.__fSpecifyTableIdExtension
        }
    }

    /**
     * @type {Integer}
     */
    TableIdExtension {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * @type {BOOL}
     */
    fSpecifyVersion{
        get {
            if(!this.HasProp("__fSpecifyVersion"))
                this.__fSpecifyVersion := BOOL(this.ptr + 48)
            return this.__fSpecifyVersion
        }
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 52, "char")
        set => NumPut("char", value, this, 52)
    }

    /**
     * @type {BOOL}
     */
    fSpecifySectionNumber{
        get {
            if(!this.HasProp("__fSpecifySectionNumber"))
                this.__fSpecifySectionNumber := BOOL(this.ptr + 56)
            return this.__fSpecifySectionNumber
        }
    }

    /**
     * @type {Integer}
     */
    SectionNumber {
        get => NumGet(this, 60, "char")
        set => NumPut("char", value, this, 60)
    }

    /**
     * @type {BOOL}
     */
    fSpecifyCurrentNext{
        get {
            if(!this.HasProp("__fSpecifyCurrentNext"))
                this.__fSpecifyCurrentNext := BOOL(this.ptr + 64)
            return this.__fSpecifyCurrentNext
        }
    }

    /**
     * @type {BOOL}
     */
    fNext{
        get {
            if(!this.HasProp("__fNext"))
                this.__fNext := BOOL(this.ptr + 68)
            return this.__fNext
        }
    }

    /**
     * @type {BOOL}
     */
    fSpecifyDsmccOptions{
        get {
            if(!this.HasProp("__fSpecifyDsmccOptions"))
                this.__fSpecifyDsmccOptions := BOOL(this.ptr + 72)
            return this.__fSpecifyDsmccOptions
        }
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
     * @type {BOOL}
     */
    fSpecifyAtscOptions{
        get {
            if(!this.HasProp("__fSpecifyAtscOptions"))
                this.__fSpecifyAtscOptions := BOOL(this.ptr + 140)
            return this.__fSpecifyAtscOptions
        }
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
     * @type {BOOL}
     */
    fSpecifyDvbEitOptions{
        get {
            if(!this.HasProp("__fSpecifyDvbEitOptions"))
                this.__fSpecifyDvbEitOptions := BOOL(this.ptr + 156)
            return this.__fSpecifyDvbEitOptions
        }
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
