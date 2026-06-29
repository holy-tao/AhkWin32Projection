#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_COPPStatusInput {
    #StructPack 4

    rApp : Guid

    guidStatusRequestID : Guid

    dwSequence : UInt32

    cbSizeData : UInt32

    StatusData : Int8[4056]

}
