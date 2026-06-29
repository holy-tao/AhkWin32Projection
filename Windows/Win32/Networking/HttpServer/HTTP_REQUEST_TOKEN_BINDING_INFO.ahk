#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_REQUEST_TOKEN_BINDING_INFO {
    #StructPack 8

    TokenBinding : IntPtr

    TokenBindingSize : UInt32

    EKM : IntPtr

    EKMSize : UInt32

    KeyType : Int8

}
