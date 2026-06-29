#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KBUGCHECK_CALLBACK_RECORD {
    #StructPack 8

    Entry : IntPtr

    CallbackRoutine : IntPtr

    Buffer : IntPtr

    Length : UInt32

    Component : IntPtr

    Checksum : IntPtr

    State : Int8

}
