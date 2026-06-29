#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BD_PAC_HEADER.ahk" { BD_PAC_HEADER }

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct BD_DISC_WRITE_PROTECT_PAC {
    #StructPack 1

    Header : BD_PAC_HEADER

    KnownPACEntireDiscFlags : Int8

    Reserved1 : Int8[3]

    WriteProtectControlByte : Int8

    Reserved2 : Int8[7]

    WriteProtectPassword : Int8[32]

}
