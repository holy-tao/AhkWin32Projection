#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PERSIST_FOLDER_TARGET_INFO.ahk
#Include .\IPersistFolder2.ahk

/**
 * Extends the IPersistFolder and IPersistFolder2 interfaces by allowing a folder object to implement nondefault handling of folder shortcuts.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersist">IPersist</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ipersistfolder">IPersistFolder</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ipersistfolder2">IPersistFolder2</a> interfaces, from which it inherits.
 * 
 * In Windows versions earlier than Windows Vista, this interface was declared in Shlobj.h.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Namespace extensions implement this interface if they need to perform nondefault handling of folder shortcuts.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Applications do not normally use this interface directly.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ipersistfolder3
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPersistFolder3 extends IPersistFolder2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistFolder3
     * @type {Guid}
     */
    static IID => Guid("{cef04fdf-fe72-11d2-87a5-00c04f6837cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEx", "GetFolderTargetInfo"]

    /**
     * Initializes a folder and specifies its location in the namespace. If the folder is a shortcut, this method also specifies the location of the target folder.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipersistfolder3-initializeex
     */
    InitializeEx(pbc, pidlRoot, ppfti) {
        result := ComCall(6, this, "ptr", pbc, "ptr", pidlRoot, "ptr", ppfti, "HRESULT")
        return result
    }

    /**
     * Provides the location and attributes of a folder shortcut's target folder.
     * @returns {PERSIST_FOLDER_TARGET_INFO} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-persist_folder_target_info">PERSIST_FOLDER_TARGET_INFO</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-persist_folder_target_info">PERSIST_FOLDER_TARGET_INFO</a> structure used to return the target folder's location and attributes.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipersistfolder3-getfoldertargetinfo
     */
    GetFolderTargetInfo() {
        ppfti := PERSIST_FOLDER_TARGET_INFO()
        result := ComCall(7, this, "ptr", ppfti, "HRESULT")
        return ppfti
    }
}
