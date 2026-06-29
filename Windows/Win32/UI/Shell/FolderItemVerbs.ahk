#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\FolderItemVerb.ahk" { FolderItemVerb }

/**
 * Represents the collection of verbs for an item in a Shell folder. This object contains properties and methods that allow you to retrieve information about the collection.
 * @see https://learn.microsoft.com/windows/win32/shell/folderitemverbs
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FolderItemVerbs extends IDispatch {
    /**
     * The interface identifier for FolderItemVerbs
     * @type {Guid}
     */
    static IID := Guid("{1f8352c0-50b0-11cf-960c-0080c7f4ee85}")

    /**
     * The class identifier for FolderItemVerbs
     * @type {Guid}
     */
    static CLSID := Guid("{1f8352c0-50b0-11cf-960c-0080c7f4ee85}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for FolderItemVerbs interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count       : IntPtr
        get_Application : IntPtr
        get_Parent      : IntPtr
        Item            : IntPtr
        _NewEnum        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := FolderItemVerbs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
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
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Application() {
        result := ComCall(8, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(9, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * Retrieves the FolderItemVerb object for a specified item in the collection.
     * @param {VARIANT} index 
     * @returns {FolderItemVerb} 
     * @see https://learn.microsoft.com/windows/win32/shell/folderitemverbs-item
     */
    Item(index) {
        result := ComCall(10, this, VARIANT, index, "ptr*", &ppid := 0, "HRESULT")
        return FolderItemVerb(ppid)
    }

    /**
     * Creates and returns a new FolderItemVerbs object that is a copy of this FolderItemVerbs object.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/shell/folderitemverbs--newenum
     */
    _NewEnum() {
        result := ComCall(11, this, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    Query(iid) {
        if (FolderItemVerbs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_Application := CallbackCreate(GetMethod(implObj, "get_Application"), flags, 2)
        this.vtbl.get_Parent := CallbackCreate(GetMethod(implObj, "get_Parent"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
        this.vtbl._NewEnum := CallbackCreate(GetMethod(implObj, "_NewEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_Application)
        CallbackFree(this.vtbl.get_Parent)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl._NewEnum)
    }
}
