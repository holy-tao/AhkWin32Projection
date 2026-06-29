#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct BUSDATA {
    #StructPack 8

    BusDataType : UInt32

    BusNumber : UInt32

    SlotNumber : UInt32

    Buffer : IntPtr

    Offset : UInt32

    Length : UInt32

}
