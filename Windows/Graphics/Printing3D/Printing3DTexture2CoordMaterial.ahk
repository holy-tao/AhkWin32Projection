#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DTexture2CoordMaterial.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a 2D texture material used in the 3D model.
 * @remarks
 * The Printing3DTexture2CoordMaterial class corresponds to the `<tex2coord>` element in the 3D Manufacturing Format (3MF) specification. For more info, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dtexture2coordmaterial
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DTexture2CoordMaterial extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DTexture2CoordMaterial

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DTexture2CoordMaterial.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the texture used in the 2D texture material.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dtexture2coordmaterial.texture
     * @type {Printing3DModelTexture} 
     */
    Texture {
        get => this.get_Texture()
        set => this.put_Texture(value)
    }

    /**
     * Gets or sets the U-coordinate within the texture, horizontally right from the origin in the upper left of the texture.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dtexture2coordmaterial.u
     * @type {Float} 
     */
    U {
        get => this.get_U()
        set => this.put_U(value)
    }

    /**
     * Gets or sets the V-coordinate within the texture, vertically down from the origin in the upper left of the texture.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dtexture2coordmaterial.v
     * @type {Float} 
     */
    V {
        get => this.get_V()
        set => this.put_V(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [Printing3DTexture2CoordMaterial](printing3dtexture2coordmaterial.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DTexture2CoordMaterial")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Printing3DModelTexture} 
     */
    get_Texture() {
        if (!this.HasProp("__IPrinting3DTexture2CoordMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DTexture2CoordMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DTexture2CoordMaterial := IPrinting3DTexture2CoordMaterial(outPtr)
        }

        return this.__IPrinting3DTexture2CoordMaterial.get_Texture()
    }

    /**
     * 
     * @param {Printing3DModelTexture} value 
     * @returns {HRESULT} 
     */
    put_Texture(value) {
        if (!this.HasProp("__IPrinting3DTexture2CoordMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DTexture2CoordMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DTexture2CoordMaterial := IPrinting3DTexture2CoordMaterial(outPtr)
        }

        return this.__IPrinting3DTexture2CoordMaterial.put_Texture(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_U() {
        if (!this.HasProp("__IPrinting3DTexture2CoordMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DTexture2CoordMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DTexture2CoordMaterial := IPrinting3DTexture2CoordMaterial(outPtr)
        }

        return this.__IPrinting3DTexture2CoordMaterial.get_U()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_U(value) {
        if (!this.HasProp("__IPrinting3DTexture2CoordMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DTexture2CoordMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DTexture2CoordMaterial := IPrinting3DTexture2CoordMaterial(outPtr)
        }

        return this.__IPrinting3DTexture2CoordMaterial.put_U(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_V() {
        if (!this.HasProp("__IPrinting3DTexture2CoordMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DTexture2CoordMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DTexture2CoordMaterial := IPrinting3DTexture2CoordMaterial(outPtr)
        }

        return this.__IPrinting3DTexture2CoordMaterial.get_V()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_V(value) {
        if (!this.HasProp("__IPrinting3DTexture2CoordMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DTexture2CoordMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DTexture2CoordMaterial := IPrinting3DTexture2CoordMaterial(outPtr)
        }

        return this.__IPrinting3DTexture2CoordMaterial.put_V(value)
    }

;@endregion Instance Methods
}
