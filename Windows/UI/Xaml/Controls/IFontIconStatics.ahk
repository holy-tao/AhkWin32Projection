#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IFontIconStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFontIconStatics
     * @type {Guid}
     */
    static IID => Guid("{b3be7bf6-1467-4086-bbcb-4e21d97a7b4d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GlyphProperty", "get_FontSizeProperty", "get_FontFamilyProperty", "get_FontWeightProperty", "get_FontStyleProperty"]

    /**
     * @type {DependencyProperty} 
     */
    GlyphProperty {
        get => this.get_GlyphProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FontSizeProperty {
        get => this.get_FontSizeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FontFamilyProperty {
        get => this.get_FontFamilyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FontWeightProperty {
        get => this.get_FontWeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FontStyleProperty {
        get => this.get_FontStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_GlyphProperty() {
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
    get_FontSizeProperty() {
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
    get_FontFamilyProperty() {
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
    get_FontWeightProperty() {
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
    get_FontStyleProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
