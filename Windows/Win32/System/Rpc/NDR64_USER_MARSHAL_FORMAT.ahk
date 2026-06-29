#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_USER_MARSHAL_FORMAT {
    #StructPack 8

    FormatCode : Int8

    Flags : Int8

    RoutineIndex : UInt16

    TransmittedTypeWireAlignment : UInt16

    MemoryAlignment : UInt16

    UserTypeMemorySize : UInt32

    TransmittedTypeBufferSize : UInt32

    TransmittedType : IntPtr

}
