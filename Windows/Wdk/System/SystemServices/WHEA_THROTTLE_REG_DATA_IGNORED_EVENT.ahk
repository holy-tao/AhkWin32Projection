#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_THROTTLE_TYPE.ahk" { WHEA_THROTTLE_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_THROTTLE_REG_DATA_IGNORED_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    ThrottleType : WHEA_THROTTLE_TYPE

}
