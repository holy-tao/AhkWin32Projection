#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IDrillInThemeAnimationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDrillInThemeAnimationStatics
     * @type {Guid}
     */
    static IID => Guid("{c61fe488-a17a-4b11-b53b-a4f1a07d4ba9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EntranceTargetNameProperty", "get_EntranceTargetProperty", "get_ExitTargetNameProperty", "get_ExitTargetProperty"]

    /**
     * @type {DependencyProperty} 
     */
    EntranceTargetNameProperty {
        get => this.get_EntranceTargetNameProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    EntranceTargetProperty {
        get => this.get_EntranceTargetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ExitTargetNameProperty {
        get => this.get_ExitTargetNameProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ExitTargetProperty {
        get => this.get_ExitTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_EntranceTargetNameProperty() {
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
    get_EntranceTargetProperty() {
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
    get_ExitTargetNameProperty() {
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
    get_ExitTargetProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
