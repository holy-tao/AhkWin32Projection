#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IADs.ahk

/**
 * The IADsDomain interface is a dual interface that inherits from IADs.
 * @remarks
 * 
  * For the WinNT provider supplied by Microsoft, this interface is implemented on the <b>WinNTDomain</b> object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsdomain
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsDomain extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsDomain
     * @type {Guid}
     */
    static IID => Guid("{00e4c220-fd16-11ce-abc4-02608c9e7553}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsWorkgroup", "get_MinPasswordLength", "put_MinPasswordLength", "get_MinPasswordAge", "put_MinPasswordAge", "get_MaxPasswordAge", "put_MaxPasswordAge", "get_MaxBadPasswordsAllowed", "put_MaxBadPasswordsAllowed", "get_PasswordHistoryLength", "put_PasswordHistoryLength", "get_PasswordAttributes", "put_PasswordAttributes", "get_AutoUnlockInterval", "put_AutoUnlockInterval", "get_LockoutObservationInterval", "put_LockoutObservationInterval"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_IsWorkgroup(retval) {
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_MinPasswordLength(retval) {
        result := ComCall(21, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnMinPasswordLength 
     * @returns {HRESULT} 
     */
    put_MinPasswordLength(lnMinPasswordLength) {
        result := ComCall(22, this, "int", lnMinPasswordLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_MinPasswordAge(retval) {
        result := ComCall(23, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnMinPasswordAge 
     * @returns {HRESULT} 
     */
    put_MinPasswordAge(lnMinPasswordAge) {
        result := ComCall(24, this, "int", lnMinPasswordAge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_MaxPasswordAge(retval) {
        result := ComCall(25, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnMaxPasswordAge 
     * @returns {HRESULT} 
     */
    put_MaxPasswordAge(lnMaxPasswordAge) {
        result := ComCall(26, this, "int", lnMaxPasswordAge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_MaxBadPasswordsAllowed(retval) {
        result := ComCall(27, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnMaxBadPasswordsAllowed 
     * @returns {HRESULT} 
     */
    put_MaxBadPasswordsAllowed(lnMaxBadPasswordsAllowed) {
        result := ComCall(28, this, "int", lnMaxBadPasswordsAllowed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_PasswordHistoryLength(retval) {
        result := ComCall(29, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnPasswordHistoryLength 
     * @returns {HRESULT} 
     */
    put_PasswordHistoryLength(lnPasswordHistoryLength) {
        result := ComCall(30, this, "int", lnPasswordHistoryLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_PasswordAttributes(retval) {
        result := ComCall(31, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnPasswordAttributes 
     * @returns {HRESULT} 
     */
    put_PasswordAttributes(lnPasswordAttributes) {
        result := ComCall(32, this, "int", lnPasswordAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_AutoUnlockInterval(retval) {
        result := ComCall(33, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnAutoUnlockInterval 
     * @returns {HRESULT} 
     */
    put_AutoUnlockInterval(lnAutoUnlockInterval) {
        result := ComCall(34, this, "int", lnAutoUnlockInterval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_LockoutObservationInterval(retval) {
        result := ComCall(35, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnLockoutObservationInterval 
     * @returns {HRESULT} 
     */
    put_LockoutObservationInterval(lnLockoutObservationInterval) {
        result := ComCall(36, this, "int", lnLockoutObservationInterval, "HRESULT")
        return result
    }
}
