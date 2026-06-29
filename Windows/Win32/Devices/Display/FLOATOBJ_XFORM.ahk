#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FLOATOBJ_XFORM structure describes an arbitrary linear two-dimensional transform, such as for geometric wide lines. (FLOATOBJ_XFORM)
 * @remarks
 * All elements are specified as <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-floatobj">FLOATOBJ</a> values. The transform can be downloaded to the driver. Structure members can be operated on by the <b>FLOATOBJ_</b><i>Xxx</i> routines.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-floatobj_xform
 * @namespace Windows.Win32.Devices.Display
 * @architecture X64, Arm64
 */
export default struct FLOATOBJ_XFORM {
    #StructPack 4

    eM11 : Float32

    eM12 : Float32

    eM21 : Float32

    /**
     * Are the four <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-floatobj">FLOATOBJ</a> elements that comprise a 2x2 row-major matrix. The <b>eM11</b> member specifies the matrix element at row 1, column 1, the <b>eM12</b> member specifies the matrix element at row 1, column2, and so on.
     */
    eM22 : Float32

    eDx : Float32

    /**
     * Are the x- and y-translation components of the transform.
     */
    eDy : Float32

}
