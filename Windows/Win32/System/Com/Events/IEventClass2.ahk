#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IEventClass.ahk

/**
 * Used to set and obtain data on event class objects. This interface extends the IEventClass interface.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ieventclass2
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IEventClass2 extends IEventClass{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEventClass2
     * @type {Guid}
     */
    static IID => Guid("{fb2b72a1-7a68-11d1-88f9-0080c7d771bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PublisherID", "put_PublisherID", "get_MultiInterfacePublisherFilterCLSID", "put_MultiInterfacePublisherFilterCLSID", "get_AllowInprocActivation", "put_AllowInprocActivation", "get_FireInParallel", "put_FireInParallel"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPublisherID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass2-get_publisherid
     */
    get_PublisherID(pbstrPublisherID) {
        result := ComCall(21, this, "ptr", pbstrPublisherID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPublisherID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass2-put_publisherid
     */
    put_PublisherID(bstrPublisherID) {
        bstrPublisherID := bstrPublisherID is String ? BSTR.Alloc(bstrPublisherID).Value : bstrPublisherID

        result := ComCall(22, this, "ptr", bstrPublisherID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPubFilCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass2-get_multiinterfacepublisherfilterclsid
     */
    get_MultiInterfacePublisherFilterCLSID(pbstrPubFilCLSID) {
        result := ComCall(23, this, "ptr", pbstrPubFilCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPubFilCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass2-put_multiinterfacepublisherfilterclsid
     */
    put_MultiInterfacePublisherFilterCLSID(bstrPubFilCLSID) {
        bstrPubFilCLSID := bstrPubFilCLSID is String ? BSTR.Alloc(bstrPubFilCLSID).Value : bstrPubFilCLSID

        result := ComCall(24, this, "ptr", bstrPubFilCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfAllowInprocActivation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass2-get_allowinprocactivation
     */
    get_AllowInprocActivation(pfAllowInprocActivation) {
        result := ComCall(25, this, "ptr", pfAllowInprocActivation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fAllowInprocActivation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass2-put_allowinprocactivation
     */
    put_AllowInprocActivation(fAllowInprocActivation) {
        result := ComCall(26, this, "int", fAllowInprocActivation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfFireInParallel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass2-get_fireinparallel
     */
    get_FireInParallel(pfFireInParallel) {
        result := ComCall(27, this, "ptr", pfFireInParallel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fFireInParallel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass2-put_fireinparallel
     */
    put_FireInParallel(fFireInParallel) {
        result := ComCall(28, this, "int", fFireInParallel, "HRESULT")
        return result
    }
}
