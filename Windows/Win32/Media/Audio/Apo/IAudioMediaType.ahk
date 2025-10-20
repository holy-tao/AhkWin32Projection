#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IAudioMediaType interface exposes methods that allow an sAPO to get information that is used to negotiate with the audio engine for the appropriate audio data format.
 * @see https://docs.microsoft.com/windows/win32/api//audiomediatype/nn-audiomediatype-iaudiomediatype
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioMediaType extends IUnknown{
    /**
     * The interface identifier for IAudioMediaType
     * @type {Guid}
     */
    static IID => Guid("{4e997f73-b71f-4798-873b-ed7dfcf15b4d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pfCompressed 
     * @returns {HRESULT} 
     */
    IsCompressedFormat(pfCompressed) {
        result := ComCall(3, this, "ptr", pfCompressed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAudioMediaType>} pIAudioType 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    IsEqual(pIAudioType, pdwFlags) {
        result := ComCall(4, this, "ptr", pIAudioType, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Pointer<WAVEFORMATEX>} 
     */
    GetAudioFormat() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<UNCOMPRESSEDAUDIOFORMAT>} pUncompressedAudioFormat 
     * @returns {HRESULT} 
     */
    GetUncompressedAudioFormat(pUncompressedAudioFormat) {
        result := ComCall(6, this, "ptr", pUncompressedAudioFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
