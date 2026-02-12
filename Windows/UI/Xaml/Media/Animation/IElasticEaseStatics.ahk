#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IElasticEaseStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElasticEaseStatics
     * @type {Guid}
     */
    static IID => Guid("{a9f566ec-fe9c-4b2b-8e52-bb785d562185}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OscillationsProperty", "get_SpringinessProperty"]

    /**
     * @type {DependencyProperty} 
     */
    OscillationsProperty {
        get => this.get_OscillationsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SpringinessProperty {
        get => this.get_SpringinessProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_OscillationsProperty() {
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
    get_SpringinessProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
