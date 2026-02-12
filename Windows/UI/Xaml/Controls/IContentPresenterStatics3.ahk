#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IContentPresenterStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentPresenterStatics3
     * @type {Guid}
     */
    static IID => Guid("{cbe6cf5b-38b1-4d5d-b098-bc94b35c8ddf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsTextScaleFactorEnabledProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IsTextScaleFactorEnabledProperty {
        get => this.get_IsTextScaleFactorEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsTextScaleFactorEnabledProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
