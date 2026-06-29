#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_LOCK {
    #StructPack 8

    CompleteLockIrpRoutine : IntPtr

    UnlockRoutine : IntPtr

    FastIoIsQuestionable : BOOLEAN

    SpareC : BOOLEAN[3]

    LockInformation : IntPtr

    LastReturnedLockInfo : IntPtr

    LastReturnedLock : IntPtr

    LockRequestsInProgress : Int32

}
