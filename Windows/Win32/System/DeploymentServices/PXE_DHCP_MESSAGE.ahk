#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PXE_DHCP_OPTION.ahk" { PXE_DHCP_OPTION }

/**
 * The PXE_DHCP_MESSAGE structure can be used with the Windows Deployment Services PXE Server API.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/ns-wdspxe-pxe_dhcp_message
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PXE_DHCP_MESSAGE {
    #StructPack 4

    /**
     * Operation (op) field
     */
    Operation : Int8

    /**
     * Hardware Address Type (htype) field
     */
    HardwareAddressType : Int8

    /**
     * Hardware Address Length (hlen) field
     */
    HardwareAddressLength : Int8

    HopCount : Int8

    TransactionID : UInt32

    /**
     * Seconds Since Boot (secs) field
     */
    SecondsSinceBoot : UInt16

    /**
     * This parameter is reserved.
     */
    Reserved : UInt16

    /**
     * Client IP Address (ciaddr) field
     */
    ClientIpAddress : UInt32

    YourIpAddress : UInt32

    BootstrapServerAddress : UInt32

    RelayAgentIpAddress : UInt32

    HardwareAddress : Int8[16]

    HostName : Int8[64]

    BootFileName : Int8[128]

    bMagicCookie : Int8[4]

    Option : PXE_DHCP_OPTION

    static __New() {
        DefineProp(this.Prototype, 'uMagicCookie', { type: UInt32, offset: 236 })
        this.DeleteProp("__New")
    }
}
