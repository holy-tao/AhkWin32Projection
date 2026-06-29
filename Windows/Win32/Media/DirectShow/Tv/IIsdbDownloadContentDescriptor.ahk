#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DVB_STRCONV_MODE.ahk" { DVB_STRCONV_MODE }

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) download content descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdbdownloadcontentdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IIsdbDownloadContentDescriptor extends IUnknown {
    /**
     * The interface identifier for IIsdbDownloadContentDescriptor
     * @type {Guid}
     */
    static IID := Guid("{5298661e-cb88-4f5f-a1de-5f440c185b92}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsdbDownloadContentDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag                          : IntPtr
        GetLength                       : IntPtr
        GetFlags                        : IntPtr
        GetComponentSize                : IntPtr
        GetDownloadId                   : IntPtr
        GetTimeOutValueDII              : IntPtr
        GetLeakRate                     : IntPtr
        GetComponentTag                 : IntPtr
        GetCompatiblityDescriptorLength : IntPtr
        GetCompatiblityDescriptor       : IntPtr
        GetCountOfRecords               : IntPtr
        GetRecordModuleId               : IntPtr
        GetRecordModuleSize             : IntPtr
        GetRecordModuleInfoLength       : IntPtr
        GetRecordModuleInfo             : IntPtr
        GetTextLanguageCode             : IntPtr
        GetTextW                        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsdbDownloadContentDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies an Integrated Services Digital Broadcasting (ISDB) download content descriptor.
     * @returns {Integer} Receives the tag value. For ISDB download content descriptors, this value is 0xC9.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) download content descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets flag values from an Integrated Services Digital Broadcasting (ISDB) download content descriptor.
     * @param {Pointer<BOOL>} pfReboot Receives the value of the reboot flag. This flag is 1 if a reboot is required after the download, or 0 if it is not.
     * @param {Pointer<BOOL>} pfAddOn Receives the value of the add_on flag. This flag is 1 if the download is added to an existing file, or 0 if the download overwrites the existing file.
     * @param {Pointer<BOOL>} pfCompatibility Receives the value of the compatibility_flag field. This flag is 1 if the descriptor has a compatibility descriptor, or 0 if it does not.
     * @param {Pointer<BOOL>} pfModuleInfo Receives the value of the module_info flag. This flag is 1 if the descriptor information for each module, or 0 if it does not.
     * @param {Pointer<BOOL>} pfTextInfo Receives the value of the text_info_flag field. This flag is 1 if the descriptor includes a text description in its last field, or 0 if it does not.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getflags
     */
    GetFlags(pfReboot, pfAddOn, pfCompatibility, pfModuleInfo, pfTextInfo) {
        pfRebootMarshal := pfReboot is VarRef ? "int*" : "ptr"
        pfAddOnMarshal := pfAddOn is VarRef ? "int*" : "ptr"
        pfCompatibilityMarshal := pfCompatibility is VarRef ? "int*" : "ptr"
        pfModuleInfoMarshal := pfModuleInfo is VarRef ? "int*" : "ptr"
        pfTextInfoMarshal := pfTextInfo is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pfRebootMarshal, pfReboot, pfAddOnMarshal, pfAddOn, pfCompatibilityMarshal, pfCompatibility, pfModuleInfoMarshal, pfModuleInfo, pfTextInfoMarshal, pfTextInfo, "HRESULT")
        return result
    }

    /**
     * Gets the total size of components transmitted within the same carousel from an Integrated Services Digital Broadcasting (ISDB) download content descriptor, in bytes.
     * @returns {Integer} Receives the component size.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcomponentsize
     */
    GetComponentSize() {
        result := ComCall(6, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Gets the download identifier from an Integrated Services Digital Broadcasting (ISDB) download content descriptor. The download identifier identifies an application number for the download.
     * @returns {Integer} Receives the download identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getdownloadid
     */
    GetDownloadId() {
        result := ComCall(7, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Gets the value of the time_out_value_DII field from an Integrated Services Digital Broadcasting (ISDB) download content descriptor.
     * @returns {Integer} Receives the recommended timeout value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-gettimeoutvaluedii
     */
    GetTimeOutValueDII() {
        result := ComCall(8, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Gets the leak rate of the transport buffer from an Integrated Services Digital Broadcasting (ISDB) download content descriptor, in bytes per second.
     * @returns {Integer} Receives the leak rate.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getleakrate
     */
    GetLeakRate() {
        result := ComCall(9, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Gets the tag that identifies a stream component from an Integrated Services Digital Broadcasting (ISDB) download content descriptor. This tag also identifies the stream in the program map table (PMT).
     * @returns {Integer} Receives the component tag.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcomponenttag
     */
    GetComponentTag() {
        result := ComCall(10, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of the compatibility descriptor from an Integrated Services Digital Broadcasting (ISDB) download content descriptor.
     * @returns {Integer} Receives the length of the compatibility descriptor.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcompatiblitydescriptorlength
     */
    GetCompatiblityDescriptorLength() {
        result := ComCall(11, this, "ushort*", &pwLength := 0, "HRESULT")
        return pwLength
    }

    /**
     * Gets data from the compatibility descriptor in an Integrated Services Digital Broadcasting (ISDB) download content descriptor. The compatibility descriptor specifies a target to be updated by the download.
     * @returns {Pointer<Integer>} Pointer to a buffer that receives the compatibility descriptor. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcompatiblitydescriptor
     */
    GetCompatiblityDescriptor() {
        result := ComCall(12, this, "ptr*", &ppbData := 0, "HRESULT")
        return ppbData
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) download content descriptor, in bytes.
     * @returns {Integer} Receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(13, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the identifier from an Integrated Services Digital Broadcasting (ISDB) download content descriptor that specifies the carousel used for downloading.
     * @param {Integer} wRecordIndex Specifies the module record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcountofrecords">IIsdbDownloadContentDescriptor::GetCountOfRecords</a> method to get the number of records in the extended event descriptor.
     * @returns {Integer} Receives the module ID.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getrecordmoduleid
     */
    GetRecordModuleId(wRecordIndex) {
        result := ComCall(14, this, "ushort", wRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the size of a module from an Integrated Services Digital Broadcasting (ISDB) download content descriptor, in bytes.
     * @param {Integer} wRecordIndex Specifies the record number for the module containing the module_info_byte field,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcountofrecords">IIsdbDownloadContentDescriptor::GetCountOfRecords</a> method    to get the number of records in the download content descriptor.
     * @returns {Integer} Receives the module size.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getrecordmodulesize
     */
    GetRecordModuleSize(wRecordIndex) {
        result := ComCall(15, this, "ushort", wRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Gets the value of the module_info_length field from an Integrated Services Digital Broadcasting (ISDB) download content descriptor. The module_info_length field gives the length of the module_info_byte field in the descriptor.
     * @param {Integer} wRecordIndex Specifies the record number for the module containing the module_info_byte field,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcountofrecords">IIsdbDownloadContentDescriptor::GetCountOfRecords</a> method    to get the number of records in the extended event descriptor.
     * @returns {Integer} Receives the length of the module_info_byte field. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getrecordmoduleinfo">IIsdbDownloadContentDescriptor::GetRecordModuleInfo</a> method to get the contents of this field.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getrecordmoduleinfolength
     */
    GetRecordModuleInfoLength(wRecordIndex) {
        result := ComCall(16, this, "ushort", wRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of a module_info_byte field from a module record in an Integrated Services Digital Broadcasting (ISDB) download content descriptor.
     * @param {Integer} wRecordIndex Specifies the record number for the module containing the module_info_byte field,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcountofrecords">IIsdbDownloadContentDescriptor::GetCountOfRecords</a> method to get the number of records in the extended event descriptor.
     * @returns {Pointer<Integer>} Pointer to a buffer that receives the field value. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getrecordmoduleinfo
     */
    GetRecordModuleInfo(wRecordIndex) {
        result := ComCall(17, this, "ushort", wRecordIndex, "ptr*", &ppbData := 0, "HRESULT")
        return ppbData
    }

    /**
     * Gets the three-character ISO 639 language code from an Integrated Services Digital Broadcasting (ISDB) download content descriptor.
     * @returns {Integer} Receives the language code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-gettextlanguagecode
     */
    GetTextLanguageCode() {
        result := ComCall(18, this, "char*", &szCode := 0, "HRESULT")
        return szCode
    }

    /**
     * Gets the text from an Integrated Services Digital Broadcasting (ISDB) download content descriptor that describes the descriptor contents, in Unicode text format.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the description text. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-gettextw
     */
    GetTextW(convMode) {
        pbstrName := BSTR.Owned()
        result := ComCall(19, this, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    Query(iid) {
        if (IIsdbDownloadContentDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetFlags := CallbackCreate(GetMethod(implObj, "GetFlags"), flags, 6)
        this.vtbl.GetComponentSize := CallbackCreate(GetMethod(implObj, "GetComponentSize"), flags, 2)
        this.vtbl.GetDownloadId := CallbackCreate(GetMethod(implObj, "GetDownloadId"), flags, 2)
        this.vtbl.GetTimeOutValueDII := CallbackCreate(GetMethod(implObj, "GetTimeOutValueDII"), flags, 2)
        this.vtbl.GetLeakRate := CallbackCreate(GetMethod(implObj, "GetLeakRate"), flags, 2)
        this.vtbl.GetComponentTag := CallbackCreate(GetMethod(implObj, "GetComponentTag"), flags, 2)
        this.vtbl.GetCompatiblityDescriptorLength := CallbackCreate(GetMethod(implObj, "GetCompatiblityDescriptorLength"), flags, 2)
        this.vtbl.GetCompatiblityDescriptor := CallbackCreate(GetMethod(implObj, "GetCompatiblityDescriptor"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordModuleId := CallbackCreate(GetMethod(implObj, "GetRecordModuleId"), flags, 3)
        this.vtbl.GetRecordModuleSize := CallbackCreate(GetMethod(implObj, "GetRecordModuleSize"), flags, 3)
        this.vtbl.GetRecordModuleInfoLength := CallbackCreate(GetMethod(implObj, "GetRecordModuleInfoLength"), flags, 3)
        this.vtbl.GetRecordModuleInfo := CallbackCreate(GetMethod(implObj, "GetRecordModuleInfo"), flags, 3)
        this.vtbl.GetTextLanguageCode := CallbackCreate(GetMethod(implObj, "GetTextLanguageCode"), flags, 2)
        this.vtbl.GetTextW := CallbackCreate(GetMethod(implObj, "GetTextW"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetFlags)
        CallbackFree(this.vtbl.GetComponentSize)
        CallbackFree(this.vtbl.GetDownloadId)
        CallbackFree(this.vtbl.GetTimeOutValueDII)
        CallbackFree(this.vtbl.GetLeakRate)
        CallbackFree(this.vtbl.GetComponentTag)
        CallbackFree(this.vtbl.GetCompatiblityDescriptorLength)
        CallbackFree(this.vtbl.GetCompatiblityDescriptor)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordModuleId)
        CallbackFree(this.vtbl.GetRecordModuleSize)
        CallbackFree(this.vtbl.GetRecordModuleInfoLength)
        CallbackFree(this.vtbl.GetRecordModuleInfo)
        CallbackFree(this.vtbl.GetTextLanguageCode)
        CallbackFree(this.vtbl.GetTextW)
    }
}
