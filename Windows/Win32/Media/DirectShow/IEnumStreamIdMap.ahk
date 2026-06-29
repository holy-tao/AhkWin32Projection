#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\STREAM_ID_MAP.ahk" { STREAM_ID_MAP }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IEnumStreamIdMap interface is implemented on a standard COM collection of Stream ID maps that have been created by the MPEG-2 Demultiplexer's IMPEG2StreamIdMap::MapStreamId method.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ienumstreamidmap
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IEnumStreamIdMap extends IUnknown {
    /**
     * The interface identifier for IEnumStreamIdMap
     * @type {Guid}
     */
    static IID := Guid("{945c1566-6202-46fc-96c7-d87f289c6534}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumStreamIdMap interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumStreamIdMap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Next method retrieves the next n elements in the collection.
     * @remarks
     * If <i>cRequest</i> &gt;= 0 and <i>pcReceived</i> is not <b>NULL</b>, upon return <i>pcReceived</i> contains the number of stream ID maps remaining in the collection.
     * @param {Integer} cRequest The number of elements to retrieve.
     * @param {Pointer<STREAM_ID_MAP>} pStreamIdMap Address of a user-allocated array containing <i>cRequest</i> elements that will receive the retrieved <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-stream_id_map">STREAM_ID_MAP</a> structures.
     * @param {Pointer<Integer>} pcReceived Receives the number of elements actually retrieved.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails,an <b>HRESULT</b> error code is returned.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumstreamidmap-next
     */
    Next(cRequest, pStreamIdMap, pcReceived) {
        pcReceivedMarshal := pcReceived is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cRequest, STREAM_ID_MAP.Ptr, pStreamIdMap, pcReceivedMarshal, pcReceived, "HRESULT")
        return result
    }

    /**
     * The Skip method skip the element at the specified index.
     * @param {Integer} cRecords Index of the element to skip.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, an <b>HRESULT</b> error code is returned.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumstreamidmap-skip
     */
    Skip(cRecords) {
        result := ComCall(4, this, "uint", cRecords, "HRESULT")
        return result
    }

    /**
     * The Reset method moves the iterator to the beginning of the collection.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails,an <b>HRESULT</b> error code is returned.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumstreamidmap-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method copies the collection.
     * @returns {IEnumStreamIdMap} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ienumstreamidmap">IEnumStreamIdMap</a> interface of the new collection object. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumstreamidmap-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnumStreamIdMap := 0, "HRESULT")
        return IEnumStreamIdMap(ppIEnumStreamIdMap)
    }

    Query(iid) {
        if (IEnumStreamIdMap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
