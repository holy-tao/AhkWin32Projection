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
     * 
     * @param {Pointer<IDiscRecorder2>} value 
     * @returns {HRESULT} 
     */
    put_Recorder(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDiscRecorder2>} value 
     * @returns {HRESULT} 
     */
    get_Recorder(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     */
    put_BufferUnderrunFreeDisabled(value) {
        result := ComCall(14, this, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     */
    get_BufferUnderrunFreeDisabled(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     */
    put_PostgapAlreadyInImage(value) {
        result := ComCall(16, this, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     */
    get_PostgapAlreadyInImage(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_CurrentMediaStatus(value) {
        result := ComCall(18, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_WriteProtectStatus(value) {
        result := ComCall(19, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_TotalSectorsOnMedia(value) {
        result := ComCall(20, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_FreeSectorsOnMedia(value) {
        result := ComCall(21, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_NextWritableAddress(value) {
        result := ComCall(22, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_StartAddressOfPreviousSession(value) {
        result := ComCall(23, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_LastWrittenAddressOfPreviousSession(value) {
        result := ComCall(24, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     */
    put_ForceMediaToBeClosed(value) {
        result := ComCall(25, this, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     */
    get_ForceMediaToBeClosed(value) {
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     */
    put_DisableConsumerDvdCompatibilityMode(value) {
        result := ComCall(27, this, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     */
    get_DisableConsumerDvdCompatibilityMode(value) {
        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_CurrentPhysicalMediaType(value) {
        result := ComCall(29, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     */
    put_ClientName(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     */
    get_ClientName(value) {
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_RequestedWriteSpeed(value) {
        result := ComCall(32, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     */
    get_RequestedRotationTypeIsPureCAV(value) {
        result := ComCall(33, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_CurrentWriteSpeed(value) {
        result := ComCall(34, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     */
    get_CurrentRotationTypeIsPureCAV(value) {
        result := ComCall(35, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} supportedSpeeds 
     * @returns {HRESULT} 
     */
    get_SupportedWriteSpeeds(supportedSpeeds) {
        result := ComCall(36, this, "ptr", supportedSpeeds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} supportedSpeedDescriptors 
     * @returns {HRESULT} 
     */
    get_SupportedWriteSpeedDescriptors(supportedSpeedDescriptors) {
        result := ComCall(37, this, "ptr", supportedSpeedDescriptors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     */
    put_ForceOverwrite(value) {
        result := ComCall(38, this, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     */
    get_ForceOverwrite(value) {
        result := ComCall(39, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} value 
     * @returns {HRESULT} 
     */
    get_MultisessionInterfaces(value) {
        result := ComCall(40, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} data 
     * @returns {HRESULT} 
     */
    Write(data) {
        result := ComCall(41, this, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelWrite() {
        result := ComCall(42, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} RequestedSectorsPerSecond 
     * @param {VARIANT_BOOL} RotationTypeIsPureCAV 
     * @returns {HRESULT} 
     */
    SetWriteSpeed(RequestedSectorsPerSecond, RotationTypeIsPureCAV) {
        result := ComCall(43, this, "int", RequestedSectorsPerSecond, "short", RotationTypeIsPureCAV, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
