#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMultisession.ahk

/**
 * Use this interface to retrieve information about the previous import session on a sequentially recorded media, if the media contains a previous session.
 * @remarks
 * 
 * If more than one multi-session interface exist, the application can let <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage">IFileSystemImage</a> choose a compatible multi-session interface to use  or the application can specify the multi-session interface to use by setting the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-imultisession-put_inuse">put_InUse</a> property to VARIANT_TRUE.
 * 
 * A file system creator would use the address properties to import the content of the previous session on the disc and to compute the position of the next session it will create. These properties will return the same values as the properties of the same name of the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2data">IDiscFormat2Data</a> interface.
 * 
 * This is a <b>MsftMultisessionSequential</b> object in script.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-imultisessionsequential
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMultisessionSequential extends IMultisession{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultisessionSequential
     * @type {Guid}
     */
    static IID => Guid("{27354151-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsFirstDataSession", "get_StartAddressOfPreviousSession", "get_LastWrittenAddressOfPreviousSession", "get_NextWritableAddress", "get_FreeSectorsOnMedia"]

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
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the session is the first data session on the media. Otherwise, the value is VARIANT_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-imultisessionsequential-get_isfirstdatasession
     */
    get_IsFirstDataSession() {
        result := ComCall(11, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the first sector written in the previous session on the media.
     * @returns {Integer} Sector number that identifies the starting point of the previous write session.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-imultisessionsequential-get_startaddressofprevioussession
     */
    get_StartAddressOfPreviousSession() {
        result := ComCall(12, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the last sector written in the previous session on the media.
     * @returns {Integer} Sector number that identifies the last sector written in the previous write session.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-imultisessionsequential-get_lastwrittenaddressofprevioussession
     */
    get_LastWrittenAddressOfPreviousSession() {
        result := ComCall(13, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the next writable address on the media, including used sectors.
     * @returns {Integer} Sector number that identifies the next available sector that can record data or audio.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-imultisessionsequential-get_nextwritableaddress
     */
    get_NextWritableAddress() {
        result := ComCall(14, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the number of free sectors available on the media.
     * @returns {Integer} Number of sectors on the disc that are available for use.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-imultisessionsequential-get_freesectorsonmedia
     */
    get_FreeSectorsOnMedia() {
        result := ComCall(15, this, "int*", &value := 0, "HRESULT")
        return value
    }
}
