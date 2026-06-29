#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DVB_STRCONV_MODE.ahk" { DVB_STRCONV_MODE }
#Import ".\MPEG_DATE_AND_TIME.ahk" { MPEG_DATE_AND_TIME }

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) series descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdbseriesdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IIsdbSeriesDescriptor extends IUnknown {
    /**
     * The interface identifier for IIsdbSeriesDescriptor
     * @type {Guid}
     */
    static IID := Guid("{07ef6370-1660-4f26-87fc-614adab24b11}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsdbSeriesDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag               : IntPtr
        GetLength            : IntPtr
        GetSeriesId          : IntPtr
        GetRepeatLabel       : IntPtr
        GetProgramPattern    : IntPtr
        GetExpireDate        : IntPtr
        GetEpisodeNumber     : IntPtr
        GetLastEpisodeNumber : IntPtr
        GetSeriesNameW       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsdbSeriesDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies an Integrated Services Digital Broadcasting (ISDB) series descriptor.
     * @returns {Integer} Receives the tag value. For ISDB series descriptors, this value is 0xD5.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) series descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a unique series identifier from an Integrated Services Digital Broadcasting (ISDB) series descriptor.
     * @returns {Integer} Receives the series identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-getseriesid
     */
    GetSeriesId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets a label that identifies a series repeat from an Integrated Services Digital Broadcasting (ISDB) series descriptor.
     * @returns {Integer} Receives the repeat label. If this label is zero, the series is an original broadcast.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-getrepeatlabel
     */
    GetRepeatLabel() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a code that indicates how often a series is programmed from an Integrated Services Digital Broadcasting (ISDB) series descriptor.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-getprogrampattern
     */
    GetProgramPattern() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a series expiration date from an Integrated Services Digital Broadcasting (ISDB) series descriptor.
     * @param {Pointer<BOOL>} pfValid Receives a flag that indicates whether the series expiration date in the descriptor expire_date field is valid.
     * @param {Pointer<MPEG_DATE_AND_TIME>} pmdtVal Receives the date and time when the series expires.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-getexpiredate
     */
    GetExpireDate(pfValid, pmdtVal) {
        pfValidMarshal := pfValid is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pfValidMarshal, pfValid, MPEG_DATE_AND_TIME.Ptr, pmdtVal, "HRESULT")
        return result
    }

    /**
     * Gets the episode number from an Integrated Services Digital Broadcasting (ISDB) series descriptor.
     * @returns {Integer} Receives the episode number.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-getepisodenumber
     */
    GetEpisodeNumber() {
        result := ComCall(9, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the number of the last episode of a series from an Integrated Services Digital Broadcasting (ISDB) series descriptor.
     * @returns {Integer} Receives the last episode number.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-getlastepisodenumber
     */
    GetLastEpisodeNumber() {
        result := ComCall(10, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the series name from an Integrated Services Digital Broadcasting (ISDB) series descriptor.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the series name. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-getseriesnamew
     */
    GetSeriesNameW(convMode) {
        pbstrName := BSTR.Owned()
        result := ComCall(11, this, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    Query(iid) {
        if (IIsdbSeriesDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetSeriesId := CallbackCreate(GetMethod(implObj, "GetSeriesId"), flags, 2)
        this.vtbl.GetRepeatLabel := CallbackCreate(GetMethod(implObj, "GetRepeatLabel"), flags, 2)
        this.vtbl.GetProgramPattern := CallbackCreate(GetMethod(implObj, "GetProgramPattern"), flags, 2)
        this.vtbl.GetExpireDate := CallbackCreate(GetMethod(implObj, "GetExpireDate"), flags, 3)
        this.vtbl.GetEpisodeNumber := CallbackCreate(GetMethod(implObj, "GetEpisodeNumber"), flags, 2)
        this.vtbl.GetLastEpisodeNumber := CallbackCreate(GetMethod(implObj, "GetLastEpisodeNumber"), flags, 2)
        this.vtbl.GetSeriesNameW := CallbackCreate(GetMethod(implObj, "GetSeriesNameW"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetSeriesId)
        CallbackFree(this.vtbl.GetRepeatLabel)
        CallbackFree(this.vtbl.GetProgramPattern)
        CallbackFree(this.vtbl.GetExpireDate)
        CallbackFree(this.vtbl.GetEpisodeNumber)
        CallbackFree(this.vtbl.GetLastEpisodeNumber)
        CallbackFree(this.vtbl.GetSeriesNameW)
    }
}
