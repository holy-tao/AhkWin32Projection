#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IPersist.ahk" { IPersist }

/**
 * Exposes a method that initializes Shell folder objects.
 * @remarks
 * When you implement a Shell namespace extension, specifically the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface, you must implement this interface so the folder object can be initialized. Implementation of this interface is how the folder is told where it is in the Shell namespace.
 * 
 * You do not use this interface directly. It is used by the file system implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-bindtoobject">IShellFolder::BindToObject</a> interface when it is initializing a Shell folder object.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipersistfolder
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IPersistFolder extends IPersist {
    /**
     * The interface identifier for IPersistFolder
     * @type {Guid}
     */
    static IID := Guid("{000214ea-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPersistFolder interfaces
    */
    struct Vtbl extends IPersist.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPersistFolder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Instructs a Shell folder object to initialize itself based on the information passed.
     * @remarks
     * All objects that implement the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface for use in the Shell's namespace must implement this method. When a folder's location in the namespace is not a relevant consideration, this method can simply return S_OK. When the location is relevant to the folder, you should store the fully qualified IDLIST passed in for later reference.
     * 
     * For example, if the folder implementation needs to construct a fully qualified pointer to an item identifier list (PIDL) to elements that it contains, the PIDL passed to this method should be used to construct the fully qualified PIDLs.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>LPCITEMIDLIST</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> (item identifier list) structure that specifies the absolute location of the folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipersistfolder-initialize
     */
    Initialize(pidl) {
        result := ComCall(4, this, ITEMIDLIST.Ptr, pidl, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPersistFolder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
