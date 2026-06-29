#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBINDEXCOLUMNDESC.ahk" { DBINDEXCOLUMNDESC }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IIndexDefinition extends IUnknown {
    /**
     * The interface identifier for IIndexDefinition
     * @type {Guid}
     */
    static IID := Guid("{0c733a68-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIndexDefinition interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateIndex : IntPtr
        DropIndex   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIndexDefinition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBID>} pIndexID 
     * @param {Pointer} cIndexColumnDescs 
     * @param {Pointer<DBINDEXCOLUMNDESC>} rgIndexColumnDescs 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {Pointer<DBID>} 
     */
    CreateIndex(pTableID, pIndexID, cIndexColumnDescs, rgIndexColumnDescs, cPropertySets, rgPropertySets) {
        result := ComCall(3, this, DBID.Ptr, pTableID, DBID.Ptr, pIndexID, "ptr", cIndexColumnDescs, DBINDEXCOLUMNDESC.Ptr, rgIndexColumnDescs, "uint", cPropertySets, DBPROPSET.Ptr, rgPropertySets, "ptr*", &ppIndexID := 0, "HRESULT")
        return ppIndexID
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBID>} pIndexID 
     * @returns {HRESULT} 
     */
    DropIndex(pTableID, pIndexID) {
        result := ComCall(4, this, DBID.Ptr, pTableID, DBID.Ptr, pIndexID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IIndexDefinition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateIndex := CallbackCreate(GetMethod(implObj, "CreateIndex"), flags, 8)
        this.vtbl.DropIndex := CallbackCreate(GetMethod(implObj, "DropIndex"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateIndex)
        CallbackFree(this.vtbl.DropIndex)
    }
}
