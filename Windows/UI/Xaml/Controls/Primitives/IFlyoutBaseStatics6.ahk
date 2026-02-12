#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IFlyoutBaseStatics6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFlyoutBaseStatics6
     * @type {Guid}
     */
    static IID => Guid("{96d49254-c91b-5246-8b39-afc2a2c50cf8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ShouldConstrainToRootBoundsProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ShouldConstrainToRootBoundsProperty {
        get => this.get_ShouldConstrainToRootBoundsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ShouldConstrainToRootBoundsProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
