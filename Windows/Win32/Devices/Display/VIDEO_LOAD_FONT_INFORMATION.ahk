#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_LOAD_FONT_INFORMATION {
    #StructPack 4

    WidthInPixels : UInt16

    HeightInPixels : UInt16

    FontSize : UInt32

    Font : Int8[1]

}
