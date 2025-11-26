#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITAddressTranslationInfo.ahk
#Include .\IEnumLocation.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumCallingCard.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITAddressTranslation interface provides methods that allow translation of a calling address into a different format. For example, an application may need to translate an address from canonical to dialable prior to making a call.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itaddresstranslation
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAddressTranslation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITAddressTranslation
     * @type {Guid}
     */
    static IID => Guid("{0c4d8f03-8ddb-11d1-a09e-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TranslateAddress", "TranslateDialog", "EnumerateLocations", "get_Locations", "EnumerateCallingCards", "get_CallingCards"]

    /**
     * @type {VARIANT} 
     */
    Locations {
        get => this.get_Locations()
    }

    /**
     * @type {VARIANT} 
     */
    CallingCards {
        get => this.get_CallingCards()
    }

    /**
     * The TranslateAddress method creates the address translation information interface.
     * @param {BSTR} pAddressToTranslate Pointer to <b>BSTR</b> containing address that requires translation.
     * @param {Integer} lCard Calling card used for translation.
     * @param {Integer} lTranslateOptions Indicator of translation options, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetranslateoption--constants">LINETRANSLATEOPTION__Constants</a>.
     * @returns {ITAddressTranslationInfo} Pointer to newly created 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddresstranslationinfo">ITAddressTranslationInfo</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresstranslation-translateaddress
     */
    TranslateAddress(pAddressToTranslate, lCard, lTranslateOptions) {
        pAddressToTranslate := pAddressToTranslate is String ? BSTR.Alloc(pAddressToTranslate).Value : pAddressToTranslate

        result := ComCall(7, this, "ptr", pAddressToTranslate, "int", lCard, "int", lTranslateOptions, "ptr*", &ppTranslated := 0, "HRESULT")
        return ITAddressTranslationInfo(ppTranslated)
    }

    /**
     * The TranslateDialog method displays an application-modal dialog box that allows the user to change the current location of a phone number about to be dialed, adjust location and calling card parameters, and see the effect.
     * @param {Pointer} hwndOwner A handle to a window to which the dialog box is to be attached. Can be a <b>NULL</b> value to indicate that any window created during the function should have no owner window.
     * @param {BSTR} pAddressIn A pointer to <b>BSTR</b> containing a phone number that is used to show the effect of the user's changes on the location parameters. The number must be in canonical format. This pointer can be left <b>NULL</b>, in which case the phone number portion of the dialog box is not displayed. If the <i>pAddressIn</i> parameter contains a subaddress or name field or additional addresses separated from the first address by ASCII CR and LF characters, only the first address is used in the dialog box.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hwndOwner</i> parameter is not a valid handle or the <i>pAddressIn</i> parameter is not a valid phone number.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pAddressIn</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_REGISTRY_SETTING_CORRUPT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The registry settings for address translation are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_NODRIVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No TSP exists that can do translation for this address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INUSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The dialog is already open and in use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current address is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_OPERATIONFAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TAPI was not able to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresstranslation-translatedialog
     */
    TranslateDialog(hwndOwner, pAddressIn) {
        pAddressIn := pAddressIn is String ? BSTR.Alloc(pAddressIn).Value : pAddressIn

        result := ComCall(8, this, "ptr", hwndOwner, "ptr", pAddressIn, "HRESULT")
        return result
    }

    /**
     * The EnumerateLocations method enumerates the currently available address locations. This method is provided for C and C++ applications. Automation client applications, such as those written in Visual Basic, must use the get_Locations method.
     * @returns {IEnumLocation} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumlocation">IEnumLocation</a> object created.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresstranslation-enumeratelocations
     */
    EnumerateLocations() {
        result := ComCall(9, this, "ptr*", &ppEnumLocation := 0, "HRESULT")
        return IEnumLocation(ppEnumLocation)
    }

    /**
     * The get_Locations method creates a collection of currently available address locations. This method is provided for Automation client applications, such as those written in Visual Basic. C and C++ applications must use the EnumerateLocations method.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itlocationinfo">ITLocationInfo</a> interface pointers (location objects).
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresstranslation-get_locations
     */
    get_Locations() {
        pVariant := VARIANT()
        result := ComCall(10, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateCallingCards method enumerates calling cards associated with the address. This method is provided for C and C++ applications. Automation client applications, such as those written in Visual Basic, must use the get_CallingCards method.
     * @returns {IEnumCallingCard} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumcallingcard">IEnumCallingCard</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresstranslation-enumeratecallingcards
     */
    EnumerateCallingCards() {
        result := ComCall(11, this, "ptr*", &ppEnumCallingCard := 0, "HRESULT")
        return IEnumCallingCard(ppEnumCallingCard)
    }

    /**
     * The get_CallingCards method creates a collection of calling cards associated with the address.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallingcard">ITCallingCard</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itaddresstranslation-get_callingcards
     */
    get_CallingCards() {
        pVariant := VARIANT()
        result := ComCall(12, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }
}
