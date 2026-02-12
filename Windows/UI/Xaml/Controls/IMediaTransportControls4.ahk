#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMediaTransportControls4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaTransportControls4
     * @type {Guid}
     */
    static IID => Guid("{0fb17c58-9f23-11e7-abc4-cec278b6b50a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsCompactOverlayButtonVisible", "put_IsCompactOverlayButtonVisible", "get_IsCompactOverlayEnabled", "put_IsCompactOverlayEnabled"]

    /**
     * @type {Boolean} 
     */
    IsCompactOverlayButtonVisible {
        get => this.get_IsCompactOverlayButtonVisible()
        set => this.put_IsCompactOverlayButtonVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCompactOverlayEnabled {
        get => this.get_IsCompactOverlayEnabled()
        set => this.put_IsCompactOverlayEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCompactOverlayButtonVisible() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_IsCompactOverlayButtonVisible(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCompactOverlayEnabled() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_IsCompactOverlayEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
