#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_MANUFACTURING_SELF_TEST_TYPE.ahk" { DOT11_MANUFACTURING_SELF_TEST_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_MANUFACTURING_SELF_TEST_SET_PARAMS {
    #StructPack 8

    SelfTestType : DOT11_MANUFACTURING_SELF_TEST_TYPE

    uTestID : UInt32

    uPinBitMask : UInt32

    pvContext : IntPtr

    uBufferLength : UInt32

    ucBufferIn : Int8[1]

}
