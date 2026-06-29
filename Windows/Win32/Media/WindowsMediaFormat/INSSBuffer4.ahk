#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\INSSBuffer3.ahk" { INSSBuffer3 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The INSSBuffer4 interface provides methods to enumerate buffer properties.
 * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nn-wmsbuffer-inssbuffer4
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct INSSBuffer4 extends INSSBuffer3 {
    /**
     * The interface identifier for INSSBuffer4
     * @type {Guid}
     */
    static IID := Guid("{b6b8fd5a-32e2-49d4-a910-c26cc85465ed}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INSSBuffer4 interfaces
    */
    struct Vtbl extends INSSBuffer3.Vtbl {
        GetPropertyCount   : IntPtr
        GetPropertyByIndex : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INSSBuffer4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetPropertyCount method retrieves the total number of buffer properties, also called data unit extensions, associated with the sample contained in the buffer object.
     * @returns {Integer} Pointer to the size of buffer properties.
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer4-getpropertycount
     */
    GetPropertyCount() {
        result := ComCall(12, this, "uint*", &pcBufferProperties := 0, "HRESULT")
        return pcBufferProperties
    }

    /**
     * The GetPropertyByIndex method retrieves a buffer property, also called a data unit extension, that was set using INSSBuffer3::SetProperty.
     * @param {Integer} dwBufferPropertyIndex <b>DWORD</b> containing the buffer property index. This value will be between zero and one less than the total number of properties associated with the sample. You can retrieve the total number of properties by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nf-wmsbuffer-inssbuffer4-getpropertycount">INSSBuffer4::GetPropertyCount</a>.
     * @param {Pointer<Guid>} pguidBufferProperty Pointer to a GUID specifying the type of buffer property.
     * @param {Pointer<Void>} pvBufferProperty Void pointer containing the value of the buffer property.
     * @param {Pointer<Integer>} pdwBufferPropertySize Pointer to a <b>DWORD</b> containing the size of the value pointed to by <i>pvBufferProperty</i>. If you set <i>pvBufferProperty</i> to <b>NULL</b>, this value will be set to the required size in bytes of the buffer needed to store the property value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer4-getpropertybyindex
     */
    GetPropertyByIndex(dwBufferPropertyIndex, pguidBufferProperty, pvBufferProperty, pdwBufferPropertySize) {
        pvBufferPropertyMarshal := pvBufferProperty is VarRef ? "ptr" : "ptr"
        pdwBufferPropertySizeMarshal := pdwBufferPropertySize is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", dwBufferPropertyIndex, Guid.Ptr, pguidBufferProperty, pvBufferPropertyMarshal, pvBufferProperty, pdwBufferPropertySizeMarshal, pdwBufferPropertySize, "HRESULT")
        return result
    }

    Query(iid) {
        if (INSSBuffer4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPropertyCount := CallbackCreate(GetMethod(implObj, "GetPropertyCount"), flags, 2)
        this.vtbl.GetPropertyByIndex := CallbackCreate(GetMethod(implObj, "GetPropertyByIndex"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPropertyCount)
        CallbackFree(this.vtbl.GetPropertyByIndex)
    }
}
