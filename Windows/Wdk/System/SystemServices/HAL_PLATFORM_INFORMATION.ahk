#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct HAL_PLATFORM_INFORMATION {
    #StructPack 4

    PlatformFlags : UInt32

}
