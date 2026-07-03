#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SERENUM_PORTION.ahk" { SERENUM_PORTION }

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */
export default struct SERENUM_PORT_PARAMETERS {
    #StructPack 8

    Size : UInt32

    ReadAccessor : IntPtr

    WriteAccessor : IntPtr

    SerPortAddress : IntPtr

    HardwareHandle : IntPtr

    Portion : SERENUM_PORTION

    NumberAxis : UInt16

    Reserved : UInt16[3]

}
