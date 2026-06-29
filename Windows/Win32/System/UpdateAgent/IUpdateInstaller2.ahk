#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUpdateInstaller.ahk" { IUpdateInstaller }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Installs or uninstalls updates on a computer. (IUpdateInstaller2)
 * @remarks
 * You can create an instance of this interface by using the UpdateInstaller coclass. Use the Microsoft.Update.Installer program identifier to create the object.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdateinstaller2
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateInstaller2 extends IUpdateInstaller {
    /**
     * The interface identifier for IUpdateInstaller2
     * @type {Guid}
     */
    static IID := Guid("{3442d4fe-224d-4cee-98cf-30e0c4d229e6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateInstaller2 interfaces
    */
    struct Vtbl extends IUpdateInstaller.Vtbl {
        get_ForceQuiet : IntPtr
        put_ForceQuiet : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateInstaller2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ForceQuiet {
        get => this.get_ForceQuiet()
        set => this.put_ForceQuiet(value)
    }

    /**
     * Gets and sets a Boolean value that indicates whether Windows Installer is forced to install the updates without user interaction. (Get)
     * @remarks
     * You cannot forcibly silence some updates. If an update does not support this action, and you try to install the update, the update returns the following: WU_E_UH_DOESNOTSUPPORTACTION.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller2-get_forcequiet
     */
    get_ForceQuiet() {
        result := ComCall(28, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether Windows Installer is forced to install the updates without user interaction. (Put)
     * @remarks
     * You cannot forcibly silence some updates. If an update does not support this action, and you try to install the update, the update returns the following: WU_E_UH_DOESNOTSUPPORTACTION.
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller2-put_forcequiet
     */
    put_ForceQuiet(value) {
        result := ComCall(29, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUpdateInstaller2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ForceQuiet := CallbackCreate(GetMethod(implObj, "get_ForceQuiet"), flags, 2)
        this.vtbl.put_ForceQuiet := CallbackCreate(GetMethod(implObj, "put_ForceQuiet"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ForceQuiet)
        CallbackFree(this.vtbl.put_ForceQuiet)
    }
}
