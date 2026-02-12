#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DColorMaterial.ahk
#Include .\IPrinting3DColorMaterial2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a color material used in the 3D model.
 * @remarks
 * The Printing3DColorMaterial class corresponds to the `<color>` element in the 3D Manufacturing Format (3MF) specification. For more info, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcolormaterial
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DColorMaterial extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DColorMaterial

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DColorMaterial.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the color value of the material.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcolormaterial.value
     * @type {Integer} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Gets or sets the color of the material.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcolormaterial.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [Printing3DColorMaterial](printing3dcolormaterial.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DColorMaterial")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Value() {
        if (!this.HasProp("__IPrinting3DColorMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DColorMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DColorMaterial := IPrinting3DColorMaterial(outPtr)
        }

        return this.__IPrinting3DColorMaterial.get_Value()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IPrinting3DColorMaterial")) {
            if ((queryResult := this.QueryInterface(IPrinting3DColorMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DColorMaterial := IPrinting3DColorMaterial(outPtr)
        }

        return this.__IPrinting3DColorMaterial.put_Value(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Color() {
        if (!this.HasProp("__IPrinting3DColorMaterial2")) {
            if ((queryResult := this.QueryInterface(IPrinting3DColorMaterial2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DColorMaterial2 := IPrinting3DColorMaterial2(outPtr)
        }

        return this.__IPrinting3DColorMaterial2.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__IPrinting3DColorMaterial2")) {
            if ((queryResult := this.QueryInterface(IPrinting3DColorMaterial2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DColorMaterial2 := IPrinting3DColorMaterial2(outPtr)
        }

        return this.__IPrinting3DColorMaterial2.put_Color(value)
    }

;@endregion Instance Methods
}
