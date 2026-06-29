#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct POWER_SESSION_ALLOW_EXTERNAL_DMA_DEVICES {
    #StructPack 1

    IsAllowed : BOOLEAN

}
