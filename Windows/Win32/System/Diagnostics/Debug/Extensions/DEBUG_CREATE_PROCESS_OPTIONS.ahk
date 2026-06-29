#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_CREATE_PROCESS_OPTIONS {
    #StructPack 4

    CreateFlags : UInt32

    EngCreateFlags : UInt32

    VerifierFlags : UInt32

    Reserved : UInt32

}
