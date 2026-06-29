#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_UNION_ARM {
    #StructPack 8

    CaseValue : Int64

    Type : IntPtr

    Reserved : UInt32

}
