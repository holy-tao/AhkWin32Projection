#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include .\Certificate.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class IChainBuildingParameters extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChainBuildingParameters
     * @type {Guid}
     */
    static IID => Guid("{422ba922-7c8d-47b7-b59b-b12703733ac3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EnhancedKeyUsages", "get_ValidationTimestamp", "put_ValidationTimestamp", "get_RevocationCheckEnabled", "put_RevocationCheckEnabled", "get_NetworkRetrievalEnabled", "put_NetworkRetrievalEnabled", "get_AuthorityInformationAccessEnabled", "put_AuthorityInformationAccessEnabled", "get_CurrentTimeValidationEnabled", "put_CurrentTimeValidationEnabled", "get_ExclusiveTrustRoots"]

    /**
     * @type {IVector<HSTRING>} 
     */
    EnhancedKeyUsages {
        get => this.get_EnhancedKeyUsages()
    }

    /**
     * @type {DateTime} 
     */
    ValidationTimestamp {
        get => this.get_ValidationTimestamp()
        set => this.put_ValidationTimestamp(value)
    }

    /**
     * @type {Boolean} 
     */
    RevocationCheckEnabled {
        get => this.get_RevocationCheckEnabled()
        set => this.put_RevocationCheckEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    NetworkRetrievalEnabled {
        get => this.get_NetworkRetrievalEnabled()
        set => this.put_NetworkRetrievalEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    AuthorityInformationAccessEnabled {
        get => this.get_AuthorityInformationAccessEnabled()
        set => this.put_AuthorityInformationAccessEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    CurrentTimeValidationEnabled {
        get => this.get_CurrentTimeValidationEnabled()
        set => this.put_CurrentTimeValidationEnabled(value)
    }

    /**
     * @type {IVector<Certificate>} 
     */
    ExclusiveTrustRoots {
        get => this.get_ExclusiveTrustRoots()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_EnhancedKeyUsages() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ValidationTimestamp() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_ValidationTimestamp(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RevocationCheckEnabled() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RevocationCheckEnabled(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_NetworkRetrievalEnabled() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_NetworkRetrievalEnabled(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AuthorityInformationAccessEnabled() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AuthorityInformationAccessEnabled(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CurrentTimeValidationEnabled() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CurrentTimeValidationEnabled(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<Certificate>} 
     */
    get_ExclusiveTrustRoots() {
        result := ComCall(17, this, "ptr*", &certificates := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Certificate, certificates)
    }
}
