#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SCOPE_TABLE_ARM {
    #StructPack 4

    Count : UInt32

    BeginAddress : UInt32

    EndAddress : UInt32

    HandlerAddress : UInt32

    JumpTarget : UInt32

}
