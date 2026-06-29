#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Represents an ADSI representation of Typed Name attribute syntax.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_typedname
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_TYPEDNAME {
    #StructPack 8

    /**
     * The null-terminated Unicode string that contains an object name.
     */
    ObjectName : PWSTR

    /**
     * The priority associated with the object.
     */
    Level : UInt32

    /**
     * The frequency of reference of the object.
     */
    Interval : UInt32

}
