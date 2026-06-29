#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KDPC.ahk" { KDPC }
#Import ".\KQUEUE.ahk" { KQUEUE }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct KWAIT_BLOCK {
    #StructPack 8

    WaitListEntry : IntPtr

    WaitType : Int8

    BlockState : Int8

    WaitKey : UInt16

    Thread : IntPtr

    Object : IntPtr

    SparePtr : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'NotificationQueue', { type: KQUEUE.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'Dpc', { type: KDPC.Ptr, offset: 16 })
        this.DeleteProp("__New")
    }
}
