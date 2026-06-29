#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct OPLOCK_KEY_CONTEXT {
    #StructPack 4

    Version : UInt16

    Flags : UInt16

    ParentOplockKey : Guid

    TargetOplockKey : Guid

    Reserved : UInt32

}
