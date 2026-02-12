#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DComponentWithMatrix.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a 3D Manufacturing Format (3MF) component that's applied to the object definition with a matrix transform.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcomponentwithmatrix
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DComponentWithMatrix extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DComponentWithMatrix

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DComponentWithMatrix.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the 3D Manufacturing Format (3MF) primitive component that's applied to the object definition with a matrix transform.
     * @remarks
     * The [Printing3DComponent](printing3dcomponent.md) class corresponds to the `<object>` element in the 3D Manufacturing Format (3MF) specification. For more info, see the [3MF Specification](https://3mf.io/spec/).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcomponentwithmatrix.component
     * @type {Printing3DComponent} 
     */
    Component {
        get => this.get_Component()
        set => this.put_Component(value)
    }

    /**
     * Gets or sets the matrix transform that's applied to the 3D Manufacturing Format (3MF) primitive component.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dcomponentwithmatrix.matrix
     * @type {Matrix4x4} 
     */
    Matrix {
        get => this.get_Matrix()
        set => this.put_Matrix(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [Printing3DComponentWithMatrix](printing3dcomponentwithmatrix.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DComponentWithMatrix")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Printing3DComponent} 
     */
    get_Component() {
        if (!this.HasProp("__IPrinting3DComponentWithMatrix")) {
            if ((queryResult := this.QueryInterface(IPrinting3DComponentWithMatrix.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DComponentWithMatrix := IPrinting3DComponentWithMatrix(outPtr)
        }

        return this.__IPrinting3DComponentWithMatrix.get_Component()
    }

    /**
     * 
     * @param {Printing3DComponent} value 
     * @returns {HRESULT} 
     */
    put_Component(value) {
        if (!this.HasProp("__IPrinting3DComponentWithMatrix")) {
            if ((queryResult := this.QueryInterface(IPrinting3DComponentWithMatrix.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DComponentWithMatrix := IPrinting3DComponentWithMatrix(outPtr)
        }

        return this.__IPrinting3DComponentWithMatrix.put_Component(value)
    }

    /**
     * 
     * @returns {Matrix4x4} 
     */
    get_Matrix() {
        if (!this.HasProp("__IPrinting3DComponentWithMatrix")) {
            if ((queryResult := this.QueryInterface(IPrinting3DComponentWithMatrix.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DComponentWithMatrix := IPrinting3DComponentWithMatrix(outPtr)
        }

        return this.__IPrinting3DComponentWithMatrix.get_Matrix()
    }

    /**
     * 
     * @param {Matrix4x4} value 
     * @returns {HRESULT} 
     */
    put_Matrix(value) {
        if (!this.HasProp("__IPrinting3DComponentWithMatrix")) {
            if ((queryResult := this.QueryInterface(IPrinting3DComponentWithMatrix.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DComponentWithMatrix := IPrinting3DComponentWithMatrix(outPtr)
        }

        return this.__IPrinting3DComponentWithMatrix.put_Matrix(value)
    }

;@endregion Instance Methods
}
