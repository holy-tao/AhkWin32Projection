#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VK_TO_WCHARS1.ahk" { VK_TO_WCHARS1 }

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct VK_TO_WCHAR_TABLE {
    #StructPack 8

    pVkToWchars : VK_TO_WCHARS1.Ptr

    nModifications : Int8

    cbSize : Int8 := this.Size

}
