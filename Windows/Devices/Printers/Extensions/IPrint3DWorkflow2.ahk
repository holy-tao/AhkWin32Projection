#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers.Extensions
 * @version WindowsRuntime 1.4
 */
class IPrint3DWorkflow2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrint3DWorkflow2
     * @type {Guid}
     */
    static IID => Guid("{a2a6c54f-8ac1-4918-9741-e34f3004239e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_PrinterChanged", "remove_PrinterChanged"]

    /**
     * 
     * @param {TypedEventHandler<Print3DWorkflow, Print3DWorkflowPrinterChangedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_PrinterChanged(eventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(6, this, "ptr", eventHandler, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_PrinterChanged(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(7, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
