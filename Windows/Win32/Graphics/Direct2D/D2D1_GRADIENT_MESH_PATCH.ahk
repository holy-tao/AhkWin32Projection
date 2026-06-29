#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_PATCH_EDGE_MODE.ahk" { D2D1_PATCH_EDGE_MODE }
#Import "Common\D2D1_COLOR_F.ahk" { D2D1_COLOR_F }
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }

/**
 * Represents a tensor patch with 16 control points, 4 corner colors, and boundary flags. An ID2D1GradientMesh is made up of 1 or more gradient mesh patches. Use the GradientMeshPatch function or the GradientMeshPatchFromCoonsPatch function to create one.
 * @remarks
 * The following image shows the numbering of control points on a tensor grid.
 * 
 * <img alt="Number of control points on a tensor grid" src="./images/tensorpatch.png"/>
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ns-d2d1_3-d2d1_gradient_mesh_patch
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_GRADIENT_MESH_PATCH {
    #StructPack 4

    /**
     * The coordinate-space location of the control point in column 0 and row 0 of the tensor grid.
     */
    point00 : D2D_POINT_2F

    /**
     * The coordinate-space location of the control point in column 0 and row 1 of the tensor grid.
     */
    point01 : D2D_POINT_2F

    /**
     * The coordinate-space location of the control point in column 0 and row 2 of the tensor grid.
     */
    point02 : D2D_POINT_2F

    /**
     * The coordinate-space location of the control point in column 0 and row 3 of the tensor grid.
     */
    point03 : D2D_POINT_2F

    /**
     * The coordinate-space location of the control point in column 1 and row 0 of the tensor grid.
     */
    point10 : D2D_POINT_2F

    /**
     * The coordinate-space location of the control point in column 1 and row 1 of the tensor grid.
     */
    point11 : D2D_POINT_2F

    /**
     * The coordinate-space location of the control point in column 1 and row 2 of the tensor grid.
     */
    point12 : D2D_POINT_2F

    /**
     * The coordinate-space location of the control point in column 1 and row 3 of the tensor grid.
     */
    point13 : D2D_POINT_2F

    /**
     * The coordinate-space location of the control point in column 2 and row 0 of the tensor grid.
     */
    point20 : D2D_POINT_2F

    /**
     * The coordinate-space location of the control point in column 2 and row 1 of the tensor grid.
     */
    point21 : D2D_POINT_2F

    /**
     * The coordinate-space location of the control point in column 2 and row 2 of the tensor grid.
     */
    point22 : D2D_POINT_2F

    /**
     * The coordinate-space location of the control point in column 2 and row 3 of the tensor grid.
     */
    point23 : D2D_POINT_2F

    /**
     * The coordinate-space location of the control point in column 3 and row 0 of the tensor grid.
     */
    point30 : D2D_POINT_2F

    /**
     * The coordinate-space location of the control point in column 3 and row 1 of the tensor grid.
     */
    point31 : D2D_POINT_2F

    /**
     * The coordinate-space location of the control point in column 3 and row 2 of the tensor grid.
     */
    point32 : D2D_POINT_2F

    /**
     * The coordinate-space location of the control point in column 3 and row 3 of the tensor grid.
     */
    point33 : D2D_POINT_2F

    /**
     * The color associated with the control point in column 0 and row 0 of the tensor grid.
     */
    color00 : D2D1_COLOR_F

    /**
     * The color associated with the control point in column 0 and row 3 of the tensor grid.
     */
    color03 : D2D1_COLOR_F

    /**
     * The color associated with the control point in column 3 and row 0 of the tensor grid.
     */
    color30 : D2D1_COLOR_F

    /**
     * The color associated with the control point in column 3 and row 3 of the tensor grid.
     */
    color33 : D2D1_COLOR_F

    /**
     * Specifies how to render the top edge of the mesh.
     */
    topEdgeMode : D2D1_PATCH_EDGE_MODE

    /**
     * Specifies how to render the left edge of the mesh.
     */
    leftEdgeMode : D2D1_PATCH_EDGE_MODE

    /**
     * Specifies how to render the bottom edge of the mesh.
     */
    bottomEdgeMode : D2D1_PATCH_EDGE_MODE

    /**
     * Specifies how to render the right edge of the mesh.
     */
    rightEdgeMode : D2D1_PATCH_EDGE_MODE

}
