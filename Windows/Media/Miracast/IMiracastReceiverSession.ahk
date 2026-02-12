#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\MiracastReceiverSessionStartResult.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class IMiracastReceiverSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMiracastReceiverSession
     * @type {Guid}
     */
    static IID => Guid("{1d2bcdb4-ef8b-5209-bfc9-c32116504803}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_ConnectionCreated", "remove_ConnectionCreated", "add_MediaSourceCreated", "remove_MediaSourceCreated", "add_Disconnected", "remove_Disconnected", "get_AllowConnectionTakeover", "put_AllowConnectionTakeover", "get_MaxSimultaneousConnections", "put_MaxSimultaneousConnections", "Start", "StartAsync"]

    /**
     * @type {Boolean} 
     */
    AllowConnectionTakeover {
        get => this.get_AllowConnectionTakeover()
        set => this.put_AllowConnectionTakeover(value)
    }

    /**
     * @type {Integer} 
     */
    MaxSimultaneousConnections {
        get => this.get_MaxSimultaneousConnections()
        set => this.put_MaxSimultaneousConnections(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MiracastReceiverSession, MiracastReceiverConnectionCreatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ConnectionCreated(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_ConnectionCreated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MiracastReceiverSession, MiracastReceiverMediaSourceCreatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MediaSourceCreated(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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
    remove_MediaSourceCreated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MiracastReceiverSession, MiracastReceiverDisconnectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Disconnected(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
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
    remove_Disconnected(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowConnectionTakeover() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_AllowConnectionTakeover(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxSimultaneousConnections() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxSimultaneousConnections(value) {
        result := ComCall(15, this, "int", value, "int")
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
     * @returns {MiracastReceiverSessionStartResult} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element
     */
    Start() {
        result := ComCall(16, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MiracastReceiverSessionStartResult(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<MiracastReceiverSessionStartResult>} 
     */
    StartAsync() {
        result := ComCall(17, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MiracastReceiverSessionStartResult, operation)
    }
}
