#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IMsmStrings.ahk" { IMsmStrings }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IMsmGetFiles interface enables the client to retrieve the files needed in a particular language of the module.
 * @see https://learn.microsoft.com/windows/win32/api/mergemod/nn-mergemod-imsmgetfiles
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IMsmGetFiles extends IDispatch {
    /**
     * The interface identifier for IMsmGetFiles
     * @type {Guid}
     */
    static IID := Guid("{7041ae26-2d78-11d2-888a-00a0c981b015}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMsmGetFiles interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ModuleFiles : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMsmGetFiles.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IMsmStrings} 
     */
    ModuleFiles {
        get => this.get_ModuleFiles()
    }

    /**
     * The get_ModuleFiles method retrieves the ModuleFiles property of the GetFiles object.
     * @returns {IMsmStrings} Collection of IMsmStrings that are the primary keys of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Msi/file-table">File table</a> for the currently open module.
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmgetfiles-get_modulefiles
     */
    get_ModuleFiles() {
        result := ComCall(7, this, "ptr*", &Files := 0, "HRESULT")
        return IMsmStrings(Files)
    }

    Query(iid) {
        if (IMsmGetFiles.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ModuleFiles := CallbackCreate(GetMethod(implObj, "get_ModuleFiles"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ModuleFiles)
    }
}
