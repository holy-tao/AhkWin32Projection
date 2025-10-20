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
     * 
     * @param {Pointer<BSTR>} pbstrEventClassID 
     * @returns {HRESULT} 
     */
    get_EventClassID(pbstrEventClassID) {
        result := ComCall(7, this, "ptr", pbstrEventClassID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrEventClassID 
     * @returns {HRESULT} 
     */
    put_EventClassID(bstrEventClassID) {
        bstrEventClassID := bstrEventClassID is String ? BSTR.Alloc(bstrEventClassID).Value : bstrEventClassID

        result := ComCall(8, this, "ptr", bstrEventClassID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrEventClassName 
     * @returns {HRESULT} 
     */
    get_EventClassName(pbstrEventClassName) {
        result := ComCall(9, this, "ptr", pbstrEventClassName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrEventClassName 
     * @returns {HRESULT} 
     */
    put_EventClassName(bstrEventClassName) {
        bstrEventClassName := bstrEventClassName is String ? BSTR.Alloc(bstrEventClassName).Value : bstrEventClassName

        result := ComCall(10, this, "ptr", bstrEventClassName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrOwnerSID 
     * @returns {HRESULT} 
     */
    get_OwnerSID(pbstrOwnerSID) {
        result := ComCall(11, this, "ptr", pbstrOwnerSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrOwnerSID 
     * @returns {HRESULT} 
     */
    put_OwnerSID(bstrOwnerSID) {
        bstrOwnerSID := bstrOwnerSID is String ? BSTR.Alloc(bstrOwnerSID).Value : bstrOwnerSID

        result := ComCall(12, this, "ptr", bstrOwnerSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFiringInterfaceID 
     * @returns {HRESULT} 
     */
    get_FiringInterfaceID(pbstrFiringInterfaceID) {
        result := ComCall(13, this, "ptr", pbstrFiringInterfaceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrFiringInterfaceID 
     * @returns {HRESULT} 
     */
    put_FiringInterfaceID(bstrFiringInterfaceID) {
        bstrFiringInterfaceID := bstrFiringInterfaceID is String ? BSTR.Alloc(bstrFiringInterfaceID).Value : bstrFiringInterfaceID

        result := ComCall(14, this, "ptr", bstrFiringInterfaceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     */
    get_Description(pbstrDescription) {
        result := ComCall(15, this, "ptr", pbstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(16, this, "ptr", bstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCustomConfigCLSID 
     * @returns {HRESULT} 
     */
    get_CustomConfigCLSID(pbstrCustomConfigCLSID) {
        result := ComCall(17, this, "ptr", pbstrCustomConfigCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCustomConfigCLSID 
     * @returns {HRESULT} 
     */
    put_CustomConfigCLSID(bstrCustomConfigCLSID) {
        bstrCustomConfigCLSID := bstrCustomConfigCLSID is String ? BSTR.Alloc(bstrCustomConfigCLSID).Value : bstrCustomConfigCLSID

        result := ComCall(18, this, "ptr", bstrCustomConfigCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTypeLib 
     * @returns {HRESULT} 
     */
    get_TypeLib(pbstrTypeLib) {
        result := ComCall(19, this, "ptr", pbstrTypeLib, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrTypeLib 
     * @returns {HRESULT} 
     */
    put_TypeLib(bstrTypeLib) {
        bstrTypeLib := bstrTypeLib is String ? BSTR.Alloc(bstrTypeLib).Value : bstrTypeLib

        result := ComCall(20, this, "ptr", bstrTypeLib, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
