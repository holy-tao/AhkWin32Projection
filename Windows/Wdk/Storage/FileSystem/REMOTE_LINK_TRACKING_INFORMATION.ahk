#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REMOTE_LINK_TRACKING_INFORMATION {
    #StructPack 8

    TargetFileObject : IntPtr

    TargetLinkTrackingInformationLength : UInt32

    TargetLinkTrackingInformationBuffer : Int8[1]

}
