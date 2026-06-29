#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DVD_DISC_CONTROL_BLOCK_LIST_DCB.ahk" { DVD_DISC_CONTROL_BLOCK_LIST_DCB }
#Import ".\DVD_DISC_CONTROL_BLOCK_HEADER.ahk" { DVD_DISC_CONTROL_BLOCK_HEADER }

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_DISC_CONTROL_BLOCK_LIST {
    #StructPack 1

    header : DVD_DISC_CONTROL_BLOCK_HEADER

    Reserved0 : Int8

    ReadabldDCBs : Int8

    Reserved1 : Int8

    WritableDCBs : Int8

    Dcbs : DVD_DISC_CONTROL_BLOCK_LIST_DCB[1]

}
