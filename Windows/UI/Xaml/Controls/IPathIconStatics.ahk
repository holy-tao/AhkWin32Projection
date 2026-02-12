#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPathIconStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPathIconStatics
     * @type {Guid}
     */
    static IID => Guid("{77b75db8-fb15-491a-b6e3-7dbba911bafe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DataProperty"]

    /**
     * @type {DependencyProperty} 
     */
    DataProperty {
        get => this.get_DataProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DataProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
