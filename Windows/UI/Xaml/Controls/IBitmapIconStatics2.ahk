#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IBitmapIconStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapIconStatics2
     * @type {Guid}
     */
    static IID => Guid("{9745026b-b742-4a89-a5d7-a0e5fb809af1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ShowAsMonochromeProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ShowAsMonochromeProperty {
        get => this.get_ShowAsMonochromeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ShowAsMonochromeProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
