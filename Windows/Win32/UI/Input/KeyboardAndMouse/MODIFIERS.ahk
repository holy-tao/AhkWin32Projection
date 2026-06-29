#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VK_TO_BIT.ahk" { VK_TO_BIT }

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct MODIFIERS {
    #StructPack 8

    pVkToBit : VK_TO_BIT.Ptr

    wMaxModBits : UInt16

    ModNumber : Int8[1]

}
