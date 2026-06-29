#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_MANUFACTURING_TEST_TYPE.ahk" { DOT11_MANUFACTURING_TEST_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_MANUFACTURING_TEST {
    #StructPack 4

    dot11ManufacturingTestType : DOT11_MANUFACTURING_TEST_TYPE

    uBufferLength : UInt32

    ucBuffer : Int8[1]

}
