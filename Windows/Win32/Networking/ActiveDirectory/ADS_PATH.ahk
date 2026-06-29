#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The ADS_PATH structure is an ADSI representation of the Path attribute syntax.
 * @remarks
 * The <b>Path</b> attribute in represents a file system path.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_path
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_PATH {
    #StructPack 8

    /**
     * Type of file in the file system.
     */
    Type : UInt32

    /**
     * The null-terminated Unicode string that contains the name of an existing volume in the file system.
     */
    VolumeName : PWSTR

    /**
     * The null-terminated Unicode string that contains the path of a directory in the file system.
     */
    Path : PWSTR

}
