#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_PREDICT_FAILURE {
    #StructPack 4

    PredictFailure : UInt32

    VendorSpecific : Int8[512]

}
