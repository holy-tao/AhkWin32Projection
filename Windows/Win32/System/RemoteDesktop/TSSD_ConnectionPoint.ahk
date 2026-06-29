#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TSSD_AddrV46Type.ahk" { TSSD_AddrV46Type }

/**
 * Defines the IP address of a target.
 * @see https://learn.microsoft.com/windows/win32/api/sessdirpublictypes/ns-sessdirpublictypes-tssd_connectionpoint
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct TSSD_ConnectionPoint {
    #StructPack 4

    /**
     * The server address.
     */
    ServerAddressB : Int8[16]

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-tssd_addrv46type">TSSD_AddrV46Type</a> enumeration  that indicates the IP address type.
     */
    AddressType : TSSD_AddrV46Type

    /**
     * The IP port number.
     */
    PortNumber : UInt16

    /**
     * The scope of the address.
     */
    AddressScope : UInt32

}
