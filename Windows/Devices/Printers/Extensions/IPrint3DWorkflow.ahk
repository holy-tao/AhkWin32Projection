#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers.Extensions
 * @version WindowsRuntime 1.4
 */
class IPrint3DWorkflow extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrint3DWorkflow
     * @type {Guid}
     */
    static IID => Guid("{c56f74bd-3669-4a66-ab42-c8151930cd34}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceID", "GetPrintModelPackage", "get_IsPrintReady", "put_IsPrintReady", "add_PrintRequested", "remove_PrintRequested"]

    /**
     * @type {HSTRING} 
     */
    DeviceID {
        get => this.get_DeviceID()
    }

    /**
     * @type {Boolean} 
     */
    IsPrintReady {
        get => this.get_IsPrintReady()
        set => this.put_IsPrintReady(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceID() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    GetPrintModelPackage() {
        result := ComCall(7, this, "ptr*", &printModelPackage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(printModelPackage)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPrintReady() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_IsPrintReady(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<Print3DWorkflow, Print3DWorkflowPrintRequestedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_PrintRequested(eventHandler) {
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
    remove_PrintRequested(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(11, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
