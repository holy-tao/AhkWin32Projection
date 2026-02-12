#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapIconStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapIconStatics2
     * @type {Guid}
     */
    static IID => Guid("{ff4c306a-cf76-46ab-a12f-b603b986c696}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CollisionBehaviorDesiredProperty"]

    /**
     * @type {DependencyProperty} 
     */
    CollisionBehaviorDesiredProperty {
        get => this.get_CollisionBehaviorDesiredProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CollisionBehaviorDesiredProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
