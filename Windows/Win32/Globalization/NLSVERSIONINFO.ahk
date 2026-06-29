#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }

/**
 * The NLSVERSIONINFO structure (winnls.h) is deprecated and should not be used.
 * @remarks
 * Starting with Windows 8, <b>NLSVERSIONINFO</b> is deprecated. In fact, it is identical to <a href="https://docs.microsoft.com/windows/desktop/api/winnls/ns-winnls-nlsversioninfoex">NLSVERSIONINFOEX</a>, which your app should use instead.
 * 
 * See Remarks for <a href="https://docs.microsoft.com/windows/desktop/api/winnls/ns-winnls-nlsversioninfoex">NLSVERSIONINFOEX</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winnls/ns-winnls-nlsversioninfo~r1
 * @namespace Windows.Win32.Globalization
 */
export default struct NLSVERSIONINFO {
    #StructPack 4

    /**
     * Size, in bytes, of the structure.
     */
    dwNLSVersionInfoSize : UInt32

    /**
     * NLS version. This value is used to track changes and additions to the set of code points that have the indicated capability for a particular locale. The value is locale-specific, and increments when the capability changes. For example, using the COMPARE_STRING capability defined by the <a href="https://docs.microsoft.com/windows/desktop/api/winnls/ne-winnls-sysnls_function">SYSNLS_FUNCTION</a> enumeration, the version changes if sorting weights are assigned to code points that previously had no weights defined for the locale.
     */
    dwNLSVersion : UInt32

    /**
     * Defined version. This value is used to track changes in the repertoire of Unicode code points. The value increments when the Unicode repertoire is extended, for example, if more characters are defined.
     */
    dwDefinedVersion : UInt32

    dwEffectiveId : UInt32

    guidCustomVersion : Guid

}
