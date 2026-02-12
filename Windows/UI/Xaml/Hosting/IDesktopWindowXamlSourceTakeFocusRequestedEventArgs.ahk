#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\XamlSourceFocusNavigationRequest.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class IDesktopWindowXamlSourceTakeFocusRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDesktopWindowXamlSourceTakeFocusRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{fe61e4b9-a7af-52b3-bdb9-c3305c0b8df2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Request"]

    /**
     * @type {XamlSourceFocusNavigationRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * 
     * @returns {XamlSourceFocusNavigationRequest} 
     */
    get_Request() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XamlSourceFocusNavigationRequest(value)
    }
}
