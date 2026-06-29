#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HACCESSOR.ahk" { HACCESSOR }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IReadData extends IUnknown {
    /**
     * The interface identifier for IReadData
     * @type {Guid}
     */
    static IID := Guid("{0c733a6a-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IReadData interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReadData       : IntPtr
        ReleaseChapter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IReadData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Pointer} cbBookmark 
     * @param {Pointer<Integer>} pBookmark 
     * @param {Pointer} lRowsOffset 
     * @param {HACCESSOR} _hAccessor 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer<Integer>>} ppFixedData 
     * @param {Pointer<Pointer>} pcbVariableTotal 
     * @param {Pointer<Pointer<Integer>>} ppVariableData 
     * @returns {Pointer} 
     */
    ReadData(hChapter, cbBookmark, pBookmark, lRowsOffset, _hAccessor, cRows, ppFixedData, pcbVariableTotal, ppVariableData) {
        pBookmarkMarshal := pBookmark is VarRef ? "char*" : "ptr"
        ppFixedDataMarshal := ppFixedData is VarRef ? "ptr*" : "ptr"
        pcbVariableTotalMarshal := pcbVariableTotal is VarRef ? "ptr*" : "ptr"
        ppVariableDataMarshal := ppVariableData is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hChapter, "ptr", cbBookmark, pBookmarkMarshal, pBookmark, "ptr", lRowsOffset, HACCESSOR, _hAccessor, "ptr", cRows, "ptr*", &pcRowsObtained := 0, ppFixedDataMarshal, ppFixedData, pcbVariableTotalMarshal, pcbVariableTotal, ppVariableDataMarshal, ppVariableData, "HRESULT")
        return pcRowsObtained
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @returns {HRESULT} 
     */
    ReleaseChapter(hChapter) {
        result := ComCall(4, this, "ptr", hChapter, "HRESULT")
        return result
    }

    Query(iid) {
        if (IReadData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReadData := CallbackCreate(GetMethod(implObj, "ReadData"), flags, 11)
        this.vtbl.ReleaseChapter := CallbackCreate(GetMethod(implObj, "ReleaseChapter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReadData)
        CallbackFree(this.vtbl.ReleaseChapter)
    }
}
