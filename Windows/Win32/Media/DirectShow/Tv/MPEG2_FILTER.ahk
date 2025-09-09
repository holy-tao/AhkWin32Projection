#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DSMCC_FILTER_OPTIONS.ahk
#Include .\ATSC_FILTER_OPTIONS.ahk

/**
 * The MPEG2_FILTER structure specifies criteria for matching MPEG-2 section headers.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg2_filter
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG2_FILTER extends Win32Struct
{
    static sizeof => 124

    static packingSize => 1

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
        get => NumGet(this, 1, "ushort")
        set => NumPut("ushort", value, this, 1)
    }

    /**
     * If <b>TRUE</b>, the <b>Filter</b> and <b>Mask</b> members specify the filtering criteria as a pair of bit masks, and the remaining members of this structure are ignored. If this field is <b>FALSE</b>, the <b>Filter</b> and <b>Mask</b> members are ignored, and the other structure members contain the filtering criteria.
     * @type {Integer}
     */
    fUseRawFilteringBits {
        get => NumGet(this, 3, "int")
        set => NumPut("int", value, this, 3)
    }

    /**
     * Specifies a 16-byte bit mask, which contains the bit values to match in the section header.
     * @type {Array<Byte>}
     */
    Filter{
        get {
            if(!this.HasProp("__FilterProxyArray"))
                this.__FilterProxyArray := Win32FixedArray(this.ptr + 7, 16, Primitive, "char")
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
                this.__MaskProxyArray := Win32FixedArray(this.ptr + 23, 16, Primitive, "char")
            return this.__MaskProxyArray
        }
    }

    /**
     * If <b>TRUE</b>, the <b>table_ID_extension</b> field in the header must match the value of the <b>TableIdExtension</b> structure member. Otherwise, the <b>table_ID_extension</b> field is ignored.
     * @type {Integer}
     */
    fSpecifyTableIdExtension {
        get => NumGet(this, 39, "int")
        set => NumPut("int", value, this, 39)
    }

    /**
     * Specifies a value for the <b>table_ID_extension</b> field.
     * @type {Integer}
     */
    TableIdExtension {
        get => NumGet(this, 43, "ushort")
        set => NumPut("ushort", value, this, 43)
    }

    /**
     * If <b>TRUE</b>, the <b>version_number</b> field in the header must match the value of the <b>Version</b> structure member. Otherwise, the <b>version_number</b> field is ignored.
     * @type {Integer}
     */
    fSpecifyVersion {
        get => NumGet(this, 45, "int")
        set => NumPut("int", value, this, 45)
    }

    /**
     * Specifies a value for the <b>version_number</b> field.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 49, "char")
        set => NumPut("char", value, this, 49)
    }

    /**
     * If <b>TRUE</b>, the <b>section_number</b> field in the header must match the value of the <b>SectionNumber</b> member. Otherwise, the <b>section_number</b> field is ignored.
     * @type {Integer}
     */
    fSpecifySectionNumber {
        get => NumGet(this, 50, "int")
        set => NumPut("int", value, this, 50)
    }

    /**
     * Specifies a value for the <b>section_number</b> field.
     * @type {Integer}
     */
    SectionNumber {
        get => NumGet(this, 54, "char")
        set => NumPut("char", value, this, 54)
    }

    /**
     * If <b>TRUE</b>, the <b>current_next_indicator</b> bit in the header must match the value of the <b>fNext</b> structure member. Otherwise, the <b>current_next_indicator</b> field is ignored.
     * @type {Integer}
     */
    fSpecifyCurrentNext {
        get => NumGet(this, 55, "int")
        set => NumPut("int", value, this, 55)
    }

    /**
     * Specifies a value for the <b>current_next_indicator</b> bit. You can use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ne-mpeg2structs-mpeg_current_next_bit">MPEG_CURRENT_NEXT_BIT</a> enumeration type to specify this value.
     * @type {Integer}
     */
    fNext {
        get => NumGet(this, 59, "int")
        set => NumPut("int", value, this, 59)
    }

    /**
     * If <b>TRUE</b>, the <b>Dsmcc</b> member contains additional filtering criteria for the DSM-CC portions of the section header. Otherwise, the <b>Dsmcc</b> member is ignored.
     * @type {Integer}
     */
    fSpecifyDsmccOptions {
        get => NumGet(this, 63, "int")
        set => NumPut("int", value, this, 63)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-dsmcc_filter_options">DSMCC_FILTER_OPTIONS</a> structure that contains additional filtering criteria for the DSM-CC portions of the section header.
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
     * If <b>TRUE</b>, the <b>Atsc</b> member contains additional filtering criteria. Otherwise, the <b>Atsc</b> member is ignored.
     * @type {Integer}
     */
    fSpecifyAtscOptions {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * Specifies an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-atsc_filter_options">ATSC_FILTER_OPTIONS</a> structure that contains additional filtering criteria.
     * @type {ATSC_FILTER_OPTIONS}
     */
    Atsc{
        get {
            if(!this.HasProp("__Atsc"))
                this.__Atsc := ATSC_FILTER_OPTIONS(this.ptr + 116)
            return this.__Atsc
        }
    }
}
