#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct KBD_TYPE_INFO {
    #StructPack 4

    dwVersion : UInt32

    dwType : UInt32

    dwSubType : UInt32

}
