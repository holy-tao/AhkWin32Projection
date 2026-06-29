#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Console
 */
export default struct CONSOLE_PROCESS_INFO {
    #StructPack 4

    dwProcessID : UInt32

    dwFlags : UInt32

}
