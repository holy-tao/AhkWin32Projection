#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPublishedApp.ahk" { IPublishedApp }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that enumerate published applications to Add/Remove Programs in the Control Panel. The object exposing this interface is requested through IAppPublisher::EnumApps.
 * @remarks
 * To publish applications to Add/Remove Programs in the Control Panel, you must support <b>IEnumPublishedApps</b>, <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-iapppublisher">IAppPublisher</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-ipublishedapp">IPublishedApp</a>.
 * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nn-shappmgr-ienumpublishedapps
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IEnumPublishedApps extends IUnknown {
    /**
     * The interface identifier for IEnumPublishedApps
     * @type {Guid}
     */
    static IID := Guid("{0b124f8c-91f0-11d1-b8b5-006008059382}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumPublishedApps interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Reset : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumPublishedApps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the next IPublishedApp object in the enumeration.
     * @remarks
     * <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-ienumpublishedapps">IEnumPublishedApps</a> is not a standard enumeration interface. It does not support a Skip method, nor does its Next method support retrieval of multiple items.
     *         </div>
     * <div> </div>
     * @returns {IPublishedApp} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-ipublishedapp">IPublishedApp</a>**</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-ipublishedapp">IPublishedApp</a> interface reference variable that returns the next application object. Note that the category of the application object returned must match that passed into <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nf-shappmgr-iapppublisher-enumapps">EnumApps</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nf-shappmgr-ienumpublishedapps-next
     */
    Next() {
        result := ComCall(3, this, "ptr*", &pia := 0, "HRESULT")
        return IPublishedApp(pia)
    }

    /**
     * Resets the enumeration of IPublishedApp objects to the first item.
     * @remarks
     * <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-ienumpublishedapps">IEnumPublishedApps</a> is not a standard enumeration interface.</div>
     * <div> </div>
     *  It does not support a Skip method nor does its Next method support retrieval of multiple items.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method only returns S_OK.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nf-shappmgr-ienumpublishedapps-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEnumPublishedApps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Reset)
    }
}
