#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCLFS_CLIENT_ADVANCE_TAIL_CALLBACK.ahk" { PCLFS_CLIENT_ADVANCE_TAIL_CALLBACK }
#Import ".\PCLFS_CLIENT_LFF_HANDLER_COMPLETE_CALLBACK.ahk" { PCLFS_CLIENT_LFF_HANDLER_COMPLETE_CALLBACK }
#Import ".\PCLFS_CLIENT_LOG_UNPINNED_CALLBACK.ahk" { PCLFS_CLIENT_LOG_UNPINNED_CALLBACK }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CLFS_MGMT_CLIENT_REGISTRATION {
    #StructPack 8

    Version : UInt32

    AdvanceTailCallback : PCLFS_CLIENT_ADVANCE_TAIL_CALLBACK

    AdvanceTailCallbackData : IntPtr

    LogGrowthCompleteCallback : PCLFS_CLIENT_LFF_HANDLER_COMPLETE_CALLBACK

    LogGrowthCompleteCallbackData : IntPtr

    LogUnpinnedCallback : PCLFS_CLIENT_LOG_UNPINNED_CALLBACK

    LogUnpinnedCallbackData : IntPtr

}
