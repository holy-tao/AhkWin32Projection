#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IAcrylicBrushStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAcrylicBrushStatics2
     * @type {Guid}
     */
    static IID => Guid("{129188a8-bf11-5bbc-8445-8c510e5926c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TintLuminosityOpacityProperty"]

    /**
     * @type {DependencyProperty} 
     */
    TintLuminosityOpacityProperty {
        get => this.get_TintLuminosityOpacityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TintLuminosityOpacityProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
