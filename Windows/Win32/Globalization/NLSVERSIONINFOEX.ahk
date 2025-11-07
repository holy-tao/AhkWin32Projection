#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains version information about an NLS capability.
 * @remarks
 * 
 * The <b>dwNLSVersion</b> and <b>dwDefinedVersion</b> members are completely independent. Although each member is defined for a single DWORD, actually each is composed of a major version and a minor version. See <a href="https://docs.microsoft.com/windows/desktop/Intl/handling-sorting-in-your-applications">Handling Sorting in Your Applications</a> for more information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winnls/ns-winnls-nlsversioninfoex
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class NLSVERSIONINFOEX extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Size, in bytes, of the structure.
     * @type {Integer}
     */
    dwNLSVersionInfoSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Version. This value is used to track changes and additions to the set of code points that have the indicated capability for a particular locale. The value is locale-specific, and increments when the capability changes. For example, using the COMPARE_STRING capability defined by the <a href="https://docs.microsoft.com/windows/desktop/api/winnls/ne-winnls-sysnls_function">SYSNLS_FUNCTION</a> enumeration, the version changes if sorting weights are assigned to code points that previously had no weights defined for the locale.
     * @type {Integer}
     */
    dwNLSVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Defined version. This value is used to track changes in the repertoire of Unicode code points. The value increments when the Unicode repertoire is extended, for example, if more characters are defined.
     * 
     * <b>Starting with Windows 8:</b> Deprecated. Use <b>dwNLSVersion</b> instead.
     * @type {Integer}
     */
    dwDefinedVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Identifier of the sort order used for the input locale for the represented version. For example, for a custom locale en-Mine that uses 0409 for a sort order identifier, this member contains "0409". If this member specifies a "real" sort, <b>guidCustomVersion</b> is set to an empty GUID.
     * 
     * <b>Starting with Windows 8:</b> Deprecated. Use <b>guidCustomVersion</b> instead.
     * @type {Integer}
     */
    dwEffectiveId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Unique GUID for the behavior of a custom sort used by the locale for the represented version.
     * @type {Pointer<Guid>}
     */
    guidCustomVersion {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
