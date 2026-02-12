#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRefreshVisualizerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRefreshVisualizerStatics
     * @type {Guid}
     */
    static IID => Guid("{afea56af-362a-4015-b155-733a1f869831}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InfoProviderProperty", "get_OrientationProperty", "get_ContentProperty", "get_StateProperty"]

    /**
     * @type {DependencyProperty} 
     */
    InfoProviderProperty {
        get => this.get_InfoProviderProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OrientationProperty {
        get => this.get_OrientationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ContentProperty {
        get => this.get_ContentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StateProperty {
        get => this.get_StateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_InfoProviderProperty() {
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
    get_OrientationProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ContentProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StateProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
