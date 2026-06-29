#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct NETWORK_APP_INSTANCE_VERSION_ECP_CONTEXT {
    #StructPack 8

    Size : UInt16

    Reserved : UInt16

    VersionHigh : Int64

    VersionLow : Int64

}
