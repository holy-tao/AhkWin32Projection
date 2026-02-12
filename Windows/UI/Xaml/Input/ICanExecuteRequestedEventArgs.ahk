#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class ICanExecuteRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICanExecuteRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{c8e75256-1950-505d-993b-75907ef96830}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Parameter", "get_CanExecute", "put_CanExecute"]

    /**
     * @type {IInspectable} 
     */
    Parameter {
        get => this.get_Parameter()
    }

    /**
     * @type {Boolean} 
     */
    CanExecute {
        get => this.get_CanExecute()
        set => this.put_CanExecute(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Parameter() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanExecute() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanExecute(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
