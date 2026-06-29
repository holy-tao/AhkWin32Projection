#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_DETACHED_SIG_BLOBS {
    #StructPack 8

    cbContentObject : Int64

    pbContentObject : IntPtr

    cbSignatureObject : UInt32

    pbSignatureObject : IntPtr

}
