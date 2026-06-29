#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputKeyState {
    #StructPack 4

    scanCode : UInt32

    codePoint : UInt32

    virtualKey : Int8

    isDeadKey : Int8

}
