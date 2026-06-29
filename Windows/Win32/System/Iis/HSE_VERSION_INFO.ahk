#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HSE_VERSION_INFO {
    #StructPack 4

    dwExtensionVersion : UInt32

    lpszExtensionDesc : CHAR[256]

}
