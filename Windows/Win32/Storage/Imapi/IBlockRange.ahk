#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Use this interface to retrieve information about a single continuous range of sectors on the media. This interface is typically used together with the IBlockRangeList interface to describe a collection of sector ranges.
 * @remarks
 * The values returned by the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iblockrange-get_startlba">IBlockRange::get_StartLba</a> and <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iblockrange-get_endlba">IBlockRange::get_EndLba</a> methods define an inclusive range, i.e. both the start and end sectors belong to the range.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-iblockrange
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IBlockRange extends IDispatch {
    /**
     * The interface identifier for IBlockRange
     * @type {Guid}
     */
    static IID := Guid("{b507ca25-2204-11dd-966a-001aa01bbc58}")

    /**
     * The class identifier for BlockRange
     * @type {Guid}
     */
    static CLSID := Guid("{b507ca27-2204-11dd-966a-001aa01bbc58}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBlockRange interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_StartLba : IntPtr
        get_EndLba   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBlockRange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    StartLba {
        get => this.get_StartLba()
    }

    /**
     * @type {Integer} 
     */
    EndLba {
        get => this.get_EndLba()
    }

    /**
     * Retrieves the start sector of the range described by IBlockRange.
     * @returns {Integer} The start sector of the range.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iblockrange-get_startlba
     */
    get_StartLba() {
        result := ComCall(7, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the end sector of the range specified by the IBlockRange interface.
     * @remarks
     * The sector number returned by this method is included in the range.
     * @returns {Integer} The end sector of the range.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iblockrange-get_endlba
     */
    get_EndLba() {
        result := ComCall(8, this, "int*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IBlockRange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_StartLba := CallbackCreate(GetMethod(implObj, "get_StartLba"), flags, 2)
        this.vtbl.get_EndLba := CallbackCreate(GetMethod(implObj, "get_EndLba"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_StartLba)
        CallbackFree(this.vtbl.get_EndLba)
    }
}
