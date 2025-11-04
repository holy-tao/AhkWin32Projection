#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<IDiscRecorder2>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_recorder
     */
    get_Recorder(value) {
        result := ComCall(13, this, "ptr*", value, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_bufferunderrunfreedisabled
     */
    get_BufferUnderrunFreeDisabled(value) {
        result := ComCall(15, this, "ptr", value, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_postgapalreadyinimage
     */
    get_PostgapAlreadyInImage(value) {
        result := ComCall(17, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_currentmediastatus
     */
    get_CurrentMediaStatus(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_writeprotectstatus
     */
    get_WriteProtectStatus(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_totalsectorsonmedia
     */
    get_TotalSectorsOnMedia(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_freesectorsonmedia
     */
    get_FreeSectorsOnMedia(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_nextwritableaddress
     */
    get_NextWritableAddress(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_startaddressofprevioussession
     */
    get_StartAddressOfPreviousSession(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(23, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_lastwrittenaddressofprevioussession
     */
    get_LastWrittenAddressOfPreviousSession(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, valueMarshal, value, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_forcemediatobeclosed
     */
    get_ForceMediaToBeClosed(value) {
        result := ComCall(26, this, "ptr", value, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_disableconsumerdvdcompatibilitymode
     */
    get_DisableConsumerDvdCompatibilityMode(value) {
        result := ComCall(28, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_currentphysicalmediatype
     */
    get_CurrentPhysicalMediaType(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, valueMarshal, value, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_clientname
     */
    get_ClientName(value) {
        result := ComCall(31, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_requestedwritespeed
     */
    get_RequestedWriteSpeed(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_requestedrotationtypeispurecav
     */
    get_RequestedRotationTypeIsPureCAV(value) {
        result := ComCall(33, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_currentwritespeed
     */
    get_CurrentWriteSpeed(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_currentrotationtypeispurecav
     */
    get_CurrentRotationTypeIsPureCAV(value) {
        result := ComCall(35, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} supportedSpeeds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_supportedwritespeeds
     */
    get_SupportedWriteSpeeds(supportedSpeeds) {
        supportedSpeedsMarshal := supportedSpeeds is VarRef ? "ptr*" : "ptr"

        result := ComCall(36, this, supportedSpeedsMarshal, supportedSpeeds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} supportedSpeedDescriptors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_supportedwritespeeddescriptors
     */
    get_SupportedWriteSpeedDescriptors(supportedSpeedDescriptors) {
        supportedSpeedDescriptorsMarshal := supportedSpeedDescriptors is VarRef ? "ptr*" : "ptr"

        result := ComCall(37, this, supportedSpeedDescriptorsMarshal, supportedSpeedDescriptors, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_forceoverwrite
     */
    get_ForceOverwrite(value) {
        result := ComCall(39, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2data-get_multisessioninterfaces
     */
    get_MultisessionInterfaces(value) {
        valueMarshal := value is VarRef ? "ptr*" : "ptr"

        result := ComCall(40, this, valueMarshal, value, "HRESULT")
        return result
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
