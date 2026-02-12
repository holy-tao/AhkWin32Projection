#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyObject.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IFocusManagerGotFocusEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFocusManagerGotFocusEventArgs
     * @type {Guid}
     */
    static IID => Guid("{97aa5d83-535b-507a-868e-62b706f06b61}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NewFocusedElement", "get_CorrelationId"]

    /**
     * @type {DependencyObject} 
     */
    NewFocusedElement {
        get => this.get_NewFocusedElement()
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
    get_NewFocusedElement() {
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
