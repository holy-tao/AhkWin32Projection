#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAutomaticUpdatesResults.ahk" { IAutomaticUpdatesResults }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAutomaticUpdates.ahk" { IAutomaticUpdates }

/**
 * Contains the functionality of Automatic Updates. (IAutomaticUpdates2)
 * @remarks
 * You can create a new instance of this interface by using the AutomaticUpdates coclass. Use the 
 *     Microsoft.Update.AutoUpdate program identifier to create the object.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iautomaticupdates2
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IAutomaticUpdates2 extends IAutomaticUpdates {
    /**
     * The interface identifier for IAutomaticUpdates2
     * @type {Guid}
     */
    static IID := Guid("{4a2f5c31-cfd9-410e-b7fb-29a653973a0f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAutomaticUpdates2 interfaces
    */
    struct Vtbl extends IAutomaticUpdates.Vtbl {
        get_Results : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAutomaticUpdates2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IAutomaticUpdatesResults} 
     */
    Results {
        get => this.get_Results()
    }

    /**
     * Returns a pointer to an IAutomaticUpdatesResults interface.
     * @returns {IAutomaticUpdatesResults} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iautomaticupdatesresults">IAutomaticUpdatesResults</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdates2-get_results
     */
    get_Results() {
        result := ComCall(14, this, "ptr*", &retval := 0, "HRESULT")
        return IAutomaticUpdatesResults(retval)
    }

    Query(iid) {
        if (IAutomaticUpdates2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Results := CallbackCreate(GetMethod(implObj, "get_Results"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Results)
    }
}
