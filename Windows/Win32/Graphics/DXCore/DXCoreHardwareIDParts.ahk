#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DXCore
 */
export default struct DXCoreHardwareIDParts {
    #StructPack 4

    vendorID : UInt32

    deviceID : UInt32

    subSystemID : UInt32

    subVendorID : UInt32

    revisionID : UInt32

}
