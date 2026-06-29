#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VSC_LPWSTR.ahk" { VSC_LPWSTR }
#Import ".\VSC_VK.ahk" { VSC_VK }
#Import ".\DEADKEY.ahk" { DEADKEY }
#Import ".\MODIFIERS.ahk" { MODIFIERS }
#Import ".\LIGATURE1.ahk" { LIGATURE1 }
#Import ".\VK_TO_WCHAR_TABLE.ahk" { VK_TO_WCHAR_TABLE }

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct KBDTABLES {
    #StructPack 8

    pCharModifiers : MODIFIERS.Ptr

    pVkToWcharTable : VK_TO_WCHAR_TABLE.Ptr

    pDeadKey : DEADKEY.Ptr

    pKeyNames : VSC_LPWSTR.Ptr

    pKeyNamesExt : VSC_LPWSTR.Ptr

    pKeyNamesDead : IntPtr

    pusVSCtoVK : IntPtr

    bMaxVSCtoVK : Int8

    pVSCtoVK_E0 : VSC_VK.Ptr

    pVSCtoVK_E1 : VSC_VK.Ptr

    fLocaleFlags : UInt32

    nLgMax : Int8

    cbLgEntry : Int8

    pLigature : LIGATURE1.Ptr

    dwType : UInt32

    dwSubType : UInt32

}
