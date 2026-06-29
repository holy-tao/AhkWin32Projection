#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The ADS_BACKLINK structure is an ADSI representation of the Back Link attribute syntax.
 * @remarks
 * A <b>Back Link</b> attribute contains one or more servers that hold an external reference to the attached object.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_backlink
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_BACKLINK {
    #StructPack 8

    /**
     * Identifier of the remote server that requires an external reference to the object specified by <b>ObjectName</b>. See below.
     */
    RemoteID : UInt32

    /**
     * The null-terminated Unicode string that specifies the name of an object to which the <b>Back Link</b> attribute is attached.
     */
    ObjectName : PWSTR

}
