#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct EXTENDED_CREATE_INFORMATION {
    #StructPack 8

    ExtendedCreateFlags : Int64

    EaBuffer : IntPtr

    EaLength : UInt32

}
