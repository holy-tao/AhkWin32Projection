#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct GET_CURRENT_PROCESS_ADDRESS {
    #StructPack 8

    Processor : UInt32

    CurrentThread : Int64

    Address : Int64

}
