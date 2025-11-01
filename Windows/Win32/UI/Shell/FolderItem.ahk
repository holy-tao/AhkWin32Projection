#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/folderitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FolderItem extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for FolderItem
     * @type {Guid}
     */
    static IID => Guid("{fac32c80-cbe4-11ce-8350-444553540000}")

    /**
     * The class identifier for FolderItem
     * @type {Guid}
     */
    static CLSID => Guid("{fac32c80-cbe4-11ce-8350-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Application", "get_Parent", "get_Name", "put_Name", "get_Path", "get_GetLink", "get_GetFolder", "get_IsLink", "get_IsFolder", "get_IsFileSystem", "get_IsBrowsable", "get_ModifyDate", "put_ModifyDate", "get_Size", "get_Type", "Verbs", "InvokeVerb"]

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_Application(ppid) {
        result := ComCall(7, this, "ptr*", ppid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_Parent(ppid) {
        result := ComCall(8, this, "ptr*", ppid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbs 
     * @returns {HRESULT} 
     */
    get_Name(pbs) {
        result := ComCall(9, this, "ptr", pbs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_Name(bs) {
        bs := bs is String ? BSTR.Alloc(bs).Value : bs

        result := ComCall(10, this, "ptr", bs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbs 
     * @returns {HRESULT} 
     */
    get_Path(pbs) {
        result := ComCall(11, this, "ptr", pbs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_GetLink(ppid) {
        result := ComCall(12, this, "ptr*", ppid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_GetFolder(ppid) {
        result := ComCall(13, this, "ptr*", ppid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pb 
     * @returns {HRESULT} 
     */
    get_IsLink(pb) {
        result := ComCall(14, this, "ptr", pb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pb 
     * @returns {HRESULT} 
     */
    get_IsFolder(pb) {
        result := ComCall(15, this, "ptr", pb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pb 
     * @returns {HRESULT} 
     */
    get_IsFileSystem(pb) {
        result := ComCall(16, this, "ptr", pb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pb 
     * @returns {HRESULT} 
     */
    get_IsBrowsable(pb) {
        result := ComCall(17, this, "ptr", pb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdt 
     * @returns {HRESULT} 
     */
    get_ModifyDate(pdt) {
        pdtMarshal := pdt is VarRef ? "double*" : "ptr"

        result := ComCall(18, this, pdtMarshal, pdt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} dt 
     * @returns {HRESULT} 
     */
    put_ModifyDate(dt) {
        result := ComCall(19, this, "double", dt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pul 
     * @returns {HRESULT} 
     */
    get_Size(pul) {
        pulMarshal := pul is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pulMarshal, pul, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbs 
     * @returns {HRESULT} 
     */
    get_Type(pbs) {
        result := ComCall(21, this, "ptr", pbs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FolderItemVerbs>} ppfic 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/folderitem-verbs
     */
    Verbs(ppfic) {
        result := ComCall(22, this, "ptr*", ppfic, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vVerb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/folderitem-invokeverb
     */
    InvokeVerb(vVerb) {
        result := ComCall(23, this, "ptr", vVerb, "HRESULT")
        return result
    }
}
