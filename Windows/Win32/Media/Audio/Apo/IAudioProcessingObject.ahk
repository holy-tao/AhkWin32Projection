#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * System Effects Audio Processing Objects (sAPOs) are typically used in or called from real-time process threads.
 * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nn-audioenginebaseapo-iaudioprocessingobject
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioProcessingObject extends IUnknown{
    /**
     * The interface identifier for IAudioProcessingObject
     * @type {Guid}
     */
    static IID => Guid("{fd7f2b29-24d0-4b5c-b177-592c39f9ca10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pTime 
     * @returns {HRESULT} 
     */
    GetLatency(pTime) {
        result := ComCall(4, this, "int64*", pTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<APO_REG_PROPERTIES>} ppRegProps 
     * @returns {HRESULT} 
     */
    GetRegistrationProperties(ppRegProps) {
        result := ComCall(5, this, "ptr", ppRegProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} cbDataSize 
     * @param {Pointer<Byte>} pbyData 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(cbDataSize, pbyData) {
        result := ComCall(6, this, "uint", cbDataSize, "char*", pbyData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAudioMediaType>} pOppositeFormat 
     * @param {Pointer<IAudioMediaType>} pRequestedInputFormat 
     * @param {Pointer<IAudioMediaType>} ppSupportedInputFormat 
     * @returns {HRESULT} 
     */
    IsInputFormatSupported(pOppositeFormat, pRequestedInputFormat, ppSupportedInputFormat) {
        result := ComCall(7, this, "ptr", pOppositeFormat, "ptr", pRequestedInputFormat, "ptr", ppSupportedInputFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAudioMediaType>} pOppositeFormat 
     * @param {Pointer<IAudioMediaType>} pRequestedOutputFormat 
     * @param {Pointer<IAudioMediaType>} ppSupportedOutputFormat 
     * @returns {HRESULT} 
     */
    IsOutputFormatSupported(pOppositeFormat, pRequestedOutputFormat, ppSupportedOutputFormat) {
        result := ComCall(8, this, "ptr", pOppositeFormat, "ptr", pRequestedOutputFormat, "ptr", ppSupportedOutputFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pu32ChannelCount 
     * @returns {HRESULT} 
     */
    GetInputChannelCount(pu32ChannelCount) {
        result := ComCall(9, this, "uint*", pu32ChannelCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
