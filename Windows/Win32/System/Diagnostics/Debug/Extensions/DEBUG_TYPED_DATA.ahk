#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_TYPED_DATA {
    #StructPack 8

    ModBase : Int64

    Offset : Int64

    EngineHandle : Int64

    Data : Int64

    Size : UInt32

    Flags : UInt32

    TypeId : UInt32

    BaseTypeId : UInt32

    Tag : UInt32

    Register : UInt32

    Internal : Int64[9]

}
