#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SERVICE_RUNS_IN_PROCESS.ahk" { SERVICE_RUNS_IN_PROCESS }
#Import ".\SERVICE_STATUS_PROCESS.ahk" { SERVICE_STATUS_PROCESS }
#Import ".\ENUM_SERVICE_TYPE.ahk" { ENUM_SERVICE_TYPE }
#Import ".\SERVICE_STATUS_CURRENT_STATE.ahk" { SERVICE_STATUS_CURRENT_STATE }

/**
 * @namespace Windows.Win32.System.Services
 */
export default struct SERVICE_NOTIFY_1 {
    #StructPack 8

    dwVersion : UInt32

    pfnNotifyCallback : IntPtr

    pContext : IntPtr

    dwNotificationStatus : UInt32

    ServiceStatus : SERVICE_STATUS_PROCESS

}
