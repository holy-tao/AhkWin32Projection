#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains information about a file, related to its use with MUI.
 * @remarks
 * All offsets are from the base of the structure. An offset of 0 indicates that the data is not available.
 * 
 * The following is an example showing how to access data for the position in the structure that is described by an offset. This example accesses the language name string with the position defined by <i>dwLanguageNameOffset</i>.
 * 
 * 
 * ```cpp
 * PFILEMUIINFO pFileMUIInfo = NULL;
 * 
 * Allocate_pFileMUIInfo_AndPassTo_GetFileMUIInfo(&pFileMUIInfo);
 * 
 * LPWSTR lpszLang = reinterpret_cast<LPWSTR>(reinterpret_cast<BYTE*>(pFileMUIInfo) + pFileMUIInfo->dwLanguageNameOffset);
 * 
 * ```
 * 
 * 
 * This example uses two reinterpret casts. First the code casts to BYTE* so the pointer arithmetic for the offset will be done in bytes. Then the code casts the resulting pointer to the desired type.
 * 
 * Alternatively, the code can be written as shown below. The effect is the same; the choice is strictly one of style.
 * 
 * 
 * ```cpp
 * PFILEMUIINFO pFileMUIInfo = NULL;
 * 
 * Allocate_pFileMUIInfo_AndPassTo_GetFileMUIInfo(&pFileMUIInfo);
 * 
 * DWORD ix = pFileMUIInfo->dwLanguageNameOffset - offsetof(struct _FILEMUIINFO, abBuffer);
 * LPWSTR lpszLang = reinterpret_cast<LPWSTR>(&(pFileMUIInfo->abBuffer[ix]));
 * 
 * ```
 * 
 * 
 * <h3><a id="C__Signature"></a><a id="c__signature"></a><a id="C__SIGNATURE"></a>C# Signature</h3>
 * 
 * ```cpp
 * unsafe public struct FILEMUIINFO
 *         {
 *             public System.UInt32 dwSize;
 *             public System.UInt32 dwVersion;
 *             public System.UInt32 dwFileType;
 *             public fixed System.Byte pChecksum[16];
 *             public fixed System.Byte pServiceChecksum[16];
 *             public System.UInt32 dwLanguageNameOffset;
 *             public System.UInt32 dwTypeIDMainSize;
 *             public System.UInt32 dwTypeIDMainOffset;
 *             public System.UInt32 dwTypeNameMainOffset;
 *             public System.UInt32 dwTypeIDMUISize;
 *             public System.UInt32 dwTypeIDMUIOffset;
 *             public System.UInt32 dwTypeNameMUIOffset;
 *             public fixed System.Byte abBuffer[8];
 *         }
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/winnls/ns-winnls-filemuiinfo
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class FILEMUIINFO extends Win32Struct
{
    static sizeof => 80

    static packingSize => 4

    /**
     * Size of the structure, including the buffer, which can be extended past the 8 bytes declared. The minimum value allowed is <c>sizeof(FILEMUIINFO)</c>.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Version of the structure. The current version is 0x001.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The file type. Possible values are:
     * 
     * <ul>
     * <li>MUI_FILETYPE_NOT_LANGUAGE_NEUTRAL. The input file does not have resource configuration data. This file type is typical for older executable files. If this file type is specified, the other file types will not provide useful information.</li>
     * <li>MUI_FILETYPE_LANGUAGE_NEUTRAL_MAIN. The input file is an LN file.</li>
     * <li>MUI_FILETYPE_LANGUAGE_NEUTRAL_MUI. The input file is a language-specific resource file.</li>
     * </ul>
     * @type {Integer}
     */
    dwFileType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to a 128-bit checksum for the file, if it is either an LN file or a language-specific resource file.
     * @type {Array<Byte>}
     */
    pChecksum{
        get {
            if(!this.HasProp("__pChecksumProxyArray"))
                this.__pChecksumProxyArray := Win32FixedArray(this.ptr + 12, 16, Primitive, "char")
            return this.__pChecksumProxyArray
        }
    }

    /**
     * Pointer to a 128-bit checksum for the file, used for servicing.
     * @type {Array<Byte>}
     */
    pServiceChecksum{
        get {
            if(!this.HasProp("__pServiceChecksumProxyArray"))
                this.__pServiceChecksumProxyArray := Win32FixedArray(this.ptr + 28, 16, Primitive, "char")
            return this.__pServiceChecksumProxyArray
        }
    }

    /**
     * Offset, in bytes, from the beginning of the structure to the language name string for a language-specific resource file, or to the ultimate fallback language name string for an LN file.
     * @type {Integer}
     */
    dwLanguageNameOffset {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Size of the array for which the offset is indicated by <i>dwTypeIDMainOffset</i>. The size also corresponds to the number of strings in the multi-string array indicated by <i>dwTypeNameMainOffset</i>.
     * @type {Integer}
     */
    dwTypeIDMainSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Offset, in bytes, from the beginning of the structure to a DWORD array enumerating the resource types contained in the LN file.
     * @type {Integer}
     */
    dwTypeIDMainOffset {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Offset, in bytes, from the beginning of the structure to a series of null-terminated strings in a multi-string array enumerating the resource names contained in the LN file.
     * @type {Integer}
     */
    dwTypeNameMainOffset {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Size of the array with the offset indicated by <i>dwTypeIDMUIOffset</i>. The size also corresponds to the number of strings in the series of strings indicated by <i>dwTypeNameMUIOffset</i>.
     * @type {Integer}
     */
    dwTypeIDMUISize {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Offset, in bytes, from the beginning of the structure to a DWORD array enumerating the resource types contained in the LN file.
     * @type {Integer}
     */
    dwTypeIDMUIOffset {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Offset, in bytes, from the beginning of the structure to a multi-string array enumerating the resource names contained in the LN file.
     * @type {Integer}
     */
    dwTypeNameMUIOffset {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Remainder of the allocated memory for this structure. See the Remarks section for correct use of this array.
     * @type {Array<Byte>}
     */
    abBuffer{
        get {
            if(!this.HasProp("__abBufferProxyArray"))
                this.__abBufferProxyArray := Win32FixedArray(this.ptr + 72, 8, Primitive, "char")
            return this.__abBufferProxyArray
        }
    }
}
