#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IADs.ahk" { IADs }

/**
 * The IADsDomain interface is a dual interface that inherits from IADs.
 * @remarks
 * For the WinNT provider supplied by Microsoft, this interface is implemented on the <b>WinNTDomain</b> object.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsdomain
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsDomain extends IADs {
    /**
     * The interface identifier for IADsDomain
     * @type {Guid}
     */
    static IID := Guid("{00e4c220-fd16-11ce-abc4-02608c9e7553}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsDomain interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_IsWorkgroup                : IntPtr
        get_MinPasswordLength          : IntPtr
        put_MinPasswordLength          : IntPtr
        get_MinPasswordAge             : IntPtr
        put_MinPasswordAge             : IntPtr
        get_MaxPasswordAge             : IntPtr
        put_MaxPasswordAge             : IntPtr
        get_MaxBadPasswordsAllowed     : IntPtr
        put_MaxBadPasswordsAllowed     : IntPtr
        get_PasswordHistoryLength      : IntPtr
        put_PasswordHistoryLength      : IntPtr
        get_PasswordAttributes         : IntPtr
        put_PasswordAttributes         : IntPtr
        get_AutoUnlockInterval         : IntPtr
        put_AutoUnlockInterval         : IntPtr
        get_LockoutObservationInterval : IntPtr
        put_LockoutObservationInterval : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsDomain.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsWorkgroup {
        get => this.get_IsWorkgroup()
    }

    /**
     * @type {Integer} 
     */
    MinPasswordLength {
        get => this.get_MinPasswordLength()
        set => this.put_MinPasswordLength(value)
    }

    /**
     * @type {Integer} 
     */
    MinPasswordAge {
        get => this.get_MinPasswordAge()
        set => this.put_MinPasswordAge(value)
    }

    /**
     * @type {Integer} 
     */
    MaxPasswordAge {
        get => this.get_MaxPasswordAge()
        set => this.put_MaxPasswordAge(value)
    }

    /**
     * @type {Integer} 
     */
    MaxBadPasswordsAllowed {
        get => this.get_MaxBadPasswordsAllowed()
        set => this.put_MaxBadPasswordsAllowed(value)
    }

    /**
     * @type {Integer} 
     */
    PasswordHistoryLength {
        get => this.get_PasswordHistoryLength()
        set => this.put_PasswordHistoryLength(value)
    }

    /**
     * @type {Integer} 
     */
    PasswordAttributes {
        get => this.get_PasswordAttributes()
        set => this.put_PasswordAttributes(value)
    }

    /**
     * @type {Integer} 
     */
    AutoUnlockInterval {
        get => this.get_AutoUnlockInterval()
        set => this.put_AutoUnlockInterval(value)
    }

    /**
     * @type {Integer} 
     */
    LockoutObservationInterval {
        get => this.get_LockoutObservationInterval()
        set => this.put_LockoutObservationInterval(value)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsWorkgroup() {
        result := ComCall(20, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinPasswordLength() {
        result := ComCall(21, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_MinPasswordAge() {
        result := ComCall(23, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_MaxPasswordAge() {
        result := ComCall(25, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_MaxBadPasswordsAllowed() {
        result := ComCall(27, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_PasswordHistoryLength() {
        result := ComCall(29, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_PasswordAttributes() {
        result := ComCall(31, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_AutoUnlockInterval() {
        result := ComCall(33, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_LockoutObservationInterval() {
        result := ComCall(35, this, "int*", &retval := 0, "HRESULT")
        return retval
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

    Query(iid) {
        if (IADsDomain.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_IsWorkgroup := CallbackCreate(GetMethod(implObj, "get_IsWorkgroup"), flags, 2)
        this.vtbl.get_MinPasswordLength := CallbackCreate(GetMethod(implObj, "get_MinPasswordLength"), flags, 2)
        this.vtbl.put_MinPasswordLength := CallbackCreate(GetMethod(implObj, "put_MinPasswordLength"), flags, 2)
        this.vtbl.get_MinPasswordAge := CallbackCreate(GetMethod(implObj, "get_MinPasswordAge"), flags, 2)
        this.vtbl.put_MinPasswordAge := CallbackCreate(GetMethod(implObj, "put_MinPasswordAge"), flags, 2)
        this.vtbl.get_MaxPasswordAge := CallbackCreate(GetMethod(implObj, "get_MaxPasswordAge"), flags, 2)
        this.vtbl.put_MaxPasswordAge := CallbackCreate(GetMethod(implObj, "put_MaxPasswordAge"), flags, 2)
        this.vtbl.get_MaxBadPasswordsAllowed := CallbackCreate(GetMethod(implObj, "get_MaxBadPasswordsAllowed"), flags, 2)
        this.vtbl.put_MaxBadPasswordsAllowed := CallbackCreate(GetMethod(implObj, "put_MaxBadPasswordsAllowed"), flags, 2)
        this.vtbl.get_PasswordHistoryLength := CallbackCreate(GetMethod(implObj, "get_PasswordHistoryLength"), flags, 2)
        this.vtbl.put_PasswordHistoryLength := CallbackCreate(GetMethod(implObj, "put_PasswordHistoryLength"), flags, 2)
        this.vtbl.get_PasswordAttributes := CallbackCreate(GetMethod(implObj, "get_PasswordAttributes"), flags, 2)
        this.vtbl.put_PasswordAttributes := CallbackCreate(GetMethod(implObj, "put_PasswordAttributes"), flags, 2)
        this.vtbl.get_AutoUnlockInterval := CallbackCreate(GetMethod(implObj, "get_AutoUnlockInterval"), flags, 2)
        this.vtbl.put_AutoUnlockInterval := CallbackCreate(GetMethod(implObj, "put_AutoUnlockInterval"), flags, 2)
        this.vtbl.get_LockoutObservationInterval := CallbackCreate(GetMethod(implObj, "get_LockoutObservationInterval"), flags, 2)
        this.vtbl.put_LockoutObservationInterval := CallbackCreate(GetMethod(implObj, "put_LockoutObservationInterval"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_IsWorkgroup)
        CallbackFree(this.vtbl.get_MinPasswordLength)
        CallbackFree(this.vtbl.put_MinPasswordLength)
        CallbackFree(this.vtbl.get_MinPasswordAge)
        CallbackFree(this.vtbl.put_MinPasswordAge)
        CallbackFree(this.vtbl.get_MaxPasswordAge)
        CallbackFree(this.vtbl.put_MaxPasswordAge)
        CallbackFree(this.vtbl.get_MaxBadPasswordsAllowed)
        CallbackFree(this.vtbl.put_MaxBadPasswordsAllowed)
        CallbackFree(this.vtbl.get_PasswordHistoryLength)
        CallbackFree(this.vtbl.put_PasswordHistoryLength)
        CallbackFree(this.vtbl.get_PasswordAttributes)
        CallbackFree(this.vtbl.put_PasswordAttributes)
        CallbackFree(this.vtbl.get_AutoUnlockInterval)
        CallbackFree(this.vtbl.put_AutoUnlockInterval)
        CallbackFree(this.vtbl.get_LockoutObservationInterval)
        CallbackFree(this.vtbl.put_LockoutObservationInterval)
    }
}
