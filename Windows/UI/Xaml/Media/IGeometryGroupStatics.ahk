#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IGeometryGroupStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeometryGroupStatics
     * @type {Guid}
     */
    static IID => Guid("{56c955f4-8496-4bb6-abf0-617b1fe78b45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FillRuleProperty", "get_ChildrenProperty"]

    /**
     * @type {DependencyProperty} 
     */
    FillRuleProperty {
        get => this.get_FillRuleProperty()
    }

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
    get_FillRuleProperty() {
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
    get_ChildrenProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
