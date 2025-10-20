#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk

/**
 * Manages an Advanced Systems Format (ASF) profile.
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nn-wmcontainer-imfasfprofile
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFProfile extends IMFAttributes{
    /**
     * The interface identifier for IMFASFProfile
     * @type {Guid}
     */
    static IID => Guid("{d267bf6a-028b-4e0d-903d-43f0ef82d0d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * 
     * @param {Pointer<UInt32>} pcStreams 
     * @returns {HRESULT} 
     */
    GetStreamCount(pcStreams) {
        result := ComCall(33, this, "uint*", pcStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<UInt16>} pwStreamNumber 
     * @param {Pointer<IMFASFStreamConfig>} ppIStream 
     * @returns {HRESULT} 
     */
    GetStream(dwStreamIndex, pwStreamNumber, ppIStream) {
        result := ComCall(34, this, "uint", dwStreamIndex, "ushort*", pwStreamNumber, "ptr", ppIStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {Pointer<IMFASFStreamConfig>} ppIStream 
     * @returns {HRESULT} 
     */
    GetStreamByNumber(wStreamNumber, ppIStream) {
        result := ComCall(35, this, "ushort", wStreamNumber, "ptr", ppIStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFStreamConfig>} pIStream 
     * @returns {HRESULT} 
     */
    SetStream(pIStream) {
        result := ComCall(36, this, "ptr", pIStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @returns {HRESULT} 
     */
    RemoveStream(wStreamNumber) {
        result := ComCall(37, this, "ushort", wStreamNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaType>} pIMediaType 
     * @param {Pointer<IMFASFStreamConfig>} ppIStream 
     * @returns {HRESULT} 
     */
    CreateStream(pIMediaType, ppIStream) {
        result := ComCall(38, this, "ptr", pIMediaType, "ptr", ppIStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcMutexs 
     * @returns {HRESULT} 
     */
    GetMutualExclusionCount(pcMutexs) {
        result := ComCall(39, this, "uint*", pcMutexs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMutexIndex 
     * @param {Pointer<IMFASFMutualExclusion>} ppIMutex 
     * @returns {HRESULT} 
     */
    GetMutualExclusion(dwMutexIndex, ppIMutex) {
        result := ComCall(40, this, "uint", dwMutexIndex, "ptr", ppIMutex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFMutualExclusion>} pIMutex 
     * @returns {HRESULT} 
     */
    AddMutualExclusion(pIMutex) {
        result := ComCall(41, this, "ptr", pIMutex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMutexIndex 
     * @returns {HRESULT} 
     */
    RemoveMutualExclusion(dwMutexIndex) {
        result := ComCall(42, this, "uint", dwMutexIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFMutualExclusion>} ppIMutex 
     * @returns {HRESULT} 
     */
    CreateMutualExclusion(ppIMutex) {
        result := ComCall(43, this, "ptr", ppIMutex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFStreamPrioritization>} ppIStreamPrioritization 
     * @returns {HRESULT} 
     */
    GetStreamPrioritization(ppIStreamPrioritization) {
        result := ComCall(44, this, "ptr", ppIStreamPrioritization, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFStreamPrioritization>} pIStreamPrioritization 
     * @returns {HRESULT} 
     */
    AddStreamPrioritization(pIStreamPrioritization) {
        result := ComCall(45, this, "ptr", pIStreamPrioritization, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveStreamPrioritization() {
        result := ComCall(46, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFStreamPrioritization>} ppIStreamPrioritization 
     * @returns {HRESULT} 
     */
    CreateStreamPrioritization(ppIStreamPrioritization) {
        result := ComCall(47, this, "ptr", ppIStreamPrioritization, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFProfile>} ppIProfile 
     * @returns {HRESULT} 
     */
    Clone(ppIProfile) {
        result := ComCall(48, this, "ptr", ppIProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
