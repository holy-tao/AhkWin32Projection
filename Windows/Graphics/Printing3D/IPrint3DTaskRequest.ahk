#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Print3DTask.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrint3DTaskRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrint3DTaskRequest
     * @type {Guid}
     */
    static IID => Guid("{2595c46f-2245-4c5a-8731-0d604dc6bc3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTask"]

    /**
     * 
     * @param {HSTRING} title 
     * @param {HSTRING} printerId 
     * @param {Print3DTaskSourceRequestedHandler} handler 
     * @returns {Print3DTask} 
     */
    CreateTask(title, printerId, handler) {
        if(title is String) {
            pin := HSTRING.Create(title)
            title := pin.Value
        }
        title := title is Win32Handle ? NumGet(title, "ptr") : title
        if(printerId is String) {
            pin := HSTRING.Create(printerId)
            printerId := pin.Value
        }
        printerId := printerId is Win32Handle ? NumGet(printerId, "ptr") : printerId

        result := ComCall(6, this, "ptr", title, "ptr", printerId, "ptr", handler, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Print3DTask(result_)
    }
}
