#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDiscRecorder2.ahk
#Include .\IDiscFormat2.ahk

/**
 * Use this interface to write a data stream to a disc.
 * @remarks
 * 
  * To create the <b>MsftDiscFormat2Data</b> object in a script, use IMAPI2.MsftDiscFormat2Data as the program identifier when calling <b>CreateObject</b>.
  * 
  * It is possible for a power state transition to take place during a burn operation (i.e. user log-off or system suspend) which leads to the  interruption of the burn process and  possible data loss. For programming considerations, see <a href="https://docs.microsoft.com/windows/desktop/imapi/preventing-logoff-or-suspend-during-a-burn">Preventing Logoff or Suspend During a Burn</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-idiscformat2data
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscFormat2Data extends IDiscFormat2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiscFormat2Data
     * @type {Guid}
     */
    static IID => Guid("{27354153-9f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Recorder", "get_Recorder", "put_BufferUnderrunFreeDisabled", "get_BufferUnderrunFreeDisabled", "put_PostgapAlreadyInImage", "get_PostgapAlreadyInImage", "get_CurrentMediaStatus", "get_WriteProtectStatus", "get_TotalSectorsOnMedia", "get_FreeSectorsOnMedia", "get_NextWritableAddress", "get_StartAddressOfPreviousSession", "get_LastWrittenAddressOfPreviousSession", "put_ForceMediaToBeClosed", "get_ForceMediaToBeClosed", "put_DisableConsumerDvdCompatibilityMode", "get_DisableConsumerDvdCompatibilityMode", "get_CurrentPhysicalMediaType", "put_ClientName", "get_ClientName", "get_RequestedWriteSpeed", "get_RequestedRotationTypeIsPureCAV", "get_CurrentWriteSpeed", "get_CurrentRotationTypeIsPureCAV", "get_SupportedWriteSpeeds", "get_SupportedWriteSpeedDescriptors", "put_ForceOverwrite", "get_ForceOverwrite", "get_MultisessionInterfaces", "Write", "CancelWrite", "SetWriteSpeed"]

    /**
     * 
     * @param {IDiscRecorder2} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-put_recorder
     */
    put_Recorder(value) {
        result := ComCall(12, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDiscRecorder2} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_recorder
     */
    get_Recorder() {
        result := ComCall(13, this, "ptr*", &value := 0, "HRESULT")
        return IDiscRecorder2(value)
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-put_bufferunderrunfreedisabled
     */
    put_BufferUnderrunFreeDisabled(value) {
        result := ComCall(14, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_bufferunderrunfreedisabled
     */
    get_BufferUnderrunFreeDisabled() {
        result := ComCall(15, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-put_postgapalreadyinimage
     */
    put_PostgapAlreadyInImage(value) {
        result := ComCall(16, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_postgapalreadyinimage
     */
    get_PostgapAlreadyInImage() {
        result := ComCall(17, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_currentmediastatus
     */
    get_CurrentMediaStatus() {
        result := ComCall(18, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_writeprotectstatus
     */
    get_WriteProtectStatus() {
        result := ComCall(19, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_totalsectorsonmedia
     */
    get_TotalSectorsOnMedia() {
        result := ComCall(20, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_freesectorsonmedia
     */
    get_FreeSectorsOnMedia() {
        result := ComCall(21, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_nextwritableaddress
     */
    get_NextWritableAddress() {
        result := ComCall(22, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_startaddressofprevioussession
     */
    get_StartAddressOfPreviousSession() {
        result := ComCall(23, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_lastwrittenaddressofprevioussession
     */
    get_LastWrittenAddressOfPreviousSession() {
        result := ComCall(24, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-put_forcemediatobeclosed
     */
    put_ForceMediaToBeClosed(value) {
        result := ComCall(25, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_forcemediatobeclosed
     */
    get_ForceMediaToBeClosed() {
        result := ComCall(26, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-put_disableconsumerdvdcompatibilitymode
     */
    put_DisableConsumerDvdCompatibilityMode(value) {
        result := ComCall(27, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_disableconsumerdvdcompatibilitymode
     */
    get_DisableConsumerDvdCompatibilityMode() {
        result := ComCall(28, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_currentphysicalmediatype
     */
    get_CurrentPhysicalMediaType() {
        result := ComCall(29, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-put_clientname
     */
    put_ClientName(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(30, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_clientname
     */
    get_ClientName() {
        value := BSTR()
        result := ComCall(31, this, "ptr", value, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_requestedwritespeed
     */
    get_RequestedWriteSpeed() {
        result := ComCall(32, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_requestedrotationtypeispurecav
     */
    get_RequestedRotationTypeIsPureCAV() {
        result := ComCall(33, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_currentwritespeed
     */
    get_CurrentWriteSpeed() {
        result := ComCall(34, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_currentrotationtypeispurecav
     */
    get_CurrentRotationTypeIsPureCAV() {
        result := ComCall(35, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_supportedwritespeeds
     */
    get_SupportedWriteSpeeds() {
        result := ComCall(36, this, "ptr*", &supportedSpeeds := 0, "HRESULT")
        return supportedSpeeds
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_supportedwritespeeddescriptors
     */
    get_SupportedWriteSpeedDescriptors() {
        result := ComCall(37, this, "ptr*", &supportedSpeedDescriptors := 0, "HRESULT")
        return supportedSpeedDescriptors
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-put_forceoverwrite
     */
    put_ForceOverwrite(value) {
        result := ComCall(38, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_forceoverwrite
     */
    get_ForceOverwrite() {
        result := ComCall(39, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_multisessioninterfaces
     */
    get_MultisessionInterfaces() {
        result := ComCall(40, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {IStream} data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-write
     */
    Write(data) {
        result := ComCall(41, this, "ptr", data, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-cancelwrite
     */
    CancelWrite() {
        result := ComCall(42, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RequestedSectorsPerSecond 
     * @param {VARIANT_BOOL} RotationTypeIsPureCAV 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-setwritespeed
     */
    SetWriteSpeed(RequestedSectorsPerSecond, RotationTypeIsPureCAV) {
        result := ComCall(43, this, "int", RequestedSectorsPerSecond, "short", RotationTypeIsPureCAV, "HRESULT")
        return result
    }
}
