#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFaxIncomingMessageIterator.ahk" { IFaxIncomingMessageIterator }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxIncomingMessage.ahk" { IFaxIncomingMessage }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IFaxIncomingArchive interface is used by a fax client application to access and configure the archive of inbound fax messages received successfully by the fax service.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxincomingarchive
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxIncomingArchive extends IDispatch {
    /**
     * The interface identifier for IFaxIncomingArchive
     * @type {Guid}
     */
    static IID := Guid("{76062cc7-f714-4fbd-aa06-ed6e4a4b70f3}")

    /**
     * The class identifier for FaxIncomingArchive
     * @type {Guid}
     */
    static CLSID := Guid("{8426c56a-35a1-4c6f-af93-fc952422e2c2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxIncomingArchive interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_UseArchive         : IntPtr
        put_UseArchive         : IntPtr
        get_ArchiveFolder      : IntPtr
        put_ArchiveFolder      : IntPtr
        get_SizeQuotaWarning   : IntPtr
        put_SizeQuotaWarning   : IntPtr
        get_HighQuotaWaterMark : IntPtr
        put_HighQuotaWaterMark : IntPtr
        get_LowQuotaWaterMark  : IntPtr
        put_LowQuotaWaterMark  : IntPtr
        get_AgeLimit           : IntPtr
        put_AgeLimit           : IntPtr
        get_SizeLow            : IntPtr
        get_SizeHigh           : IntPtr
        Refresh                : IntPtr
        Save                   : IntPtr
        GetMessages            : IntPtr
        GetMessage             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxIncomingArchive.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    UseArchive {
        get => this.get_UseArchive()
        set => this.put_UseArchive(value)
    }

    /**
     * @type {BSTR} 
     */
    ArchiveFolder {
        get => this.get_ArchiveFolder()
        set => this.put_ArchiveFolder(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    SizeQuotaWarning {
        get => this.get_SizeQuotaWarning()
        set => this.put_SizeQuotaWarning(value)
    }

    /**
     * @type {Integer} 
     */
    HighQuotaWaterMark {
        get => this.get_HighQuotaWaterMark()
        set => this.put_HighQuotaWaterMark(value)
    }

    /**
     * @type {Integer} 
     */
    LowQuotaWaterMark {
        get => this.get_LowQuotaWaterMark()
        set => this.put_LowQuotaWaterMark(value)
    }

    /**
     * @type {Integer} 
     */
    AgeLimit {
        get => this.get_AgeLimit()
        set => this.put_AgeLimit(value)
    }

    /**
     * @type {Integer} 
     */
    SizeLow {
        get => this.get_SizeLow()
    }

    /**
     * @type {Integer} 
     */
    SizeHigh {
        get => this.get_SizeHigh()
    }

    /**
     * The UseArchive property is a Boolean value that indicates whether the fax service archives inbound fax messages. (Get)
     * @remarks
     * <div class="alert"><b>Note</b>  This property is not supported in Windows Vista, Windows Server 2008, and later versions of Windows. To access this property in Windows Vista, Windows Server 2008, and later versions of Windows,  get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxconfiguration">IFaxConfiguration</a> interface from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxserver2">IFaxServer2</a> interface, and then call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-usearchive-vb">IFaxConfiguration::put_UseArchive</a>   or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-usearchive-vb">IFaxConfiguration::get_UseArchive</a> method.</div>
     * <div> </div>
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_usearchive
     */
    get_UseArchive() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &pbUseArchive := 0, "HRESULT")
        return pbUseArchive
    }

    /**
     * The UseArchive property is a Boolean value that indicates whether the fax service archives inbound fax messages. (Put)
     * @remarks
     * <div class="alert"><b>Note</b>  This property is not supported in Windows Vista, Windows Server 2008, and later versions of Windows. To access this property in Windows Vista, Windows Server 2008, and later versions of Windows,  get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxconfiguration">IFaxConfiguration</a> interface from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxserver2">IFaxServer2</a> interface, and then call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-usearchive-vb">IFaxConfiguration::put_UseArchive</a>   or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-usearchive-vb">IFaxConfiguration::get_UseArchive</a> method.</div>
     * <div> </div>
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {VARIANT_BOOL} bUseArchive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-put_usearchive
     */
    put_UseArchive(bUseArchive) {
        result := ComCall(8, this, VARIANT_BOOL, bUseArchive, "HRESULT")
        return result
    }

    /**
     * The ArchiveFolder property is a null-terminated string that specifies the folder location on the fax server for archived inbound faxes. (Get)
     * @remarks
     * <div class="alert"><b>Note</b>  This property is not supported in Windows Vista, Windows Server 2008, and later versions of Windows. To access this property in Windows Vista, Windows Server 2008, and later versions of Windows,  get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxconfiguration">IFaxConfiguration</a> interface from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxserver2">IFaxServer2</a> interface, and then call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-archivelocation-vb">IFaxConfiguration::put_ArchiveLocation</a>   or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-archivelocation-vb">IFaxConfiguration::get_ArchiveLocation</a> method.</div>
     * <div> </div>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_archivefolder
     */
    get_ArchiveFolder() {
        pbstrArchiveFolder := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrArchiveFolder, "HRESULT")
        return pbstrArchiveFolder
    }

    /**
     * The ArchiveFolder property is a null-terminated string that specifies the folder location on the fax server for archived inbound faxes. (Put)
     * @remarks
     * <div class="alert"><b>Note</b>  This property is not supported in Windows Vista, Windows Server 2008, and later versions of Windows. To access this property in Windows Vista, Windows Server 2008, and later versions of Windows,  get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxconfiguration">IFaxConfiguration</a> interface from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxserver2">IFaxServer2</a> interface, and then call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-archivelocation-vb">IFaxConfiguration::put_ArchiveLocation</a>   or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-archivelocation-vb">IFaxConfiguration::get_ArchiveLocation</a> method.</div>
     * <div> </div>
     * @param {BSTR} bstrArchiveFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-put_archivefolder
     */
    put_ArchiveFolder(bstrArchiveFolder) {
        bstrArchiveFolder := bstrArchiveFolder is String ? BSTR.Alloc(bstrArchiveFolder).Value : bstrArchiveFolder

        result := ComCall(10, this, BSTR, bstrArchiveFolder, "HRESULT")
        return result
    }

    /**
     * The SizeQuotaWarning property is a Boolean value that indicates whether the fax service issues a warning in the event log when the size of the inbound archive exceeds the limit defined by the HighQuotaWaterMark property. (Get)
     * @remarks
     * <div class="alert"><b>Note</b>  This property is not supported in Windows Vista, Windows Server 2008, and later versions of Windows. To access this property in Windows Vista, Windows Server 2008, and later versions of Windows,  get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxconfiguration">IFaxConfiguration</a> interface from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxserver2">IFaxServer2</a> interface, and then call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-sizequotawarning-vb">IFaxConfiguration::put_SizeQuotaWarning</a>   or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-sizequotawarning-vb">IFaxConfiguration::get_SizeQuotaWarning</a> method.</div>
     * <div> </div>
     * If this property is equal to <b>TRUE</b>, the fax service will issue a warning when the number of fax messages exceeds the threshold. If this property is equal to <b>FALSE</b>, the fax service does not issue a warning.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_sizequotawarning
     */
    get_SizeQuotaWarning() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &pbSizeQuotaWarning := 0, "HRESULT")
        return pbSizeQuotaWarning
    }

    /**
     * The SizeQuotaWarning property is a Boolean value that indicates whether the fax service issues a warning in the event log when the size of the inbound archive exceeds the limit defined by the HighQuotaWaterMark property. (Put)
     * @remarks
     * <div class="alert"><b>Note</b>  This property is not supported in Windows Vista, Windows Server 2008, and later versions of Windows. To access this property in Windows Vista, Windows Server 2008, and later versions of Windows,  get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxconfiguration">IFaxConfiguration</a> interface from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxserver2">IFaxServer2</a> interface, and then call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-sizequotawarning-vb">IFaxConfiguration::put_SizeQuotaWarning</a>   or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-sizequotawarning-vb">IFaxConfiguration::get_SizeQuotaWarning</a> method.</div>
     * <div> </div>
     * If this property is equal to <b>TRUE</b>, the fax service will issue a warning when the number of fax messages exceeds the threshold. If this property is equal to <b>FALSE</b>, the fax service does not issue a warning.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {VARIANT_BOOL} bSizeQuotaWarning 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-put_sizequotawarning
     */
    put_SizeQuotaWarning(bSizeQuotaWarning) {
        result := ComCall(12, this, VARIANT_BOOL, bSizeQuotaWarning, "HRESULT")
        return result
    }

    /**
     * The HighQuotaWaterMark property is a value that specifies the upper warning threshold for the size of the archive of inbound fax messages, in megabytes. (Get)
     * @remarks
     * <div class="alert"><b>Note</b>  This property is not supported in Windows Vista, Windows Server 2008, and later versions of Windows. To access this property in Windows Vista, Windows Server 2008, and later versions of Windows,  get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxconfiguration">IFaxConfiguration</a> interface from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxserver2">IFaxServer2</a> interface, and then call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-highquotawatermark-vb">IFaxConfiguration::put_HighQuotaWaterMark</a>   or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-highquotawatermark-vb">IFaxConfiguration::get_HighQuotaWaterMark</a> method.</div>
     * <div> </div>
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_highquotawatermark
     */
    get_HighQuotaWaterMark() {
        result := ComCall(13, this, "int*", &plHighQuotaWaterMark := 0, "HRESULT")
        return plHighQuotaWaterMark
    }

    /**
     * The HighQuotaWaterMark property is a value that specifies the upper warning threshold for the size of the archive of inbound fax messages, in megabytes. (Put)
     * @remarks
     * <div class="alert"><b>Note</b>  This property is not supported in Windows Vista, Windows Server 2008, and later versions of Windows. To access this property in Windows Vista, Windows Server 2008, and later versions of Windows,  get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxconfiguration">IFaxConfiguration</a> interface from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxserver2">IFaxServer2</a> interface, and then call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-highquotawatermark-vb">IFaxConfiguration::put_HighQuotaWaterMark</a>   or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-highquotawatermark-vb">IFaxConfiguration::get_HighQuotaWaterMark</a> method.</div>
     * <div> </div>
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {Integer} lHighQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-put_highquotawatermark
     */
    put_HighQuotaWaterMark(lHighQuotaWaterMark) {
        result := ComCall(14, this, "int", lHighQuotaWaterMark, "HRESULT")
        return result
    }

    /**
     * The LowQuotaWaterMark property is a value that specifies the lower warning threshold for the archive of inbound fax messages, in megabytes. (Get)
     * @remarks
     * <div class="alert"><b>Note</b>  This property is not supported in Windows Vista, Windows Server 2008, and later versions of Windows. To access this property in Windows Vista, Windows Server 2008, and later versions of Windows,  get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxconfiguration">IFaxConfiguration</a> interface from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxserver2">IFaxServer2</a> interface, and then call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-lowquotawatermark-vb">IFaxConfiguration::put_LowQuotaWaterMark</a>   or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-lowquotawatermark-vb">IFaxConfiguration::get_LowQuotaWaterMark</a> method.</div>
     * <div> </div>
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_lowquotawatermark
     */
    get_LowQuotaWaterMark() {
        result := ComCall(15, this, "int*", &plLowQuotaWaterMark := 0, "HRESULT")
        return plLowQuotaWaterMark
    }

    /**
     * The LowQuotaWaterMark property is a value that specifies the lower warning threshold for the archive of inbound fax messages, in megabytes. (Put)
     * @remarks
     * <div class="alert"><b>Note</b>  This property is not supported in Windows Vista, Windows Server 2008, and later versions of Windows. To access this property in Windows Vista, Windows Server 2008, and later versions of Windows,  get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxconfiguration">IFaxConfiguration</a> interface from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxserver2">IFaxServer2</a> interface, and then call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-lowquotawatermark-vb">IFaxConfiguration::put_LowQuotaWaterMark</a>   or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-lowquotawatermark-vb">IFaxConfiguration::get_LowQuotaWaterMark</a> method.</div>
     * <div> </div>
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {Integer} lLowQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-put_lowquotawatermark
     */
    put_LowQuotaWaterMark(lLowQuotaWaterMark) {
        result := ComCall(16, this, "int", lLowQuotaWaterMark, "HRESULT")
        return result
    }

    /**
     * The AgeLimit property is a value that indicates the number of days that the fax service retains fax messages in the archive of inbound faxes. (Get)
     * @remarks
     * <div class="alert"><b>Note</b>  This property is not supported in Windows Vista, Windows Server 2008, and later versions of Windows. To access this property in Windows Vista, Windows Server 2008, and later versions of Windows,  get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxconfiguration">IFaxConfiguration</a> interface from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxserver2">IFaxServer2</a> interface, and then call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-archiveagelimit-vb">IFaxConfiguration::put_ArchiveAgeLimit</a>   or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-archiveagelimit-vb">IFaxConfiguration::get_ArchiveAgeLimit</a> method.</div>
     * <div> </div>
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_agelimit
     */
    get_AgeLimit() {
        result := ComCall(17, this, "int*", &plAgeLimit := 0, "HRESULT")
        return plAgeLimit
    }

    /**
     * The AgeLimit property is a value that indicates the number of days that the fax service retains fax messages in the archive of inbound faxes. (Put)
     * @remarks
     * <div class="alert"><b>Note</b>  This property is not supported in Windows Vista, Windows Server 2008, and later versions of Windows. To access this property in Windows Vista, Windows Server 2008, and later versions of Windows,  get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxconfiguration">IFaxConfiguration</a> interface from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxserver2">IFaxServer2</a> interface, and then call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-archiveagelimit-vb">IFaxConfiguration::put_ArchiveAgeLimit</a>   or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-archiveagelimit-vb">IFaxConfiguration::get_ArchiveAgeLimit</a> method.</div>
     * <div> </div>
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {Integer} lAgeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-put_agelimit
     */
    put_AgeLimit(lAgeLimit) {
        result := ComCall(18, this, "int", lAgeLimit, "HRESULT")
        return result
    }

    /**
     * The SizeLow property is a value that specifies the low 32-bit value (in bytes) for the size of the archive of inbound fax messages.
     * @remarks
     * <div class="alert"><b>Note</b>  This property is not supported in Windows Vista, Windows Server 2008, and later versions of Windows.</div>
     * <div> </div>
     * Because the archive may exceed 4 GB in size, the archive's size is described using two long values. SizeLow is the low 32-bit value of the archive size. SizeHigh is the high 32-bit value of the archive size. The size of the archive is: SizeLow + 4 GB * SizeHigh.
     * 
     * If both the <b>SizeLow</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingarchive-sizehigh-vb">SizeHigh</a> properties have the value 0xffffffff, they specify an invalid archive size, and you should ignore both property values.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_sizelow
     */
    get_SizeLow() {
        result := ComCall(19, this, "int*", &plSizeLow := 0, "HRESULT")
        return plSizeLow
    }

    /**
     * The SizeHigh property is a value that specifies the high 32-bit value (in bytes) for the size of the archive of inbound fax messages.
     * @remarks
     * <div class="alert"><b>Note</b>  This property is not supported in Windows Vista, Windows Server 2008, and later versions of Windows.</div>
     * <div> </div>
     * Because the archive may exceed 4 GB in size, the archive's size is described using two long values. SizeLow is the low 32-bit value of the archive size. SizeHigh is the high 32-bit value of the archive size. The size of the archive is: SizeLow + 4 GB * SizeHigh.
     * 
     * If both the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingarchive-sizelow-vb">SizeLow</a> and <b>SizeHigh</b> properties have the value 0xffffffff, they specify an invalid archive size, and you should ignore both property values.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_sizehigh
     */
    get_SizeHigh() {
        result := ComCall(20, this, "int*", &plSizeHigh := 0, "HRESULT")
        return plSizeHigh
    }

    /**
     * The Refresh method refreshes FaxIncomingArchive object information from the fax server. When the Refresh method is called, any configuration changes made after the last Save method call are lost.
     * @remarks
     * <div class="alert"><b>Note</b>  In Windows Vista, Windows Server 2008, and later versions of Windows, this method is not supported and returns an error.</div>
     * <div> </div>
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-refresh
     */
    Refresh() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * The Save method saves the FaxIncomingArchive object's data.
     * @remarks
     * <div class="alert"><b>Note</b>  In Windows Vista, Windows Server 2008, and later versions of Windows, this method is not supported and returns an error.</div>
     * <div> </div>
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access rights.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-save
     */
    Save() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * The GetMessages method returns a new iterator (archive cursor) for the archive of inbound fax messages.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_IN_ARCHIVE</a> access right.
     * @param {Integer} lPrefetchSize Type: <b>long</b>
     * 
     * <b>long</b> value that indicates the size of the prefetch buffer. This value determines how many fax messages the iterator object retrieves from the fax server when the object needs to refresh its contents. The default value is <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ldefault-prefetch-size">lDEFAULT_PREFETCH_SIZE</a>.
     * @returns {IFaxIncomingMessageIterator} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxincomingmessageiterator">IFaxIncomingMessageIterator</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessageiterator">FaxIncomingMessageIterator</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-getmessages
     */
    GetMessages(lPrefetchSize) {
        result := ComCall(23, this, "int", lPrefetchSize, "ptr*", &pFaxIncomingMessageIterator := 0, "HRESULT")
        return IFaxIncomingMessageIterator(pFaxIncomingMessageIterator)
    }

    /**
     * The GetMessage method returns a fax message from the archive of inbound faxes by using the fax message ID.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_IN_ARCHIVE</a> access right.
     * @param {BSTR} bstrMessageId Type: <b>BSTR</b>
     * 
     * Specifies a null-terminated string that contains the message ID of the fax to retrieve from the archive of inbound faxes.
     * @returns {IFaxIncomingMessage} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxincomingmessage">IFaxIncomingMessage</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingmessage">FaxIncomingMessage</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-getmessage
     */
    GetMessage(bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(24, this, BSTR, bstrMessageId, "ptr*", &pFaxIncomingMessage := 0, "HRESULT")
        return IFaxIncomingMessage(pFaxIncomingMessage)
    }

    Query(iid) {
        if (IFaxIncomingArchive.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_UseArchive := CallbackCreate(GetMethod(implObj, "get_UseArchive"), flags, 2)
        this.vtbl.put_UseArchive := CallbackCreate(GetMethod(implObj, "put_UseArchive"), flags, 2)
        this.vtbl.get_ArchiveFolder := CallbackCreate(GetMethod(implObj, "get_ArchiveFolder"), flags, 2)
        this.vtbl.put_ArchiveFolder := CallbackCreate(GetMethod(implObj, "put_ArchiveFolder"), flags, 2)
        this.vtbl.get_SizeQuotaWarning := CallbackCreate(GetMethod(implObj, "get_SizeQuotaWarning"), flags, 2)
        this.vtbl.put_SizeQuotaWarning := CallbackCreate(GetMethod(implObj, "put_SizeQuotaWarning"), flags, 2)
        this.vtbl.get_HighQuotaWaterMark := CallbackCreate(GetMethod(implObj, "get_HighQuotaWaterMark"), flags, 2)
        this.vtbl.put_HighQuotaWaterMark := CallbackCreate(GetMethod(implObj, "put_HighQuotaWaterMark"), flags, 2)
        this.vtbl.get_LowQuotaWaterMark := CallbackCreate(GetMethod(implObj, "get_LowQuotaWaterMark"), flags, 2)
        this.vtbl.put_LowQuotaWaterMark := CallbackCreate(GetMethod(implObj, "put_LowQuotaWaterMark"), flags, 2)
        this.vtbl.get_AgeLimit := CallbackCreate(GetMethod(implObj, "get_AgeLimit"), flags, 2)
        this.vtbl.put_AgeLimit := CallbackCreate(GetMethod(implObj, "put_AgeLimit"), flags, 2)
        this.vtbl.get_SizeLow := CallbackCreate(GetMethod(implObj, "get_SizeLow"), flags, 2)
        this.vtbl.get_SizeHigh := CallbackCreate(GetMethod(implObj, "get_SizeHigh"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
        this.vtbl.GetMessages := CallbackCreate(GetMethod(implObj, "GetMessages"), flags, 3)
        this.vtbl.GetMessage := CallbackCreate(GetMethod(implObj, "GetMessage"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_UseArchive)
        CallbackFree(this.vtbl.put_UseArchive)
        CallbackFree(this.vtbl.get_ArchiveFolder)
        CallbackFree(this.vtbl.put_ArchiveFolder)
        CallbackFree(this.vtbl.get_SizeQuotaWarning)
        CallbackFree(this.vtbl.put_SizeQuotaWarning)
        CallbackFree(this.vtbl.get_HighQuotaWaterMark)
        CallbackFree(this.vtbl.put_HighQuotaWaterMark)
        CallbackFree(this.vtbl.get_LowQuotaWaterMark)
        CallbackFree(this.vtbl.put_LowQuotaWaterMark)
        CallbackFree(this.vtbl.get_AgeLimit)
        CallbackFree(this.vtbl.put_AgeLimit)
        CallbackFree(this.vtbl.get_SizeLow)
        CallbackFree(this.vtbl.get_SizeHigh)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.GetMessages)
        CallbackFree(this.vtbl.GetMessage)
    }
}
