#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFN_DrvGetDriverSetting.ahk" { PFN_DrvGetDriverSetting }
#Import ".\PFN_DrvUpdateUISetting.ahk" { PFN_DrvUpdateUISetting }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct OEMUIPROCS {
    #StructPack 8

    DrvGetDriverSetting : PFN_DrvGetDriverSetting

    DrvUpdateUISetting : PFN_DrvUpdateUISetting

}
