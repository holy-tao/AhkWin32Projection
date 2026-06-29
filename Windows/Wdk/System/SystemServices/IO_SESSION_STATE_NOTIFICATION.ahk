#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_SESSION_STATE_NOTIFICATION {
    #StructPack 8

    Size : UInt32

    Flags : UInt32

    IoObject : IntPtr

    EventMask : UInt32

    Context : IntPtr

}
