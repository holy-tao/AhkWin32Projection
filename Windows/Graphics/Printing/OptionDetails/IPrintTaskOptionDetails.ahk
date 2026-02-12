#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\IPrintOptionDetails.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PrintCustomItemListOptionDetails.ahk
#Include .\PrintCustomTextOptionDetails.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class IPrintTaskOptionDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTaskOptionDetails
     * @type {Guid}
     */
    static IID => Guid("{f5720af1-a89e-42a6-81af-f8e010b38a68}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Options", "CreateItemListOption", "CreateTextOption", "add_OptionChanged", "remove_OptionChanged", "add_BeginValidation", "remove_BeginValidation"]

    /**
     * @type {IMapView<HSTRING, IPrintOptionDetails>} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IPrintOptionDetails>} 
     */
    get_Options() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), IPrintOptionDetails, value)
    }

    /**
     * 
     * @param {HSTRING} optionId 
     * @param {HSTRING} displayName 
     * @returns {PrintCustomItemListOptionDetails} 
     */
    CreateItemListOption(optionId, displayName) {
        if(optionId is String) {
            pin := HSTRING.Create(optionId)
            optionId := pin.Value
        }
        optionId := optionId is Win32Handle ? NumGet(optionId, "ptr") : optionId
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(7, this, "ptr", optionId, "ptr", displayName, "ptr*", &itemListOption := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintCustomItemListOptionDetails(itemListOption)
    }

    /**
     * 
     * @param {HSTRING} optionId 
     * @param {HSTRING} displayName 
     * @returns {PrintCustomTextOptionDetails} 
     */
    CreateTextOption(optionId, displayName) {
        if(optionId is String) {
            pin := HSTRING.Create(optionId)
            optionId := pin.Value
        }
        optionId := optionId is Win32Handle ? NumGet(optionId, "ptr") : optionId
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(8, this, "ptr", optionId, "ptr", displayName, "ptr*", &textOption := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintCustomTextOptionDetails(textOption)
    }

    /**
     * 
     * @param {TypedEventHandler<PrintTaskOptionDetails, PrintTaskOptionChangedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_OptionChanged(eventHandler) {
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
    remove_OptionChanged(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(10, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PrintTaskOptionDetails, IInspectable>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_BeginValidation(eventHandler) {
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
    remove_BeginValidation(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(12, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
