#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMDMID structure describes serial numbers and group IDs.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdmid
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct WMDMID {
    #StructPack 4

    /**
     * Size of the **WMDMID** structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    dwVendorID : UInt32

    pID : Int8[128]

    /**
     * Actual length of the serial number returned, in bytes.
     */
    SerialNumberLength : UInt32

}
