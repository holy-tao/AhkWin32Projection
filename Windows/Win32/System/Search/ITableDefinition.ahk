#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DBCOLUMNDESC.ahk" { DBCOLUMNDESC }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ITableDefinition extends IUnknown {
    /**
     * The interface identifier for ITableDefinition
     * @type {Guid}
     */
    static IID := Guid("{0c733a86-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITableDefinition interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateTable : IntPtr
        DropTable   : IntPtr
        AddColumn   : IntPtr
        DropColumn  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITableDefinition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * CreateTable creates structures and an object handle for an ITableData object which can be used to create table contents.
     * @remarks
     * The _lpAllocateBuffer_, _lpAllocateMore_, and _lpFreeBuffer_ input parameters point to the [MAPIAllocateBuffer](mapiallocatebuffer.md), [MAPIAllocateMore](mapiallocatemore.md), and [MAPIFreeBuffer](mapifreebuffer.md) functions, respectively. A client application calling **CreateTable** passes in pointers to the MAPI functions just named; a service provider passes the pointers to these functions that it received in its initialization call or retrieved with a call to the [IMAPISupport::GetMemAllocRoutines](imapisupport-getmemallocroutines.md) method.
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer} cColumnDescs 
     * @param {Pointer<DBCOLUMNDESC>} rgColumnDescs 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @param {Pointer<Pointer<DBID>>} ppTableID 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} S_OK
     *   
     * > The call succeeded and has returned the expected value or values.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/createtable
     */
    CreateTable(pUnkOuter, pTableID, cColumnDescs, rgColumnDescs, riid, cPropertySets, rgPropertySets, ppTableID, ppRowset) {
        ppTableIDMarshal := ppTableID is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pUnkOuter, DBID.Ptr, pTableID, "ptr", cColumnDescs, DBCOLUMNDESC.Ptr, rgColumnDescs, Guid.Ptr, riid, "uint", cPropertySets, DBPROPSET.Ptr, rgPropertySets, ppTableIDMarshal, ppTableID, IUnknown.Ptr, ppRowset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @returns {HRESULT} 
     */
    DropTable(pTableID) {
        result := ComCall(4, this, DBID.Ptr, pTableID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBCOLUMNDESC>} pColumnDesc 
     * @returns {Pointer<DBID>} 
     */
    AddColumn(pTableID, pColumnDesc) {
        result := ComCall(5, this, DBID.Ptr, pTableID, DBCOLUMNDESC.Ptr, pColumnDesc, "ptr*", &ppColumnID := 0, "HRESULT")
        return ppColumnID
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBID>} pColumnID 
     * @returns {HRESULT} 
     */
    DropColumn(pTableID, pColumnID) {
        result := ComCall(6, this, DBID.Ptr, pTableID, DBID.Ptr, pColumnID, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITableDefinition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateTable := CallbackCreate(GetMethod(implObj, "CreateTable"), flags, 10)
        this.vtbl.DropTable := CallbackCreate(GetMethod(implObj, "DropTable"), flags, 2)
        this.vtbl.AddColumn := CallbackCreate(GetMethod(implObj, "AddColumn"), flags, 4)
        this.vtbl.DropColumn := CallbackCreate(GetMethod(implObj, "DropColumn"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateTable)
        CallbackFree(this.vtbl.DropTable)
        CallbackFree(this.vtbl.AddColumn)
        CallbackFree(this.vtbl.DropColumn)
    }
}
