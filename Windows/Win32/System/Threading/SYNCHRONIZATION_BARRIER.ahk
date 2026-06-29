#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct SYNCHRONIZATION_BARRIER {
    #StructPack 8

    Reserved1 : UInt32

    Reserved2 : UInt32

    Reserved3 : IntPtr[2]

    Reserved4 : UInt32

    Reserved5 : UInt32

}
