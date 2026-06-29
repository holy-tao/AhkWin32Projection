#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFsrmCollection.ahk" { IFsrmCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FsrmPropertyBagField.ahk" { FsrmPropertyBagField }
#Import ".\IFsrmPropertyBag.ahk" { IFsrmPropertyBag }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * IFsrmPropertyBag2 Interface
 * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpropertybag2
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmPropertyBag2 extends IFsrmPropertyBag {
    /**
     * The interface identifier for IFsrmPropertyBag2
     * @type {Guid}
     */
    static IID := Guid("{0e46bdbd-2402-4fed-9c30-9266e6eb2cc9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmPropertyBag2 interfaces
    */
    struct Vtbl extends IFsrmPropertyBag.Vtbl {
        GetFieldValue                : IntPtr
        GetUntrustedInFileProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmPropertyBag2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the value of the specified field from the property bag.
     * @param {FsrmPropertyBagField} field Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmpropertybagfield">FsrmPropertyBagField</a></b>
     * 
     * Indicates whether the volume name returned is the name of the volume being accessed, which may be a snapshot, or the volume where the property bag lives.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * Returns the specified value.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag2-getfieldvalue
     */
    GetFieldValue(field) {
        value := VARIANT()
        result := ComCall(28, this, FsrmPropertyBagField, field, VARIANT.Ptr, value, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {IFsrmCollection} 
     */
    GetUntrustedInFileProperties() {
        result := ComCall(29, this, "ptr*", &props := 0, "HRESULT")
        return IFsrmCollection(props)
    }

    Query(iid) {
        if (IFsrmPropertyBag2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFieldValue := CallbackCreate(GetMethod(implObj, "GetFieldValue"), flags, 3)
        this.vtbl.GetUntrustedInFileProperties := CallbackCreate(GetMethod(implObj, "GetUntrustedInFileProperties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFieldValue)
        CallbackFree(this.vtbl.GetUntrustedInFileProperties)
    }
}
