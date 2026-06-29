#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_LANE_ERROR_STATUS {
    #StructPack 4

    LaneBitmap : UInt32

}
