#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct SECURE_ELEMENT_NFCC_CAPABILITIES {
    #StructPack 2

    cbMaxRoutingTableSize : UInt16

    IsAidRoutingSupported : BOOLEAN

    IsProtocolRoutingSupported : BOOLEAN

    IsTechRoutingSupported : BOOLEAN

}
