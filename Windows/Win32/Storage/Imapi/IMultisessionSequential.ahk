#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IMultisession.ahk" { IMultisession }

/**
 * Use this interface to retrieve information about the previous import session on a sequentially recorded media, if the media contains a previous session.
 * @remarks
 * If more than one multi-session interface exist, the application can let <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage">IFileSystemImage</a> choose a compatible multi-session interface to use  or the application can specify the multi-session interface to use by setting the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-imultisession-put_inuse">put_InUse</a> property to VARIANT_TRUE.
 * 
 * A file system creator would use the address properties to import the content of the previous session on the disc and to compute the position of the next session it will create. These properties will return the same values as the properties of the same name of the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2data">IDiscFormat2Data</a> interface.
 * 
 * This is a <b>MsftMultisessionSequential</b> object in script.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-imultisessionsequential
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IMultisessionSequential extends IMultisession {
    /**
     * The interface identifier for IMultisessionSequential
     * @type {Guid}
     */
    static IID := Guid("{27354151-7f64-5b0f-8f00-5d77afbe261e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMultisessionSequential interfaces
    */
    struct Vtbl extends IMultisession.Vtbl {
        get_IsFirstDataSession                  : IntPtr
        get_StartAddressOfPreviousSession       : IntPtr
        get_LastWrittenAddressOfPreviousSession : IntPtr
        get_NextWritableAddress                 : IntPtr
        get_FreeSectorsOnMedia                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMultisessionSequential.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsFirstDataSession {
        get => this.get_IsFirstDataSession()
    }

    /**
     * @type {Integer} 
     */
    StartAddressOfPreviousSession {
        get => this.get_StartAddressOfPreviousSession()
    }

    /**
     * @type {Integer} 
     */
    LastWrittenAddressOfPreviousSession {
        get => this.get_LastWrittenAddressOfPreviousSession()
    }

    /**
     * @type {Integer} 
     */
    NextWritableAddress {
        get => this.get_NextWritableAddress()
    }

    /**
     * @type {Integer} 
     */
    FreeSectorsOnMedia {
        get => this.get_FreeSectorsOnMedia()
    }

    /**
     * Determines if this session is the first data session on the media.
     * @remarks
     * This property is relevant on CD media that combine audio and data tracks/sessions, such as CD Extra and Mixed-Mode CD.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the session is the first data session on the media. Otherwise, the value is VARIANT_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisessionsequential-get_isfirstdatasession
     */
    get_IsFirstDataSession() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the first sector written in the previous session on the media.
     * @returns {Integer} Sector number that identifies the starting point of the previous write session.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisessionsequential-get_startaddressofprevioussession
     */
    get_StartAddressOfPreviousSession() {
        result := ComCall(12, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the last sector written in the previous session on the media.
     * @returns {Integer} Sector number that identifies the last sector written in the previous write session.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisessionsequential-get_lastwrittenaddressofprevioussession
     */
    get_LastWrittenAddressOfPreviousSession() {
        result := ComCall(13, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the next writable address on the media, including used sectors.
     * @returns {Integer} Sector number that identifies the next available sector that can record data or audio.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisessionsequential-get_nextwritableaddress
     */
    get_NextWritableAddress() {
        result := ComCall(14, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the number of free sectors available on the media.
     * @returns {Integer} Number of sectors on the disc that are available for use.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisessionsequential-get_freesectorsonmedia
     */
    get_FreeSectorsOnMedia() {
        result := ComCall(15, this, "int*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IMultisessionSequential.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_IsFirstDataSession := CallbackCreate(GetMethod(implObj, "get_IsFirstDataSession"), flags, 2)
        this.vtbl.get_StartAddressOfPreviousSession := CallbackCreate(GetMethod(implObj, "get_StartAddressOfPreviousSession"), flags, 2)
        this.vtbl.get_LastWrittenAddressOfPreviousSession := CallbackCreate(GetMethod(implObj, "get_LastWrittenAddressOfPreviousSession"), flags, 2)
        this.vtbl.get_NextWritableAddress := CallbackCreate(GetMethod(implObj, "get_NextWritableAddress"), flags, 2)
        this.vtbl.get_FreeSectorsOnMedia := CallbackCreate(GetMethod(implObj, "get_FreeSectorsOnMedia"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_IsFirstDataSession)
        CallbackFree(this.vtbl.get_StartAddressOfPreviousSession)
        CallbackFree(this.vtbl.get_LastWrittenAddressOfPreviousSession)
        CallbackFree(this.vtbl.get_NextWritableAddress)
        CallbackFree(this.vtbl.get_FreeSectorsOnMedia)
    }
}
