#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_CURSOR_POSITION {
    #StructPack 2

    Column : Int16

    Row : Int16

}
