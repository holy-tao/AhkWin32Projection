#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_OPERATION_MODE_CAPABILITY {
    #StructPack 4

    uReserved : UInt32

    uMajorVersion : UInt32

    uMinorVersion : UInt32

    uNumOfTXBuffers : UInt32

    uNumOfRXBuffers : UInt32

    uOpModeCapability : UInt32

}
