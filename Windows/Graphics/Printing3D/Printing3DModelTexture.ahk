#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DModelTexture.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a texture used in the 3D model.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodeltexture
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DModelTexture extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DModelTexture

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DModelTexture.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the texture resource used by the texture.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodeltexture.textureresource
     * @type {Printing3DTextureResource} 
     */
    TextureResource {
        get => this.get_TextureResource()
        set => this.put_TextureResource(value)
    }

    /**
     * Get or sets a value that indicates how tiling should occur in the U axis in order to fill the overall requested area.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodeltexture.tilestyleu
     * @type {Integer} 
     */
    TileStyleU {
        get => this.get_TileStyleU()
        set => this.put_TileStyleU(value)
    }

    /**
     * Gets or sets a value that indicates how tiling should occur in the V axis in order to fill the overall requested area.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmodeltexture.tilestylev
     * @type {Integer} 
     */
    TileStyleV {
        get => this.get_TileStyleV()
        set => this.put_TileStyleV(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [Printing3DModelTexture](printing3dmodeltexture.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DModelTexture")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Printing3DTextureResource} 
     */
    get_TextureResource() {
        if (!this.HasProp("__IPrinting3DModelTexture")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModelTexture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModelTexture := IPrinting3DModelTexture(outPtr)
        }

        return this.__IPrinting3DModelTexture.get_TextureResource()
    }

    /**
     * 
     * @param {Printing3DTextureResource} value 
     * @returns {HRESULT} 
     */
    put_TextureResource(value) {
        if (!this.HasProp("__IPrinting3DModelTexture")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModelTexture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModelTexture := IPrinting3DModelTexture(outPtr)
        }

        return this.__IPrinting3DModelTexture.put_TextureResource(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TileStyleU() {
        if (!this.HasProp("__IPrinting3DModelTexture")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModelTexture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModelTexture := IPrinting3DModelTexture(outPtr)
        }

        return this.__IPrinting3DModelTexture.get_TileStyleU()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TileStyleU(value) {
        if (!this.HasProp("__IPrinting3DModelTexture")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModelTexture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModelTexture := IPrinting3DModelTexture(outPtr)
        }

        return this.__IPrinting3DModelTexture.put_TileStyleU(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TileStyleV() {
        if (!this.HasProp("__IPrinting3DModelTexture")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModelTexture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModelTexture := IPrinting3DModelTexture(outPtr)
        }

        return this.__IPrinting3DModelTexture.get_TileStyleV()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TileStyleV(value) {
        if (!this.HasProp("__IPrinting3DModelTexture")) {
            if ((queryResult := this.QueryInterface(IPrinting3DModelTexture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DModelTexture := IPrinting3DModelTexture(outPtr)
        }

        return this.__IPrinting3DModelTexture.put_TileStyleV(value)
    }

;@endregion Instance Methods
}
