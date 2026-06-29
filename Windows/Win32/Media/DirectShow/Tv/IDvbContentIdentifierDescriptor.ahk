#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that get information from a Digital Video Broadcast (DVB) content identifier descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvbcontentidentifierdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbContentIdentifierDescriptor extends IUnknown {
    /**
     * The interface identifier for IDvbContentIdentifierDescriptor
     * @type {Guid}
     */
    static IID := Guid("{05e0c1ea-f661-4053-9fbf-d93b28359838}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbContentIdentifierDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag            : IntPtr
        GetLength         : IntPtr
        GetCountOfRecords : IntPtr
        GetRecordCrid     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbContentIdentifierDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag for a Digital Video Broadcast (DVB) content identifier descriptor.
     * @returns {Integer} Receives the content identifier descriptor tag. For content identifier descriptors, this tag value is "0x76".
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcontentidentifierdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) content identifier descriptor.
     * @returns {Integer} Gets the descriptor body length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcontentidentifierdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of service records in a Digital Video Broadcast (DVB) content identifier descriptor.
     * @returns {Integer} Receives the number of service records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcontentidentifierdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the content reference identifier (CRID) from a Digital Video Broadcast (DVB) content identifier descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the service record to return. To get the number of service records in the descriptor, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbcontentidentifierdescriptor-getcountofrecords">IDvbContentIdentifierDescriptor::GetCountOfRecords</a> method.
     * @param {Pointer<Integer>} pbType Receives the type of the CRID.
     * @param {Pointer<Integer>} pbLocation Gets the location of the CRID.
     * @param {Pointer<Integer>} pbLength Gets the number of bytes required to return the CRID.
     * @param {Pointer<Pointer<Integer>>} ppbBytes Pointer to a buffer that receives the CRID. The caller is responsible for freeing this memory.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcontentidentifierdescriptor-getrecordcrid
     */
    GetRecordCrid(bRecordIndex, pbType, pbLocation, pbLength, ppbBytes) {
        pbTypeMarshal := pbType is VarRef ? "char*" : "ptr"
        pbLocationMarshal := pbLocation is VarRef ? "char*" : "ptr"
        pbLengthMarshal := pbLength is VarRef ? "char*" : "ptr"
        ppbBytesMarshal := ppbBytes is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "char", bRecordIndex, pbTypeMarshal, pbType, pbLocationMarshal, pbLocation, pbLengthMarshal, pbLength, ppbBytesMarshal, ppbBytes, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDvbContentIdentifierDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordCrid := CallbackCreate(GetMethod(implObj, "GetRecordCrid"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordCrid)
    }
}
