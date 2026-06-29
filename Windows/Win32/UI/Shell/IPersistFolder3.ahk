#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IBindCtx.ahk" { IBindCtx }
#Import ".\PERSIST_FOLDER_TARGET_INFO.ahk" { PERSIST_FOLDER_TARGET_INFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPersistFolder2.ahk" { IPersistFolder2 }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }

/**
 * Extends the IPersistFolder and IPersistFolder2 interfaces by allowing a folder object to implement nondefault handling of folder shortcuts.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersist">IPersist</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ipersistfolder">IPersistFolder</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ipersistfolder2">IPersistFolder2</a> interfaces, from which it inherits.
 * 
 * In Windows versions earlier than Windows Vista, this interface was declared in Shlobj.h.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Namespace extensions implement this interface if they need to perform nondefault handling of folder shortcuts.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Applications do not normally use this interface directly.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipersistfolder3
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IPersistFolder3 extends IPersistFolder2 {
    /**
     * The interface identifier for IPersistFolder3
     * @type {Guid}
     */
    static IID := Guid("{cef04fdf-fe72-11d2-87a5-00c04f6837cf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPersistFolder3 interfaces
    */
    struct Vtbl extends IPersistFolder2.Vtbl {
        InitializeEx        : IntPtr
        GetFolderTargetInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPersistFolder3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes a folder and specifies its location in the namespace. If the folder is a shortcut, this method also specifies the location of the target folder.
     * @remarks
     * This function is an extended version of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipersistfolder-initialize">IPersistFolder::Initialize</a>. It allows the Shell to initialize folder shortcuts as well as normal folders.
     * @param {IBindCtx} pbc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> object that provides the bind context. This parameter can be <b>NULL</b>.
     * @param {Pointer<ITEMIDLIST>} pidlRoot Type: <b>LPCITEMIDLIST</b>
     * 
     * A pointer to a fully qualified PIDL that specifies the absolute location of a folder or folder shortcut. The calling application is responsible for allocating and freeing this PIDL.
     * @param {Pointer<PERSIST_FOLDER_TARGET_INFO>} ppfti Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-persist_folder_target_info">PERSIST_FOLDER_TARGET_INFO</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-persist_folder_target_info">PERSIST_FOLDER_TARGET_INFO</a> structure that specifies the location of the target folder and its attributes. 
     * 
     *                     
     * 
     * If <i>ppfti</i> points to a valid structure, <i>pidlRoot</i> represents a folder shortcut.
     * 
     * If <i>ppfti</i> is set to <b>NULL</b>, <i>pidlRoot</i> represents a normal folder. In that case, <b>InitializeEx</b> should behave as if <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipersistfolder-initialize">Initialize</a> had been called.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipersistfolder3-initializeex
     */
    InitializeEx(pbc, pidlRoot, ppfti) {
        result := ComCall(6, this, "ptr", pbc, ITEMIDLIST.Ptr, pidlRoot, PERSIST_FOLDER_TARGET_INFO.Ptr, ppfti, "HRESULT")
        return result
    }

    /**
     * Provides the location and attributes of a folder shortcut's target folder.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-persist_folder_target_info">PERSIST_FOLDER_TARGET_INFO</a> structure might not be initialized by the caller. <b>GetFolderTargetInfo</b> must assign values to all members of the structure before returning it to the caller.
     * @returns {PERSIST_FOLDER_TARGET_INFO} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-persist_folder_target_info">PERSIST_FOLDER_TARGET_INFO</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-persist_folder_target_info">PERSIST_FOLDER_TARGET_INFO</a> structure used to return the target folder's location and attributes.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipersistfolder3-getfoldertargetinfo
     */
    GetFolderTargetInfo() {
        ppfti := PERSIST_FOLDER_TARGET_INFO()
        result := ComCall(7, this, PERSIST_FOLDER_TARGET_INFO.Ptr, ppfti, "HRESULT")
        return ppfti
    }

    Query(iid) {
        if (IPersistFolder3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeEx := CallbackCreate(GetMethod(implObj, "InitializeEx"), flags, 4)
        this.vtbl.GetFolderTargetInfo := CallbackCreate(GetMethod(implObj, "GetFolderTargetInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeEx)
        CallbackFree(this.vtbl.GetFolderTargetInfo)
    }
}
