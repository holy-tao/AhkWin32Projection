#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\FolderItemVerbs.ahk

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
        set => this.put_Name(value)
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {IDispatch} 
     */
    GetLink {
        get => this.get_GetLink()
    }

    /**
     * @type {IDispatch} 
     */
    GetFolder {
        get => this.get_GetFolder()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsLink {
        get => this.get_IsLink()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsFolder {
        get => this.get_IsFolder()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsFileSystem {
        get => this.get_IsFileSystem()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsBrowsable {
        get => this.get_IsBrowsable()
    }

    /**
     * @type {Float} 
     */
    ModifyDate {
        get => this.get_ModifyDate()
        set => this.put_ModifyDate(value)
    }

    /**
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * @type {BSTR} 
     */
    Type {
        get => this.get_Type()
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
        pbs := BSTR()
        result := ComCall(9, this, "ptr", pbs, "HRESULT")
        return pbs
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
     * @returns {BSTR} 
     */
    get_Path() {
        pbs := BSTR()
        result := ComCall(11, this, "ptr", pbs, "HRESULT")
        return pbs
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_GetLink() {
        result := ComCall(12, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_GetFolder() {
        result := ComCall(13, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsLink() {
        result := ComCall(14, this, "short*", &pb := 0, "HRESULT")
        return pb
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsFolder() {
        result := ComCall(15, this, "short*", &pb := 0, "HRESULT")
        return pb
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsFileSystem() {
        result := ComCall(16, this, "short*", &pb := 0, "HRESULT")
        return pb
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsBrowsable() {
        result := ComCall(17, this, "short*", &pb := 0, "HRESULT")
        return pb
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ModifyDate() {
        result := ComCall(18, this, "double*", &pdt := 0, "HRESULT")
        return pdt
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
     * @returns {Integer} 
     */
    get_Size() {
        result := ComCall(20, this, "int*", &pul := 0, "HRESULT")
        return pul
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Type() {
        pbs := BSTR()
        result := ComCall(21, this, "ptr", pbs, "HRESULT")
        return pbs
    }

    /**
     * 
     * @returns {FolderItemVerbs} 
     * @see https://learn.microsoft.com/windows/win32/shell/folderitem-verbs
     */
    Verbs() {
        result := ComCall(22, this, "ptr*", &ppfic := 0, "HRESULT")
        return FolderItemVerbs(ppfic)
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
