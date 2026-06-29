#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ADDRALIAS {
    #StructPack 4

    rgchName : CHAR[41]

    rgchEName : CHAR[11]

    rgchSrvr : CHAR[12]

    dibDetail : UInt32

    type : UInt16

}
