#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct POWER_ADAPTER_SET_STATUS_BUFFER {
    #StructPack 1

    Version : Int8

    RecOverride : BOOLEAN

    Reserved : Int8[2]

}
