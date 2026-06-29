#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */
export default struct SERENUM_PORT_DESC {
    #StructPack 8

    Size : UInt32

    PortHandle : IntPtr

    PortAddress : Int64

    Reserved : UInt16[1]

}
