#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_PHY_FREQUENCY_ADOPTED_PARAMETERS {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    ulPhyId : UInt32

    ulChannel : UInt32

    static __New() {
        DefineProp(this.Prototype, 'ulFrequency', { type: UInt32, offset: 8 })
        this.DeleteProp("__New")
    }
}
