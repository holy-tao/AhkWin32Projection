#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CLFS_MGMT_CLIENT_REGISTRATION {
    #StructPack 8

    Version : UInt32

    AdvanceTailCallback : IntPtr

    AdvanceTailCallbackData : IntPtr

    LogGrowthCompleteCallback : IntPtr

    LogGrowthCompleteCallbackData : IntPtr

    LogUnpinnedCallback : IntPtr

    LogUnpinnedCallbackData : IntPtr

}
