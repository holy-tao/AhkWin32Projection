#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_AGNSS_INJECTBLOB {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    BlobOui : UInt32

    BlobVersion : UInt32

    AgnssFormat : UInt32

    BlobSize : UInt32

    BlobData : Int8[1]

}
