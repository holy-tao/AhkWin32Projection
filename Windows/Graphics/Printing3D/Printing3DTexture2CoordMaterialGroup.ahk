#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DTexture2CoordMaterialGroup.ahk
#Include .\IPrinting3DTexture2CoordMaterialGroup2.ahk
#Include .\IPrinting3DTexture2CoordMaterialGroupFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a group of 2D texture materials used in the 3D model.
 * @remarks
 * The Printing3DTexture2CoordMaterialGroup class corresponds to the `<texture2dgroup>` element in the 3D Manufacturing Format (3MF) specification. For more info, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dtexture2coordmaterialgroup
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DTexture2CoordMaterialGroup extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DTexture2CoordMaterialGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DTexture2CoordMaterialGroup.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a instance of the [Printing3DTexture2CoordMaterialGroup](printing3dtexture2coordmaterialgroup.md) class.
     * @remarks
     * Set *MaterialGroupId* to a value greater than zero. A value of zero is not valid and triggers an **E_INVALIADARG** error.
     * @param {Integer} MaterialGroupId The identifier for a group of 2D texture materials used in the 3D model; a value greater than zero.
     * @returns {Printing3DTexture2CoordMaterialGroup} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dtexture2coordmaterialgroup.#ctor
     */
    static Create(MaterialGroupId) {
        if (!Printing3DTexture2CoordMaterialGroup.HasProp("__IPrinting3DTexture2CoordMaterialGroupFactory")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DTexture2CoordMaterialGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrinting3DTexture2CoordMaterialGroupFactory.IID)
            Printing3DTexture2CoordMaterialGroup.__IPrinting3DTexture2CoordMaterialGroupFactory := IPrinting3DTexture2CoordMaterialGroupFactory(factoryPtr)
        }

        return Printing3DTexture2CoordMaterialGroup.__IPrinting3DTexture2CoordMaterialGroupFactory.Create(MaterialGroupId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a group of 2D texture materials used in the 3D model.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dtexture2coordmaterialgroup.texture2coords
     * @type {IVector<Printing3DTexture2CoordMaterial>} 
     */
    Texture2Coords {
        get => this.get_Texture2Coords()
    }

    /**
     * Gets the identifier (ID) of the 2D texture material group.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dtexture2coordmaterialgroup.materialgroupid
     * @type {Integer} 
     */
    MaterialGroupId {
        get => this.get_MaterialGroupId()
    }

    /**
     * Gets or sets the texture of the material group.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dtexture2coordmaterialgroup.texture
     * @type {Printing3DModelTexture} 
     */
    Texture {
        get => this.get_Texture()
        set => this.put_Texture(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<Printing3DTexture2CoordMaterial>} 
     */
    get_Texture2Coords() {
        if (!this.HasProp("__IPrinting3DTexture2CoordMaterialGroup")) {
            if ((queryResult := this.QueryInterface(IPrinting3DTexture2CoordMaterialGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DTexture2CoordMaterialGroup := IPrinting3DTexture2CoordMaterialGroup(outPtr)
        }

        return this.__IPrinting3DTexture2CoordMaterialGroup.get_Texture2Coords()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaterialGroupId() {
        if (!this.HasProp("__IPrinting3DTexture2CoordMaterialGroup")) {
            if ((queryResult := this.QueryInterface(IPrinting3DTexture2CoordMaterialGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DTexture2CoordMaterialGroup := IPrinting3DTexture2CoordMaterialGroup(outPtr)
        }

        return this.__IPrinting3DTexture2CoordMaterialGroup.get_MaterialGroupId()
    }

    /**
     * 
     * @returns {Printing3DModelTexture} 
     */
    get_Texture() {
        if (!this.HasProp("__IPrinting3DTexture2CoordMaterialGroup2")) {
            if ((queryResult := this.QueryInterface(IPrinting3DTexture2CoordMaterialGroup2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DTexture2CoordMaterialGroup2 := IPrinting3DTexture2CoordMaterialGroup2(outPtr)
        }

        return this.__IPrinting3DTexture2CoordMaterialGroup2.get_Texture()
    }

    /**
     * 
     * @param {Printing3DModelTexture} value 
     * @returns {HRESULT} 
     */
    put_Texture(value) {
        if (!this.HasProp("__IPrinting3DTexture2CoordMaterialGroup2")) {
            if ((queryResult := this.QueryInterface(IPrinting3DTexture2CoordMaterialGroup2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DTexture2CoordMaterialGroup2 := IPrinting3DTexture2CoordMaterialGroup2(outPtr)
        }

        return this.__IPrinting3DTexture2CoordMaterialGroup2.put_Texture(value)
    }

;@endregion Instance Methods
}
