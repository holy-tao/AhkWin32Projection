#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<VARIANT>} pPhones 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi2-get_phones
     */
    get_Phones(pPhones) {
        result := ComCall(23, this, "ptr", pPhones, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumPhone>} ppEnumPhone 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi2-enumeratephones
     */
    EnumeratePhones(ppEnumPhone) {
        result := ComCall(24, this, "ptr*", ppEnumPhone, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITCollection2>} ppCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapi2-createemptycollectionobject
     */
    CreateEmptyCollectionObject(ppCollection) {
        result := ComCall(25, this, "ptr*", ppCollection, "HRESULT")
        return result
    }
}
