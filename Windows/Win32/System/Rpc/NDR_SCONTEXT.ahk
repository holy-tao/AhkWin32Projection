#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR_SCONTEXT {
    #StructPack 8

    pad : IntPtr[2]

    userContext : IntPtr

}
