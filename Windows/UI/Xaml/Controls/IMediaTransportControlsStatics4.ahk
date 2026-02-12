#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMediaTransportControlsStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaTransportControlsStatics4
     * @type {Guid}
     */
    static IID => Guid("{0fb18144-9f23-11e7-abc4-cec278b6b50a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsCompactOverlayButtonVisibleProperty", "get_IsCompactOverlayEnabledProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IsCompactOverlayButtonVisibleProperty {
        get => this.get_IsCompactOverlayButtonVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsCompactOverlayEnabledProperty {
        get => this.get_IsCompactOverlayEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsCompactOverlayButtonVisibleProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsCompactOverlayEnabledProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
