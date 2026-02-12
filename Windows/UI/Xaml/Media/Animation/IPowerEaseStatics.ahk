#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IPowerEaseStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPowerEaseStatics
     * @type {Guid}
     */
    static IID => Guid("{a5955103-91a2-460c-9c41-d28f6a939bda}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PowerProperty"]

    /**
     * @type {DependencyProperty} 
     */
    PowerProperty {
        get => this.get_PowerProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PowerProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
