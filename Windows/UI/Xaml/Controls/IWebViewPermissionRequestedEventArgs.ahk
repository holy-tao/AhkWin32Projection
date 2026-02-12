#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WebViewPermissionRequest.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IWebViewPermissionRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewPermissionRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{dadecfd0-6e1e-473f-b0be-b02404d6a86d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PermissionRequest"]

    /**
     * @type {WebViewPermissionRequest} 
     */
    PermissionRequest {
        get => this.get_PermissionRequest()
    }

    /**
     * 
     * @returns {WebViewPermissionRequest} 
     */
    get_PermissionRequest() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebViewPermissionRequest(value)
    }
}
