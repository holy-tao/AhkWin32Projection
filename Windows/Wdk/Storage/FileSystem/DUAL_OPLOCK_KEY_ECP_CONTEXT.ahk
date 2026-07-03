#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct DUAL_OPLOCK_KEY_ECP_CONTEXT {
    #StructPack 4

    ParentOplockKey : Guid

    TargetOplockKey : Guid

    ParentOplockKeySet : BOOLEAN

    TargetOplockKeySet : BOOLEAN

}
