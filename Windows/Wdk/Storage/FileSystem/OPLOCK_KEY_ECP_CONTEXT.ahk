#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct OPLOCK_KEY_ECP_CONTEXT {
    #StructPack 4

    OplockKey : Guid

    Reserved : UInt32

}
