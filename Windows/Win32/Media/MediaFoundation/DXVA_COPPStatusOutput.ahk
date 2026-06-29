#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_COPPStatusOutput {
    #StructPack 4

    macKDI : Guid

    cbSizeData : UInt32

    COPPStatus : Int8[4076]

}
