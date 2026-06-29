#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */
export default struct SERIAL_HANDFLOW {
    #StructPack 4

    ControlHandShake : UInt32

    FlowReplace : UInt32

    XonLimit : Int32

    XoffLimit : Int32

}
