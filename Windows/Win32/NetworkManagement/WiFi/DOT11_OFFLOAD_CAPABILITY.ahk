#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_OFFLOAD_CAPABILITY {
    #StructPack 4

    uReserved : UInt32

    uFlags : UInt32

    uSupportedWEPAlgorithms : UInt32

    uNumOfReplayWindows : UInt32

    uMaxWEPKeyMappingLength : UInt32

    uSupportedAuthAlgorithms : UInt32

    uMaxAuthKeyMappingLength : UInt32

}
