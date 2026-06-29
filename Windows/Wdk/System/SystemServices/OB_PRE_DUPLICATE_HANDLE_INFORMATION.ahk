#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct OB_PRE_DUPLICATE_HANDLE_INFORMATION {
    #StructPack 8

    DesiredAccess : UInt32

    OriginalDesiredAccess : UInt32

    SourceProcess : IntPtr

    TargetProcess : IntPtr

}
