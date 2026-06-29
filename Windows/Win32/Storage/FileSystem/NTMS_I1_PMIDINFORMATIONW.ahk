#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset Unicode
 */
export default struct NTMS_I1_PMIDINFORMATIONW {
    #StructPack 4

    CurrentLibrary : Guid

    MediaPool : Guid

    Location : Guid

    LocationType : UInt32

    MediaType : Guid

    HomeSlot : Guid

    szBarCode : WCHAR[64]

    BarCodeState : UInt32

    szSequenceNumber : WCHAR[32]

    MediaState : UInt32

    dwNumberOfPartitions : UInt32

}
