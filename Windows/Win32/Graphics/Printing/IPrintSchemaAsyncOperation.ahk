#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaAsyncOperation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSchemaAsyncOperation
     * @type {Guid}
     */
    static IID => Guid("{143c8dcb-d37f-47f7-88e8-6b1d21f2c5f7}")

    /**
     * The class identifier for PrintSchemaAsyncOperation
     * @type {Guid}
     */
    static CLSID => Guid("{43b2f83d-10f2-48ab-831b-55fdbdbd34a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Cancel"]

    /**
     * Specifies the date and time when the trigger is activated.
     * @remarks
     * The **&lt;StartBoundary&gt;** element is a required element for time and calendar triggers ([**&lt;TimeTrigger&gt;**](taskschedulerschema-timetrigger-triggergroup-element.md) and [**&lt;CalendarTrigger&gt;**](taskschedulerschema-calendartrigger-triggergroup-element.md)).
     * 
     * For scripting development, the end boundary is specified using the [**Trigger.StartBoundary**](trigger-startboundary.md) property that is inherited by the all trigger objects.
     * 
     * For C++ development, the end boundary is specified using the [**ITrigger::StartBoundary**](/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary) property that is inherited by the all trigger interfaces.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element
     */
    Start() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Use the Cancel-Session packet to terminate the upload session with the BITS server.
     * @remarks
     * This packet cancels an upload job if it is sent before the last fragment is sent. Cancel-Session has no effect on a file whose last fragment has already been sent. When the BITS server receives the last fragment, it writes the file to its final destination and, in the case of an upload-reply, posts the file to the server application. In the upload-reply case, the Cancel-Session packet cancels the reply portion of an upload-reply job.
     * 
     * The BITS server releases all resources and deletes all temporary files when it receives this packet.
     * 
     * The BITS client sends this packet when the user cancels the job.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Bits/cancel-session
     */
    Cancel() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
