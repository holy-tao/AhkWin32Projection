#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionPropertySet.ahk
#Include .\ICompositionPropertySet2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Stores values as key-value pairs.
 * @remarks
 * **CompositionPropertySet**s are [CompositionObject](compositionobject.md)s that allow storage of key values pairs that can be shared across the application and are not tied to the lifetime of another composition object. **CompositionPropertySet**s are most commonly used with animations, where they maintain key-value pairs that are referenced to drive portions of composition animations. **CompositionPropertySet**s provide the ability to insert key-value pairs or retrieve a value for a given key. For more information on using **CompositionPropertySet** with animations, see the [Animations Overview](/windows/uwp/graphics/composition-animation) page.
 * 
 * CompositionPropertySet does not support a delete function – ensure you use CompositionPropertySet to store values that will be shared across the application.
 * 
 * > [!NOTE]
 * > Inserting a new value into a CompositionPropertySet for a key that already exists will overwrite the old value with the new one.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionPropertySet extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionPropertySet

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionPropertySet.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Inserts a [Color](../windows.ui/color.md) key-value pair.
     * @param {HSTRING} propertyName The key associated with the value. This key can be used to retrieve the value.
     * @param {Color} value The value to insert.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.insertcolor
     */
    InsertColor(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet := ICompositionPropertySet(outPtr)
        }

        return this.__ICompositionPropertySet.InsertColor(propertyName, value)
    }

    /**
     * Inserts a Matrix3x2 key-value pair.
     * @param {HSTRING} propertyName The key associated with the value. This key can be used to retrieve the value.
     * @param {Matrix3x2} value The value to insert.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.insertmatrix3x2
     */
    InsertMatrix3x2(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet := ICompositionPropertySet(outPtr)
        }

        return this.__ICompositionPropertySet.InsertMatrix3x2(propertyName, value)
    }

    /**
     * Inserts a Matrix4x4 key-value pair.
     * @param {HSTRING} propertyName The key associated with the value. This key can be used to retrieve the value.
     * @param {Matrix4x4} value The value to insert.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.insertmatrix4x4
     */
    InsertMatrix4x4(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet := ICompositionPropertySet(outPtr)
        }

        return this.__ICompositionPropertySet.InsertMatrix4x4(propertyName, value)
    }

    /**
     * Inserts a quaternion key-value pair.
     * @param {HSTRING} propertyName The key associated with the value. This key can be used to retrieve the value.
     * @param {Quaternion} value The value to insert.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.insertquaternion
     */
    InsertQuaternion(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet := ICompositionPropertySet(outPtr)
        }

        return this.__ICompositionPropertySet.InsertQuaternion(propertyName, value)
    }

    /**
     * Inserts a [Single](/dotnet/api/system.single?view=dotnet-uwp-10.0&preserve-view=true) key-value pair.
     * @param {HSTRING} propertyName The name of the property to insert.
     * @param {Float} value The value of the property to insert.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.insertscalar
     */
    InsertScalar(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet := ICompositionPropertySet(outPtr)
        }

        return this.__ICompositionPropertySet.InsertScalar(propertyName, value)
    }

    /**
     * Inserts a Vector2 key-value pair.
     * @param {HSTRING} propertyName The key associated with the value. This key can be used to retrieve the value.
     * @param {Vector2} value The value to insert.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.insertvector2
     */
    InsertVector2(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet := ICompositionPropertySet(outPtr)
        }

        return this.__ICompositionPropertySet.InsertVector2(propertyName, value)
    }

    /**
     * Inserts a Vector3 key-value pair.
     * @param {HSTRING} propertyName The key associated with the value. This key can be used to retrieve the value.
     * @param {Vector3} value The value to insert.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.insertvector3
     */
    InsertVector3(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet := ICompositionPropertySet(outPtr)
        }

        return this.__ICompositionPropertySet.InsertVector3(propertyName, value)
    }

    /**
     * Inserts a Vector4 key-value pair.
     * @param {HSTRING} propertyName The key associated with the value. This key can be used to retrieve the value.
     * @param {Vector4} value The value to insert.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.insertvector4
     */
    InsertVector4(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet := ICompositionPropertySet(outPtr)
        }

        return this.__ICompositionPropertySet.InsertVector4(propertyName, value)
    }

    /**
     * Retrieves the specified [Color](../windows.ui/color.md) property value.
     * @param {HSTRING} propertyName The name of the property to retrieve.
     * @param {Pointer<Color>} value If the operation is successful, this parameter will contain the specified [Color](../windows.ui/color.md) property value when the method returns.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.trygetcolor
     */
    TryGetColor(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet := ICompositionPropertySet(outPtr)
        }

        return this.__ICompositionPropertySet.TryGetColor(propertyName, value)
    }

    /**
     * Retrieves the specified [Matrix3x2](../windows.foundation.numerics/matrix3x2.md) property value.
     * @param {HSTRING} propertyName The name of the property to retrieve.
     * @param {Pointer<Matrix3x2>} value If the operation is successful, this parameter will contain the specified [Matrix3x2](../windows.foundation.numerics/matrix3x2.md) property value when the method returns.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.trygetmatrix3x2
     */
    TryGetMatrix3x2(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet := ICompositionPropertySet(outPtr)
        }

        return this.__ICompositionPropertySet.TryGetMatrix3x2(propertyName, value)
    }

    /**
     * Retrieves the specified [Matrix4x4](../windows.foundation.numerics/matrix4x4.md) property value.
     * @param {HSTRING} propertyName The name of the property to retrieve.
     * @param {Pointer<Matrix4x4>} value If the operation is successful, this parameter will contain the specified [Matrix4x4](../windows.foundation.numerics/matrix4x4.md) property value when the method returns.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.trygetmatrix4x4
     */
    TryGetMatrix4x4(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet := ICompositionPropertySet(outPtr)
        }

        return this.__ICompositionPropertySet.TryGetMatrix4x4(propertyName, value)
    }

    /**
     * Retrieves the specified quaternion property value.
     * @param {HSTRING} propertyName The name of the property to retrieve.
     * @param {Pointer<Quaternion>} value If the operation is successful, this parameter will contain the specified quaternion property value when the method returns.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.trygetquaternion
     */
    TryGetQuaternion(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet := ICompositionPropertySet(outPtr)
        }

        return this.__ICompositionPropertySet.TryGetQuaternion(propertyName, value)
    }

    /**
     * Retrieves the specified [Single](/dotnet/api/system.single?view=dotnet-uwp-10.0&preserve-view=true) property value.
     * @param {HSTRING} propertyName The name of the property to retrieve.
     * @param {Pointer<Single>} value If the operation is successful, this parameter will contain the specified [Single](/dotnet/api/system.single?view=dotnet-uwp-10.0&preserve-view=true) property value when the method returns.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.trygetscalar
     */
    TryGetScalar(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet := ICompositionPropertySet(outPtr)
        }

        return this.__ICompositionPropertySet.TryGetScalar(propertyName, value)
    }

    /**
     * Retrieves the specified [Vector2](../windows.foundation.numerics/vector2.md) property value.
     * @param {HSTRING} propertyName The name of the property to retrieve.
     * @param {Pointer<Vector2>} value If the operation is successful, this parameter will contain the specified [Vector2](../windows.foundation.numerics/vector2.md) property value when the method returns.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.trygetvector2
     */
    TryGetVector2(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet := ICompositionPropertySet(outPtr)
        }

        return this.__ICompositionPropertySet.TryGetVector2(propertyName, value)
    }

    /**
     * Retrieves the specified [Vector3](../windows.foundation.numerics/vector3.md) property value.
     * @param {HSTRING} propertyName The name of the property to retrieve.
     * @param {Pointer<Vector3>} value If the operation is successful, this parameter will contain the specified [Vector3](../windows.foundation.numerics/vector3.md) property value when the method returns.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.trygetvector3
     */
    TryGetVector3(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet := ICompositionPropertySet(outPtr)
        }

        return this.__ICompositionPropertySet.TryGetVector3(propertyName, value)
    }

    /**
     * Retrieves the specified [Vector4](../windows.foundation.numerics/vector4.md) property value.
     * @param {HSTRING} propertyName The name of the property to retrieve.
     * @param {Pointer<Vector4>} value If the operation is successful, this parameter will contain the specified [Vector4](../windows.foundation.numerics/vector4.md) property value when the method returns.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.trygetvector4
     */
    TryGetVector4(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet := ICompositionPropertySet(outPtr)
        }

        return this.__ICompositionPropertySet.TryGetVector4(propertyName, value)
    }

    /**
     * Inserts a boolean key-value pair.
     * @param {HSTRING} propertyName The key associated with the value. This key can be used to retrieve the value.
     * @param {Boolean} value The value to insert.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.insertboolean
     */
    InsertBoolean(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet2")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet2 := ICompositionPropertySet2(outPtr)
        }

        return this.__ICompositionPropertySet2.InsertBoolean(propertyName, value)
    }

    /**
     * Retrieves the specified boolean property value.
     * @param {HSTRING} propertyName The name of the property to retrieve.
     * @param {Pointer<Boolean>} value If the operation is successful, this parameter will contain the specified boolean property value when the method returns.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionpropertyset.trygetboolean
     */
    TryGetBoolean(propertyName, value) {
        if (!this.HasProp("__ICompositionPropertySet2")) {
            if ((queryResult := this.QueryInterface(ICompositionPropertySet2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionPropertySet2 := ICompositionPropertySet2(outPtr)
        }

        return this.__ICompositionPropertySet2.TryGetBoolean(propertyName, value)
    }

;@endregion Instance Methods
}
