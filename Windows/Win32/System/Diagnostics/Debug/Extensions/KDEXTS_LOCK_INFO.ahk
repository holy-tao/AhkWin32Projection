#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct KDEXTS_LOCK_INFO {
    #StructPack 8

    SizeOfStruct : UInt32

    Address : Int64

    OwningThread : Int64

    ExclusiveOwned : BOOL

    NumOwners : UInt32

    ContentionCount : UInt32

    NumExclusiveWaiters : UInt32

    NumSharedWaiters : UInt32

    pOwnerThreads : IntPtr

    pWaiterThreads : IntPtr

}
