#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) parental rating descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvbparentalratingdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbParentalRatingDescriptor extends IUnknown {
    /**
     * The interface identifier for IDvbParentalRatingDescriptor
     * @type {Guid}
     */
    static IID := Guid("{3ad9dde1-fb1b-4186-937f-22e6b5a72a10}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbParentalRatingDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag            : IntPtr
        GetLength         : IntPtr
        GetCountOfRecords : IntPtr
        GetRecordRating   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbParentalRatingDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that describes a Digital Video Broadcast (DVB) parental rating descriptor.
     * @returns {Integer} Receives the parental rating descriptor tag. This value is "0x55" for parental rating descriptors.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbparentalratingdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) parental rating descriptor, in bytes,.
     * @returns {Integer} Receives the descriptor length, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbparentalratingdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of records in a Digital Video Broadcast (DVB) parental rating descriptor.
     * @returns {Integer} Receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbparentalratingdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a code that indicates the age-based rating for a Digital Video Broadcast (DVB) broadcast from a DVB parental rating descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the descriptor to return. To get the number of descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbparentalratingdescriptor-getcountofrecords">IDvbParentalRatingDescriptor::GetCountOfRecords</a>.
     * @param {Pointer<Integer>} pszCountryCode Receives the ISO 3166 country code from the parental rating descriptor.
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbparentalratingdescriptor-getrecordrating
     */
    GetRecordRating(bRecordIndex, pszCountryCode, pbVal) {
        pszCountryCodeMarshal := pszCountryCode is VarRef ? "char*" : "ptr"
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "char", bRecordIndex, pszCountryCodeMarshal, pszCountryCode, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDvbParentalRatingDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordRating := CallbackCreate(GetMethod(implObj, "GetRecordRating"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordRating)
    }
}
