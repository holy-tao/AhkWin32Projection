#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Printing3D3MFPackage.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrint3DTask extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrint3DTask
     * @type {Guid}
     */
    static IID => Guid("{8ce3d080-2118-4c28-80de-f426d70191ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Source", "add_Submitting", "remove_Submitting", "add_Completed", "remove_Completed", "add_SourceChanged", "remove_SourceChanged"]

    /**
     * @type {Printing3D3MFPackage} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * 
     * @returns {Printing3D3MFPackage} 
     */
    get_Source() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Printing3D3MFPackage(value)
    }

    /**
     * 
     * @param {TypedEventHandler<Print3DTask, IInspectable>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Submitting(eventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(7, this, "ptr", eventHandler, "ptr", eventCookie, "int")
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
    remove_Submitting(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(8, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<Print3DTask, Print3DTaskCompletedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Completed(eventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(9, this, "ptr", eventHandler, "ptr", eventCookie, "int")
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
    remove_Completed(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(10, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<Print3DTask, Print3DTaskSourceChangedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceChanged(eventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(11, this, "ptr", eventHandler, "ptr", eventCookie, "int")
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
    remove_SourceChanged(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(12, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
