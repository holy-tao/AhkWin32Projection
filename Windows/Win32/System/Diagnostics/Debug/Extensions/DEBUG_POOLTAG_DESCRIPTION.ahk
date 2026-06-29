#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_POOLTAG_DESCRIPTION {
    #StructPack 4

    SizeOfStruct : UInt32

    PoolTag : UInt32

    Description : CHAR[260]

    Binary : CHAR[32]

    Owner : CHAR[32]

}
