#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PROCESS_NAME_ENTRY {
    #StructPack 4

    ProcessId : UInt32

    NameOffset : UInt32

    NameSize : UInt32

    NextEntry : UInt32

}
