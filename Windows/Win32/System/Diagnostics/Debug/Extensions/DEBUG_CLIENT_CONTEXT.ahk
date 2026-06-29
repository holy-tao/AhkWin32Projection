#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_CLIENT_CONTEXT {
    #StructPack 4

    cbSize : UInt32 := this.Size

    eClient : UInt32

}
