#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITextBlockStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextBlockStatics2
     * @type {Guid}
     */
    static IID => Guid("{88100b1b-ff24-4b93-a0e6-f029c94871f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectionHighlightColorProperty", "get_MaxLinesProperty", "get_TextLineBoundsProperty", "get_OpticalMarginAlignmentProperty", "get_IsColorFontEnabledProperty", "get_TextReadingOrderProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SelectionHighlightColorProperty {
        get => this.get_SelectionHighlightColorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxLinesProperty {
        get => this.get_MaxLinesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TextLineBoundsProperty {
        get => this.get_TextLineBoundsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OpticalMarginAlignmentProperty {
        get => this.get_OpticalMarginAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsColorFontEnabledProperty {
        get => this.get_IsColorFontEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TextReadingOrderProperty {
        get => this.get_TextReadingOrderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectionHighlightColorProperty() {
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
    get_MaxLinesProperty() {
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
    get_TextLineBoundsProperty() {
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
    get_OpticalMarginAlignmentProperty() {
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
    get_IsColorFontEnabledProperty() {
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
    get_TextReadingOrderProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
