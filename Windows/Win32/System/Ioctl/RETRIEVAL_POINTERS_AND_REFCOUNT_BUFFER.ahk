#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct RETRIEVAL_POINTERS_AND_REFCOUNT_BUFFER {
    #StructPack 8

    ExtentCount : UInt32

    StartingVcn : Int64

    NextVcn : Int64

    Lcn : Int64

    ReferenceCount : UInt32

}
