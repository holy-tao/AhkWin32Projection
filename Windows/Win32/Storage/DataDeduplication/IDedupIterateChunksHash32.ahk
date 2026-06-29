#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DEDUP_CHUNK_INFO_HASH32.ahk" { DEDUP_CHUNK_INFO_HASH32 }

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct IDedupIterateChunksHash32 extends IUnknown {
    /**
     * The interface identifier for IDedupIterateChunksHash32
     * @type {Guid}
     */
    static IID := Guid("{90b584d3-72aa-400f-9767-cad866a5a2d8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDedupIterateChunksHash32 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PushBuffer : IntPtr
        Next       : IntPtr
        Drain      : IntPtr
        Reset      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDedupIterateChunksHash32.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Integer} ulBufferLength 
     * @returns {HRESULT} 
     */
    PushBuffer(pBuffer, ulBufferLength) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pBufferMarshal, pBuffer, "uint", ulBufferLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulMaxChunks 
     * @param {Pointer<DEDUP_CHUNK_INFO_HASH32>} pArrChunks 
     * @param {Pointer<Integer>} pulFetched 
     * @returns {HRESULT} 
     */
    Next(ulMaxChunks, pArrChunks, pulFetched) {
        pulFetchedMarshal := pulFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", ulMaxChunks, DEDUP_CHUNK_INFO_HASH32.Ptr, pArrChunks, pulFetchedMarshal, pulFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Drain() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDedupIterateChunksHash32.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PushBuffer := CallbackCreate(GetMethod(implObj, "PushBuffer"), flags, 3)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Drain := CallbackCreate(GetMethod(implObj, "Drain"), flags, 1)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PushBuffer)
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Drain)
        CallbackFree(this.vtbl.Reset)
    }
}
