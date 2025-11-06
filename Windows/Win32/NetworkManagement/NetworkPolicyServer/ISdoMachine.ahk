#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the ISdoMachine interface to attach to an SDO computer, obtain information about the SDO computer, and obtain interfaces to other SDO objects.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/nn-sdoias-isdomachine
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ISdoMachine extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISdoMachine
     * @type {Guid}
     */
    static IID => Guid("{479f6e75-49a2-11d2-8eca-00c04fc2f519}")

    /**
     * The class identifier for SdoMachine
     * @type {Guid}
     */
    static CLSID => Guid("{e9218ae7-9e91-11d1-bf60-0080c7846bc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Attach", "GetDictionarySDO", "GetServiceSDO", "GetUserSDO", "GetOSType", "GetDomainType", "IsDirectoryAvailable", "GetAttachedComputer", "GetSDOSchema"]

    /**
     * 
     * @param {BSTR} bstrComputerName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdomachine-attach
     */
    Attach(bstrComputerName) {
        bstrComputerName := bstrComputerName is String ? BSTR.Alloc(bstrComputerName).Value : bstrComputerName

        result := ComCall(7, this, "ptr", bstrComputerName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdomachine-getdictionarysdo
     */
    GetDictionarySDO() {
        result := ComCall(8, this, "ptr*", &ppDictionarySDO := 0, "HRESULT")
        return IUnknown(ppDictionarySDO)
    }

    /**
     * 
     * @param {Integer} eDataStore 
     * @param {BSTR} bstrServiceName 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdomachine-getservicesdo
     */
    GetServiceSDO(eDataStore, bstrServiceName) {
        bstrServiceName := bstrServiceName is String ? BSTR.Alloc(bstrServiceName).Value : bstrServiceName

        result := ComCall(9, this, "int", eDataStore, "ptr", bstrServiceName, "ptr*", &ppServiceSDO := 0, "HRESULT")
        return IUnknown(ppServiceSDO)
    }

    /**
     * 
     * @param {Integer} eDataStore 
     * @param {BSTR} bstrUserName 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdomachine-getusersdo
     */
    GetUserSDO(eDataStore, bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(10, this, "int", eDataStore, "ptr", bstrUserName, "ptr*", &ppUserSDO := 0, "HRESULT")
        return IUnknown(ppUserSDO)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdomachine-getostype
     */
    GetOSType() {
        result := ComCall(11, this, "int*", &eOSType := 0, "HRESULT")
        return eOSType
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdomachine-getdomaintype
     */
    GetDomainType() {
        result := ComCall(12, this, "int*", &eDomainType := 0, "HRESULT")
        return eDomainType
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdomachine-isdirectoryavailable
     */
    IsDirectoryAvailable() {
        result := ComCall(13, this, "short*", &boolDirectoryAvailable := 0, "HRESULT")
        return boolDirectoryAvailable
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdomachine-getattachedcomputer
     */
    GetAttachedComputer() {
        bstrComputerName := BSTR()
        result := ComCall(14, this, "ptr", bstrComputerName, "HRESULT")
        return bstrComputerName
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetSDOSchema() {
        result := ComCall(15, this, "ptr*", &ppSDOSchema := 0, "HRESULT")
        return IUnknown(ppSDOSchema)
    }
}
