#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct BOOTDISK_INFORMATION_LITE {
    #StructPack 8

    NumberEntries : UInt32

    Entries : IntPtr[1]

}
