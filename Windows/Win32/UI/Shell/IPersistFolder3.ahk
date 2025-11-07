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
     * 
     * @param {IBindCtx} pbc 
     * @param {Pointer<ITEMIDLIST>} pidlRoot 
     * @param {Pointer<PERSIST_FOLDER_TARGET_INFO>} ppfti 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipersistfolder3-initializeex
     */
    InitializeEx(pbc, pidlRoot, ppfti) {
        result := ComCall(6, this, "ptr", pbc, "ptr", pidlRoot, "ptr", ppfti, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PERSIST_FOLDER_TARGET_INFO} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipersistfolder3-getfoldertargetinfo
     */
    GetFolderTargetInfo() {
        ppfti := PERSIST_FOLDER_TARGET_INFO()
        result := ComCall(7, this, "ptr", ppfti, "HRESULT")
        return ppfti
    }
}
