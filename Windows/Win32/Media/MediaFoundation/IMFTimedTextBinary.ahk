#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the data content of a timed-text object.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imftimedtextbinary
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTimedTextBinary extends IUnknown {
    /**
     * The interface identifier for IMFTimedTextBinary
     * @type {Guid}
     */
    static IID := Guid("{4ae3a412-0545-43c4-bf6f-6b97a5c6c432}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTimedTextBinary interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTimedTextBinary.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the data content of the timed-text object.
     * @param {Pointer<Pointer<Integer>>} data Type: <b>const BYTE**</b>
     * 
     * A pointer to a memory block that receives a pointer to the data content of the timed-text object.
     * @param {Pointer<Integer>} length Type: <b>DWORD*</b>
     * 
     * A pointer to a variable that receives the length in bytes of the data content.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextbinary-getdata
     */
    GetData(data, length) {
        dataMarshal := data is VarRef ? "ptr*" : "ptr"
        lengthMarshal := length is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, dataMarshal, data, lengthMarshal, length, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFTimedTextBinary.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetData := CallbackCreate(GetMethod(implObj, "GetData"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetData)
    }
}
