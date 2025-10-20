#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ICoreWindowAdapterInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreWindowAdapterInterop
     * @type {Guid}
     */
    static IID => Guid("{7a5b6fd1-cd73-4b6c-9cf4-2e869eaf470a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppActivationClientAdapter", "get_ApplicationViewClientAdapter", "get_CoreApplicationViewClientAdapter", "get_HoloViewClientAdapter", "get_PositionerClientAdapter", "get_SystemNavigationClientAdapter", "get_TitleBarClientAdapter", "SetWindowClientAdapter"]

    /**
     * 
     * @param {Pointer<IUnknown>} value 
     * @returns {HRESULT} 
     */
    get_AppActivationClientAdapter(value) {
        result := ComCall(6, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} value 
     * @returns {HRESULT} 
     */
    get_ApplicationViewClientAdapter(value) {
        result := ComCall(7, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} value 
     * @returns {HRESULT} 
     */
    get_CoreApplicationViewClientAdapter(value) {
        result := ComCall(8, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} value 
     * @returns {HRESULT} 
     */
    get_HoloViewClientAdapter(value) {
        result := ComCall(9, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} value 
     * @returns {HRESULT} 
     */
    get_PositionerClientAdapter(value) {
        result := ComCall(10, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} value 
     * @returns {HRESULT} 
     */
    get_SystemNavigationClientAdapter(value) {
        result := ComCall(11, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} value 
     * @returns {HRESULT} 
     */
    get_TitleBarClientAdapter(value) {
        result := ComCall(12, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} value 
     * @returns {HRESULT} 
     */
    SetWindowClientAdapter(value) {
        result := ComCall(13, this, "ptr", value, "HRESULT")
        return result
    }
}
