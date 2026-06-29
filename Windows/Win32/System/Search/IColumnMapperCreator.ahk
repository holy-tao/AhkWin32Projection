#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IColumnMapper.ahk" { IColumnMapper }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Contains a method to retrieves a column mapper object.
 * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nn-indexsrv-icolumnmappercreator
 * @namespace Windows.Win32.System.Search
 */
export default struct IColumnMapperCreator extends IUnknown {
    /**
     * The interface identifier for IColumnMapperCreator
     * @type {Guid}
     */
    static IID := Guid("{0b63e37b-9ccc-11d0-bcdb-00805fccce04}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IColumnMapperCreator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetColumnMapper : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IColumnMapperCreator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a column mapper object.
     * @param {PWSTR} wcsMachineName Machine on which the catalog exists.
     * @param {PWSTR} wcsCatalogName Catalog for which column mapper is requested.
     * @returns {IColumnMapper} Stores the outgoing column mapper pointer.
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-icolumnmappercreator-getcolumnmapper
     */
    GetColumnMapper(wcsMachineName, wcsCatalogName) {
        wcsMachineName := wcsMachineName is String ? StrPtr(wcsMachineName) : wcsMachineName
        wcsCatalogName := wcsCatalogName is String ? StrPtr(wcsCatalogName) : wcsCatalogName

        result := ComCall(3, this, "ptr", wcsMachineName, "ptr", wcsCatalogName, "ptr*", &ppColumnMapper := 0, "HRESULT")
        return IColumnMapper(ppColumnMapper)
    }

    Query(iid) {
        if (IColumnMapperCreator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetColumnMapper := CallbackCreate(GetMethod(implObj, "GetColumnMapper"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetColumnMapper)
    }
}
