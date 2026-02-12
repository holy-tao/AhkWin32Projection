#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class IWebViewControlSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewControlSettings
     * @type {Guid}
     */
    static IID => Guid("{c9967fbf-5e98-4cfd-8cce-27b0911e3de8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_IsJavaScriptEnabled", "get_IsJavaScriptEnabled", "put_IsIndexedDBEnabled", "get_IsIndexedDBEnabled", "put_IsScriptNotifyAllowed", "get_IsScriptNotifyAllowed"]

    /**
     * @type {Boolean} 
     */
    IsJavaScriptEnabled {
        get => this.get_IsJavaScriptEnabled()
        set => this.put_IsJavaScriptEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsIndexedDBEnabled {
        get => this.get_IsIndexedDBEnabled()
        set => this.put_IsIndexedDBEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsScriptNotifyAllowed {
        get => this.get_IsScriptNotifyAllowed()
        set => this.put_IsScriptNotifyAllowed(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsJavaScriptEnabled(value) {
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
    get_IsJavaScriptEnabled() {
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
    put_IsIndexedDBEnabled(value) {
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
    get_IsIndexedDBEnabled() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_IsScriptNotifyAllowed(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScriptNotifyAllowed() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
