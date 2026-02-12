#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\ApplicationModel\DataTransfer\DataPackagePropertySet.ahk
#Include .\IPrintDocumentSource.ahk
#Include .\PrintTaskOptions.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the core functionality for a **PrintTaskOptions** object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscore
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IPrintTask extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTask
     * @type {Guid}
     */
    static IID => Guid("{61d80247-6cf6-4fad-84e2-a5e82e2d4ceb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Properties", "get_Source", "get_Options", "add_Previewing", "remove_Previewing", "add_Submitting", "remove_Submitting", "add_Progressing", "remove_Progressing", "add_Completed", "remove_Completed"]

    /**
     * @type {DataPackagePropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {IPrintDocumentSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * @type {PrintTaskOptions} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * 
     * @returns {DataPackagePropertySet} 
     */
    get_Properties() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataPackagePropertySet(value)
    }

    /**
     * 
     * @returns {IPrintDocumentSource} 
     */
    get_Source() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPrintDocumentSource(value)
    }

    /**
     * 
     * @returns {PrintTaskOptions} 
     */
    get_Options() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTaskOptions(value)
    }

    /**
     * 
     * @param {TypedEventHandler<PrintTask, IInspectable>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Previewing(eventHandler) {
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
    remove_Previewing(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(10, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PrintTask, IInspectable>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Submitting(eventHandler) {
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
    remove_Submitting(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(12, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PrintTask, PrintTaskProgressingEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Progressing(eventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(13, this, "ptr", eventHandler, "ptr", eventCookie, "int")
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
    remove_Progressing(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(14, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PrintTask, PrintTaskCompletedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Completed(eventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(15, this, "ptr", eventHandler, "ptr", eventCookie, "int")
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

        result := ComCall(16, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
