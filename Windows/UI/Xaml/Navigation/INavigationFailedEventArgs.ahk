#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Interop\TypeName.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class INavigationFailedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationFailedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{11c1dff7-36c2-4102-b2ef-0217a97289b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Exception", "get_Handled", "put_Handled", "get_SourcePageType"]

    /**
     * @type {HRESULT} 
     */
    Exception {
        get => this.get_Exception()
    }

    /**
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * @type {TypeName} 
     */
    SourcePageType {
        get => this.get_SourcePageType()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_Exception() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
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
    put_Handled(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_SourcePageType() {
        value := TypeName()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
