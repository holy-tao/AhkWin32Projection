#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IDispatch.ahk

/**
 * Associates a class of event objects with the event interface those objects implement.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ieventclass
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IEventClass extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEventClass
     * @type {Guid}
     */
    static IID => Guid("{fb2b72a0-7a68-11d1-88f9-0080c7d771bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EventClassID", "put_EventClassID", "get_EventClassName", "put_EventClassName", "get_OwnerSID", "put_OwnerSID", "get_FiringInterfaceID", "put_FiringInterfaceID", "get_Description", "put_Description", "get_CustomConfigCLSID", "put_CustomConfigCLSID", "get_TypeLib", "put_TypeLib"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrEventClassID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-get_eventclassid
     */
    get_EventClassID(pbstrEventClassID) {
        result := ComCall(7, this, "ptr", pbstrEventClassID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrEventClassID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-put_eventclassid
     */
    put_EventClassID(bstrEventClassID) {
        bstrEventClassID := bstrEventClassID is String ? BSTR.Alloc(bstrEventClassID).Value : bstrEventClassID

        result := ComCall(8, this, "ptr", bstrEventClassID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrEventClassName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-get_eventclassname
     */
    get_EventClassName(pbstrEventClassName) {
        result := ComCall(9, this, "ptr", pbstrEventClassName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrEventClassName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-put_eventclassname
     */
    put_EventClassName(bstrEventClassName) {
        bstrEventClassName := bstrEventClassName is String ? BSTR.Alloc(bstrEventClassName).Value : bstrEventClassName

        result := ComCall(10, this, "ptr", bstrEventClassName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrOwnerSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-get_ownersid
     */
    get_OwnerSID(pbstrOwnerSID) {
        result := ComCall(11, this, "ptr", pbstrOwnerSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrOwnerSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-put_ownersid
     */
    put_OwnerSID(bstrOwnerSID) {
        bstrOwnerSID := bstrOwnerSID is String ? BSTR.Alloc(bstrOwnerSID).Value : bstrOwnerSID

        result := ComCall(12, this, "ptr", bstrOwnerSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFiringInterfaceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-get_firinginterfaceid
     */
    get_FiringInterfaceID(pbstrFiringInterfaceID) {
        result := ComCall(13, this, "ptr", pbstrFiringInterfaceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFiringInterfaceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-put_firinginterfaceid
     */
    put_FiringInterfaceID(bstrFiringInterfaceID) {
        bstrFiringInterfaceID := bstrFiringInterfaceID is String ? BSTR.Alloc(bstrFiringInterfaceID).Value : bstrFiringInterfaceID

        result := ComCall(14, this, "ptr", bstrFiringInterfaceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-get_description
     */
    get_Description(pbstrDescription) {
        result := ComCall(15, this, "ptr", pbstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(16, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCustomConfigCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-get_customconfigclsid
     */
    get_CustomConfigCLSID(pbstrCustomConfigCLSID) {
        result := ComCall(17, this, "ptr", pbstrCustomConfigCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrCustomConfigCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-put_customconfigclsid
     */
    put_CustomConfigCLSID(bstrCustomConfigCLSID) {
        bstrCustomConfigCLSID := bstrCustomConfigCLSID is String ? BSTR.Alloc(bstrCustomConfigCLSID).Value : bstrCustomConfigCLSID

        result := ComCall(18, this, "ptr", bstrCustomConfigCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTypeLib 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-get_typelib
     */
    get_TypeLib(pbstrTypeLib) {
        result := ComCall(19, this, "ptr", pbstrTypeLib, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTypeLib 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-put_typelib
     */
    put_TypeLib(bstrTypeLib) {
        bstrTypeLib := bstrTypeLib is String ? BSTR.Alloc(bstrTypeLib).Value : bstrTypeLib

        result := ComCall(20, this, "ptr", bstrTypeLib, "HRESULT")
        return result
    }
}
