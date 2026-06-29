#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct DUMP_DRIVER {
    #StructPack 8

    DumpDriverList : IntPtr

    DriverName : WCHAR[15]

    BaseName : WCHAR[15]

}
