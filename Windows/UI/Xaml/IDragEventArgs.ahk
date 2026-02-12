#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\ApplicationModel\DataTransfer\DataPackage.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IDragEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDragEventArgs
     * @type {Guid}
     */
    static IID => Guid("{b440c7c3-02b4-4980-9342-25dae1c0f188}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Handled", "put_Handled", "get_Data", "put_Data", "GetPosition"]

    /**
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * @type {DataPackage} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataPackage} 
     */
    get_Data() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataPackage(value)
    }

    /**
     * 
     * @param {DataPackage} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers an event handler that is invoked when the asynchronous operation started by GetPositionInformationAsync completes, and provides a method that returns the results of the operation.
     * @param {UIElement} relativeTo 
     * @returns {POINT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/mediastreaming/getpositioninformationoperation
     */
    GetPosition(relativeTo) {
        result_ := POINT()
        result := ComCall(10, this, "ptr", relativeTo, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
