#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FD_XFORM structure describes an arbitrary two-dimensional font transform.
 * @remarks
 * This structure is used typically to hold notional-to-device-space font transformations.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-fd_xform
 * @namespace Windows.Win32.Devices.Display
 * @architecture X64, Arm64
 */
export default struct FD_XFORM {
    #StructPack 4

    eXX : Float32

    eXY : Float32

    eYX : Float32

    /**
     * Are the four elements that comprise a 2x2 row-major matrix. <b>eXX</b> and <b>eXY</b> are the elements in the first row; <b>eYX</b> and <b>eYY</b> are the elements in the second row.
     */
    eYY : Float32

}
