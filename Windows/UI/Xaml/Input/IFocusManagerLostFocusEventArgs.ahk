#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyObject.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IFocusManagerLostFocusEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFocusManagerLostFocusEventArgs
     * @type {Guid}
     */
    static IID => Guid("{3e157e7a-9578-5cd3-aaa8-051b3d391978}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OldFocusedElement", "get_CorrelationId"]

    /**
     * @type {DependencyObject} 
     */
    OldFocusedElement {
        get => this.get_OldFocusedElement()
    }

    /**
     * @type {Guid} 
     */
    CorrelationId {
        get => this.get_CorrelationId()
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_OldFocusedElement() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CorrelationId() {
        value := Guid()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
