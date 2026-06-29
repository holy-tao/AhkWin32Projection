#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IO_SECURITY_CONTEXT.ahk" { IO_SECURITY_CONTEXT }
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct QUERY_PATH_REQUEST {
    #StructPack 8

    PathNameLength : UInt32

    SecurityContext : IO_SECURITY_CONTEXT.Ptr

    FilePathName : WCHAR[1]

}
