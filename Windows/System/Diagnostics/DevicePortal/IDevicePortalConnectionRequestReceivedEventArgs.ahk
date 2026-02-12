#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Web\Http\HttpRequestMessage.ahk
#Include ..\..\..\Web\Http\HttpResponseMessage.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics.DevicePortal
 * @version WindowsRuntime 1.4
 */
class IDevicePortalConnectionRequestReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDevicePortalConnectionRequestReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{64dae045-6fda-4459-9ebd-ecce22e38559}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RequestMessage", "get_ResponseMessage"]

    /**
     * @type {HttpRequestMessage} 
     */
    RequestMessage {
        get => this.get_RequestMessage()
    }

    /**
     * @type {HttpResponseMessage} 
     */
    ResponseMessage {
        get => this.get_ResponseMessage()
    }

    /**
     * 
     * @returns {HttpRequestMessage} 
     */
    get_RequestMessage() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpRequestMessage(value)
    }

    /**
     * 
     * @returns {HttpResponseMessage} 
     */
    get_ResponseMessage() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpResponseMessage(value)
    }
}
