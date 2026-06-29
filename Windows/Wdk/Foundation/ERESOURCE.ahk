#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OWNER_ENTRY.ahk" { OWNER_ENTRY }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct ERESOURCE {
    #StructPack 8

    SystemResourcesList : IntPtr

    OwnerTable : OWNER_ENTRY.Ptr

    ActiveCount : Int16

    Flag : UInt16

    SharedWaiters : IntPtr

    ExclusiveWaiters : IntPtr

    OwnerEntry : IntPtr

    ActiveEntries : UInt32

    ContentionCount : UInt32

    NumberOfSharedWaiters : UInt32

    NumberOfExclusiveWaiters : UInt32

    Address : IntPtr

    SpinLock : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'ReservedLowFlags', { type: Int8, offset: 18 })
        DefineProp(this.Prototype, 'WaiterPriority', { type: Int8, offset: 19 })
        DefineProp(this.Prototype, 'CreatorBackTraceIndex', { type: IntPtr, offset: 64 })
        this.DeleteProp("__New")
    }
}
