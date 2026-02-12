#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VisualState.ahk
#Include Controls\Control.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IVisualStateChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualStateChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{fe216ab1-f31f-4791-8989-c70e1d9b59ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OldState", "put_OldState", "get_NewState", "put_NewState", "get_Control", "put_Control"]

    /**
     * @type {VisualState} 
     */
    OldState {
        get => this.get_OldState()
        set => this.put_OldState(value)
    }

    /**
     * @type {VisualState} 
     */
    NewState {
        get => this.get_NewState()
        set => this.put_NewState(value)
    }

    /**
     * @type {Control} 
     */
    Control {
        get => this.get_Control()
        set => this.put_Control(value)
    }

    /**
     * 
     * @returns {VisualState} 
     */
    get_OldState() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VisualState(value)
    }

    /**
     * 
     * @param {VisualState} value 
     * @returns {HRESULT} 
     */
    put_OldState(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VisualState} 
     */
    get_NewState() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VisualState(value)
    }

    /**
     * 
     * @param {VisualState} value 
     * @returns {HRESULT} 
     */
    put_NewState(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Control} 
     */
    get_Control() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Control(value)
    }

    /**
     * 
     * @param {Control} value 
     * @returns {HRESULT} 
     */
    put_Control(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
