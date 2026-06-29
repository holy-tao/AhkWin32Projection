#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows snap-ins to add HTML Help support. (ISnapinHelp)
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-isnapinhelp
 * @namespace Windows.Win32.System.Mmc
 */
export default struct ISnapinHelp extends IUnknown {
    /**
     * The interface identifier for ISnapinHelp
     * @type {Guid}
     */
    static IID := Guid("{a6b15ace-df59-11d0-a7dd-00c04fd909dd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISnapinHelp interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetHelpTopic : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISnapinHelp.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables a snap-in to add its compiled HTML Help file to the MMC Help collection file.
     * @remarks
     * MMC calls the snap-in's implementation of this method to get the location of the snap-in's Help file. MMC merges the HTML Help files of all snap-ins with the MMC console HTML Help collection file.
     * 
     * The topic hierarchy from the snap-in's Help file will appear in the table of contents when the collection is viewed.
     * 
     * By merging the HTML Help files, MMC creates a single, integrated HTML Help table of contents, index, and search feature. When a user clicks Help on Microsoft Management Console on the main 
     * <b>Help</b> menu, MMC opens the merged Help file that includes HTML Help files for all snap-ins in the current console file.
     * 
     * Allocate the <i>lpCompiledHelpFile</i> string with the COM API function <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> (or the equivalent) and MMC will release it.
     * @returns {PWSTR} A pointer to the address of the null-terminated Unicode string that contains the path of the compiled Help file (.chm) for the snap-in. When specifying the path, place the file anywhere and specify the full path name.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinhelp-gethelptopic
     */
    GetHelpTopic() {
        result := ComCall(3, this, PWSTR.Ptr, &lpCompiledHelpFile := 0, "HRESULT")
        return lpCompiledHelpFile
    }

    Query(iid) {
        if (ISnapinHelp.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetHelpTopic := CallbackCreate(GetMethod(implObj, "GetHelpTopic"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetHelpTopic)
    }
}
