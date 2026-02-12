#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IWebViewBrushStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewBrushStatics
     * @type {Guid}
     */
    static IID => Guid("{d74daa24-1d05-463e-b028-6baa4420e762}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceNameProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SourceNameProperty {
        get => this.get_SourceNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SourceNameProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
