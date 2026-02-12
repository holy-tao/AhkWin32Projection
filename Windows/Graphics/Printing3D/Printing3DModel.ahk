#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DModel.ahk
#Include .\IPrinting3DModel2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the 3D model in a 3D Manufacturing Format (3MF) package.
 * @remarks
 * The Printing3DModel class corresponds to the `<model>` element in the 3D Manufacturing Format (3MF) specification. For more info, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DModel extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DModel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DModel.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the units of measure used in the 3D model.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.unit
     * @type {Integer} 
     */
    Unit {
        get => this.get_Unit()
        set => this.put_Unit(value)
    }

    /**
     * Gets all textures used in the 3D model.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.textures
     * @type {IVector<Printing3DModelTexture>} 
     */
    Textures {
        get => this.get_Textures()
    }

    /**
     * Gets all meshes used in the 3D model.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.meshes
     * @type {IVector<Printing3DMesh>} 
     */
    Meshes {
        get => this.get_Meshes()
    }

    /**
     * Gets all 3D Manufacturing Format (3MF) components used in the 3D model.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.components
     * @type {IVector<Printing3DComponent>} 
     */
    Components {
        get => this.get_Components()
    }

    /**
     * Gets or sets the root material container for the 3D model.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.material
     * @type {Printing3DMaterial} 
     */
    Material {
        get => this.get_Material()
        set => this.put_Material(value)
    }

    /**
     * Gets or sets the root 3D Manufacturing Format (3MF) component. It represents the build plate on a 3D printer and defines what will be printed.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.build
     * @type {Printing3DComponent} 
     */
    Build {
        get => this.get_Build()
        set => this.put_Build(value)
    }

    /**
     * Gets or sets the version of the 3D Manufacturing Format (3MF) package.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.version
     * @type {HSTRING} 
     */
    Version {
        get => this.get_Version()
        set => this.put_Version(value)
    }

    /**
     * Gets a list of the extensions required by the 3D Manufacturing Format (3MF) package.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.requiredextensions
     * @type {IVector<HSTRING>} 
     */
    RequiredExtensions {
        get => this.get_RequiredExtensions()
    }

    /**
     * Gets the metadata for the 3D Manufacturing Format (3MF) package.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.metadata
     * @type {IMap<HSTRING, HSTRING>} 
     */
    Metadata {
        get => this.get_Metadata()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [Printing3DModel](printing3dmodel.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DModel")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Unit() {
        if (!this.HasProp("__IPrinting3DModel")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel := IPrinting3DModel(outPtr)
        }

        return this.__IPrinting3DModel.get_Unit()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Unit(value) {
        if (!this.HasProp("__IPrinting3DModel")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel := IPrinting3DModel(outPtr)
        }

        return this.__IPrinting3DModel.put_Unit(value)
    }

    /**
     * 
     * @returns {IVector<Printing3DModelTexture>} 
     */
    get_Textures() {
        if (!this.HasProp("__IPrinting3DModel")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel := IPrinting3DModel(outPtr)
        }

        return this.__IPrinting3DModel.get_Textures()
    }

    /**
     * 
     * @returns {IVector<Printing3DMesh>} 
     */
    get_Meshes() {
        if (!this.HasProp("__IPrinting3DModel")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel := IPrinting3DModel(outPtr)
        }

        return this.__IPrinting3DModel.get_Meshes()
    }

    /**
     * 
     * @returns {IVector<Printing3DComponent>} 
     */
    get_Components() {
        if (!this.HasProp("__IPrinting3DModel")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel := IPrinting3DModel(outPtr)
        }

        return this.__IPrinting3DModel.get_Components()
    }

    /**
     * 
     * @returns {Printing3DMaterial} 
     */
    get_Material() {
        if (!this.HasProp("__IPrinting3DModel")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel := IPrinting3DModel(outPtr)
        }

        return this.__IPrinting3DModel.get_Material()
    }

    /**
     * 
     * @param {Printing3DMaterial} value 
     * @returns {HRESULT} 
     */
    put_Material(value) {
        if (!this.HasProp("__IPrinting3DModel")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel := IPrinting3DModel(outPtr)
        }

        return this.__IPrinting3DModel.put_Material(value)
    }

    /**
     * 
     * @returns {Printing3DComponent} 
     */
    get_Build() {
        if (!this.HasProp("__IPrinting3DModel")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel := IPrinting3DModel(outPtr)
        }

        return this.__IPrinting3DModel.get_Build()
    }

    /**
     * 
     * @param {Printing3DComponent} value 
     * @returns {HRESULT} 
     */
    put_Build(value) {
        if (!this.HasProp("__IPrinting3DModel")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel := IPrinting3DModel(outPtr)
        }

        return this.__IPrinting3DModel.put_Build(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Version() {
        if (!this.HasProp("__IPrinting3DModel")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel := IPrinting3DModel(outPtr)
        }

        return this.__IPrinting3DModel.get_Version()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Version(value) {
        if (!this.HasProp("__IPrinting3DModel")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel := IPrinting3DModel(outPtr)
        }

        return this.__IPrinting3DModel.put_Version(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_RequiredExtensions() {
        if (!this.HasProp("__IPrinting3DModel")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel := IPrinting3DModel(outPtr)
        }

        return this.__IPrinting3DModel.get_RequiredExtensions()
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_Metadata() {
        if (!this.HasProp("__IPrinting3DModel")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel := IPrinting3DModel(outPtr)
        }

        return this.__IPrinting3DModel.get_Metadata()
    }

    /**
     * Executes the 3D model repair algorithm on the model.
     * @remarks
     * Until April 2022 Microsoft offered an online 3D Model Repair service. Please find information on alternative tools, such as 3D Builder, at this [address](https://3mf.io/blog/2022/04/microsoft-is-sunsetting-the-3mf-service/).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.repairasync
     */
    RepairAsync() {
        if (!this.HasProp("__IPrinting3DModel")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel := IPrinting3DModel(outPtr)
        }

        return this.__IPrinting3DModel.RepairAsync()
    }

    /**
     * Gets a copy of the current 3D model.
     * @returns {Printing3DModel} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.clone
     */
    Clone() {
        if (!this.HasProp("__IPrinting3DModel")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel := IPrinting3DModel(outPtr)
        }

        return this.__IPrinting3DModel.Clone()
    }

    /**
     * Begins the 3D model repair algorithm, but exits if the time limit is reached.
     * @remarks
     * Until April 2022 Microsoft offered an online 3D Model Repair service. Please find information on alternative tools, such as 3D Builder, at this [address](https://3mf.io/blog/2022/04/microsoft-is-sunsetting-the-3mf-service/).
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.trypartialrepairasync
     */
    TryPartialRepairAsync() {
        if (!this.HasProp("__IPrinting3DModel2")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel2 := IPrinting3DModel2(outPtr)
        }

        return this.__IPrinting3DModel2.TryPartialRepairAsync()
    }

    /**
     * Executes the 3D model repair algorithm until complete or an exception is thrown.
     * @remarks
     * Until April 2022 Microsoft offered an online 3D Model Repair service. Please find information on alternative tools, such as 3D Builder, at this [address](https://3mf.io/blog/2022/04/microsoft-is-sunsetting-the-3mf-service/).
     * @param {TimeSpan} maxWaitTime 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.trypartialrepairasync
     */
    TryPartialRepairWithTimeAsync(maxWaitTime) {
        if (!this.HasProp("__IPrinting3DModel2")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel2 := IPrinting3DModel2(outPtr)
        }

        return this.__IPrinting3DModel2.TryPartialRepairWithTimeAsync(maxWaitTime)
    }

    /**
     * Runs an algorithm that reduces the number of triangle faces in all of the meshes within the [Printing3DModel](printing3dmodel.md) by merging nearby vertices. Stops according to the specified options.
     * @returns {IAsyncOperationWithProgress<Boolean, Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.tryreducefacesasync
     */
    TryReduceFacesAsync() {
        if (!this.HasProp("__IPrinting3DModel2")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel2 := IPrinting3DModel2(outPtr)
        }

        return this.__IPrinting3DModel2.TryReduceFacesAsync()
    }

    /**
     * Runs an algorithm that reduces the number of triangle faces in all of the meshes within the [Printing3DModel](printing3dmodel.md) by merging nearby vertices. Stops according to the specified options or when the *maxWait* time is reached.
     * @param {Printing3DFaceReductionOptions} printing3DFaceReductionOptions_ Defines the conditions which will trigger the end of the operation.
     * @returns {IAsyncOperationWithProgress<Boolean, Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.tryreducefacesasync
     */
    TryReduceFacesWithOptionsAsync(printing3DFaceReductionOptions_) {
        if (!this.HasProp("__IPrinting3DModel2")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel2 := IPrinting3DModel2(outPtr)
        }

        return this.__IPrinting3DModel2.TryReduceFacesWithOptionsAsync(printing3DFaceReductionOptions_)
    }

    /**
     * Runs an algorithm that reduces the number of triangle faces in all of the meshes within the [Printing3DModel](printing3dmodel.md) by merging nearby vertices. Stops when the total number of triangles is reduced by half.
     * @param {Printing3DFaceReductionOptions} printing3DFaceReductionOptions_ 
     * @param {TimeSpan} maxWait 
     * @returns {IAsyncOperationWithProgress<Boolean, Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.tryreducefacesasync
     */
    TryReduceFacesWithOptionsAndTimeAsync(printing3DFaceReductionOptions_, maxWait) {
        if (!this.HasProp("__IPrinting3DModel2")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel2 := IPrinting3DModel2(outPtr)
        }

        return this.__IPrinting3DModel2.TryReduceFacesWithOptionsAndTimeAsync(printing3DFaceReductionOptions_, maxWait)
    }

    /**
     * Executes the 3D model repair algorithm, with the ability to report the progress of the operation.
     * @remarks
     * Until April 2022 Microsoft offered an online 3D Model Repair service. Please find information on alternative tools, such as 3D Builder, at this [address](https://3mf.io/blog/2022/04/microsoft-is-sunsetting-the-3mf-service/).
     * @returns {IAsyncOperationWithProgress<Boolean, Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodel.repairwithprogressasync
     */
    RepairWithProgressAsync() {
        if (!this.HasProp("__IPrinting3DModel2")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModel2 := IPrinting3DModel2(outPtr)
        }

        return this.__IPrinting3DModel2.RepairWithProgressAsync()
    }

;@endregion Instance Methods
}
