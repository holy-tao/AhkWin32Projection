#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_MANUFACTURING_TEST_QUERY_DATA {
    #StructPack 4

    uKey : UInt32

    uOffset : UInt32

    uBufferLength : UInt32

    uBytesRead : UInt32

    ucBufferOut : Int8[1]

}
