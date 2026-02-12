#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\StreamSocketListenerControl.ahk
#Include .\StreamSocketListenerInformation.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IStreamSocketListener extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamSocketListener
     * @type {Guid}
     */
    static IID => Guid("{ff513437-df9f-4df0-bf82-0ec5d7b35aae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Control", "get_Information", "BindServiceNameAsync", "BindEndpointAsync", "add_ConnectionReceived", "remove_ConnectionReceived"]

    /**
     * @type {StreamSocketListenerControl} 
     */
    Control {
        get => this.get_Control()
    }

    /**
     * @type {StreamSocketListenerInformation} 
     */
    Information {
        get => this.get_Information()
    }

    /**
     * 
     * @returns {StreamSocketListenerControl} 
     */
    get_Control() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StreamSocketListenerControl(value)
    }

    /**
     * 
     * @returns {StreamSocketListenerInformation} 
     */
    get_Information() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StreamSocketListenerInformation(value)
    }

    /**
     * 
     * @param {HSTRING} localServiceName 
     * @returns {IAsyncAction} 
     */
    BindServiceNameAsync(localServiceName) {
        if(localServiceName is String) {
            pin := HSTRING.Create(localServiceName)
            localServiceName := pin.Value
        }
        localServiceName := localServiceName is Win32Handle ? NumGet(localServiceName, "ptr") : localServiceName

        result := ComCall(8, this, "ptr", localServiceName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HostName} localHostName 
     * @param {HSTRING} localServiceName 
     * @returns {IAsyncAction} 
     */
    BindEndpointAsync(localHostName, localServiceName) {
        if(localServiceName is String) {
            pin := HSTRING.Create(localServiceName)
            localServiceName := pin.Value
        }
        localServiceName := localServiceName is Win32Handle ? NumGet(localServiceName, "ptr") : localServiceName

        result := ComCall(9, this, "ptr", localHostName, "ptr", localServiceName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {TypedEventHandler<StreamSocketListener, StreamSocketListenerConnectionReceivedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_ConnectionReceived(eventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(10, this, "ptr", eventHandler, "ptr", eventCookie, "int")
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
    remove_ConnectionReceived(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(11, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
