#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PM_DISPATCH_TABLE {
    #StructPack 8

    Signature : UInt32

    Version : UInt32

    Function : IntPtr[1]

}
