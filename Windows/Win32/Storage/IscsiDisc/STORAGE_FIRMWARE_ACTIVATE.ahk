#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct STORAGE_FIRMWARE_ACTIVATE {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    SlotToActivate : Int8

    Reserved0 : Int8[3]

}
