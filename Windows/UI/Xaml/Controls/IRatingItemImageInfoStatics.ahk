#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRatingItemImageInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRatingItemImageInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{8438486b-4b1c-4123-ba0b-73484d68c338}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisabledImageProperty", "get_ImageProperty", "get_PlaceholderImageProperty", "get_PointerOverImageProperty", "get_PointerOverPlaceholderImageProperty", "get_UnsetImageProperty"]

    /**
     * @type {DependencyProperty} 
     */
    DisabledImageProperty {
        get => this.get_DisabledImageProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ImageProperty {
        get => this.get_ImageProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PlaceholderImageProperty {
        get => this.get_PlaceholderImageProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PointerOverImageProperty {
        get => this.get_PointerOverImageProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PointerOverPlaceholderImageProperty {
        get => this.get_PointerOverPlaceholderImageProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    UnsetImageProperty {
        get => this.get_UnsetImageProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DisabledImageProperty() {
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
    get_ImageProperty() {
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
    get_PlaceholderImageProperty() {
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
    get_PointerOverImageProperty() {
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
    get_PointerOverPlaceholderImageProperty() {
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
    get_UnsetImageProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
