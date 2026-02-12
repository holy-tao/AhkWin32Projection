#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppCaptureAlternateShortcutKeys3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCaptureAlternateShortcutKeys3
     * @type {Guid}
     */
    static IID => Guid("{7b81448c-418e-469c-a49a-45b597c826b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ToggleCameraCaptureKey", "get_ToggleCameraCaptureKey", "put_ToggleCameraCaptureKeyModifiers", "get_ToggleCameraCaptureKeyModifiers", "put_ToggleBroadcastKey", "get_ToggleBroadcastKey", "put_ToggleBroadcastKeyModifiers", "get_ToggleBroadcastKeyModifiers"]

    /**
     * @type {Integer} 
     */
    ToggleCameraCaptureKey {
        get => this.get_ToggleCameraCaptureKey()
        set => this.put_ToggleCameraCaptureKey(value)
    }

    /**
     * @type {Integer} 
     */
    ToggleCameraCaptureKeyModifiers {
        get => this.get_ToggleCameraCaptureKeyModifiers()
        set => this.put_ToggleCameraCaptureKeyModifiers(value)
    }

    /**
     * @type {Integer} 
     */
    ToggleBroadcastKey {
        get => this.get_ToggleBroadcastKey()
        set => this.put_ToggleBroadcastKey(value)
    }

    /**
     * @type {Integer} 
     */
    ToggleBroadcastKeyModifiers {
        get => this.get_ToggleBroadcastKeyModifiers()
        set => this.put_ToggleBroadcastKeyModifiers(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleCameraCaptureKey(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleCameraCaptureKey() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleCameraCaptureKeyModifiers(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleCameraCaptureKeyModifiers() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleBroadcastKey(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleBroadcastKey() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleBroadcastKeyModifiers(value) {
        result := ComCall(12, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleBroadcastKeyModifiers() {
        result := ComCall(13, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
