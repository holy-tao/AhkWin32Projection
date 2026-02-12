#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Base class for composition animations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.icompositionanimationbase
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionAnimation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionAnimation
     * @type {Guid}
     */
    static IID => Guid("{464c4c2c-1caa-4061-9b40-e13fde1503ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ClearAllParameters", "ClearParameter", "SetColorParameter", "SetMatrix3x2Parameter", "SetMatrix4x4Parameter", "SetQuaternionParameter", "SetReferenceParameter", "SetScalarParameter", "SetVector2Parameter", "SetVector3Parameter", "SetVector4Parameter"]

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearAllParameters() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} key 
     * @returns {HRESULT} 
     */
    ClearParameter(key) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := ComCall(7, this, "ptr", key, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} key 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    SetColorParameter(key, value) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := ComCall(8, this, "ptr", key, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} key 
     * @param {Matrix3x2} value 
     * @returns {HRESULT} 
     */
    SetMatrix3x2Parameter(key, value) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := ComCall(9, this, "ptr", key, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} key 
     * @param {Matrix4x4} value 
     * @returns {HRESULT} 
     */
    SetMatrix4x4Parameter(key, value) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := ComCall(10, this, "ptr", key, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} key 
     * @param {Quaternion} value 
     * @returns {HRESULT} 
     */
    SetQuaternionParameter(key, value) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := ComCall(11, this, "ptr", key, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} key 
     * @param {CompositionObject} compositionObject_ 
     * @returns {HRESULT} 
     */
    SetReferenceParameter(key, compositionObject_) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := ComCall(12, this, "ptr", key, "ptr", compositionObject_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} key 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    SetScalarParameter(key, value) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := ComCall(13, this, "ptr", key, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} key 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    SetVector2Parameter(key, value) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := ComCall(14, this, "ptr", key, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} key 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    SetVector3Parameter(key, value) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := ComCall(15, this, "ptr", key, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} key 
     * @param {Vector4} value 
     * @returns {HRESULT} 
     */
    SetVector4Parameter(key, value) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := ComCall(16, this, "ptr", key, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
