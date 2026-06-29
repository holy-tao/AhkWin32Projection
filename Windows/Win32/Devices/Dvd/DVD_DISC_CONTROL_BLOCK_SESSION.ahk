#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DVD_DISC_CONTROL_BLOCK_SESSION_ITEM.ahk" { DVD_DISC_CONTROL_BLOCK_SESSION_ITEM }
#Import ".\DVD_DISC_CONTROL_BLOCK_HEADER.ahk" { DVD_DISC_CONTROL_BLOCK_HEADER }

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_DISC_CONTROL_BLOCK_SESSION {
    #StructPack 1

    header : DVD_DISC_CONTROL_BLOCK_HEADER

    SessionNumber : Int8[2]

    Reserved0 : Int8[22]

    DiscID : Int8[32]

    Reserved1 : Int8[32]

    SessionItem : DVD_DISC_CONTROL_BLOCK_SESSION_ITEM[504]

    Reserved2 : Int8[24576]

}
