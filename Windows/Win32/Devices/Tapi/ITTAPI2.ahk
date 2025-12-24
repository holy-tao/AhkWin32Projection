#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumPhone.ahk
#Include .\ITCollection2.ahk
#Include .\ITTAPI.ahk

/**
 * The ITTAPI2 interface derives from the ITTAPI interface. It adds additional methods on the TAPI object to support phone devices.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ittapi2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITTAPI2 extends ITTAPI{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITTAPI2
     * @type {Guid}
     */
    static IID => Guid("{54fbdc8c-d90f-4dad-9695-b373097f094b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Phones", "EnumeratePhones", "CreateEmptyCollectionObject"]

    /**
     * @type {VARIANT} 
     */
    Phones {
        get => this.get_Phones()
    }

    /**
     * The get_Phones method enumerates the phone objects corresponding to the phone devices. If there are no phones available that can be used with the address, this method produces an empty collection and returns S_OK.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphone">ITPhone</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi2-get_phones
     */
    get_Phones() {
        pPhones := VARIANT()
        result := ComCall(23, this, "ptr", pPhones, "HRESULT")
        return pPhones
    }

    /**
     * The EnumeratePhones method enumerates the phone objects corresponding to the phone devices. If there are no phones available that can be used with the address, this method produces an empty enumeration and returns S_OK.
     * @returns {IEnumPhone} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumphone">IEnumPhone</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi2-enumeratephones
     */
    EnumeratePhones() {
        result := ComCall(24, this, "ptr*", &ppEnumPhone := 0, "HRESULT")
        return IEnumPhone(ppEnumPhone)
    }

    /**
     * The CreateEmptyCollectionObject method creates an empty collection object. The collection can be filled with ITDetectTone or ITCustomTone objects for use with the DetectTonesByCollection method or the GenerateCustomTonesByCollection method, respectively.
     * @returns {ITCollection2} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection2">ITCollection2</a> interface on the new collection object.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapi2-createemptycollectionobject
     */
    CreateEmptyCollectionObject() {
        result := ComCall(25, this, "ptr*", &ppCollection := 0, "HRESULT")
        return ITCollection2(ppCollection)
    }
}
