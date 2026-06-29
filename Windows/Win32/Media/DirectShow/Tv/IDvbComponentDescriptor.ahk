#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DVB_STRCONV_MODE.ahk" { DVB_STRCONV_MODE }

/**
 * Identifies the type of a Digital Video Broadcast (DVB) component stream and provides a text description of the component stream.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvbcomponentdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbComponentDescriptor extends IUnknown {
    /**
     * The interface identifier for IDvbComponentDescriptor
     * @type {Guid}
     */
    static IID := Guid("{91e405cf-80e7-457f-9096-1b9d1ce32141}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbComponentDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag           : IntPtr
        GetLength        : IntPtr
        GetStreamContent : IntPtr
        GetComponentType : IntPtr
        GetComponentTag  : IntPtr
        GetLanguageCode  : IntPtr
        GetTextW         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbComponentDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies a Digital Video Broadcast (DVB) component descriptor.
     * @returns {Integer} Receives the identifier tag. For DVB component descriptors, this value is "0x50".
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcomponentdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) component descriptor
     * @returns {Integer} Receives the descriptor length, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcomponentdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the stream content code for a Digital Video Broadcast (DVB) component descriptor.
     * @remarks
     * For a list of content codes associated with the value returned in the <i>pbVal</i>  parameter, see Table 26 in Section 6.2.9 of the DVB standards document,  
     *       <a href="https://docs.microsoft.com/">Digital Video Broadcasting Specification for Service Information (SI) in DVB systems</a>.
     * @returns {Integer} Receives the stream content code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcomponentdescriptor-getstreamcontent
     */
    GetStreamContent() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the component type code for a Digital Video Broadcast (DVB) component descriptor.
     * @remarks
     * For a list of component types associated with the value returned in the <i>pbVal</i>  parameter, see Table 26 in Section 6.2.9 of the DVB standards document,  
     *       <i>Digital Video Broadcasting Specification for Service Information (SI) in DVB systems</i>. (This resource may not be available in some languages 
     * 
     * and countries.)
     * @returns {Integer} Receives the component type code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcomponentdescriptor-getcomponenttype
     */
    GetComponentType() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the component tag from a DVB component descriptor. The component tag has the same value as the component_tag field in the stream identifier descriptor in the Program Specific Information (PSI) program map section for the component stream.
     * @returns {Integer} Receives the component tag.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcomponentdescriptor-getcomponenttag
     */
    GetComponentTag() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the three-character ISO 639 language code from a Digital Video Broadcast (DVB) component descriptor.
     * @returns {Integer} Pointer to the buffer that receives the language code. For a list of language codes, refer to the <a href="http://www.sil.org/ISO639-3/codes.asp">ISO 639 Code Tables</a>. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcomponentdescriptor-getlanguagecode
     */
    GetLanguageCode() {
        result := ComCall(8, this, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * Gets the text describing the elementary stream, in Unicode string format, from a Digital Video Broadcast (DVB) component descriptor.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Receives the event description text. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcomponentdescriptor-gettextw
     */
    GetTextW(convMode) {
        pbstrText := BSTR.Owned()
        result := ComCall(9, this, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrText, "HRESULT")
        return pbstrText
    }

    Query(iid) {
        if (IDvbComponentDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetStreamContent := CallbackCreate(GetMethod(implObj, "GetStreamContent"), flags, 2)
        this.vtbl.GetComponentType := CallbackCreate(GetMethod(implObj, "GetComponentType"), flags, 2)
        this.vtbl.GetComponentTag := CallbackCreate(GetMethod(implObj, "GetComponentTag"), flags, 2)
        this.vtbl.GetLanguageCode := CallbackCreate(GetMethod(implObj, "GetLanguageCode"), flags, 2)
        this.vtbl.GetTextW := CallbackCreate(GetMethod(implObj, "GetTextW"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetStreamContent)
        CallbackFree(this.vtbl.GetComponentType)
        CallbackFree(this.vtbl.GetComponentTag)
        CallbackFree(this.vtbl.GetLanguageCode)
        CallbackFree(this.vtbl.GetTextW)
    }
}
