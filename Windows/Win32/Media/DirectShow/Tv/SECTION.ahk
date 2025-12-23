#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MPEG_HEADER_BITS_MIDL.ahk

/**
 * The SECTION structure represents a short header from an MPEG-2 table section.
 * @remarks
 * This structure represents an MPEG-2 short header. The section might contain a long header or DSM-CC header, each of which extends the short header:
 * 
 * <ul>
 * <li>If the <b>Header.W.SectionSyntaxIndicator</b> bit is set, the section uses the long syntax. In that case, you can cast a <b>SECTION</b> pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-long_section">LONG_SECTION</a> pointer.</li>
 * <li>If the TID indicates a DSM-CC user-to-network message (0x3B) or a download data message (0x3C), the section uses the DSM-CC header syntax. In that case, you can cast a <b>SECTION</b> pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-dsmcc_section">DSMCC_SECTION</a> pointer.</li>
 * </ul>
 * The following code shows how to access the bit fields within the <b>Header</b> member:
 * 
 * 
 * ```cpp
 * 
 * SECTION *pSection; // Points to the section data.
 * 
 * // Coerce the Header field to an MPEG_HEADER_BITS type.
 * MPEG_HEADER_BITS *pHeader = (MPEG_HEADER_BITS*)&pSection->Header.W;
 * 
 * // Now use the pHeader pointer to access the bit fields.
 * WORD SectionLength = pHeader->SectionLength;
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-section
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class SECTION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    class _Header_e__Union extends Win32Struct {
        static sizeof => 2
        static packingSize => 1

        /**
         * @type {MPEG_HEADER_BITS_MIDL}
         */
        S{
            get {
                if(!this.HasProp("__S"))
                    this.__S := MPEG_HEADER_BITS_MIDL(0, this)
                return this.__S
            }
        }
    
        /**
         * @type {Integer}
         */
        W {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
    }

    /**
     * Specifies the table identifier (TID) of the section.
     * @type {Integer}
     */
    TableId {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * A union that contains the following members.
     * @type {_Header_e__Union}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := %this.__Class%._Header_e__Union(1, this)
            return this.__Header
        }
    }

    /**
     * Contains the section data, as a byte array. The length of the array is given by the <b>Header.W.SectionLength</b> field.
     * @type {Array<Byte>}
     */
    SectionData{
        get {
            if(!this.HasProp("__SectionDataProxyArray"))
                this.__SectionDataProxyArray := Win32FixedArray(this.ptr + 3, 1, Primitive, "char")
            return this.__SectionDataProxyArray
        }
    }
}
