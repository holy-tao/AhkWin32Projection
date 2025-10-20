#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWscProduct.ahk

/**
 * @namespace Windows.Win32.System.SecurityCenter
 * @version v4.0.30319
 */
class IWscProduct2 extends IWscProduct{
    /**
     * The interface identifier for IWscProduct2
     * @type {Guid}
     */
    static IID => Guid("{f896ca54-fe09-4403-86d4-23cb488d81d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Pointer<Int32>} peStatus 
     * @returns {HRESULT} 
     */
    get_AntivirusScanSubstatus(peStatus) {
        result := ComCall(14, this, "int*", peStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peStatus 
     * @returns {HRESULT} 
     */
    get_AntivirusSettingsSubstatus(peStatus) {
        result := ComCall(15, this, "int*", peStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peStatus 
     * @returns {HRESULT} 
     */
    get_AntivirusProtectionUpdateSubstatus(peStatus) {
        result := ComCall(16, this, "int*", peStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peStatus 
     * @returns {HRESULT} 
     */
    get_FirewallDomainProfileSubstatus(peStatus) {
        result := ComCall(17, this, "int*", peStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peStatus 
     * @returns {HRESULT} 
     */
    get_FirewallPrivateProfileSubstatus(peStatus) {
        result := ComCall(18, this, "int*", peStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peStatus 
     * @returns {HRESULT} 
     */
    get_FirewallPublicProfileSubstatus(peStatus) {
        result := ComCall(19, this, "int*", peStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
