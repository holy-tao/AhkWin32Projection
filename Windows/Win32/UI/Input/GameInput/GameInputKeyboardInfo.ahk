#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputString.ahk" { GameInputString }
#Import ".\GameInputKeyboardKind.ahk" { GameInputKeyboardKind }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputKeyboardInfo {
    #StructPack 8

    kind : GameInputKeyboardKind

    layout : UInt32

    keyCount : UInt32

    functionKeyCount : UInt32

    maxSimultaneousKeys : UInt32

    platformType : UInt32

    platformSubtype : UInt32

    nativeLanguage : GameInputString.Ptr

}
