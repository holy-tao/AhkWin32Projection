#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOL.ahk
#Include .\DSMCC_FILTER_OPTIONS.ahk
#Include .\ATSC_FILTER_OPTIONS.ahk

/**
 * The MPEG2_FILTER structure specifies criteria for matching MPEG-2 section headers.
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2structs/ns-mpeg2structs-mpeg2_filter
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG2_FILTER extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * Specifies the version number of the structure. This value must be 1 or higher.
     * @type {Integer}
     */
    bVersionNumber {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies the size of the structure data, excluding any padding bytes. Set this field equal to the constant <b>MPEG2_FILTER_VERSION_1_SIZE</b>.
     * @type {Integer}
     */
    wFilterSize {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * If <b>TRUE</b>, the <b>Filter</b> and <b>Mask</b> members specify the filtering criteria as a pair of bit masks, and the remaining members of this structure are ignored. If this field is <b>FALSE</b>, the <b>Filter</b> and <b>Mask</b> members are ignored, and the other structure members contain the filtering criteria.
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
     * Specifies a 16-byte bit mask, which contains the bit values to match in the section header.
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
     * Specifies a 16-byte bit mask. Set any "don't care" bits equal to 1, and all other bits to 0. In other words, for each bit, if the value in <b>Mask</b> is 0, the corresponding bit in <b>Filter</b> will be matched against that bit in the section header. If the value in <b>Mask</b> is 1, that bit in the section header is ignored.
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
     * If <b>TRUE</b>, the <b>table_ID_extension</b> field in the header must match the value of the <b>TableIdExtension</b> structure member. Otherwise, the <b>table_ID_extension</b> field is ignored.
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
     * Specifies a value for the <b>table_ID_extension</b> field.
     * @type {Integer}
     */
    TableIdExtension {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * If <b>TRUE</b>, the <b>version_number</b> field in the header must match the value of the <b>Version</b> structure member. Otherwise, the <b>version_number</b> field is ignored.
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
     * Specifies a value for the <b>version_number</b> field.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 52, "char")
        set => NumPut("char", value, this, 52)
    }

    /**
     * If <b>TRUE</b>, the <b>section_number</b> field in the header must match the value of the <b>SectionNumber</b> member. Otherwise, the <b>section_number</b> field is ignored.
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
     * Specifies a value for the <b>section_number</b> field.
     * @type {Integer}
     */
    SectionNumber {
        get => NumGet(this, 60, "char")
        set => NumPut("char", value, this, 60)
    }

    /**
     * If <b>TRUE</b>, the <b>current_next_indicator</b> bit in the header must match the value of the <b>fNext</b> structue member. Otherwise, the <b>current_next_indicator</b> field is ignored.
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
     * Specifies a value for the <b>current_next_indicator</b> bit. You can use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ne-mpeg2structs-mpeg_current_next_bit">MPEG_CURRENT_NEXT_BIT</a> enumeration type to specify this value.
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
     * If <b>TRUE</b>, the <b>Dsmcc</b> member contains additional filtering criteria for the DSM-CC portions of the section header. Otherwise, the <b>Dsmcc</b> member is ignored.
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
     * Specifies a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-dsmcc_filter_options">DSMCC_FILTER_OPTIONS</a> structure that contains additional filtering criteria for the DSM-CC portions of the section header.
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
     * If <b>TRUE</b>, the <b>Atsc</b> member contains additional filtering criteria. Otherwise, the <b>Atsc</b> member is ignored.
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
     * Specifies an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-atsc_filter_options">ATSC_FILTER_OPTIONS</a> structure that contains additional filtering criteria.
     * @type {ATSC_FILTER_OPTIONS}
     */
    Atsc{
        get {
            if(!this.HasProp("__Atsc"))
                this.__Atsc := ATSC_FILTER_OPTIONS(this.ptr + 144)
            return this.__Atsc
        }
    }
}
