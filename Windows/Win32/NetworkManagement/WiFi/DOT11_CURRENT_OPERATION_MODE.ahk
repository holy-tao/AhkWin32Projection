#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_CURRENT_OPERATION_MODE {
    #StructPack 4

    uReserved : UInt32

    uCurrentOpMode : UInt32

}
