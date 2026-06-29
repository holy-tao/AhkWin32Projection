#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TRAFFIC_SELECTOR0 {
    #StructPack 4

    protocolId : Int8

    portStart : UInt16

    portEnd : UInt16

    ipVersion : FWP_IP_VERSION

    startV4Address : UInt32

    endV4Address : UInt32

    static __New() {
        DefineProp(this.Prototype, 'startV6Address', { type: Int8[16], offset: 12 })
        DefineProp(this.Prototype, 'endV6Address', { type: Int8[16], offset: 28 })
        this.DeleteProp("__New")
    }
}
