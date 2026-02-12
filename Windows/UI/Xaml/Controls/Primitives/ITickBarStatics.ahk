#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ITickBarStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITickBarStatics
     * @type {Guid}
     */
    static IID => Guid("{2c6d7e40-799d-4a54-be09-1fefc61d018e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FillProperty"]

    /**
     * @type {DependencyProperty} 
     */
    FillProperty {
        get => this.get_FillProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FillProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
