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
     * 
     * @param {BSTR} pAddressToTranslate 
     * @param {Integer} lCard 
     * @param {Integer} lTranslateOptions 
     * @returns {ITAddressTranslationInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresstranslation-translateaddress
     */
    TranslateAddress(pAddressToTranslate, lCard, lTranslateOptions) {
        pAddressToTranslate := pAddressToTranslate is String ? BSTR.Alloc(pAddressToTranslate).Value : pAddressToTranslate

        result := ComCall(7, this, "ptr", pAddressToTranslate, "int", lCard, "int", lTranslateOptions, "ptr*", &ppTranslated := 0, "HRESULT")
        return ITAddressTranslationInfo(ppTranslated)
    }

    /**
     * 
     * @param {Pointer} hwndOwner 
     * @param {BSTR} pAddressIn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresstranslation-translatedialog
     */
    TranslateDialog(hwndOwner, pAddressIn) {
        pAddressIn := pAddressIn is String ? BSTR.Alloc(pAddressIn).Value : pAddressIn

        result := ComCall(8, this, "ptr", hwndOwner, "ptr", pAddressIn, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumLocation} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresstranslation-enumeratelocations
     */
    EnumerateLocations() {
        result := ComCall(9, this, "ptr*", &ppEnumLocation := 0, "HRESULT")
        return IEnumLocation(ppEnumLocation)
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresstranslation-get_locations
     */
    get_Locations() {
        pVariant := VARIANT()
        result := ComCall(10, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * 
     * @returns {IEnumCallingCard} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresstranslation-enumeratecallingcards
     */
    EnumerateCallingCards() {
        result := ComCall(11, this, "ptr*", &ppEnumCallingCard := 0, "HRESULT")
        return IEnumCallingCard(ppEnumCallingCard)
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddresstranslation-get_callingcards
     */
    get_CallingCards() {
        pVariant := VARIANT()
        result := ComCall(12, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }
}
