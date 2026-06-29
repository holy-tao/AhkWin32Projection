#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct MD_CHANGE_OBJECT_W {
    #StructPack 8

    pszMDPath : PWSTR

    dwMDChangeType : UInt32

    dwMDNumDataIDs : UInt32

    pdwMDDataIDs : IntPtr

}
