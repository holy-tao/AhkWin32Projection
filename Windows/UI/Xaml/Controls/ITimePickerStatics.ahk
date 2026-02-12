#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITimePickerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimePickerStatics
     * @type {Guid}
     */
    static IID => Guid("{fa71dfb1-233e-4f31-b8be-a6ea670c25cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HeaderProperty", "get_HeaderTemplateProperty", "get_ClockIdentifierProperty", "get_MinuteIncrementProperty", "get_TimeProperty"]

    /**
     * @type {DependencyProperty} 
     */
    HeaderProperty {
        get => this.get_HeaderProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HeaderTemplateProperty {
        get => this.get_HeaderTemplateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ClockIdentifierProperty {
        get => this.get_ClockIdentifierProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MinuteIncrementProperty {
        get => this.get_MinuteIncrementProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TimeProperty {
        get => this.get_TimeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HeaderProperty() {
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
    get_HeaderTemplateProperty() {
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
    get_ClockIdentifierProperty() {
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
    get_MinuteIncrementProperty() {
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
    get_TimeProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
