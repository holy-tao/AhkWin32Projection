#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DComponent.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a 3D Manufacturing Format (3MF) component. Acts as a container of other components.
 * @remarks
 * A component is a translation applied to an underlying mesh or arrangement of translations on a set of other components.
 * 
 * The Printing3DComponent class corresponds to the `<object>` element in the 3D Manufacturing Format (3MF) specification. For more info, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcomponent
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DComponent extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DComponent

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DComponent.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the 3D mesh of the component.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcomponent.mesh
     * @type {Printing3DMesh} 
     */
    Mesh {
        get => this.get_Mesh()
        set => this.put_Mesh(value)
    }

    /**
     * Gets the other components contained within the component.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcomponent.components
     * @type {IVector<Printing3DComponentWithMatrix>} 
     */
    Components {
        get => this.get_Components()
    }

    /**
     * Gets or sets the thumbnail image of the 3D Manufacturing Format (3MF) component.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcomponent.thumbnail
     * @type {Printing3DTextureResource} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
        set => this.put_Thumbnail(value)
    }

    /**
     * Gets or sets the type of the 3D Manufacturing Format (3MF) component.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcomponent.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * Gets or sets the name of the 3D Manufacturing Format (3MF) component.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcomponent.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets the part number of the 3D Manufacturing Format (3MF) component.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcomponent.partnumber
     * @type {HSTRING} 
     */
    PartNumber {
        get => this.get_PartNumber()
        set => this.put_PartNumber(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [Printing3DComponent](printing3dcomponent.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DComponent")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Printing3DMesh} 
     */
    get_Mesh() {
        if (!this.HasProp("__IPrinting3DComponent")) {
            if ((queryResult := this.QueryInterface(IPrinting3DComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DComponent := IPrinting3DComponent(outPtr)
        }

        return this.__IPrinting3DComponent.get_Mesh()
    }

    /**
     * 
     * @param {Printing3DMesh} value 
     * @returns {HRESULT} 
     */
    put_Mesh(value) {
        if (!this.HasProp("__IPrinting3DComponent")) {
            if ((queryResult := this.QueryInterface(IPrinting3DComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DComponent := IPrinting3DComponent(outPtr)
        }

        return this.__IPrinting3DComponent.put_Mesh(value)
    }

    /**
     * 
     * @returns {IVector<Printing3DComponentWithMatrix>} 
     */
    get_Components() {
        if (!this.HasProp("__IPrinting3DComponent")) {
            if ((queryResult := this.QueryInterface(IPrinting3DComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DComponent := IPrinting3DComponent(outPtr)
        }

        return this.__IPrinting3DComponent.get_Components()
    }

    /**
     * 
     * @returns {Printing3DTextureResource} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__IPrinting3DComponent")) {
            if ((queryResult := this.QueryInterface(IPrinting3DComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DComponent := IPrinting3DComponent(outPtr)
        }

        return this.__IPrinting3DComponent.get_Thumbnail()
    }

    /**
     * 
     * @param {Printing3DTextureResource} value 
     * @returns {HRESULT} 
     */
    put_Thumbnail(value) {
        if (!this.HasProp("__IPrinting3DComponent")) {
            if ((queryResult := this.QueryInterface(IPrinting3DComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DComponent := IPrinting3DComponent(outPtr)
        }

        return this.__IPrinting3DComponent.put_Thumbnail(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IPrinting3DComponent")) {
            if ((queryResult := this.QueryInterface(IPrinting3DComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DComponent := IPrinting3DComponent(outPtr)
        }

        return this.__IPrinting3DComponent.get_Type()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Type(value) {
        if (!this.HasProp("__IPrinting3DComponent")) {
            if ((queryResult := this.QueryInterface(IPrinting3DComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DComponent := IPrinting3DComponent(outPtr)
        }

        return this.__IPrinting3DComponent.put_Type(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IPrinting3DComponent")) {
            if ((queryResult := this.QueryInterface(IPrinting3DComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DComponent := IPrinting3DComponent(outPtr)
        }

        return this.__IPrinting3DComponent.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IPrinting3DComponent")) {
            if ((queryResult := this.QueryInterface(IPrinting3DComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DComponent := IPrinting3DComponent(outPtr)
        }

        return this.__IPrinting3DComponent.put_Name(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PartNumber() {
        if (!this.HasProp("__IPrinting3DComponent")) {
            if ((queryResult := this.QueryInterface(IPrinting3DComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DComponent := IPrinting3DComponent(outPtr)
        }

        return this.__IPrinting3DComponent.get_PartNumber()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PartNumber(value) {
        if (!this.HasProp("__IPrinting3DComponent")) {
            if ((queryResult := this.QueryInterface(IPrinting3DComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DComponent := IPrinting3DComponent(outPtr)
        }

        return this.__IPrinting3DComponent.put_PartNumber(value)
    }

;@endregion Instance Methods
}
