#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_MANUFACTURING_CALLBACK_TYPE.ahk" { DOT11_MANUFACTURING_CALLBACK_TYPE }
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_MANUFACTURING_CALLBACK_PARAMETERS {
    #StructPack 8

    Header : NDIS_OBJECT_HEADER

    dot11ManufacturingCallbackType : DOT11_MANUFACTURING_CALLBACK_TYPE

    uStatus : UInt32

    pvContext : IntPtr

}
