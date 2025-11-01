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
     * 
     * @param {Pointer<BSTR>} pbs 
     * @returns {HRESULT} 
     */
    get_Path(pbs) {
        result := ComCall(7, this, "ptr", pbs, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbs 
     * @returns {HRESULT} 
     */
    get_Description(pbs) {
        result := ComCall(9, this, "ptr", pbs, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbs 
     * @returns {HRESULT} 
     */
    get_WorkingDirectory(pbs) {
        result := ComCall(11, this, "ptr", pbs, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbs 
     * @returns {HRESULT} 
     */
    get_Arguments(pbs) {
        result := ComCall(13, this, "ptr", pbs, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} piHK 
     * @returns {HRESULT} 
     */
    get_Hotkey(piHK) {
        piHKMarshal := piHK is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, piHKMarshal, piHK, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} piShowCommand 
     * @returns {HRESULT} 
     */
    get_ShowCommand(piShowCommand) {
        piShowCommandMarshal := piShowCommand is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, piShowCommandMarshal, piShowCommand, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} piIcon 
     * @returns {HRESULT} 
     */
    GetIconLocation(pbs, piIcon) {
        piIconMarshal := piIcon is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, "ptr", pbs, piIconMarshal, piIcon, "HRESULT")
        return result
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
