#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct RFCOMM_RPN_DATA {
    #StructPack 1

    Baud : Int8

    Data : Int8

    FlowControl : Int8

    XonChar : Int8

    XoffChar : Int8

    ParameterMask1 : Int8

    ParameterMask2 : Int8

}
