#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUpdateSession.ahk" { IUpdateSession }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents a session in which the caller can perform operations that involve updates. For example, this interface represents sessions in which the caller performs a search, download, installation, or uninstallation operation. (IUpdateSession2)
 * @remarks
 * You can create an instance of this interface by using the UpdateSession coclass. Use the Microsoft.Update.Session program identifier to create the object.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdatesession2
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateSession2 extends IUpdateSession {
    /**
     * The interface identifier for IUpdateSession2
     * @type {Guid}
     */
    static IID := Guid("{91caf7b0-eb23-49ed-9937-c52d817f46f7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateSession2 interfaces
    */
    struct Vtbl extends IUpdateSession.Vtbl {
        get_UserLocale : IntPtr
        put_UserLocale : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateSession2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    UserLocale {
        get => this.get_UserLocale()
        set => this.put_UserLocale(value)
    }

    /**
     * Gets and sets the preferred locale for which update information is retrieved.. (Get)
     * @remarks
     * A search from an <b>UpdateSearch</b> object that was created from the <b>UpdateSession</b> object fails if the following conditions are true:
     * 
     * <ul>
     * <li>A user or a power user set the <b>UserLocale</b> property for the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface to a locale.</li>
     * <li>The locale corresponds to a language that is not installed on the computer.</li>
     * </ul>
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale
     */
    get_UserLocale() {
        result := ComCall(15, this, "uint*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the preferred locale for which update information is retrieved.. (Put)
     * @remarks
     * A search from an <b>UpdateSearch</b> object that was created from the <b>UpdateSession</b> object fails if the following conditions are true:
     * 
     * <ul>
     * <li>A user or a power user set the <b>UserLocale</b> property for the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface to a locale.</li>
     * <li>The locale corresponds to a language that is not installed on the computer.</li>
     * </ul>
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession2-put_userlocale
     */
    put_UserLocale(lcid) {
        result := ComCall(16, this, "uint", lcid, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUpdateSession2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_UserLocale := CallbackCreate(GetMethod(implObj, "get_UserLocale"), flags, 2)
        this.vtbl.put_UserLocale := CallbackCreate(GetMethod(implObj, "put_UserLocale"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_UserLocale)
        CallbackFree(this.vtbl.put_UserLocale)
    }
}
