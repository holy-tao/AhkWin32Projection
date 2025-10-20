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
     * 
     * @param {Pointer<BSTR>} pbs 
     * @returns {HRESULT} 
     */
    get_Path(pbs) {
        result := ComCall(7, this, "ptr", pbs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_Path(bs) {
        bs := bs is String ? BSTR.Alloc(bs).Value : bs

        result := ComCall(8, this, "ptr", bs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbs 
     * @returns {HRESULT} 
     */
    get_Description(pbs) {
        result := ComCall(9, this, "ptr", pbs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_Description(bs) {
        bs := bs is String ? BSTR.Alloc(bs).Value : bs

        result := ComCall(10, this, "ptr", bs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbs 
     * @returns {HRESULT} 
     */
    get_WorkingDirectory(pbs) {
        result := ComCall(11, this, "ptr", pbs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_WorkingDirectory(bs) {
        bs := bs is String ? BSTR.Alloc(bs).Value : bs

        result := ComCall(12, this, "ptr", bs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbs 
     * @returns {HRESULT} 
     */
    get_Arguments(pbs) {
        result := ComCall(13, this, "ptr", pbs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bs 
     * @returns {HRESULT} 
     */
    put_Arguments(bs) {
        bs := bs is String ? BSTR.Alloc(bs).Value : bs

        result := ComCall(14, this, "ptr", bs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} piHK 
     * @returns {HRESULT} 
     */
    get_Hotkey(piHK) {
        result := ComCall(15, this, "int*", piHK, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iHK 
     * @returns {HRESULT} 
     */
    put_Hotkey(iHK) {
        result := ComCall(16, this, "int", iHK, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} piShowCommand 
     * @returns {HRESULT} 
     */
    get_ShowCommand(piShowCommand) {
        result := ComCall(17, this, "int*", piShowCommand, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iShowCommand 
     * @returns {HRESULT} 
     */
    put_ShowCommand(iShowCommand) {
        result := ComCall(18, this, "int", iShowCommand, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fFlags 
     * @returns {HRESULT} 
     */
    Resolve(fFlags) {
        result := ComCall(19, this, "int", fFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbs 
     * @param {Pointer<Int32>} piIcon 
     * @returns {HRESULT} 
     */
    GetIconLocation(pbs, piIcon) {
        result := ComCall(20, this, "ptr", pbs, "int*", piIcon, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(21, this, "ptr", bs, "int", iIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vWhere 
     * @returns {HRESULT} 
     */
    Save(vWhere) {
        result := ComCall(22, this, "ptr", vWhere, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
