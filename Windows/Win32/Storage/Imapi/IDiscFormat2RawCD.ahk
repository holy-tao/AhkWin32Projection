#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDiscFormat2.ahk

/**
 * Use this interface to write raw images to a disc device using Disc At Once (DAO) mode (also known as uninterrupted recording).
 * @remarks
 * 
  * To create the <b>MsftDiscFormat2RawCD</b> object in a script, use IMAPI2.MsftDiscFormat2RawCD as the program identifier when calling <b>CreateObject</b>.
  * 
  * It is possible for a power state transition to take place during a burn operation (i.e. user log-off or system suspend) which leads to the  interruption of the burn process and  possible data loss. For programming considerations, see <a href="https://docs.microsoft.com/windows/desktop/imapi/preventing-logoff-or-suspend-during-a-burn">Preventing Logoff or Suspend During a Burn</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-idiscformat2rawcd
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscFormat2RawCD extends IDiscFormat2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiscFormat2RawCD
     * @type {Guid}
     */
    static IID => Guid("{27354155-8f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PrepareMedia", "WriteMedia", "WriteMedia2", "CancelWrite", "ReleaseMedia", "SetWriteSpeed", "put_Recorder", "get_Recorder", "put_BufferUnderrunFreeDisabled", "get_BufferUnderrunFreeDisabled", "get_StartOfNextSession", "get_LastPossibleStartOfLeadout", "get_CurrentPhysicalMediaType", "get_SupportedSectorTypes", "put_RequestedSectorType", "get_RequestedSectorType", "put_ClientName", "get_ClientName", "get_RequestedWriteSpeed", "get_RequestedRotationTypeIsPureCAV", "get_CurrentWriteSpeed", "get_CurrentRotationTypeIsPureCAV", "get_SupportedWriteSpeeds", "get_SupportedWriteSpeedDescriptors"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-preparemedia
     */
    PrepareMedia() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-writemedia
     */
    WriteMedia(data) {
        result := ComCall(13, this, "ptr", data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} data 
     * @param {Integer} streamLeadInSectors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-writemedia2
     */
    WriteMedia2(data, streamLeadInSectors) {
        result := ComCall(14, this, "ptr", data, "int", streamLeadInSectors, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-cancelwrite
     */
    CancelWrite() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-releasemedia
     */
    ReleaseMedia() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RequestedSectorsPerSecond 
     * @param {VARIANT_BOOL} RotationTypeIsPureCAV 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-setwritespeed
     */
    SetWriteSpeed(RequestedSectorsPerSecond, RotationTypeIsPureCAV) {
        result := ComCall(17, this, "int", RequestedSectorsPerSecond, "short", RotationTypeIsPureCAV, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDiscRecorder2} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-put_recorder
     */
    put_Recorder(value) {
        result := ComCall(18, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDiscRecorder2>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_recorder
     */
    get_Recorder(value) {
        result := ComCall(19, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-put_bufferunderrunfreedisabled
     */
    put_BufferUnderrunFreeDisabled(value) {
        result := ComCall(20, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_bufferunderrunfreedisabled
     */
    get_BufferUnderrunFreeDisabled(value) {
        result := ComCall(21, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_startofnextsession
     */
    get_StartOfNextSession(value) {
        result := ComCall(22, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_lastpossiblestartofleadout
     */
    get_LastPossibleStartOfLeadout(value) {
        result := ComCall(23, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_currentphysicalmediatype
     */
    get_CurrentPhysicalMediaType(value) {
        result := ComCall(24, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_supportedsectortypes
     */
    get_SupportedSectorTypes(value) {
        result := ComCall(25, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-put_requestedsectortype
     */
    put_RequestedSectorType(value) {
        result := ComCall(26, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_requestedsectortype
     */
    get_RequestedSectorType(value) {
        result := ComCall(27, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-put_clientname
     */
    put_ClientName(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(28, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_clientname
     */
    get_ClientName(value) {
        result := ComCall(29, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_requestedwritespeed
     */
    get_RequestedWriteSpeed(value) {
        result := ComCall(30, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_requestedrotationtypeispurecav
     */
    get_RequestedRotationTypeIsPureCAV(value) {
        result := ComCall(31, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_currentwritespeed
     */
    get_CurrentWriteSpeed(value) {
        result := ComCall(32, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_currentrotationtypeispurecav
     */
    get_CurrentRotationTypeIsPureCAV(value) {
        result := ComCall(33, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} supportedSpeeds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_supportedwritespeeds
     */
    get_SupportedWriteSpeeds(supportedSpeeds) {
        result := ComCall(34, this, "ptr*", supportedSpeeds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} supportedSpeedDescriptors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2rawcd-get_supportedwritespeeddescriptors
     */
    get_SupportedWriteSpeedDescriptors(supportedSpeedDescriptors) {
        result := ComCall(35, this, "ptr*", supportedSpeedDescriptors, "HRESULT")
        return result
    }
}
