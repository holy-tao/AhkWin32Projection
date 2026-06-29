#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct COPYFILE2_CREATE_OPLOCK_KEYS {
    #StructPack 4

    ParentOplockKey : Guid

    TargetOplockKey : Guid

}
