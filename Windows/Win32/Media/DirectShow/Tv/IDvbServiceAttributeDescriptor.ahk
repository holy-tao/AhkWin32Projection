#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbServiceAttributeDescriptor extends IUnknown {
    /**
     * The interface identifier for IDvbServiceAttributeDescriptor
     * @type {Guid}
     */
    static IID := Guid("{0f37bd92-d6a1-4854-b950-3a969d27f30e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbServiceAttributeDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag                        : IntPtr
        GetLength                     : IntPtr
        GetCountOfRecords             : IntPtr
        GetRecordServiceId            : IntPtr
        GetRecordNumericSelectionFlag : IntPtr
        GetRecordVisibleServiceFlag   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbServiceAttributeDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCountOfRecords() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     */
    GetRecordServiceId(bRecordIndex) {
        result := ComCall(6, this, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {BOOL} 
     */
    GetRecordNumericSelectionFlag(bRecordIndex) {
        result := ComCall(7, this, "char", bRecordIndex, BOOL.Ptr, &pfVal := 0, "HRESULT")
        return pfVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {BOOL} 
     */
    GetRecordVisibleServiceFlag(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, BOOL.Ptr, &pfVal := 0, "HRESULT")
        return pfVal
    }

    Query(iid) {
        if (IDvbServiceAttributeDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordServiceId := CallbackCreate(GetMethod(implObj, "GetRecordServiceId"), flags, 3)
        this.vtbl.GetRecordNumericSelectionFlag := CallbackCreate(GetMethod(implObj, "GetRecordNumericSelectionFlag"), flags, 3)
        this.vtbl.GetRecordVisibleServiceFlag := CallbackCreate(GetMethod(implObj, "GetRecordVisibleServiceFlag"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordServiceId)
        CallbackFree(this.vtbl.GetRecordNumericSelectionFlag)
        CallbackFree(this.vtbl.GetRecordVisibleServiceFlag)
    }
}
