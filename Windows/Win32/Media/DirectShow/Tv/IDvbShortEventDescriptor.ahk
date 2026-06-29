#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DVB_STRCONV_MODE.ahk" { DVB_STRCONV_MODE }

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) short event descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvbshorteventdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbShortEventDescriptor extends IUnknown {
    /**
     * The interface identifier for IDvbShortEventDescriptor
     * @type {Guid}
     */
    static IID := Guid("{b170be92-5b75-458e-9c6e-b0008231491a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbShortEventDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag          : IntPtr
        GetLength       : IntPtr
        GetLanguageCode : IntPtr
        GetEventNameW   : IntPtr
        GetTextW        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbShortEventDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies a Digital Video Broadcast (DVB) short event descriptor.
     * @returns {Integer} Receives the identifier tag. For DVB short event descriptors, this value is "0x4D".
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbshorteventdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) short event descriptor.
     * @returns {Integer} Receives the descriptor length, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbshorteventdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the three-character ISO 639 language code from a Digital Video Broadcast (DVB) short event descriptor.
     * @returns {Integer} Receives the language code. For a list of language codes, refer to <a href="http://www.sil.org/ISO639-3/codes.asp">this document</a>. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbshorteventdescriptor-getlanguagecode
     */
    GetLanguageCode() {
        result := ComCall(5, this, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * Gets the event name in Unicode string format from a Digital Video Broadcast (DVB) short event descriptor.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the event name. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbshorteventdescriptor-geteventnamew
     */
    GetEventNameW(convMode) {
        pbstrName := BSTR.Owned()
        result := ComCall(6, this, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Gets the text that describes the event in Unicode string format from a Digital Video Broadcast (DVB) short event descriptor.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the event description text. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbshorteventdescriptor-gettextw
     */
    GetTextW(convMode) {
        pbstrText := BSTR.Owned()
        result := ComCall(7, this, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrText, "HRESULT")
        return pbstrText
    }

    Query(iid) {
        if (IDvbShortEventDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetLanguageCode := CallbackCreate(GetMethod(implObj, "GetLanguageCode"), flags, 2)
        this.vtbl.GetEventNameW := CallbackCreate(GetMethod(implObj, "GetEventNameW"), flags, 3)
        this.vtbl.GetTextW := CallbackCreate(GetMethod(implObj, "GetTextW"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetLanguageCode)
        CallbackFree(this.vtbl.GetEventNameW)
        CallbackFree(this.vtbl.GetTextW)
    }
}
