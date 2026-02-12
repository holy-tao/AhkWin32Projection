#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppCaptureSettings5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCaptureSettings5
     * @type {Guid}
     */
    static IID => Guid("{18894522-b0e8-4ba0-8f13-3eaa5fa4013b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_IsEchoCancellationEnabled", "get_IsEchoCancellationEnabled", "put_IsCursorImageCaptureEnabled", "get_IsCursorImageCaptureEnabled"]

    /**
     * @type {Boolean} 
     */
    IsEchoCancellationEnabled {
        get => this.get_IsEchoCancellationEnabled()
        set => this.put_IsEchoCancellationEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCursorImageCaptureEnabled {
        get => this.get_IsCursorImageCaptureEnabled()
        set => this.put_IsCursorImageCaptureEnabled(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEchoCancellationEnabled(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEchoCancellationEnabled() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCursorImageCaptureEnabled(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCursorImageCaptureEnabled() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
