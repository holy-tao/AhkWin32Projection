#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PrintTask.ahk
#Include .\PrintTaskRequestedDeferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IPrintTaskRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTaskRequest
     * @type {Guid}
     */
    static IID => Guid("{6ff61e2e-2722-4240-a67c-f364849a17f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Deadline", "CreatePrintTask", "GetDeferral"]

    /**
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        value := DateTime()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} title 
     * @param {PrintTaskSourceRequestedHandler} handler 
     * @returns {PrintTask} 
     */
    CreatePrintTask(title, handler) {
        if(title is String) {
            pin := HSTRING.Create(title)
            title := pin.Value
        }
        title := title is Win32Handle ? NumGet(title, "ptr") : title

        result := ComCall(7, this, "ptr", title, "ptr", handler, "ptr*", &task := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTask(task)
    }

    /**
     * 
     * @returns {PrintTaskRequestedDeferral} 
     */
    GetDeferral() {
        result := ComCall(8, this, "ptr*", &deferral_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTaskRequestedDeferral(deferral_)
    }
}
