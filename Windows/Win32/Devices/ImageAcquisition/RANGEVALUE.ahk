#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct RANGEVALUE {
    #StructPack 4

    lMin : Int32

    lMax : Int32

    lStep : Int32

}
