#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import ".\IUrlAccessor3.ahk" { IUrlAccessor3 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Extends the functionality of the IUrlAccessor3 interface with the IUrlAccessor4::ShouldIndexItemContent method that identifies whether the content of the item should be indexed.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-iurlaccessor4
 * @namespace Windows.Win32.System.Search
 */
export default struct IUrlAccessor4 extends IUrlAccessor3 {
    /**
     * The interface identifier for IUrlAccessor4
     * @type {Guid}
     */
    static IID := Guid("{5cc51041-c8d2-41d7-bca3-9e9e286297dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUrlAccessor4 interfaces
    */
    struct Vtbl extends IUrlAccessor3.Vtbl {
        ShouldIndexItemContent : IntPtr
        ShouldIndexProperty    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUrlAccessor4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Identifies whether the item's content should be indexed.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a <b>BOOL</b> value that indicates whether the item's content should be indexed.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor4-shouldindexitemcontent
     */
    ShouldIndexItemContent() {
        result := ComCall(20, this, BOOL.Ptr, &pfIndexContent := 0, "HRESULT")
        return pfIndexContent
    }

    /**
     * Identifies whether a property should be indexed.
     * @param {Pointer<PROPERTYKEY>} key The property to index.
     * @returns {BOOL} A pointer to a value that indicates whether a property should be indexed.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor4-shouldindexproperty
     */
    ShouldIndexProperty(key) {
        result := ComCall(21, this, PROPERTYKEY.Ptr, key, BOOL.Ptr, &pfIndexProperty := 0, "HRESULT")
        return pfIndexProperty
    }

    Query(iid) {
        if (IUrlAccessor4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShouldIndexItemContent := CallbackCreate(GetMethod(implObj, "ShouldIndexItemContent"), flags, 2)
        this.vtbl.ShouldIndexProperty := CallbackCreate(GetMethod(implObj, "ShouldIndexProperty"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShouldIndexItemContent)
        CallbackFree(this.vtbl.ShouldIndexProperty)
    }
}
