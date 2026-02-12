#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ISplitCloseThemeAnimationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISplitCloseThemeAnimationStatics
     * @type {Guid}
     */
    static IID => Guid("{7aa94de9-cc9b-4e90-a11a-0050a2216a9e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OpenedTargetNameProperty", "get_OpenedTargetProperty", "get_ClosedTargetNameProperty", "get_ClosedTargetProperty", "get_ContentTargetNameProperty", "get_ContentTargetProperty", "get_OpenedLengthProperty", "get_ClosedLengthProperty", "get_OffsetFromCenterProperty", "get_ContentTranslationDirectionProperty", "get_ContentTranslationOffsetProperty"]

    /**
     * @type {DependencyProperty} 
     */
    OpenedTargetNameProperty {
        get => this.get_OpenedTargetNameProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OpenedTargetProperty {
        get => this.get_OpenedTargetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ClosedTargetNameProperty {
        get => this.get_ClosedTargetNameProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ClosedTargetProperty {
        get => this.get_ClosedTargetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ContentTargetNameProperty {
        get => this.get_ContentTargetNameProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ContentTargetProperty {
        get => this.get_ContentTargetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OpenedLengthProperty {
        get => this.get_OpenedLengthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ClosedLengthProperty {
        get => this.get_ClosedLengthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OffsetFromCenterProperty {
        get => this.get_OffsetFromCenterProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ContentTranslationDirectionProperty {
        get => this.get_ContentTranslationDirectionProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ContentTranslationOffsetProperty {
        get => this.get_ContentTranslationOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_OpenedTargetNameProperty() {
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
    get_OpenedTargetProperty() {
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
    get_ClosedTargetNameProperty() {
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
    get_ClosedTargetProperty() {
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
    get_ContentTargetNameProperty() {
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
    get_ContentTargetProperty() {
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
    get_OpenedLengthProperty() {
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
    get_ClosedLengthProperty() {
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
    get_OffsetFromCenterProperty() {
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
    get_ContentTranslationDirectionProperty() {
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
    get_ContentTranslationOffsetProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
