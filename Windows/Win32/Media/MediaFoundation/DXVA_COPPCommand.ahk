#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_COPPCommand {
    #StructPack 4

    macKDI : Guid

    guidCommandID : Guid

    dwSequence : UInt32

    cbSizeData : UInt32

    CommandData : Int8[4056]

}
