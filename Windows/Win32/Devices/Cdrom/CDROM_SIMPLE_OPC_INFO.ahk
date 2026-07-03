#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CDROM_OPC_INFO_TYPE.ahk" { CDROM_OPC_INFO_TYPE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_SIMPLE_OPC_INFO {
    #StructPack 4

    RequestType : CDROM_OPC_INFO_TYPE

    Exclude0 : BOOLEAN

    Exclude1 : BOOLEAN

}
