#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPersonPictureStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersonPictureStatics
     * @type {Guid}
     */
    static IID => Guid("{dbec0982-3c10-4639-9614-aa5b7cdc32ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BadgeNumberProperty", "get_BadgeGlyphProperty", "get_BadgeImageSourceProperty", "get_BadgeTextProperty", "get_IsGroupProperty", "get_ContactProperty", "get_DisplayNameProperty", "get_InitialsProperty", "get_PreferSmallImageProperty", "get_ProfilePictureProperty"]

    /**
     * @type {DependencyProperty} 
     */
    BadgeNumberProperty {
        get => this.get_BadgeNumberProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BadgeGlyphProperty {
        get => this.get_BadgeGlyphProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BadgeImageSourceProperty {
        get => this.get_BadgeImageSourceProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BadgeTextProperty {
        get => this.get_BadgeTextProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsGroupProperty {
        get => this.get_IsGroupProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ContactProperty {
        get => this.get_ContactProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DisplayNameProperty {
        get => this.get_DisplayNameProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    InitialsProperty {
        get => this.get_InitialsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PreferSmallImageProperty {
        get => this.get_PreferSmallImageProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ProfilePictureProperty {
        get => this.get_ProfilePictureProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BadgeNumberProperty() {
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
    get_BadgeGlyphProperty() {
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
    get_BadgeImageSourceProperty() {
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
    get_BadgeTextProperty() {
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
    get_IsGroupProperty() {
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
    get_ContactProperty() {
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
    get_DisplayNameProperty() {
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
    get_InitialsProperty() {
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
    get_PreferSmallImageProperty() {
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
    get_ProfilePictureProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
