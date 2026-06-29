#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfFunction.ahk" { ITfFunction }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The ITfFnLangProfileUtil interface is implemented by the speech text service and used to provide utility methods for the speech text service.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itffnlangprofileutil
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfFnLangProfileUtil extends ITfFunction {
    /**
     * The interface identifier for ITfFnLangProfileUtil
     * @type {Guid}
     */
    static IID := Guid("{a87a8574-a6c1-4e15-99f0-3d3965f548eb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfFnLangProfileUtil interfaces
    */
    struct Vtbl extends ITfFunction.Vtbl {
        RegisterActiveProfiles    : IntPtr
        IsProfileAvailableForLang : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfFnLangProfileUtil.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfFnLangProfileUtil::RegisterActiveProfiles method
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The speech text service removed its active profiles based on user actions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnlangprofileutil-registeractiveprofiles
     */
    RegisterActiveProfiles() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * ITfFnLangProfileUtil::IsProfileAvailableForLang method
     * @param {Integer} langid Contains a <b>LANGID</b> that specifies the language that the query applies to.
     * @returns {BOOL} Pointer to a <b>BOOL</b> that receives nonzero if a profile is available for the language identified by langid or zero otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnlangprofileutil-isprofileavailableforlang
     */
    IsProfileAvailableForLang(langid) {
        result := ComCall(5, this, "ushort", langid, BOOL.Ptr, &pfAvailable := 0, "HRESULT")
        return pfAvailable
    }

    Query(iid) {
        if (ITfFnLangProfileUtil.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterActiveProfiles := CallbackCreate(GetMethod(implObj, "RegisterActiveProfiles"), flags, 1)
        this.vtbl.IsProfileAvailableForLang := CallbackCreate(GetMethod(implObj, "IsProfileAvailableForLang"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterActiveProfiles)
        CallbackFree(this.vtbl.IsProfileAvailableForLang)
    }
}
