#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ITransformGroupStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransformGroupStatics
     * @type {Guid}
     */
    static IID => Guid("{25312f2a-cfab-4b24-9713-5bdead1929c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChildrenProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ChildrenProperty {
        get => this.get_ChildrenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ChildrenProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
