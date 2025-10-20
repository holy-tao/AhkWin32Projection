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
     * 
     * @param {BSTR} strName 
     * @returns {HRESULT} 
     */
    InitializeFromName(strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(7, this, "ptr", strName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<IObjectId>} pAlgorithm 
     * @param {VARIANT_BOOL} MachineContext 
     * @returns {HRESULT} 
     */
    InitializeFromType(Type, pAlgorithm, MachineContext) {
        result := ComCall(8, this, "int", Type, "ptr", pAlgorithm, "short", MachineContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICspAlgorithms>} ppValue 
     * @returns {HRESULT} 
     */
    get_CspAlgorithms(ppValue) {
        result := ComCall(9, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_HasHardwareRandomNumberGenerator(pValue) {
        result := ComCall(10, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_IsHardwareDevice(pValue) {
        result := ComCall(11, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_IsRemovable(pValue) {
        result := ComCall(12, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_IsSoftwareDevice(pValue) {
        result := ComCall(13, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_Valid(pValue) {
        result := ComCall(14, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_MaxKeyContainerNameLength(pValue) {
        result := ComCall(15, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_Name(pValue) {
        result := ComCall(16, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_Type(pValue) {
        result := ComCall(17, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_Version(pValue) {
        result := ComCall(18, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_KeySpec(pValue) {
        result := ComCall(19, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_IsSmartCard(pValue) {
        result := ComCall(20, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} MachineContext 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    GetDefaultSecurityDescriptor(MachineContext, pValue) {
        result := ComCall(21, this, "short", MachineContext, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_LegacyCsp(pValue) {
        result := ComCall(22, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IObjectId>} pAlgorithm 
     * @param {Integer} Operations 
     * @param {Pointer<ICspStatus>} ppValue 
     * @returns {HRESULT} 
     */
    GetCspStatusFromOperations(pAlgorithm, Operations, ppValue) {
        result := ComCall(23, this, "ptr", pAlgorithm, "int", Operations, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
