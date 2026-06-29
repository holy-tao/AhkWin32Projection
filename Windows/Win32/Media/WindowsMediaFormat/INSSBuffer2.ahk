#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INSSBuffer.ahk" { INSSBuffer }

/**
 * The INSSBuffer2 interface inherits from INSSBuffer and defines two additional methods. Currently, neither of these methods is implemented.
 * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nn-wmsbuffer-inssbuffer2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct INSSBuffer2 extends INSSBuffer {
    /**
     * The interface identifier for INSSBuffer2
     * @type {Guid}
     */
    static IID := Guid("{4f528693-1035-43fe-b428-757561ad3a68}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INSSBuffer2 interfaces
    */
    struct Vtbl extends INSSBuffer.Vtbl {
        GetSampleProperties : IntPtr
        SetSampleProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INSSBuffer2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The INSSBuffer2 interface inherits from INSSBuffer and defines two additional methods. Currently, neither of these methods is implemented.
     * @param {Integer} cbProperties 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nn-wmsbuffer-inssbuffer2
     */
    GetSampleProperties(cbProperties) {
        result := ComCall(8, this, "uint", cbProperties, "char*", &pbProperties := 0, "HRESULT")
        return pbProperties
    }

    /**
     * The INSSBuffer2 interface inherits from INSSBuffer and defines two additional methods. Currently, neither of these methods is implemented.
     * @param {Integer} cbProperties 
     * @param {Pointer<Integer>} pbProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nn-wmsbuffer-inssbuffer2
     */
    SetSampleProperties(cbProperties, pbProperties) {
        pbPropertiesMarshal := pbProperties is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "uint", cbProperties, pbPropertiesMarshal, pbProperties, "HRESULT")
        return result
    }

    Query(iid) {
        if (INSSBuffer2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSampleProperties := CallbackCreate(GetMethod(implObj, "GetSampleProperties"), flags, 3)
        this.vtbl.SetSampleProperties := CallbackCreate(GetMethod(implObj, "SetSampleProperties"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSampleProperties)
        CallbackFree(this.vtbl.SetSampleProperties)
    }
}
