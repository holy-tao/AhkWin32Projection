#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FolderItem extends IDispatch{
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
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_Application(ppid) {
        result := ComCall(7, this, "ptr", ppid, "int")
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
        result := ComCall(8, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbs 
     * @returns {HRESULT} 
     */
    get_Name(pbs) {
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
    put_Name(bs) {
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
    get_Path(pbs) {
        result := ComCall(11, this, "ptr", pbs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_GetLink(ppid) {
        result := ComCall(12, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_GetFolder(ppid) {
        result := ComCall(13, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pb 
     * @returns {HRESULT} 
     */
    get_IsLink(pb) {
        result := ComCall(14, this, "ptr", pb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pb 
     * @returns {HRESULT} 
     */
    get_IsFolder(pb) {
        result := ComCall(15, this, "ptr", pb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pb 
     * @returns {HRESULT} 
     */
    get_IsFileSystem(pb) {
        result := ComCall(16, this, "ptr", pb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pb 
     * @returns {HRESULT} 
     */
    get_IsBrowsable(pb) {
        result := ComCall(17, this, "ptr", pb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdt 
     * @returns {HRESULT} 
     */
    get_ModifyDate(pdt) {
        result := ComCall(18, this, "double*", pdt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} dt 
     * @returns {HRESULT} 
     */
    put_ModifyDate(dt) {
        result := ComCall(19, this, "double", dt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pul 
     * @returns {HRESULT} 
     */
    get_Size(pul) {
        result := ComCall(20, this, "int*", pul, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbs 
     * @returns {HRESULT} 
     */
    get_Type(pbs) {
        result := ComCall(21, this, "ptr", pbs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FolderItemVerbs>} ppfic 
     * @returns {HRESULT} 
     */
    Verbs(ppfic) {
        result := ComCall(22, this, "ptr", ppfic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vVerb 
     * @returns {HRESULT} 
     */
    InvokeVerb(vVerb) {
        result := ComCall(23, this, "ptr", vVerb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
