#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct KEY_TYPE_SUBTYPE {
    #StructPack 4

    dwKeySpec : UInt32

    Type : Guid

    Subtype : Guid

}
