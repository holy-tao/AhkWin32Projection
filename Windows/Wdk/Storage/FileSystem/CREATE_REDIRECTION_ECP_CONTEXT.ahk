#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct CREATE_REDIRECTION_ECP_CONTEXT {
    #StructPack 8

    Size : UInt16

    Flags : UInt16

    FileId : IntPtr

    VolumeGuid : Guid

}
