#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\CDROM_OPC_INFO_TYPE.ahk" { CDROM_OPC_INFO_TYPE }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_SIMPLE_OPC_INFO {
    #StructPack 4

    RequestType : CDROM_OPC_INFO_TYPE

    Exclude0 : BOOLEAN

    Exclude1 : BOOLEAN

}
