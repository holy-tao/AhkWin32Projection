#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_OPTIONAL_CAPABILITY {
    #StructPack 4

    uReserved : UInt32

    bDot11PCF : BOOLEAN

    bDot11PCFMPDUTransferToPC : BOOLEAN

    bStrictlyOrderedServiceClass : BOOLEAN

}
