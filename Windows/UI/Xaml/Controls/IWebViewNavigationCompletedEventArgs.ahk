#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IWebViewNavigationCompletedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewNavigationCompletedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{11e6f20b-eba7-44c0-889b-edeb6a064ddd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Uri", "get_IsSuccess", "get_WebErrorStatus"]

    /**
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * @type {Boolean} 
     */
    IsSuccess {
        get => this.get_IsSuccess()
    }

    /**
     * @type {Integer} 
     */
    WebErrorStatus {
        get => this.get_WebErrorStatus()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSuccess() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WebErrorStatus() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
