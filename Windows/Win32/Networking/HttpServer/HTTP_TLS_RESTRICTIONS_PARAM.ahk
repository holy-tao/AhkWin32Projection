#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_TLS_RESTRICTIONS_PARAM {
    #StructPack 8

    RestrictionCount : UInt32

    TlsRestrictions : IntPtr

}
