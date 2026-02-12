#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IWebViewSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewSettings
     * @type {Guid}
     */
    static IID => Guid("{1d50ad4d-abf6-4785-8df3-fdebc1270301}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsJavaScriptEnabled", "put_IsJavaScriptEnabled", "get_IsIndexedDBEnabled", "put_IsIndexedDBEnabled"]

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
     * 
     * @returns {Boolean} 
     */
    get_IsJavaScriptEnabled() {
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
    put_IsJavaScriptEnabled(value) {
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
    get_IsIndexedDBEnabled() {
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
    put_IsIndexedDBEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
