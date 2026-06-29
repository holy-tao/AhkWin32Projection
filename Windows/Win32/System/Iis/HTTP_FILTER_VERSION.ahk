#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HTTP_FILTER_VERSION {
    #StructPack 4

    dwServerFilterVersion : UInt32

    dwFilterVersion : UInt32

    lpszFilterDesc : CHAR[257]

    dwFlags : UInt32

}
