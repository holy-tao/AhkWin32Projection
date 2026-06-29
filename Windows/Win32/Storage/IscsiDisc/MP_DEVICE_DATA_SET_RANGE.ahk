#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct MP_DEVICE_DATA_SET_RANGE {
    #StructPack 8

    StartingOffset : Int64

    LengthInBytes : Int64

}
