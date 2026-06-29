#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCOMPONENTID {
    #StructPack 4

    Manufacturer : Guid

    Product : Guid

    Component : Guid

    Name : Guid

    Version : UInt32

    Revision : UInt32

}
