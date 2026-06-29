#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IOSPACE_EX64 {
    #StructPack 8

    Address : Int64

    Length : UInt32

    Data : UInt32

    InterfaceType : UInt32

    BusNumber : UInt32

    AddressSpace : UInt32

}
