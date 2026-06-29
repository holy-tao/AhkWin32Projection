#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMAPI_BURN_VERIFICATION_LEVEL.ahk" { IMAPI_BURN_VERIFICATION_LEVEL }

/**
 * Use this interface with IDiscFormat2Data or IDiscFormat2TrackAtOnce to get or set the Burn Verification Level property which dictates how burned media is verified for integrity after the write operation.
 * @remarks
 * The following example function demonstrates how the burn verification level defined by <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_burn_verification_level">IMAPI_BURN_VERIFICATION_LEVEL</a>, can be implemented. Burn verification level should be set prior to a burn operation.
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-iburnverification
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IBurnVerification extends IUnknown {
    /**
     * The interface identifier for IBurnVerification
     * @type {Guid}
     */
    static IID := Guid("{d2ffd834-958b-426d-8470-2a13879c6a91}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBurnVerification interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        put_BurnVerificationLevel : IntPtr
        get_BurnVerificationLevel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBurnVerification.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IMAPI_BURN_VERIFICATION_LEVEL} 
     */
    BurnVerificationLevel {
        get => this.get_BurnVerificationLevel()
        set => this.put_BurnVerificationLevel(value)
    }

    /**
     * Sets the Burn Verification Level.
     * @remarks
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @param {IMAPI_BURN_VERIFICATION_LEVEL} value Value that defines the Burn Verification Level. For possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_burn_verification_level">IMAPI_BURN_VERIFICATION_LEVEL</a>.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iburnverification-put_burnverificationlevel
     */
    put_BurnVerificationLevel(value) {
        result := ComCall(3, this, IMAPI_BURN_VERIFICATION_LEVEL, value, "HRESULT")
        return result
    }

    /**
     * Retrieves the current Burn Verification Level.
     * @remarks
     * This method is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
     * @returns {IMAPI_BURN_VERIFICATION_LEVEL} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_burn_verification_level">IMAPI_BURN_VERIFICATION_LEVEL</a> enumeration that specifies the current the Burn Verification Level.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iburnverification-get_burnverificationlevel
     */
    get_BurnVerificationLevel() {
        result := ComCall(4, this, "int*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IBurnVerification.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_BurnVerificationLevel := CallbackCreate(GetMethod(implObj, "put_BurnVerificationLevel"), flags, 2)
        this.vtbl.get_BurnVerificationLevel := CallbackCreate(GetMethod(implObj, "get_BurnVerificationLevel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_BurnVerificationLevel)
        CallbackFree(this.vtbl.get_BurnVerificationLevel)
    }
}
