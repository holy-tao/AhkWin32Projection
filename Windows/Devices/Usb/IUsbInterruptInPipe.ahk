#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UsbInterruptInEndpointDescriptor.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbInterruptInPipe extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbInterruptInPipe
     * @type {Guid}
     */
    static IID => Guid("{fa007116-84d7-48c7-8a3f-4c0b235f2ea6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EndpointDescriptor", "ClearStallAsync", "add_DataReceived", "remove_DataReceived"]

    /**
     * @type {UsbInterruptInEndpointDescriptor} 
     */
    EndpointDescriptor {
        get => this.get_EndpointDescriptor()
    }

    /**
     * 
     * @returns {UsbInterruptInEndpointDescriptor} 
     */
    get_EndpointDescriptor() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbInterruptInEndpointDescriptor(value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ClearStallAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {TypedEventHandler<UsbInterruptInPipe, UsbInterruptInEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DataReceived(handler) {
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
    remove_DataReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
