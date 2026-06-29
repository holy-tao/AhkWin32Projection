#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSALLOCATOR_FRAMING {
    #StructPack 4

    OptionsFlags : UInt32

    PoolType : UInt32

    Frames : UInt32

    FrameSize : UInt32

    FileAlignment : UInt32

    Reserved : UInt32

    static __New() {
        DefineProp(this.Prototype, 'RequirementsFlags', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'FramePitch', { type: Int32, offset: 16 })
        this.DeleteProp("__New")
    }
}
