#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_SERIAL_NUMBER_CAPABILITY {
    #StructPack 8

    Header : IntPtr

    LowSerialNumber : UInt32

    HighSerialNumber : UInt32

}
