#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The MBN_DEVICE_SERVICE structure provides information about a Mobile Broadband device service.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ns-mbnapi-mbn_device_service
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_DEVICE_SERVICE {
    #StructPack 8

    /**
     * A string that represents the unique ID of a Mobile Broadband device service. This matches the Device Service UUID reported by the Mobile Broadband device.
     */
    deviceServiceID : BSTR

    /**
     * if <b>TRUE</b>, this device service supports write on bulk data sessions. Otherwise, <b>FALSE</b>.
     */
    dataWriteSupported : VARIANT_BOOL

    /**
     * if <b>TRUE</b>, this device service supports read on bulk data sessions. Otherwise, <b>FALSE</b>.
     */
    dataReadSupported : VARIANT_BOOL

}
