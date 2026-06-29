#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents a single verb available to an item. This object contains properties and methods that allow you to retrieve information about the verb.
 * @see https://learn.microsoft.com/windows/win32/shell/folderitemverb
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FolderItemVerb extends IDispatch {
    /**
     * The interface identifier for FolderItemVerb
     * @type {Guid}
     */
    static IID := Guid("{08ec3e00-50b0-11cf-960c-0080c7f4ee85}")

    /**
     * The class identifier for FolderItemVerb
     * @type {Guid}
     */
    static CLSID := Guid("{08ec3e00-50b0-11cf-960c-0080c7f4ee85}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for FolderItemVerb interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Application : IntPtr
        get_Parent      : IntPtr
        get_Name        : IntPtr
        DoIt            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := FolderItemVerb.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IDispatch} 
     */
    Application {
        get => this.get_Application()
    }

    /**
     * @type {IDispatch} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Application() {
        result := ComCall(7, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(8, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbs := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbs, "HRESULT")
        return pbs
    }

    /**
     * Executes a verb on the FolderItem associated with the verb.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/shell/folderitemverb-doit
     */
    DoIt() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (FolderItemVerb.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Application := CallbackCreate(GetMethod(implObj, "get_Application"), flags, 2)
        this.vtbl.get_Parent := CallbackCreate(GetMethod(implObj, "get_Parent"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.DoIt := CallbackCreate(GetMethod(implObj, "DoIt"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Application)
        CallbackFree(this.vtbl.get_Parent)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.DoIt)
    }
}
