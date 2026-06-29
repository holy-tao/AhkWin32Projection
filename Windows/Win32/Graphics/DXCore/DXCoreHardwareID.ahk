#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the PnP hardware ID parts for an adapter.
 * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/ns-dxcore_interface-dxcorehardwareid
 * @namespace Windows.Win32.Graphics.DXCore
 */
export default struct DXCoreHardwareID {
    #StructPack 4

    vendorID : UInt32

    deviceID : UInt32

    subSysID : UInt32

    /**
     * Type: **uint32_t\***
     * 
     * The PCI ID of the adapter's revision number.
     */
    revision : UInt32

}
