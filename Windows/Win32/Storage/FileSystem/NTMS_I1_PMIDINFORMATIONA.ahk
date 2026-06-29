#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset ANSI
 */
export default struct NTMS_I1_PMIDINFORMATIONA {
    #StructPack 4

    CurrentLibrary : Guid

    MediaPool : Guid

    Location : Guid

    LocationType : UInt32

    MediaType : Guid

    HomeSlot : Guid

    szBarCode : CHAR[64]

    BarCodeState : UInt32

    szSequenceNumber : CHAR[32]

    MediaState : UInt32

    dwNumberOfPartitions : UInt32

}
