#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_NIC_SPECIFIC_EXTENSION {
    #StructPack 4

    uBufferLength : UInt32

    uTotalBufferLength : UInt32

    ucBuffer : Int8[1]

}
