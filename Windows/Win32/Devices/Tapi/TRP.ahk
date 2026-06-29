#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct TRP {
    #StructPack 2

    trpid : UInt16

    cbgrtrp : UInt16

    cch : UInt16

    cbRgb : UInt16

}
