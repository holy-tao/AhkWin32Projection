#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_IV48_COUNTER {
    #StructPack 4

    uIV32Counter : UInt32

    usIV16Counter : UInt16

}
