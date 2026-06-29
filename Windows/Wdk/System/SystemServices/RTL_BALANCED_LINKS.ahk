#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_BALANCED_LINKS {
    #StructPack 8

    Parent : RTL_BALANCED_LINKS.Ptr

    LeftChild : RTL_BALANCED_LINKS.Ptr

    RightChild : RTL_BALANCED_LINKS.Ptr

    Balance : CHAR

    Reserved : Int8[3]

}
