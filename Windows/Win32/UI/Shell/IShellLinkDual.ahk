#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellLinkDual extends IDispatch {
    /**
     * The interface identifier for IShellLinkDual
     * @type {Guid}
     */
    static IID := Guid("{88a05c00-f000-11ce-8350-444553540000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellLinkDual interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Path             : IntPtr
        put_Path             : IntPtr
        get_Description      : IntPtr
        put_Description      : IntPtr
        get_WorkingDirectory : IntPtr
        put_WorkingDirectory : IntPtr
        get_Arguments        : IntPtr
        put_Arguments        : IntPtr
        get_Hotkey           : IntPtr
        put_Hotkey           : IntPtr
        get_ShowCommand      : IntPtr
        put_ShowCommand      : IntPtr
        Resolve              : IntPtr
        GetIconLocation      : IntPtr
        SetIconLocation      : IntPtr
        Save                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellLinkDual.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    WorkingDirectory {
        get => this.get_WorkingDirectory()
        set => this.put_WorkingDirectory(value)
    }

    /**
     * @type {BSTR} 
     */
    Arguments {
        get => this.get_Arguments()
        set => this.put_Arguments(value)
    }

    /**
     * @type {Integer} 
     */
    Hotkey {
        get => this.get_Hotkey()
        set => this.put_Hotkey(value)
    }

    /**
     * @type {Integer} 
     */
    ShowCommand {
        get => this.get_ShowCommand()
        set => this.put_ShowCommand(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        pbs := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbs, "HRESULT")
        return pbs
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_Path(bs) {
        bs := bs is String ? BSTR.Alloc(bs).Value : bs

        result := ComCall(8, this, BSTR, bs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        pbs := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbs, "HRESULT")
        return pbs
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_Description(bs) {
        bs := bs is String ? BSTR.Alloc(bs).Value : bs

        result := ComCall(10, this, BSTR, bs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_WorkingDirectory() {
        pbs := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbs, "HRESULT")
        return pbs
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_WorkingDirectory(bs) {
        bs := bs is String ? BSTR.Alloc(bs).Value : bs

        result := ComCall(12, this, BSTR, bs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Arguments() {
        pbs := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbs, "HRESULT")
        return pbs
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_Arguments(bs) {
        bs := bs is String ? BSTR.Alloc(bs).Value : bs

        result := ComCall(14, this, BSTR, bs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Hotkey() {
        result := ComCall(15, this, "int*", &piHK := 0, "HRESULT")
        return piHK
    }

    /**
     * 
     * @param {Integer} iHK 
     * @returns {HRESULT} 
     */
    put_Hotkey(iHK) {
        result := ComCall(16, this, "int", iHK, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ShowCommand() {
        result := ComCall(17, this, "int*", &piShowCommand := 0, "HRESULT")
        return piShowCommand
    }

    /**
     * 
     * @param {Integer} iShowCommand 
     * @returns {HRESULT} 
     */
    put_ShowCommand(iShowCommand) {
        result := ComCall(18, this, "int", iShowCommand, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fFlags 
     * @returns {HRESULT} 
     */
    Resolve(fFlags) {
        result := ComCall(19, this, "int", fFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbs 
     * @returns {Integer} 
     */
    GetIconLocation(pbs) {
        result := ComCall(20, this, BSTR.Ptr, pbs, "int*", &piIcon := 0, "HRESULT")
        return piIcon
    }

    /**
     * 
     * @param {BSTR} bs 
     * @param {Integer} iIcon 
     * @returns {HRESULT} 
     */
    SetIconLocation(bs, iIcon) {
        bs := bs is String ? BSTR.Alloc(bs).Value : bs

        result := ComCall(21, this, BSTR, bs, "int", iIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vWhere 
     * @returns {HRESULT} 
     */
    Save(vWhere) {
        result := ComCall(22, this, VARIANT, vWhere, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellLinkDual.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.put_Path := CallbackCreate(GetMethod(implObj, "put_Path"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_WorkingDirectory := CallbackCreate(GetMethod(implObj, "get_WorkingDirectory"), flags, 2)
        this.vtbl.put_WorkingDirectory := CallbackCreate(GetMethod(implObj, "put_WorkingDirectory"), flags, 2)
        this.vtbl.get_Arguments := CallbackCreate(GetMethod(implObj, "get_Arguments"), flags, 2)
        this.vtbl.put_Arguments := CallbackCreate(GetMethod(implObj, "put_Arguments"), flags, 2)
        this.vtbl.get_Hotkey := CallbackCreate(GetMethod(implObj, "get_Hotkey"), flags, 2)
        this.vtbl.put_Hotkey := CallbackCreate(GetMethod(implObj, "put_Hotkey"), flags, 2)
        this.vtbl.get_ShowCommand := CallbackCreate(GetMethod(implObj, "get_ShowCommand"), flags, 2)
        this.vtbl.put_ShowCommand := CallbackCreate(GetMethod(implObj, "put_ShowCommand"), flags, 2)
        this.vtbl.Resolve := CallbackCreate(GetMethod(implObj, "Resolve"), flags, 2)
        this.vtbl.GetIconLocation := CallbackCreate(GetMethod(implObj, "GetIconLocation"), flags, 3)
        this.vtbl.SetIconLocation := CallbackCreate(GetMethod(implObj, "SetIconLocation"), flags, 3)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.put_Path)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_WorkingDirectory)
        CallbackFree(this.vtbl.put_WorkingDirectory)
        CallbackFree(this.vtbl.get_Arguments)
        CallbackFree(this.vtbl.put_Arguments)
        CallbackFree(this.vtbl.get_Hotkey)
        CallbackFree(this.vtbl.put_Hotkey)
        CallbackFree(this.vtbl.get_ShowCommand)
        CallbackFree(this.vtbl.put_ShowCommand)
        CallbackFree(this.vtbl.Resolve)
        CallbackFree(this.vtbl.GetIconLocation)
        CallbackFree(this.vtbl.SetIconLocation)
        CallbackFree(this.vtbl.Save)
    }
}
