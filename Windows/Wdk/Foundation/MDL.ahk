#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct MDL {
    #StructPack 8

    Next : MDL.Ptr

    Size : Int16

    MdlFlags : Int16

    Process : IntPtr

    MappedSystemVa : IntPtr

    StartVa : IntPtr

    ByteCount : UInt32

    ByteOffset : UInt32

}
