#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct XML_DRIVER_NODE_INFO {
    #StructPack 8

    FileName : CHAR[64]

    FileSize : Int64

    CreationDate : Int64

    Version : CHAR[64]

    Manufacturer : CHAR[260]

    ProductName : CHAR[260]

    Group : CHAR[260]

    Altitude : CHAR[260]

}
