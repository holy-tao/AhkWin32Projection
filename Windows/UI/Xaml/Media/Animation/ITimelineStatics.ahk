#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ITimelineStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimelineStatics
     * @type {Guid}
     */
    static IID => Guid("{a902ed4e-ef10-4d6f-9a40-93cb8895f4e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowDependentAnimations", "put_AllowDependentAnimations", "get_AutoReverseProperty", "get_BeginTimeProperty", "get_DurationProperty", "get_SpeedRatioProperty", "get_FillBehaviorProperty", "get_RepeatBehaviorProperty"]

    /**
     * @type {Boolean} 
     */
    AllowDependentAnimations {
        get => this.get_AllowDependentAnimations()
        set => this.put_AllowDependentAnimations(value)
    }

    /**
     * @type {DependencyProperty} 
     */
    AutoReverseProperty {
        get => this.get_AutoReverseProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BeginTimeProperty {
        get => this.get_BeginTimeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DurationProperty {
        get => this.get_DurationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SpeedRatioProperty {
        get => this.get_SpeedRatioProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FillBehaviorProperty {
        get => this.get_FillBehaviorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RepeatBehaviorProperty {
        get => this.get_RepeatBehaviorProperty()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowDependentAnimations() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowDependentAnimations(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AutoReverseProperty() {
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
    get_BeginTimeProperty() {
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
    get_DurationProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SpeedRatioProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FillBehaviorProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_RepeatBehaviorProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
