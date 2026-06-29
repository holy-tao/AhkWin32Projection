#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VK_F.ahk" { VK_F }

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct KBDNLSTABLES {
    #StructPack 8

    OEMIdentifier : UInt16

    LayoutInformation : UInt16

    NumOfVkToF : UInt32

    pVkToF : VK_F.Ptr

    NumOfMouseVKey : Int32

    pusMouseVKey : IntPtr

}
