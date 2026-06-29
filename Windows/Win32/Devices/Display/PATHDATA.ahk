#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POINTFIX.ahk" { POINTFIX }

/**
 * The PATHDATA structure describes all or part of a subpath.
 * @remarks
 * The PATHDATA structure describes all or part of a subpath. For example, a <b>MoveTo</b> call by an application within a path begins a new subpath.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-pathdata
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PATHDATA {
    #StructPack 8

    /**
     * Flags describing the data returned are defined as follows:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * PD_ALL
     * 
     * </td>
     * <td>
     * This flag is the ORed combination of the other flags in this table. That is, PD_ALL == PD_BEGINSUBPATH | PD_ENDSUBPATH | PD_RESETSTYLE | PD_CLOSEFIGURE | PD_BEZIERS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * PD_BEGINSUBPATH
     * 
     * </td>
     * <td>
     * The first point begins a new subpath. It is not connected to the previous subpath. If this flag is not set, the starting point for the first curve to be drawn from this data is the last point returned in the previous call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * PD_BEZIERS
     * 
     * </td>
     * <td>
     * If set, each set of three control points returned for this call describes a Bezier curve. If clear, each control point describes a line segment. A starting point for either type is either explicit at the beginning of the subpath, or implicit as the endpoint of the previous curve.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * PD_CLOSEFIGURE
     * 
     * </td>
     * <td>
     * This bit is only defined if the record ends a subpath. If set, there is an implicit line segment connecting the last point of the subpath with the first point. If such a closed subpath is being stroked, joins are used all around the path, and there are no end caps. If this flag is not set, the subpath is considered open, even if the first and last points happen to coincide. In that case, end caps should be drawn. This flag is not relevant to filling because all subpaths are assumed closed when a path is filled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * PD_ENDSUBPATH
     * 
     * </td>
     * <td>
     * The last point in the array ends the subpath. This subpath can be open or closed depending on the PD_CLOSEFIGURE flag. If there is more data to be returned in the path, the next record begins a new subpath. Note that a single record might begin and end a subpath.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * PD_RESETSTYLE
     * 
     * </td>
     * <td>
     * This bit is defined only if this record begins a new subpath. If set, it indicates the style state should be reset to zero at the beginning of the subpath. If not set, the style state is defined by the LINEATTRS structure, or continues from the previous subpath.
     * 
     * </td>
     * </tr>
     * </table>
     */
    flags : UInt32

    /**
     * Specifies the count of POINTFIX structures pointed to by <b>pptfx</b>.
     */
    count : UInt32

    /**
     * Pointer to an array of POINTFIX structures that define the control points for the curves. These structures must not be modified. For a description of the POINTFIX structure, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
     */
    pptfx : POINTFIX.Ptr

}
