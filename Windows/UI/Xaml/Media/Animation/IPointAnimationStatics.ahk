#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IPointAnimationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPointAnimationStatics
     * @type {Guid}
     */
    static IID => Guid("{2f99b356-e737-408b-a0fd-327826d32255}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FromProperty", "get_ToProperty", "get_ByProperty", "get_EasingFunctionProperty", "get_EnableDependentAnimationProperty"]

    /**
     * @type {DependencyProperty} 
     */
    FromProperty {
        get => this.get_FromProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ToProperty {
        get => this.get_ToProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ByProperty {
        get => this.get_ByProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    EasingFunctionProperty {
        get => this.get_EasingFunctionProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    EnableDependentAnimationProperty {
        get => this.get_EnableDependentAnimationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FromProperty() {
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
    get_ToProperty() {
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
    get_ByProperty() {
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
    get_EasingFunctionProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_EnableDependentAnimationProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
