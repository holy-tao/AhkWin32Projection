#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct RedEyeCorrectionParams {
    #StructPack 8

    numberOfAreas : UInt32

    areas : RECT.Ptr

}
