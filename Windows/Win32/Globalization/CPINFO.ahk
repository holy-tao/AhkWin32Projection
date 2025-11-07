#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains information about a code page. This structure is used by the GetCPInfo function.
 * @remarks
 * 
 * Lead bytes are unique to DBCS code pages that allow for more than 256 characters. A lead byte is the first byte of a 2-byte character in a DBCS. On each DBCS code page, the lead bytes occupy a specific range of byte values. This range is different for different code pages.
 * 
 * The lead byte information is not very helpful for most code pages, and is not even provided for many multi-byte encodings, for example, UTF-8 and GB18030. Your applications are discouraged from using this information to predict what the <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-multibytetowidechar">MultiByteToWideChar</a> or <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte">WideCharToMultiByte</a> function will do. The function might end up using a default character or performing other default behavior if the bytes following the lead byte are not as expected.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winnls/ns-winnls-cpinfoexa">CPINFOEX</a>, used by the <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-getcpinfoexa">GetCPInfoEx</a> function, provides an extended version of this structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winnls/ns-winnls-cpinfo
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class CPINFO extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Maximum length, in bytes, of a character in the code page. The length can be 1 for a <a href="https://docs.microsoft.com/windows/desktop/Intl/single-byte-character-sets">single-byte character set</a> (SBCS), 2 for a <a href="https://docs.microsoft.com/windows/desktop/Intl/double-byte-character-sets">double-byte character set</a> (DBCS), or a value larger than 2 for other character set types. The function cannot use the size to distinguish an SBCS or a DBCS from other character sets because of other factors, for example, the use of ISCII or ISO-2022-xx code pages.
     * @type {Integer}
     */
    MaxCharSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Default character used when translating character strings to the specific code page. This character is used by the <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte">WideCharToMultiByte</a> function if an explicit default character is not specified. The default is usually the "?" character for the code page.
     * @type {Array<Byte>}
     */
    DefaultChar{
        get {
            if(!this.HasProp("__DefaultCharProxyArray"))
                this.__DefaultCharProxyArray := Win32FixedArray(this.ptr + 4, 2, Primitive, "char")
            return this.__DefaultCharProxyArray
        }
    }

    /**
     * A fixed-length array of lead byte ranges, for which the number of lead byte ranges is variable. If the code page has no lead bytes, every element of the array is set to <b>NULL</b>. If the code page has lead bytes, the array specifies a starting value and an ending value for each range. Ranges are inclusive, and the maximum number of ranges for any code page is five. The array uses two bytes to describe each range, with two null bytes as a terminator after the last range.
     * 
     * <div class="alert"><b>Note</b>   Some code pages use lead bytes and a combination of other encoding mechanisms. This member is usually only populated for a subset of the code pages that use lead bytes in some form. For more information, see the Remarks section.</div>
     * <div> </div>
     * @type {Array<Byte>}
     */
    LeadByte{
        get {
            if(!this.HasProp("__LeadByteProxyArray"))
                this.__LeadByteProxyArray := Win32FixedArray(this.ptr + 6, 12, Primitive, "char")
            return this.__LeadByteProxyArray
        }
    }
}
