#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DVB_STRCONV_MODE.ahk" { DVB_STRCONV_MODE }

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) logo transmission descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdblogotransmissiondescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IIsdbLogoTransmissionDescriptor extends IUnknown {
    /**
     * The interface identifier for IIsdbLogoTransmissionDescriptor
     * @type {Guid}
     */
    static IID := Guid("{e0103f49-4ae1-4f07-9098-756db1fa88cd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsdbLogoTransmissionDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag                  : IntPtr
        GetLength               : IntPtr
        GetLogoTransmissionType : IntPtr
        GetLogoId               : IntPtr
        GetLogoVersion          : IntPtr
        GetDownloadDataId       : IntPtr
        GetLogoCharW            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsdbLogoTransmissionDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies an Integrated Services Digital Broadcasting (ISDB) logo transmission descriptor.
     * @returns {Integer} Receives the tag value. For ISDB logo transmission descriptors, this value is 0xCF.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) logo transmission descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the logo_transmission_type field from an Integrated Services Digital Broadcasting (ISDB) logo transmission descriptor. This field contains a code that indicates the logo transmission type.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlogotransmissiontype
     */
    GetLogoTransmissionType() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the logo identifier from an Integrated Services Digital Broadcasting (ISDB) logo transmission descriptor.
     * @returns {Integer} Receives the logo identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlogoid
     */
    GetLogoId() {
        result := ComCall(6, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the value of the logo_version field from an Integrated Services Digital Broadcasting (ISDB) logo transmission descriptor. This field contains the version number of the logo specified in the descriptor logo_id field.
     * @returns {Integer} Receives the logo version number. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlogoid">IIsdbLogoTransmissionDescriptor::GetLogoId</a> method to get the value of the logo_id field.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlogoversion
     */
    GetLogoVersion() {
        result := ComCall(7, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the value of the download_data_id field from an Integrated Services Digital Broadcasting (ISDB) logo transmission descriptor.
     * @returns {Integer} Receives the download data identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getdownloaddataid
     */
    GetDownloadDataId() {
        result := ComCall(8, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the character string for a simple logo from an Integrated Services Digital Broadcasting (ISDB) logo transmission descriptor.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the logo text. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlogocharw
     */
    GetLogoCharW(convMode) {
        pbstrChar := BSTR.Owned()
        result := ComCall(9, this, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrChar, "HRESULT")
        return pbstrChar
    }

    Query(iid) {
        if (IIsdbLogoTransmissionDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetLogoTransmissionType := CallbackCreate(GetMethod(implObj, "GetLogoTransmissionType"), flags, 2)
        this.vtbl.GetLogoId := CallbackCreate(GetMethod(implObj, "GetLogoId"), flags, 2)
        this.vtbl.GetLogoVersion := CallbackCreate(GetMethod(implObj, "GetLogoVersion"), flags, 2)
        this.vtbl.GetDownloadDataId := CallbackCreate(GetMethod(implObj, "GetDownloadDataId"), flags, 2)
        this.vtbl.GetLogoCharW := CallbackCreate(GetMethod(implObj, "GetLogoCharW"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetLogoTransmissionType)
        CallbackFree(this.vtbl.GetLogoId)
        CallbackFree(this.vtbl.GetLogoVersion)
        CallbackFree(this.vtbl.GetDownloadDataId)
        CallbackFree(this.vtbl.GetLogoCharW)
    }
}
