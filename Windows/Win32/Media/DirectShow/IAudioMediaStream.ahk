#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMediaStream.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//austream/nn-austream-iaudiomediastream
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAudioMediaStream extends IMediaStream{
    /**
     * The interface identifier for IAudioMediaStream
     * @type {Guid}
     */
    static IID => Guid("{f7537560-a3be-11d0-8212-00c04fc32c45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatCurrent 
     * @returns {HRESULT} 
     */
    GetFormat(pWaveFormatCurrent) {
        result := ComCall(9, this, "ptr", pWaveFormatCurrent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} lpWaveFormat 
     * @returns {HRESULT} 
     */
    SetFormat(lpWaveFormat) {
        result := ComCall(10, this, "ptr", lpWaveFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAudioData>} pAudioData 
     * @param {Integer} dwFlags 
     * @param {Pointer<IAudioStreamSample>} ppSample 
     * @returns {HRESULT} 
     */
    CreateSample(pAudioData, dwFlags, ppSample) {
        result := ComCall(11, this, "ptr", pAudioData, "uint", dwFlags, "ptr", ppSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
