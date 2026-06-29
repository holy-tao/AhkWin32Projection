#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct VM_COUNTERS_EX2 {
    #StructPack 8

    CountersEx : IntPtr

    PrivateWorkingSetSize : IntPtr

    SharedCommitUsage : Int64

}
