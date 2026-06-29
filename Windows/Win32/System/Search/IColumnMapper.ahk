#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }

/**
 * Retrieves property information for file based queries.
 * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nn-indexsrv-icolumnmapper
 * @namespace Windows.Win32.System.Search
 */
export default struct IColumnMapper extends IUnknown {
    /**
     * The interface identifier for IColumnMapper
     * @type {Guid}
     */
    static IID := Guid("{0b63e37a-9ccc-11d0-bcdb-00805fccce04}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IColumnMapper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPropInfoFromName : IntPtr
        GetPropInfoFromId   : IntPtr
        EnumPropInfo        : IntPtr
        IsMapUpToDate       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IColumnMapper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets property information from a name. This will return a DBID pointer in parameter ppPropId which now has to be freed by the caller and not by the callee (this class).
     * @param {PWSTR} wcsPropName The property name to look up.
     * @param {Pointer<Pointer<DBID>>} ppPropId The return Id of the property.
     * @param {Pointer<Integer>} pPropType The return type of the property.
     * @param {Pointer<Integer>} puiWidth The return property width.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-icolumnmapper-getpropinfofromname
     */
    GetPropInfoFromName(wcsPropName, ppPropId, pPropType, puiWidth) {
        wcsPropName := wcsPropName is String ? StrPtr(wcsPropName) : wcsPropName

        ppPropIdMarshal := ppPropId is VarRef ? "ptr*" : "ptr"
        pPropTypeMarshal := pPropType is VarRef ? "ushort*" : "ptr"
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", wcsPropName, ppPropIdMarshal, ppPropId, pPropTypeMarshal, pPropType, puiWidthMarshal, puiWidth, "HRESULT")
        return result
    }

    /**
     * Gets the property information from the DBID.
     * @param {Pointer<DBID>} pPropId Pointer to the property to look up.
     * @param {Pointer<Pointer<Integer>>} pwcsName The return property name.
     * @param {Pointer<Integer>} pPropType The return type of the property.
     * @param {Pointer<Integer>} puiWidth The return property width.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-icolumnmapper-getpropinfofromid
     */
    GetPropInfoFromId(pPropId, pwcsName, pPropType, puiWidth) {
        pwcsNameMarshal := pwcsName is VarRef ? "ptr*" : "ptr"
        pPropTypeMarshal := pPropType is VarRef ? "ushort*" : "ptr"
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, DBID.Ptr, pPropId, pwcsNameMarshal, pwcsName, pPropTypeMarshal, pPropType, puiWidthMarshal, puiWidth, "HRESULT")
        return result
    }

    /**
     * Gets the i-th entry from the list of properties.
     * @param {Integer} iEntry i-th entry to retrieve. Note that the entries are 0-based.
     * @param {Pointer<Pointer<Integer>>} pwcsName The return property name.
     * @param {Pointer<Pointer<DBID>>} ppPropId The Id of the property.
     * @param {Pointer<Integer>} pPropType The return type of the property.
     * @param {Pointer<Integer>} puiWidth The return property width.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-icolumnmapper-enumpropinfo
     */
    EnumPropInfo(iEntry, pwcsName, ppPropId, pPropType, puiWidth) {
        pwcsNameMarshal := pwcsName is VarRef ? "ptr*" : "ptr"
        ppPropIdMarshal := ppPropId is VarRef ? "ptr*" : "ptr"
        pPropTypeMarshal := pPropType is VarRef ? "ushort*" : "ptr"
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", iEntry, pwcsNameMarshal, pwcsName, ppPropIdMarshal, ppPropId, pPropTypeMarshal, pPropType, puiWidthMarshal, puiWidth, "HRESULT")
        return result
    }

    /**
     * Determines if the map is up to date.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-icolumnmapper-ismapuptodate
     */
    IsMapUpToDate() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IColumnMapper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPropInfoFromName := CallbackCreate(GetMethod(implObj, "GetPropInfoFromName"), flags, 5)
        this.vtbl.GetPropInfoFromId := CallbackCreate(GetMethod(implObj, "GetPropInfoFromId"), flags, 5)
        this.vtbl.EnumPropInfo := CallbackCreate(GetMethod(implObj, "EnumPropInfo"), flags, 6)
        this.vtbl.IsMapUpToDate := CallbackCreate(GetMethod(implObj, "IsMapUpToDate"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPropInfoFromName)
        CallbackFree(this.vtbl.GetPropInfoFromId)
        CallbackFree(this.vtbl.EnumPropInfo)
        CallbackFree(this.vtbl.IsMapUpToDate)
    }
}
