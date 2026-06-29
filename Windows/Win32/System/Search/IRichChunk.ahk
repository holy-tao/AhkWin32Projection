#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a chunk of data as a string and a PROPVARIANT value.
 * @remarks
 * In Windows 7, this interface is defined in structuredquerycondition.idl and structuredquerycondition.h. Prior to Windows 7 this interface was declared in structuredquery.h and structuredquery.idl.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquerycondition/nn-structuredquerycondition-irichchunk
 * @namespace Windows.Win32.System.Search
 */
export default struct IRichChunk extends IUnknown {
    /**
     * The interface identifier for IRichChunk
     * @type {Guid}
     */
    static IID := Guid("{4fdef69c-dbc9-454e-9910-b34f3c64b510}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRichChunk interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRichChunk.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the PROPVARIANT and input string that represents a chunk of data.
     * @remarks
     * Prior to Windows 7, this was declared in structuredquery.idl and structuredquery.h.
     * @param {Pointer<Integer>} pFirstPos Type: <b>ULONG*</b>
     * 
     * Receives the zero-based starting position of the range. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pLength Type: <b>ULONG*</b>
     * 
     * Receives the length of the range. This parameter can be <b>NULL</b>.
     * @param {Pointer<PWSTR>} ppsz Type: <b>LPWSTR*</b>
     * 
     * Receives the associated Unicode string value, or <b>NULL</b> if not available.
     * @param {Pointer<PROPVARIANT>} pValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Receives the associated <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> value, or <b>VT_EMPTY</b> if not available. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquerycondition/nf-structuredquerycondition-irichchunk-getdata
     */
    GetData(pFirstPos, pLength, ppsz, pValue) {
        pFirstPosMarshal := pFirstPos is VarRef ? "uint*" : "ptr"
        pLengthMarshal := pLength is VarRef ? "uint*" : "ptr"
        ppszMarshal := ppsz is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pFirstPosMarshal, pFirstPos, pLengthMarshal, pLength, ppszMarshal, ppsz, PROPVARIANT.Ptr, pValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRichChunk.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetData := CallbackCreate(GetMethod(implObj, "GetData"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetData)
    }
}
