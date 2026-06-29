#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct SYSTEM_POLICY_INFORMATION {
    #StructPack 8

    Reserved1 : IntPtr[2]

    Reserved2 : UInt32[3]

}
