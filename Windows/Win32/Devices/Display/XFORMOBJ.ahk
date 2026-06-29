#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The XFORMOBJ structure describes an arbitrary linear two-dimensional transform, such as for geometric wide lines.
 * @remarks
 * The arbitrary two-dimensional transform can be downloaded to the driver. Functions are also provided to apply the transform to driver-supplied data.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-xformobj
 * @namespace Windows.Win32.Devices.Display
 */
export default struct XFORMOBJ {
    #StructPack 4

    /**
     * There are no public members in the XFORMOBJ structure.
     */
    ulReserved : UInt32

}
