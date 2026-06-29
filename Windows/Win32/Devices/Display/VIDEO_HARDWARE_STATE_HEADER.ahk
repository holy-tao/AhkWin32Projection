#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_HARDWARE_STATE_HEADER {
    #StructPack 8

    Length : UInt32

    PortValue : Int8[48]

    AttribIndexDataState : UInt32

    BasicSequencerOffset : UInt32

    BasicCrtContOffset : UInt32

    BasicGraphContOffset : UInt32

    BasicAttribContOffset : UInt32

    BasicDacOffset : UInt32

    BasicLatchesOffset : UInt32

    ExtendedSequencerOffset : UInt32

    ExtendedCrtContOffset : UInt32

    ExtendedGraphContOffset : UInt32

    ExtendedAttribContOffset : UInt32

    ExtendedDacOffset : UInt32

    ExtendedValidatorStateOffset : UInt32

    ExtendedMiscDataOffset : UInt32

    PlaneLength : UInt32

    Plane1Offset : UInt32

    Plane2Offset : UInt32

    Plane3Offset : UInt32

    Plane4Offset : UInt32

    VGAStateFlags : UInt32

    DIBOffset : UInt32

    DIBBitsPerPixel : UInt32

    DIBXResolution : UInt32

    DIBYResolution : UInt32

    DIBXlatOffset : UInt32

    DIBXlatLength : UInt32

    VesaInfoOffset : UInt32

    FrameBufferData : IntPtr

}
