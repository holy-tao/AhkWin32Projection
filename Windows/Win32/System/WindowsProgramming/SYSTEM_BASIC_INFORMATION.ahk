#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct SYSTEM_BASIC_INFORMATION {
    #StructPack 8

    Reserved1 : Int8[24]

    Reserved2 : IntPtr[4]

    NumberOfProcessors : Int8

}
