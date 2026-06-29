#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ISnapinHelp.ahk" { ISnapinHelp }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Allows snap-ins to add HTML Help support. (ISnapinHelp2)
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-isnapinhelp2
 * @namespace Windows.Win32.System.Mmc
 */
export default struct ISnapinHelp2 extends ISnapinHelp {
    /**
     * The interface identifier for ISnapinHelp2
     * @type {Guid}
     */
    static IID := Guid("{4861a010-20f9-11d2-a510-00c04fb6dd2c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISnapinHelp2 interfaces
    */
    struct Vtbl extends ISnapinHelp.Vtbl {
        GetLinkedTopics : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISnapinHelp2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables a snap-in to specify the names and locations of any HTML Help files that are linked to the snap-in's Help file (specified in the GetHelpTopic method).
     * @remarks
     * MMC calls the snap-in's <b>ISnapinHelp2::GetLinkedTopics</b> method only if the snap-in returned <b>S_OK</b> from the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa814944(v=vs.85)">ISnapinHelp2::GetHelpTopic</a> method call.
     * 
     * Allocate the <i>lpCompiledHelpFiles</i> string with the COM API function <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> (or the equivalent) and MMC will release it
     * @returns {PWSTR} A pointer to the address of the null-terminated Unicode string that contains the path of one or more compiled Help files (.chm) that are linked to the snap-in's Help file. A semicolon is used to separate multiple file paths from each other.
     * 
     * When specifying the path, place the file anywhere and specify the full path name.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinhelp2-getlinkedtopics
     */
    GetLinkedTopics() {
        result := ComCall(4, this, PWSTR.Ptr, &lpCompiledHelpFiles := 0, "HRESULT")
        return lpCompiledHelpFiles
    }

    Query(iid) {
        if (ISnapinHelp2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLinkedTopics := CallbackCreate(GetMethod(implObj, "GetLinkedTopics"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLinkedTopics)
    }
}
