#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFileSinkFilter.ahk" { IFileSinkFilter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IFileSinkFilter2 interface extends the IFileSinkFilter interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ifilesinkfilter2
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IFileSinkFilter2 extends IFileSinkFilter {
    /**
     * The interface identifier for IFileSinkFilter2
     * @type {Guid}
     */
    static IID := Guid("{00855b90-ce1b-11d0-bd4f-00a0c911ce86}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFileSinkFilter2 interfaces
    */
    struct Vtbl extends IFileSinkFilter.Vtbl {
        SetMode : IntPtr
        GetMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFileSinkFilter2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetMode method determines whether the file writer destroys the file when it creates the new one.
     * @param {Integer} dwFlags Currently, the only defined flag is AM_FILE_OVERWRITE, which indicates that the file writer should destroy the file. Specify zero for <i>dwFlags</i> to leave the file alone.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifilesinkfilter2-setmode
     */
    SetMode(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The GetMode method retrieves whether the file writer destroys the file when it creates the new one.
     * @returns {Integer} Pointer to the retrieved flags. Currently, the only defined flag is AM_FILE_OVERWRITE, which indicates that the file should be destroyed; zero indicates that the file will be left alone.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifilesinkfilter2-getmode
     */
    GetMode() {
        result := ComCall(6, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    Query(iid) {
        if (IFileSinkFilter2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMode := CallbackCreate(GetMethod(implObj, "SetMode"), flags, 2)
        this.vtbl.GetMode := CallbackCreate(GetMethod(implObj, "GetMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMode)
        CallbackFree(this.vtbl.GetMode)
    }
}
