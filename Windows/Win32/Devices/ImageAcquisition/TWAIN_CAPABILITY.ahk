#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct TWAIN_CAPABILITY {
    #StructPack 4

    lSize : Int32

    lMSG : Int32

    lCapID : Int32

    lConType : Int32

    lRC : Int32

    lCC : Int32

    lDataSize : Int32

    Data : Int8[1]

}
