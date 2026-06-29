#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VK_FPARAM.ahk" { VK_FPARAM }

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct VK_F {
    #StructPack 4

    Vk : Int8

    NLSFEProcType : Int8

    NLSFEProcCurrent : Int8

    NLSFEProcSwitch : Int8

    NLSFEProc : VK_FPARAM[8]

    NLSFEProcAlt : VK_FPARAM[8]

}
