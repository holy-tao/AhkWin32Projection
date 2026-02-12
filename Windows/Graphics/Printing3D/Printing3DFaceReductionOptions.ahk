#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DFaceReductionOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides additional information for the [TryReduceFacesAsync](printing3dmodel_tryreducefacesasync_1526716101.md) method in the [Printing3DModel](printing3dmodel.md) class
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dfacereductionoptions
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DFaceReductionOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DFaceReductionOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DFaceReductionOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Sets the area of a triangle above which said triangle cannot be merged via the [TryReduceFacesAsync](printing3dmodel_tryreducefacesasync_1526716101.md) method. If set to zero, a built-in default value is used.
     * @remarks
     * The units of area are derived from the [Unit](printing3dmodel_unit.md) property in the [Printing3DModel](printing3dmodel.md) object from which [TryReduceFacesAsync](printing3dmodel_tryreducefacesasync_2097932692.md) is called.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dfacereductionoptions.maxreductionarea
     * @type {Float} 
     */
    MaxReductionArea {
        get => this.get_MaxReductionArea()
        set => this.put_MaxReductionArea(value)
    }

    /**
     * Sets the desired number of triangles on a mesh. The [TryReduceFacesAsync](/uwp/api/windows.graphics.printing3d.printing3dmodel.tryreducefacesasync) method will stop merging faces if the triangle count is less than or equal to this number. If set to zero, the algorithm will run until the number of triangles is reduced by half.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dfacereductionoptions.targettrianglecount
     * @type {Integer} 
     */
    TargetTriangleCount {
        get => this.get_TargetTriangleCount()
        set => this.put_TargetTriangleCount(value)
    }

    /**
     * Sets the maximum length of an edge for which the triangles that share said edge can be merged via the [TryReduceFacesAsync](printing3dmodel_tryreducefacesasync_1526716101.md) method. If set to zero, a built-in default value is used.
     * @remarks
     * The units of length are derived from the [Unit](printing3dmodel_unit.md) property in the [Printing3DModel](printing3dmodel.md) object from which [TryReduceFacesAsync](/uwp/api/windows.graphics.printing3d.printing3dmodel.tryreducefacesasync) is called.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dfacereductionoptions.maxedgelength
     * @type {Float} 
     */
    MaxEdgeLength {
        get => this.get_MaxEdgeLength()
        set => this.put_MaxEdgeLength(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [Printing3DFaceReductionOptions](printing3dfacereductionoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DFaceReductionOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxReductionArea() {
        if (!this.HasProp("__IPrinting3DFaceReductionOptions")) {
            if ((queryResult := this.QueryInterface(IPrinting3DFaceReductionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DFaceReductionOptions := IPrinting3DFaceReductionOptions(outPtr)
        }

        return this.__IPrinting3DFaceReductionOptions.get_MaxReductionArea()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxReductionArea(value) {
        if (!this.HasProp("__IPrinting3DFaceReductionOptions")) {
            if ((queryResult := this.QueryInterface(IPrinting3DFaceReductionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DFaceReductionOptions := IPrinting3DFaceReductionOptions(outPtr)
        }

        return this.__IPrinting3DFaceReductionOptions.put_MaxReductionArea(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TargetTriangleCount() {
        if (!this.HasProp("__IPrinting3DFaceReductionOptions")) {
            if ((queryResult := this.QueryInterface(IPrinting3DFaceReductionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DFaceReductionOptions := IPrinting3DFaceReductionOptions(outPtr)
        }

        return this.__IPrinting3DFaceReductionOptions.get_TargetTriangleCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TargetTriangleCount(value) {
        if (!this.HasProp("__IPrinting3DFaceReductionOptions")) {
            if ((queryResult := this.QueryInterface(IPrinting3DFaceReductionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DFaceReductionOptions := IPrinting3DFaceReductionOptions(outPtr)
        }

        return this.__IPrinting3DFaceReductionOptions.put_TargetTriangleCount(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxEdgeLength() {
        if (!this.HasProp("__IPrinting3DFaceReductionOptions")) {
            if ((queryResult := this.QueryInterface(IPrinting3DFaceReductionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DFaceReductionOptions := IPrinting3DFaceReductionOptions(outPtr)
        }

        return this.__IPrinting3DFaceReductionOptions.get_MaxEdgeLength()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxEdgeLength(value) {
        if (!this.HasProp("__IPrinting3DFaceReductionOptions")) {
            if ((queryResult := this.QueryInterface(IPrinting3DFaceReductionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DFaceReductionOptions := IPrinting3DFaceReductionOptions(outPtr)
        }

        return this.__IPrinting3DFaceReductionOptions.put_MaxEdgeLength(value)
    }

;@endregion Instance Methods
}
