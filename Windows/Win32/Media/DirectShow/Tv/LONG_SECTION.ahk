#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The LONG_SECTION structure represents a long MPEG-2 section header. If a section contains a long header, you can cast a SECTION pointer to a LONG_SECTION pointer. For more information, see the Remarks section in the SECTION reference.
 * @remarks
 * The following code shows how to access the bit fields within the <b>Version</b> member:
  * 
  * 
  * ```cpp
  * 
  * LONG_SECTION *pSection; // Points to the section data.
  * 
  * // Coerce the Version field to an MPEG_HEADER_VERSION_BITS type.
  * MPEG_HEADER_VERSION_BITS *pVersion;
  * pVersion = (MPEG_HEADER_VERSION_BITS*)&pSection->Version.B;
  * 
  * // Now use the pHeader pointer to access the bit fields.
  * BYTE VersionNumber = pSection->VersionNumber;
  * 
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-long_section
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class LONG_SECTION extends Win32Struct
{
    static sizeof => 9

    static packingSize => 1

    /**
     * Specifies the table identifier (TID) of the section.
     * @type {Integer}
     */
    TableId {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    S {
        get => NumGet(this, 1, "ushort")
        set => NumPut("ushort", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    W {
        get => NumGet(this, 1, "ushort")
        set => NumPut("ushort", value, this, 1)
    }

    /**
     * Specifies the table_id_extension field.
     * @type {Integer}
     */
    TableIdExtension {
        get => NumGet(this, 3, "ushort")
        set => NumPut("ushort", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    B {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * Specifies the section_number field, which gives the section number for this section.
     * @type {Integer}
     */
    SectionNumber {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * Specifies the last_section_number field, which gives the last (highest) section number for the table.
     * @type {Integer}
     */
    LastSectionNumber {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * Contains the remaining section data, as a byte array. The length of the array is <c>Header.W.SectionLength - 5</c> bytes.
     * @type {Array<Byte>}
     */
    RemainingData{
        get {
            if(!this.HasProp("__RemainingDataProxyArray"))
                this.__RemainingDataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__RemainingDataProxyArray
        }
    }
}
