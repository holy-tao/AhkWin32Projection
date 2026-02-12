#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IContentDialogStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentDialogStatics
     * @type {Guid}
     */
    static IID => Guid("{23ab47a6-508a-4f33-b786-f2fa96d869af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TitleProperty", "get_TitleTemplateProperty", "get_FullSizeDesiredProperty", "get_PrimaryButtonTextProperty", "get_SecondaryButtonTextProperty", "get_PrimaryButtonCommandProperty", "get_SecondaryButtonCommandProperty", "get_PrimaryButtonCommandParameterProperty", "get_SecondaryButtonCommandParameterProperty", "get_IsPrimaryButtonEnabledProperty", "get_IsSecondaryButtonEnabledProperty"]

    /**
     * @type {DependencyProperty} 
     */
    TitleProperty {
        get => this.get_TitleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TitleTemplateProperty {
        get => this.get_TitleTemplateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FullSizeDesiredProperty {
        get => this.get_FullSizeDesiredProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PrimaryButtonTextProperty {
        get => this.get_PrimaryButtonTextProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SecondaryButtonTextProperty {
        get => this.get_SecondaryButtonTextProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PrimaryButtonCommandProperty {
        get => this.get_PrimaryButtonCommandProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SecondaryButtonCommandProperty {
        get => this.get_SecondaryButtonCommandProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PrimaryButtonCommandParameterProperty {
        get => this.get_PrimaryButtonCommandParameterProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SecondaryButtonCommandParameterProperty {
        get => this.get_SecondaryButtonCommandParameterProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsPrimaryButtonEnabledProperty {
        get => this.get_IsPrimaryButtonEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsSecondaryButtonEnabledProperty {
        get => this.get_IsSecondaryButtonEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TitleProperty() {
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
    get_TitleTemplateProperty() {
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
    get_FullSizeDesiredProperty() {
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
    get_PrimaryButtonTextProperty() {
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
    get_SecondaryButtonTextProperty() {
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
    get_PrimaryButtonCommandProperty() {
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
    get_SecondaryButtonCommandProperty() {
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
    get_PrimaryButtonCommandParameterProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SecondaryButtonCommandParameterProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsPrimaryButtonEnabledProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsSecondaryButtonEnabledProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
