#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBINDEXCOLUMNDESC.ahk" { DBINDEXCOLUMNDESC }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HACCESSOR.ahk" { HACCESSOR }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetIndex extends IUnknown {
    /**
     * The interface identifier for IRowsetIndex
     * @type {Guid}
     */
    static IID := Guid("{0c733a82-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetIndex interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIndexInfo : IntPtr
        Seek         : IntPtr
        SetRange     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetIndex.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Pointer>} pcKeyColumns 
     * @param {Pointer<Pointer<DBINDEXCOLUMNDESC>>} prgIndexColumnDesc 
     * @param {Pointer<Integer>} pcIndexPropertySets 
     * @param {Pointer<Pointer<DBPROPSET>>} prgIndexPropertySets 
     * @returns {HRESULT} 
     */
    GetIndexInfo(pcKeyColumns, prgIndexColumnDesc, pcIndexPropertySets, prgIndexPropertySets) {
        pcKeyColumnsMarshal := pcKeyColumns is VarRef ? "ptr*" : "ptr"
        prgIndexColumnDescMarshal := prgIndexColumnDesc is VarRef ? "ptr*" : "ptr"
        pcIndexPropertySetsMarshal := pcIndexPropertySets is VarRef ? "uint*" : "ptr"
        prgIndexPropertySetsMarshal := prgIndexPropertySets is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pcKeyColumnsMarshal, pcKeyColumns, prgIndexColumnDescMarshal, prgIndexColumnDesc, pcIndexPropertySetsMarshal, pcIndexPropertySets, prgIndexPropertySetsMarshal, prgIndexPropertySets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HACCESSOR} _hAccessor 
     * @param {Pointer} cKeyValues 
     * @param {Pointer<Void>} pData 
     * @param {Integer} dwSeekOptions 
     * @returns {HRESULT} 
     */
    Seek(_hAccessor, cKeyValues, pData, dwSeekOptions) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, HACCESSOR, _hAccessor, "ptr", cKeyValues, pDataMarshal, pData, "uint", dwSeekOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HACCESSOR} _hAccessor 
     * @param {Pointer} cStartKeyColumns 
     * @param {Pointer<Void>} pStartData 
     * @param {Pointer} cEndKeyColumns 
     * @param {Pointer<Void>} pEndData 
     * @param {Integer} dwRangeOptions 
     * @returns {HRESULT} 
     */
    SetRange(_hAccessor, cStartKeyColumns, pStartData, cEndKeyColumns, pEndData, dwRangeOptions) {
        pStartDataMarshal := pStartData is VarRef ? "ptr" : "ptr"
        pEndDataMarshal := pEndData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, HACCESSOR, _hAccessor, "ptr", cStartKeyColumns, pStartDataMarshal, pStartData, "ptr", cEndKeyColumns, pEndDataMarshal, pEndData, "uint", dwRangeOptions, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowsetIndex.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIndexInfo := CallbackCreate(GetMethod(implObj, "GetIndexInfo"), flags, 5)
        this.vtbl.Seek := CallbackCreate(GetMethod(implObj, "Seek"), flags, 5)
        this.vtbl.SetRange := CallbackCreate(GetMethod(implObj, "SetRange"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIndexInfo)
        CallbackFree(this.vtbl.Seek)
        CallbackFree(this.vtbl.SetRange)
    }
}
