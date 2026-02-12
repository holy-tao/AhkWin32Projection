#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\ApplicationModel\DataTransfer\DataPackage.ahk
#Include .\DragUI.ahk
#Include .\DragOperationDeferral.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IDragStartingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDragStartingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{6800d3fa-90b8-46f9-8e30-5ac25f73f0f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Cancel", "put_Cancel", "get_Data", "get_DragUI", "GetDeferral", "GetPosition"]

    /**
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
    }

    /**
     * @type {DataPackage} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * @type {DragUI} 
     */
    DragUI {
        get => this.get_DragUI()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Cancel() {
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
    put_Cancel(value) {
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
     * @returns {DragUI} 
     */
    get_DragUI() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DragUI(value)
    }

    /**
     * 
     * @returns {DragOperationDeferral} 
     */
    GetDeferral() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DragOperationDeferral(result_)
    }

    /**
     * Registers an event handler that is invoked when the asynchronous operation started by GetPositionInformationAsync completes, and provides a method that returns the results of the operation.
     * @param {UIElement} relativeTo 
     * @returns {POINT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/mediastreaming/getpositioninformationoperation
     */
    GetPosition(relativeTo) {
        result_ := POINT()
        result := ComCall(11, this, "ptr", relativeTo, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
