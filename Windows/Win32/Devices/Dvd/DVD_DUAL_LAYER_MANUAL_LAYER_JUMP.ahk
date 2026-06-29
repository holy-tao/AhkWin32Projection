#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_DUAL_LAYER_MANUAL_LAYER_JUMP {
    #StructPack 1

    Reserved1 : Int8[4]

    ManualJumpLayerAddress : Int8[4]

}
