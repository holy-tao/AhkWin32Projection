#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppCaptureAlternateShortcutKeys2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCaptureAlternateShortcutKeys2
     * @type {Guid}
     */
    static IID => Guid("{c3669090-dd17-47f0-95e5-ce42286cf338}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ToggleMicrophoneCaptureKey", "get_ToggleMicrophoneCaptureKey", "put_ToggleMicrophoneCaptureKeyModifiers", "get_ToggleMicrophoneCaptureKeyModifiers"]

    /**
     * @type {Integer} 
     */
    ToggleMicrophoneCaptureKey {
        get => this.get_ToggleMicrophoneCaptureKey()
        set => this.put_ToggleMicrophoneCaptureKey(value)
    }

    /**
     * @type {Integer} 
     */
    ToggleMicrophoneCaptureKeyModifiers {
        get => this.get_ToggleMicrophoneCaptureKeyModifiers()
        set => this.put_ToggleMicrophoneCaptureKeyModifiers(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleMicrophoneCaptureKey(value) {
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
    get_ToggleMicrophoneCaptureKey() {
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
    put_ToggleMicrophoneCaptureKeyModifiers(value) {
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
    get_ToggleMicrophoneCaptureKeyModifiers() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
