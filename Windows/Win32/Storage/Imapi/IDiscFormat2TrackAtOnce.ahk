#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDiscFormat2.ahk

/**
 * Use this interface to write audio to blank CD-R or CD-RW media in Track-At-Once mode.
 * @remarks
 * 
  * To create the <b>MsftDiscFormat2TrackAtOnce</b> object in a script, use IMAPI2.MsftDiscFormat2TrackAtOnce as the program identifier when calling <b>CreateObject</b>.
  * 
  * It is possible for a power state transition to take place during a burn operation (i.e. user log-off or system suspend) which leads to the  interruption of the burn process and  possible data loss. For programming considerations, see <a href="https://docs.microsoft.com/windows/desktop/imapi/preventing-logoff-or-suspend-during-a-burn">Preventing Logoff or Suspend During a Burn</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-idiscformat2trackatonce
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscFormat2TrackAtOnce extends IDiscFormat2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiscFormat2TrackAtOnce
     * @type {Guid}
     */
    static IID => Guid("{27354154-8f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PrepareMedia", "AddAudioTrack", "CancelAddTrack", "ReleaseMedia", "SetWriteSpeed", "put_Recorder", "get_Recorder", "put_BufferUnderrunFreeDisabled", "get_BufferUnderrunFreeDisabled", "get_NumberOfExistingTracks", "get_TotalSectorsOnMedia", "get_FreeSectorsOnMedia", "get_UsedSectorsOnMedia", "put_DoNotFinalizeMedia", "get_DoNotFinalizeMedia", "get_ExpectedTableOfContents", "get_CurrentPhysicalMediaType", "put_ClientName", "get_ClientName", "get_RequestedWriteSpeed", "get_RequestedRotationTypeIsPureCAV", "get_CurrentWriteSpeed", "get_CurrentRotationTypeIsPureCAV", "get_SupportedWriteSpeeds", "get_SupportedWriteSpeedDescriptors"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-preparemedia
     */
    PrepareMedia() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-addaudiotrack
     */
    AddAudioTrack(data) {
        result := ComCall(13, this, "ptr", data, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-canceladdtrack
     */
    CancelAddTrack() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-releasemedia
     */
    ReleaseMedia() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RequestedSectorsPerSecond 
     * @param {VARIANT_BOOL} RotationTypeIsPureCAV 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-setwritespeed
     */
    SetWriteSpeed(RequestedSectorsPerSecond, RotationTypeIsPureCAV) {
        result := ComCall(16, this, "int", RequestedSectorsPerSecond, "short", RotationTypeIsPureCAV, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDiscRecorder2} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-put_recorder
     */
    put_Recorder(value) {
        result := ComCall(17, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDiscRecorder2>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-get_recorder
     */
    get_Recorder(value) {
        result := ComCall(18, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-put_bufferunderrunfreedisabled
     */
    put_BufferUnderrunFreeDisabled(value) {
        result := ComCall(19, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-get_bufferunderrunfreedisabled
     */
    get_BufferUnderrunFreeDisabled(value) {
        result := ComCall(20, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-get_numberofexistingtracks
     */
    get_NumberOfExistingTracks(value) {
        result := ComCall(21, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-get_totalsectorsonmedia
     */
    get_TotalSectorsOnMedia(value) {
        result := ComCall(22, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-get_freesectorsonmedia
     */
    get_FreeSectorsOnMedia(value) {
        result := ComCall(23, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-get_usedsectorsonmedia
     */
    get_UsedSectorsOnMedia(value) {
        result := ComCall(24, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-put_donotfinalizemedia
     */
    put_DoNotFinalizeMedia(value) {
        result := ComCall(25, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-get_donotfinalizemedia
     */
    get_DoNotFinalizeMedia(value) {
        result := ComCall(26, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-get_expectedtableofcontents
     */
    get_ExpectedTableOfContents(value) {
        result := ComCall(27, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-get_currentphysicalmediatype
     */
    get_CurrentPhysicalMediaType(value) {
        result := ComCall(28, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-put_clientname
     */
    put_ClientName(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(29, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-get_clientname
     */
    get_ClientName(value) {
        result := ComCall(30, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-get_requestedwritespeed
     */
    get_RequestedWriteSpeed(value) {
        result := ComCall(31, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-get_requestedrotationtypeispurecav
     */
    get_RequestedRotationTypeIsPureCAV(value) {
        result := ComCall(32, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-get_currentwritespeed
     */
    get_CurrentWriteSpeed(value) {
        result := ComCall(33, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-get_currentrotationtypeispurecav
     */
    get_CurrentRotationTypeIsPureCAV(value) {
        result := ComCall(34, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} supportedSpeeds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-get_supportedwritespeeds
     */
    get_SupportedWriteSpeeds(supportedSpeeds) {
        result := ComCall(35, this, "ptr*", supportedSpeeds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} supportedSpeedDescriptors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2trackatonce-get_supportedwritespeeddescriptors
     */
    get_SupportedWriteSpeedDescriptors(supportedSpeedDescriptors) {
        result := ComCall(36, this, "ptr*", supportedSpeedDescriptors, "HRESULT")
        return result
    }
}
