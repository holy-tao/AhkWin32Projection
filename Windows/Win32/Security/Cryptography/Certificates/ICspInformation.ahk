#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides access to general information about a cryptographic provider.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icspinformation
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICspInformation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICspInformation
     * @type {Guid}
     */
    static IID => Guid("{728ab307-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromName", "InitializeFromType", "get_CspAlgorithms", "get_HasHardwareRandomNumberGenerator", "get_IsHardwareDevice", "get_IsRemovable", "get_IsSoftwareDevice", "get_Valid", "get_MaxKeyContainerNameLength", "get_Name", "get_Type", "get_Version", "get_KeySpec", "get_IsSmartCard", "GetDefaultSecurityDescriptor", "get_LegacyCsp", "GetCspStatusFromOperations"]

    /**
     * 
     * @param {BSTR} strName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-initializefromname
     */
    InitializeFromName(strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(7, this, "ptr", strName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {IObjectId} pAlgorithm 
     * @param {VARIANT_BOOL} MachineContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-initializefromtype
     */
    InitializeFromType(Type, pAlgorithm, MachineContext) {
        result := ComCall(8, this, "int", Type, "ptr", pAlgorithm, "short", MachineContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ICspAlgorithms>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-get_cspalgorithms
     */
    get_CspAlgorithms(ppValue) {
        result := ComCall(9, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-get_hashardwarerandomnumbergenerator
     */
    get_HasHardwareRandomNumberGenerator(pValue) {
        result := ComCall(10, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-get_ishardwaredevice
     */
    get_IsHardwareDevice(pValue) {
        result := ComCall(11, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-get_isremovable
     */
    get_IsRemovable(pValue) {
        result := ComCall(12, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-get_issoftwaredevice
     */
    get_IsSoftwareDevice(pValue) {
        result := ComCall(13, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-get_valid
     */
    get_Valid(pValue) {
        result := ComCall(14, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-get_maxkeycontainernamelength
     */
    get_MaxKeyContainerNameLength(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-get_name
     */
    get_Name(pValue) {
        result := ComCall(16, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-get_type
     */
    get_Type(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-get_version
     */
    get_Version(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-get_keyspec
     */
    get_KeySpec(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-get_issmartcard
     */
    get_IsSmartCard(pValue) {
        result := ComCall(20, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} MachineContext 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-getdefaultsecuritydescriptor
     */
    GetDefaultSecurityDescriptor(MachineContext, pValue) {
        result := ComCall(21, this, "short", MachineContext, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-get_legacycsp
     */
    get_LegacyCsp(pValue) {
        result := ComCall(22, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IObjectId} pAlgorithm 
     * @param {Integer} Operations 
     * @param {Pointer<ICspStatus>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformation-getcspstatusfromoperations
     */
    GetCspStatusFromOperations(pAlgorithm, Operations, ppValue) {
        result := ComCall(23, this, "ptr", pAlgorithm, "int", Operations, "ptr*", ppValue, "HRESULT")
        return result
    }
}
