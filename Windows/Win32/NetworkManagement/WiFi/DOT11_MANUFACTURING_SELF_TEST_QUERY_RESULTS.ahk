#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_MANUFACTURING_SELF_TEST_TYPE.ahk" { DOT11_MANUFACTURING_SELF_TEST_TYPE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_MANUFACTURING_SELF_TEST_QUERY_RESULTS {
    #StructPack 8

    SelfTestType : DOT11_MANUFACTURING_SELF_TEST_TYPE

    uTestID : UInt32

    bResult : BOOLEAN

    uPinFailedBitMask : UInt32

    pvContext : IntPtr

    uBytesWrittenOut : UInt32

    ucBufferOut : Int8[1]

}
