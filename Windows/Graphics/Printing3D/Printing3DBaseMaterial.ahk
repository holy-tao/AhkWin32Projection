#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DBaseMaterial.ahk
#Include .\IPrinting3DBaseMaterialStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the base material used for manufacturing certain objects in the 3D model.
 * @remarks
 * The Printing3DBaseMaterial class corresponds to the `<base>` element in the 3D Manufacturing Format (3MF) specification. For more info, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dbasematerial
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DBaseMaterial extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DBaseMaterial

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DBaseMaterial.IID

    /**
     * Gets the name the acrylonitrile butadiene styrene (ABS) thermoplastic used in the base material.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dbasematerial.abs
     * @type {HSTRING} 
     */
    static Abs {
        get => Printing3DBaseMaterial.get_Abs()
    }

    /**
     * Gets the name the polylactic acid (PLA) thermoplastic used in the base material.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dbasematerial.pla
     * @type {HSTRING} 
     */
    static Pla {
        get => Printing3DBaseMaterial.get_Pla()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Abs() {
        if (!Printing3DBaseMaterial.HasProp("__IPrinting3DBaseMaterialStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DBaseMaterial")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrinting3DBaseMaterialStatics.IID)
            Printing3DBaseMaterial.__IPrinting3DBaseMaterialStatics := IPrinting3DBaseMaterialStatics(factoryPtr)
        }

        return Printing3DBaseMaterial.__IPrinting3DBaseMaterialStatics.get_Abs()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Pla() {
        if (!Printing3DBaseMaterial.HasProp("__IPrinting3DBaseMaterialStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DBaseMaterial")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrinting3DBaseMaterialStatics.IID)
            Printing3DBaseMaterial.__IPrinting3DBaseMaterialStatics := IPrinting3DBaseMaterialStatics(factoryPtr)
        }

        return Printing3DBaseMaterial.__IPrinting3DBaseMaterialStatics.get_Pla()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the name of the base material.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dbasematerial.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets the color of the base material.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dbasematerial.color
     * @type {Printing3DColorMaterial} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [Printing3DBaseMaterial](printing3dbasematerial.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DBaseMaterial")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IPrinting3DBaseMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DBaseMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DBaseMaterial := IPrinting3DBaseMaterial(outPtr)
        }

        return this.__IPrinting3DBaseMaterial.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IPrinting3DBaseMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DBaseMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DBaseMaterial := IPrinting3DBaseMaterial(outPtr)
        }

        return this.__IPrinting3DBaseMaterial.put_Name(value)
    }

    /**
     * 
     * @returns {Printing3DColorMaterial} 
     */
    get_Color() {
        if (!this.HasProp("__IPrinting3DBaseMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DBaseMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DBaseMaterial := IPrinting3DBaseMaterial(outPtr)
        }

        return this.__IPrinting3DBaseMaterial.get_Color()
    }

    /**
     * 
     * @param {Printing3DColorMaterial} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__IPrinting3DBaseMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DBaseMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DBaseMaterial := IPrinting3DBaseMaterial(outPtr)
        }

        return this.__IPrinting3DBaseMaterial.put_Color(value)
    }

;@endregion Instance Methods
}
