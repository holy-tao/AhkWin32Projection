#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Devices\Printers\IppPrintDevice.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IPrintSupportExtensionSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSupportExtensionSession
     * @type {Guid}
     */
    static IID => Guid("{eea45f1a-f4c6-54b3-a0b8-a559839aa4c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Printer", "add_PrintTicketValidationRequested", "remove_PrintTicketValidationRequested", "add_PrintDeviceCapabilitiesChanged", "remove_PrintDeviceCapabilitiesChanged", "Start"]

    /**
     * @type {IppPrintDevice} 
     */
    Printer {
        get => this.get_Printer()
    }

    /**
     * 
     * @returns {IppPrintDevice} 
     */
    get_Printer() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppPrintDevice(value)
    }

    /**
     * 
     * @param {TypedEventHandler<PrintSupportExtensionSession, PrintSupportPrintTicketValidationRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PrintTicketValidationRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PrintTicketValidationRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PrintSupportExtensionSession, PrintSupportPrintDeviceCapabilitiesChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PrintDeviceCapabilitiesChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PrintDeviceCapabilitiesChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies the date and time when the trigger is activated.
     * @remarks
     * The **&lt;StartBoundary&gt;** element is a required element for time and calendar triggers ([**&lt;TimeTrigger&gt;**](taskschedulerschema-timetrigger-triggergroup-element.md) and [**&lt;CalendarTrigger&gt;**](taskschedulerschema-calendartrigger-triggergroup-element.md)).
     * 
     * For scripting development, the end boundary is specified using the [**Trigger.StartBoundary**](trigger-startboundary.md) property that is inherited by the all trigger objects.
     * 
     * For C++ development, the end boundary is specified using the [**ITrigger::StartBoundary**](/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary) property that is inherited by the all trigger interfaces.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element
     */
    Start() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
