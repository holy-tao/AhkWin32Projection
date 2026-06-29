#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct NETWORK_APP_INSTANCE_ECP_CONTEXT {
    #StructPack 4

    Size : UInt16

    Reserved : UInt16

    AppInstanceID : Guid

}
