#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information describing the network provider returned by the WNetGetNetworkInformation function.
 * @remarks
 * The <b>NETINFOSTRUCT</b> structure contains information describing the network, such as the version of the network provider software and the network's current status.
 * @see https://learn.microsoft.com/windows/win32/api/winnetwk/ns-winnetwk-netinfostruct
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class NETINFOSTRUCT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the 
     * <b>NETINFOSTRUCT</b> structure. The caller must supply this value to indicate the size of the structure passed in. Upon return, it has the size of the structure filled in.
     * @type {Integer}
     */
    cbStructure {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The version number of the network provider software.
     * @type {Integer}
     */
    dwProviderVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Characteristics of the network provider software. 
     * 
     * 
     * This value is zero.
     * @type {Integer}
     */
    dwCharacteristics {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * An instance handle for the network provider or for the 16-bit Windows network driver.
     * @type {Pointer}
     */
    dwHandle {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The network type unique to the running network. This value associates resources with a specific network when the resources are persistent or stored in links. You can find a complete list of network types in the header file Winnetwk.h.
     * @type {Integer}
     */
    wNetType {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A set of bit flags indicating the valid print numbers for redirecting local printer devices, with the low-order bit corresponding to LPT1. 
     * 
     * 
     * 
     * 
     * <b>Windows Me/98/95:  </b>This value is always set to –1.
     * @type {Integer}
     */
    dwPrinters {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A set of bit flags indicating the valid local disk devices for redirecting disk drives, with the low-order bit corresponding to A:. 
     * 
     * 
     * 
     * 
     * <b>Windows Me/98/95:  </b>This value is always set to –1.
     * @type {Integer}
     */
    dwDrives {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
