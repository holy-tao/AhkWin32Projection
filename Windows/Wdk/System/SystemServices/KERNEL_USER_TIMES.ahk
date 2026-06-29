#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KERNEL_USER_TIMES {
    #StructPack 8

    CreateTime : Int64

    ExitTime : Int64

    KernelTime : Int64

    UserTime : Int64

}
