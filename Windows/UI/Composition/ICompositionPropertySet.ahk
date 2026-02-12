#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionPropertySet extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionPropertySet
     * @type {Guid}
     */
    static IID => Guid("{c9d6d202-5f67-4453-9117-9eadd430d3c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InsertColor", "InsertMatrix3x2", "InsertMatrix4x4", "InsertQuaternion", "InsertScalar", "InsertVector2", "InsertVector3", "InsertVector4", "TryGetColor", "TryGetMatrix3x2", "TryGetMatrix4x4", "TryGetQuaternion", "TryGetScalar", "TryGetVector2", "TryGetVector3", "TryGetVector4"]

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    InsertColor(propertyName, value) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(6, this, "ptr", propertyName, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {Matrix3x2} value 
     * @returns {HRESULT} 
     */
    InsertMatrix3x2(propertyName, value) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(7, this, "ptr", propertyName, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {Matrix4x4} value 
     * @returns {HRESULT} 
     */
    InsertMatrix4x4(propertyName, value) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(8, this, "ptr", propertyName, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {Quaternion} value 
     * @returns {HRESULT} 
     */
    InsertQuaternion(propertyName, value) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(9, this, "ptr", propertyName, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    InsertScalar(propertyName, value) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(10, this, "ptr", propertyName, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    InsertVector2(propertyName, value) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(11, this, "ptr", propertyName, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    InsertVector3(propertyName, value) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(12, this, "ptr", propertyName, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {Vector4} value 
     * @returns {HRESULT} 
     */
    InsertVector4(propertyName, value) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(13, this, "ptr", propertyName, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {Pointer<Color>} value 
     * @returns {Integer} 
     */
    TryGetColor(propertyName, value) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(14, this, "ptr", propertyName, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {Pointer<Matrix3x2>} value 
     * @returns {Integer} 
     */
    TryGetMatrix3x2(propertyName, value) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(15, this, "ptr", propertyName, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {Pointer<Matrix4x4>} value 
     * @returns {Integer} 
     */
    TryGetMatrix4x4(propertyName, value) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(16, this, "ptr", propertyName, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {Pointer<Quaternion>} value 
     * @returns {Integer} 
     */
    TryGetQuaternion(propertyName, value) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(17, this, "ptr", propertyName, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {Pointer<Single>} value 
     * @returns {Integer} 
     */
    TryGetScalar(propertyName, value) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(18, this, "ptr", propertyName, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {Pointer<Vector2>} value 
     * @returns {Integer} 
     */
    TryGetVector2(propertyName, value) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(19, this, "ptr", propertyName, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {Pointer<Vector3>} value 
     * @returns {Integer} 
     */
    TryGetVector3(propertyName, value) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(20, this, "ptr", propertyName, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {Pointer<Vector4>} value 
     * @returns {Integer} 
     */
    TryGetVector4(propertyName, value) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(21, this, "ptr", propertyName, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
