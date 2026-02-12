#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DMaterial.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents all material resources in the 3D model.
 * @remarks
 * The Printing3DMaterial class roughly corresponds to the `<resources>` element in the 3D Manufacturing Format (3MF) specification. For more info, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmaterial
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DMaterial extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DMaterial

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DMaterial.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets all base material groups used in the 3D model.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmaterial.basegroups
     * @type {IVector<Printing3DBaseMaterialGroup>} 
     */
    BaseGroups {
        get => this.get_BaseGroups()
    }

    /**
     * Gets all color material groups used in the 3D model.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmaterial.colorgroups
     * @type {IVector<Printing3DColorMaterialGroup>} 
     */
    ColorGroups {
        get => this.get_ColorGroups()
    }

    /**
     * Gets all 2D texture material groups used in the 3D model.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmaterial.texture2coordgroups
     * @type {IVector<Printing3DTexture2CoordMaterialGroup>} 
     */
    Texture2CoordGroups {
        get => this.get_Texture2CoordGroups()
    }

    /**
     * Gets all composite material groups used in the 3D model.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmaterial.compositegroups
     * @type {IVector<Printing3DCompositeMaterialGroup>} 
     */
    CompositeGroups {
        get => this.get_CompositeGroups()
    }

    /**
     * Gets all multi-property groups used in the 3D model.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmaterial.multiplepropertygroups
     * @type {IVector<Printing3DMultiplePropertyMaterialGroup>} 
     */
    MultiplePropertyGroups {
        get => this.get_MultiplePropertyGroups()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [Printing3DMaterial](printing3dmaterial.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DMaterial")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<Printing3DBaseMaterialGroup>} 
     */
    get_BaseGroups() {
        if (!this.HasProp("__IPrinting3DMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMaterial := IPrinting3DMaterial(outPtr)
        }

        return this.__IPrinting3DMaterial.get_BaseGroups()
    }

    /**
     * 
     * @returns {IVector<Printing3DColorMaterialGroup>} 
     */
    get_ColorGroups() {
        if (!this.HasProp("__IPrinting3DMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMaterial := IPrinting3DMaterial(outPtr)
        }

        return this.__IPrinting3DMaterial.get_ColorGroups()
    }

    /**
     * 
     * @returns {IVector<Printing3DTexture2CoordMaterialGroup>} 
     */
    get_Texture2CoordGroups() {
        if (!this.HasProp("__IPrinting3DMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMaterial := IPrinting3DMaterial(outPtr)
        }

        return this.__IPrinting3DMaterial.get_Texture2CoordGroups()
    }

    /**
     * 
     * @returns {IVector<Printing3DCompositeMaterialGroup>} 
     */
    get_CompositeGroups() {
        if (!this.HasProp("__IPrinting3DMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMaterial := IPrinting3DMaterial(outPtr)
        }

        return this.__IPrinting3DMaterial.get_CompositeGroups()
    }

    /**
     * 
     * @returns {IVector<Printing3DMultiplePropertyMaterialGroup>} 
     */
    get_MultiplePropertyGroups() {
        if (!this.HasProp("__IPrinting3DMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMaterial := IPrinting3DMaterial(outPtr)
        }

        return this.__IPrinting3DMaterial.get_MultiplePropertyGroups()
    }

;@endregion Instance Methods
}
