#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct SYSTEM_PROCESS_TRUST_LABEL_ACE {
    #StructPack 8

    Header : IntPtr

    Mask : UInt32

    SidStart : UInt32

}
