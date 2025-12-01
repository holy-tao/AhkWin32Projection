#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D_POINT_2F.ahk
#Include Common\D2D1_COLOR_F.ahk

/**
 * Represents a tensor patch with 16 control points, 4 corner colors, and boundary flags. An ID2D1GradientMesh is made up of 1 or more gradient mesh patches. Use the GradientMeshPatch function or the GradientMeshPatchFromCoonsPatch function to create one.
 * @remarks
 * The following image shows the numbering of control points on a tensor grid.
 * 
 * <img alt="Number of control points on a tensor grid" src="./images/tensorpatch.png"/>
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ns-d2d1_3-d2d1_gradient_mesh_patch
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_GRADIENT_MESH_PATCH extends Win32Struct
{
    static sizeof => 208

    static packingSize => 8

    /**
     * The coordinate-space location of the control point in column 0 and row 0 of the tensor grid.
     * @type {D2D_POINT_2F}
     */
    point00{
        get {
            if(!this.HasProp("__point00"))
                this.__point00 := D2D_POINT_2F(0, this)
            return this.__point00
        }
    }

    /**
     * The coordinate-space location of the control point in column 0 and row 1 of the tensor grid.
     * @type {D2D_POINT_2F}
     */
    point01{
        get {
            if(!this.HasProp("__point01"))
                this.__point01 := D2D_POINT_2F(8, this)
            return this.__point01
        }
    }

    /**
     * The coordinate-space location of the control point in column 0 and row 2 of the tensor grid.
     * @type {D2D_POINT_2F}
     */
    point02{
        get {
            if(!this.HasProp("__point02"))
                this.__point02 := D2D_POINT_2F(16, this)
            return this.__point02
        }
    }

    /**
     * The coordinate-space location of the control point in column 0 and row 3 of the tensor grid.
     * @type {D2D_POINT_2F}
     */
    point03{
        get {
            if(!this.HasProp("__point03"))
                this.__point03 := D2D_POINT_2F(24, this)
            return this.__point03
        }
    }

    /**
     * The coordinate-space location of the control point in column 1 and row 0 of the tensor grid.
     * @type {D2D_POINT_2F}
     */
    point10{
        get {
            if(!this.HasProp("__point10"))
                this.__point10 := D2D_POINT_2F(32, this)
            return this.__point10
        }
    }

    /**
     * The coordinate-space location of the control point in column 1 and row 1 of the tensor grid.
     * @type {D2D_POINT_2F}
     */
    point11{
        get {
            if(!this.HasProp("__point11"))
                this.__point11 := D2D_POINT_2F(40, this)
            return this.__point11
        }
    }

    /**
     * The coordinate-space location of the control point in column 1 and row 2 of the tensor grid.
     * @type {D2D_POINT_2F}
     */
    point12{
        get {
            if(!this.HasProp("__point12"))
                this.__point12 := D2D_POINT_2F(48, this)
            return this.__point12
        }
    }

    /**
     * The coordinate-space location of the control point in column 1 and row 3 of the tensor grid.
     * @type {D2D_POINT_2F}
     */
    point13{
        get {
            if(!this.HasProp("__point13"))
                this.__point13 := D2D_POINT_2F(56, this)
            return this.__point13
        }
    }

    /**
     * The coordinate-space location of the control point in column 2 and row 0 of the tensor grid.
     * @type {D2D_POINT_2F}
     */
    point20{
        get {
            if(!this.HasProp("__point20"))
                this.__point20 := D2D_POINT_2F(64, this)
            return this.__point20
        }
    }

    /**
     * The coordinate-space location of the control point in column 2 and row 1 of the tensor grid.
     * @type {D2D_POINT_2F}
     */
    point21{
        get {
            if(!this.HasProp("__point21"))
                this.__point21 := D2D_POINT_2F(72, this)
            return this.__point21
        }
    }

    /**
     * The coordinate-space location of the control point in column 2 and row 2 of the tensor grid.
     * @type {D2D_POINT_2F}
     */
    point22{
        get {
            if(!this.HasProp("__point22"))
                this.__point22 := D2D_POINT_2F(80, this)
            return this.__point22
        }
    }

    /**
     * The coordinate-space location of the control point in column 2 and row 3 of the tensor grid.
     * @type {D2D_POINT_2F}
     */
    point23{
        get {
            if(!this.HasProp("__point23"))
                this.__point23 := D2D_POINT_2F(88, this)
            return this.__point23
        }
    }

    /**
     * The coordinate-space location of the control point in column 3 and row 0 of the tensor grid.
     * @type {D2D_POINT_2F}
     */
    point30{
        get {
            if(!this.HasProp("__point30"))
                this.__point30 := D2D_POINT_2F(96, this)
            return this.__point30
        }
    }

    /**
     * The coordinate-space location of the control point in column 3 and row 1 of the tensor grid.
     * @type {D2D_POINT_2F}
     */
    point31{
        get {
            if(!this.HasProp("__point31"))
                this.__point31 := D2D_POINT_2F(104, this)
            return this.__point31
        }
    }

    /**
     * The coordinate-space location of the control point in column 3 and row 2 of the tensor grid.
     * @type {D2D_POINT_2F}
     */
    point32{
        get {
            if(!this.HasProp("__point32"))
                this.__point32 := D2D_POINT_2F(112, this)
            return this.__point32
        }
    }

    /**
     * The coordinate-space location of the control point in column 3 and row 3 of the tensor grid.
     * @type {D2D_POINT_2F}
     */
    point33{
        get {
            if(!this.HasProp("__point33"))
                this.__point33 := D2D_POINT_2F(120, this)
            return this.__point33
        }
    }

    /**
     * The color associated with the control point in column 0 and row 0 of the tensor grid.
     * @type {D2D1_COLOR_F}
     */
    color00{
        get {
            if(!this.HasProp("__color00"))
                this.__color00 := D2D1_COLOR_F(128, this)
            return this.__color00
        }
    }

    /**
     * The color associated with the control point in column 0 and row 3 of the tensor grid.
     * @type {D2D1_COLOR_F}
     */
    color03{
        get {
            if(!this.HasProp("__color03"))
                this.__color03 := D2D1_COLOR_F(144, this)
            return this.__color03
        }
    }

    /**
     * The color associated with the control point in column 3 and row 0 of the tensor grid.
     * @type {D2D1_COLOR_F}
     */
    color30{
        get {
            if(!this.HasProp("__color30"))
                this.__color30 := D2D1_COLOR_F(160, this)
            return this.__color30
        }
    }

    /**
     * The color associated with the control point in column 3 and row 3 of the tensor grid.
     * @type {D2D1_COLOR_F}
     */
    color33{
        get {
            if(!this.HasProp("__color33"))
                this.__color33 := D2D1_COLOR_F(176, this)
            return this.__color33
        }
    }

    /**
     * Specifies how to render the top edge of the mesh.
     * @type {Integer}
     */
    topEdgeMode {
        get => NumGet(this, 192, "int")
        set => NumPut("int", value, this, 192)
    }

    /**
     * Specifies how to render the left edge of the mesh.
     * @type {Integer}
     */
    leftEdgeMode {
        get => NumGet(this, 196, "int")
        set => NumPut("int", value, this, 196)
    }

    /**
     * Specifies how to render the bottom edge of the mesh.
     * @type {Integer}
     */
    bottomEdgeMode {
        get => NumGet(this, 200, "int")
        set => NumPut("int", value, this, 200)
    }

    /**
     * Specifies how to render the right edge of the mesh.
     * @type {Integer}
     */
    rightEdgeMode {
        get => NumGet(this, 204, "int")
        set => NumPut("int", value, this, 204)
    }
}
