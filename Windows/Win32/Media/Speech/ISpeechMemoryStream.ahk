#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpeechBaseStream.ahk" { ISpeechBaseStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechMemoryStream extends ISpeechBaseStream {
    /**
     * The interface identifier for ISpeechMemoryStream
     * @type {Guid}
     */
    static IID := Guid("{eeb14b68-808b-4abe-a5ea-b51da7588008}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechMemoryStream interfaces
    */
    struct Vtbl extends ISpeechBaseStream.Vtbl {
        SetData : IntPtr
        GetData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechMemoryStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {VARIANT} Data 
     * @returns {HRESULT} 
     */
    SetData(Data) {
        result := ComCall(12, this, VARIANT, Data, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    GetData() {
        pData := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, pData, "HRESULT")
        return pData
    }

    Query(iid) {
        if (ISpeechMemoryStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetData := CallbackCreate(GetMethod(implObj, "SetData"), flags, 2)
        this.vtbl.GetData := CallbackCreate(GetMethod(implObj, "GetData"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetData)
        CallbackFree(this.vtbl.GetData)
    }
}
