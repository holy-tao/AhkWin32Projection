#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PACQUIRE_FOR_LAZY_WRITE_EX.ahk" { PACQUIRE_FOR_LAZY_WRITE_EX }
#Import ".\PACQUIRE_FOR_READ_AHEAD.ahk" { PACQUIRE_FOR_READ_AHEAD }
#Import ".\PRELEASE_FROM_LAZY_WRITE.ahk" { PRELEASE_FROM_LAZY_WRITE }
#Import ".\PRELEASE_FROM_READ_AHEAD.ahk" { PRELEASE_FROM_READ_AHEAD }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct CACHE_MANAGER_CALLBACK_FUNCTIONS {
    #StructPack 8

    AcquireForLazyWriteEx : PACQUIRE_FOR_LAZY_WRITE_EX

    ReleaseFromLazyWrite : PRELEASE_FROM_LAZY_WRITE

    AcquireForReadAhead : PACQUIRE_FOR_READ_AHEAD

    ReleaseFromReadAhead : PRELEASE_FROM_READ_AHEAD

}
