#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class Folder extends IDispatch{
    /**
     * The interface identifier for Folder
     * @type {Guid}
     */
    static IID => Guid("{bbcbde60-c3ff-11ce-8350-444553540000}")

    /**
     * The class identifier for Folder
     * @type {Guid}
     */
    static CLSID => Guid("{bbcbde60-c3ff-11ce-8350-444553540000}")

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
    get_Title(pbs) {
        result := ComCall(7, this, "ptr", pbs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_Application(ppid) {
        result := ComCall(8, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_Parent(ppid) {
        result := ComCall(9, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Folder>} ppsf 
     * @returns {HRESULT} 
     */
    get_ParentFolder(ppsf) {
        result := ComCall(10, this, "ptr", ppsf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FolderItems>} ppid 
     * @returns {HRESULT} 
     */
    Items(ppid) {
        result := ComCall(11, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bName 
     * @param {Pointer<FolderItem>} ppid 
     * @returns {HRESULT} 
     */
    ParseName(bName, ppid) {
        bName := bName is String ? BSTR.Alloc(bName).Value : bName

        result := ComCall(12, this, "ptr", bName, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bName 
     * @param {VARIANT} vOptions 
     * @returns {HRESULT} 
     */
    NewFolder(bName, vOptions) {
        bName := bName is String ? BSTR.Alloc(bName).Value : bName

        result := ComCall(13, this, "ptr", bName, "ptr", vOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vItem 
     * @param {VARIANT} vOptions 
     * @returns {HRESULT} 
     */
    MoveHere(vItem, vOptions) {
        result := ComCall(14, this, "ptr", vItem, "ptr", vOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vItem 
     * @param {VARIANT} vOptions 
     * @returns {HRESULT} 
     */
    CopyHere(vItem, vOptions) {
        result := ComCall(15, this, "ptr", vItem, "ptr", vOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vItem 
     * @param {Integer} iColumn 
     * @param {Pointer<BSTR>} pbs 
     * @returns {HRESULT} 
     */
    GetDetailsOf(vItem, iColumn, pbs) {
        result := ComCall(16, this, "ptr", vItem, "int", iColumn, "ptr", pbs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
