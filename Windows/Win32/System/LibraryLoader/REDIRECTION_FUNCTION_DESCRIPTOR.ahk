#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.LibraryLoader
 */
export default struct REDIRECTION_FUNCTION_DESCRIPTOR {
    #StructPack 8

    DllName : PSTR

    FunctionName : PSTR

    RedirectionTarget : IntPtr

}
