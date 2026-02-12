#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3D3MFPackage.ahk
#Include .\IPrinting3D3MFPackage2.ahk
#Include .\IPrinting3D3MFPackageStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a 3D Manufacturing Format (3MF) package.
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3d3mfpackage
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3D3MFPackage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3D3MFPackage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3D3MFPackage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [Printing3D3MFPackage](printing3d3mfpackage.md) object from a 3D Manufacturing Format (3MF) file stream.
     * @param {IRandomAccessStream} value A 3MF file stream.
     * @returns {IAsyncOperation<Printing3D3MFPackage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3d3mfpackage.loadasync
     */
    static LoadAsync(value) {
        if (!Printing3D3MFPackage.HasProp("__IPrinting3D3MFPackageStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3D3MFPackage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrinting3D3MFPackageStatics.IID)
            Printing3D3MFPackage.__IPrinting3D3MFPackageStatics := IPrinting3D3MFPackageStatics(factoryPtr)
        }

        return Printing3D3MFPackage.__IPrinting3D3MFPackageStatics.LoadAsync(value)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a stream to the print ticket in the 3D Manufacturing Format (3MF) package.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3d3mfpackage.printticket
     * @type {IRandomAccessStream} 
     */
    PrintTicket {
        get => this.get_PrintTicket()
        set => this.put_PrintTicket(value)
    }

    /**
     * Gets or sets an XML stream to the 3D model in the 3D Manufacturing Format (3MF) package.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3d3mfpackage.modelpart
     * @type {IRandomAccessStream} 
     */
    ModelPart {
        get => this.get_ModelPart()
        set => this.put_ModelPart(value)
    }

    /**
     * Gets or sets a thumbnail image that represents the contents of the 3D Manufacturing Format (3MF) package.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3d3mfpackage.thumbnail
     * @type {Printing3DTextureResource} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
        set => this.put_Thumbnail(value)
    }

    /**
     * Gets or sets the textures in the 3D Manufacturing Format (3MF) package.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3d3mfpackage.textures
     * @type {IVector<Printing3DTextureResource>} 
     */
    Textures {
        get => this.get_Textures()
    }

    /**
     * Gets and sets the intended file compression level for this 3MF package. This is taken into account when the [Printing3D3MFPackage](Printing3D3MFPackage.md) instance is converted to a 3MF file.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3d3mfpackage.compression
     * @type {Integer} 
     */
    Compression {
        get => this.get_Compression()
        set => this.put_Compression(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [Printing3D3MFPackage](printing3d3mfpackage.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3D3MFPackage")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Saves the [Printing3D3MFPackage](printing3d3mfpackage.md) object to a 3D Manufacturing Format (3MF) file stream.
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3d3mfpackage.saveasync
     */
    SaveAsync() {
        if (!this.HasProp("__IPrinting3D3MFPackage")) {
            if ((queryResult := this.QueryInterface(IPrinting3D3MFPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3D3MFPackage := IPrinting3D3MFPackage(outPtr)
        }

        return this.__IPrinting3D3MFPackage.SaveAsync()
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_PrintTicket() {
        if (!this.HasProp("__IPrinting3D3MFPackage")) {
            if ((queryResult := this.QueryInterface(IPrinting3D3MFPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3D3MFPackage := IPrinting3D3MFPackage(outPtr)
        }

        return this.__IPrinting3D3MFPackage.get_PrintTicket()
    }

    /**
     * 
     * @param {IRandomAccessStream} value 
     * @returns {HRESULT} 
     */
    put_PrintTicket(value) {
        if (!this.HasProp("__IPrinting3D3MFPackage")) {
            if ((queryResult := this.QueryInterface(IPrinting3D3MFPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3D3MFPackage := IPrinting3D3MFPackage(outPtr)
        }

        return this.__IPrinting3D3MFPackage.put_PrintTicket(value)
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_ModelPart() {
        if (!this.HasProp("__IPrinting3D3MFPackage")) {
            if ((queryResult := this.QueryInterface(IPrinting3D3MFPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3D3MFPackage := IPrinting3D3MFPackage(outPtr)
        }

        return this.__IPrinting3D3MFPackage.get_ModelPart()
    }

    /**
     * 
     * @param {IRandomAccessStream} value 
     * @returns {HRESULT} 
     */
    put_ModelPart(value) {
        if (!this.HasProp("__IPrinting3D3MFPackage")) {
            if ((queryResult := this.QueryInterface(IPrinting3D3MFPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3D3MFPackage := IPrinting3D3MFPackage(outPtr)
        }

        return this.__IPrinting3D3MFPackage.put_ModelPart(value)
    }

    /**
     * 
     * @returns {Printing3DTextureResource} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__IPrinting3D3MFPackage")) {
            if ((queryResult := this.QueryInterface(IPrinting3D3MFPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3D3MFPackage := IPrinting3D3MFPackage(outPtr)
        }

        return this.__IPrinting3D3MFPackage.get_Thumbnail()
    }

    /**
     * 
     * @param {Printing3DTextureResource} value 
     * @returns {HRESULT} 
     */
    put_Thumbnail(value) {
        if (!this.HasProp("__IPrinting3D3MFPackage")) {
            if ((queryResult := this.QueryInterface(IPrinting3D3MFPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3D3MFPackage := IPrinting3D3MFPackage(outPtr)
        }

        return this.__IPrinting3D3MFPackage.put_Thumbnail(value)
    }

    /**
     * 
     * @returns {IVector<Printing3DTextureResource>} 
     */
    get_Textures() {
        if (!this.HasProp("__IPrinting3D3MFPackage")) {
            if ((queryResult := this.QueryInterface(IPrinting3D3MFPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3D3MFPackage := IPrinting3D3MFPackage(outPtr)
        }

        return this.__IPrinting3D3MFPackage.get_Textures()
    }

    /**
     * Creates a [Printing3DModel](printing3dmodel.md) object from a 3D Manufacturing Format (3MF) file stream.
     * @param {IRandomAccessStream} value A 3MF file stream.
     * @returns {IAsyncOperation<Printing3DModel>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3d3mfpackage.loadmodelfrompackageasync
     */
    LoadModelFromPackageAsync(value) {
        if (!this.HasProp("__IPrinting3D3MFPackage")) {
            if ((queryResult := this.QueryInterface(IPrinting3D3MFPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3D3MFPackage := IPrinting3D3MFPackage(outPtr)
        }

        return this.__IPrinting3D3MFPackage.LoadModelFromPackageAsync(value)
    }

    /**
     * Saves the specified 3D model to the 3D Manufacturing Format (3MF) package.
     * @param {Printing3DModel} value The 3D model to be saved to the 3MF package.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3d3mfpackage.savemodeltopackageasync
     */
    SaveModelToPackageAsync(value) {
        if (!this.HasProp("__IPrinting3D3MFPackage")) {
            if ((queryResult := this.QueryInterface(IPrinting3D3MFPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3D3MFPackage := IPrinting3D3MFPackage(outPtr)
        }

        return this.__IPrinting3D3MFPackage.SaveModelToPackageAsync(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Compression() {
        if (!this.HasProp("__IPrinting3D3MFPackage2")) {
            if ((queryResult := this.QueryInterface(IPrinting3D3MFPackage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3D3MFPackage2 := IPrinting3D3MFPackage2(outPtr)
        }

        return this.__IPrinting3D3MFPackage2.get_Compression()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Compression(value) {
        if (!this.HasProp("__IPrinting3D3MFPackage2")) {
            if ((queryResult := this.QueryInterface(IPrinting3D3MFPackage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3D3MFPackage2 := IPrinting3D3MFPackage2(outPtr)
        }

        return this.__IPrinting3D3MFPackage2.put_Compression(value)
    }

;@endregion Instance Methods
}
