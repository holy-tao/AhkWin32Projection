#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCOMPLETE_LOCK_IRP_ROUTINE.ahk" { PCOMPLETE_LOCK_IRP_ROUTINE }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\PUNLOCK_ROUTINE.ahk" { PUNLOCK_ROUTINE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_LOCK {
    #StructPack 8

    CompleteLockIrpRoutine : PCOMPLETE_LOCK_IRP_ROUTINE

    UnlockRoutine : PUNLOCK_ROUTINE

    FastIoIsQuestionable : BOOLEAN

    SpareC : BOOLEAN[3]

    LockInformation : IntPtr

    LastReturnedLockInfo : IntPtr

    LastReturnedLock : IntPtr

    LockRequestsInProgress : Int32

}
