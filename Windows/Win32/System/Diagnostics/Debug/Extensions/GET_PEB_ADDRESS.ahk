#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct GET_PEB_ADDRESS {
    #StructPack 8

    CurrentThread : Int64

    Address : Int64

}
