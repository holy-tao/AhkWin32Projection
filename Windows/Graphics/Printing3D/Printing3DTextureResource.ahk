#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DTextureResource.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies the texture resource used in a 2D texture material.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dtextureresource
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DTextureResource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DTextureResource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DTextureResource.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the image stream of the texture resource.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dtextureresource.texturedata
     * @type {IRandomAccessStreamWithContentType} 
     */
    TextureData {
        get => this.get_TextureData()
        set => this.put_TextureData(value)
    }

    /**
     * Gets or sets the name of the texture resource.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dtextureresource.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [Printing3DTextureResource](printing3dtextureresource.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DTextureResource")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IRandomAccessStreamWithContentType} 
     */
    get_TextureData() {
        if (!this.HasProp("__IPrinting3DTextureResource")) {
            if ((queryResult := this.QueryInterface(IPrinting3DTextureResource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DTextureResource := IPrinting3DTextureResource(outPtr)
        }

        return this.__IPrinting3DTextureResource.get_TextureData()
    }

    /**
     * 
     * @param {IRandomAccessStreamWithContentType} value 
     * @returns {HRESULT} 
     */
    put_TextureData(value) {
        if (!this.HasProp("__IPrinting3DTextureResource")) {
            if ((queryResult := this.QueryInterface(IPrinting3DTextureResource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DTextureResource := IPrinting3DTextureResource(outPtr)
        }

        return this.__IPrinting3DTextureResource.put_TextureData(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IPrinting3DTextureResource")) {
            if ((queryResult := this.QueryInterface(IPrinting3DTextureResource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DTextureResource := IPrinting3DTextureResource(outPtr)
        }

        return this.__IPrinting3DTextureResource.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IPrinting3DTextureResource")) {
            if ((queryResult := this.QueryInterface(IPrinting3DTextureResource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DTextureResource := IPrinting3DTextureResource(outPtr)
        }

        return this.__IPrinting3DTextureResource.put_Name(value)
    }

;@endregion Instance Methods
}
