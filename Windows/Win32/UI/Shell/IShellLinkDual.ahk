#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellLinkDual extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellLinkDual
     * @type {Guid}
     */
    static IID => Guid("{88a05c00-f000-11ce-8350-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Path", "put_Path", "get_Description", "put_Description", "get_WorkingDirectory", "put_WorkingDirectory", "get_Arguments", "put_Arguments", "get_Hotkey", "put_Hotkey", "get_ShowCommand", "put_ShowCommand", "Resolve", "GetIconLocation", "SetIconLocation", "Save"]

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
        pbs := BSTR()
        result := ComCall(7, this, "ptr", pbs, "HRESULT")
        return pbs
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_Path(bs) {
        bs := bs is String ? BSTR.Alloc(bs).Value : bs

        result := ComCall(8, this, "ptr", bs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        pbs := BSTR()
        result := ComCall(9, this, "ptr", pbs, "HRESULT")
        return pbs
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_Description(bs) {
        bs := bs is String ? BSTR.Alloc(bs).Value : bs

        result := ComCall(10, this, "ptr", bs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_WorkingDirectory() {
        pbs := BSTR()
        result := ComCall(11, this, "ptr", pbs, "HRESULT")
        return pbs
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_WorkingDirectory(bs) {
        bs := bs is String ? BSTR.Alloc(bs).Value : bs

        result := ComCall(12, this, "ptr", bs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Arguments() {
        pbs := BSTR()
        result := ComCall(13, this, "ptr", pbs, "HRESULT")
        return pbs
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_Arguments(bs) {
        bs := bs is String ? BSTR.Alloc(bs).Value : bs

        result := ComCall(14, this, "ptr", bs, "HRESULT")
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
        result := ComCall(20, this, "ptr", pbs, "int*", &piIcon := 0, "HRESULT")
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

        result := ComCall(21, this, "ptr", bs, "int", iIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vWhere 
     * @returns {HRESULT} 
     */
    Save(vWhere) {
        result := ComCall(22, this, "ptr", vWhere, "HRESULT")
        return result
    }
}
