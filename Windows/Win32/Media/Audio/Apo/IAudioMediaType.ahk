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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsCompressedFormat", "IsEqual", "GetAudioFormat", "GetUncompressedAudioFormat"]

    /**
     * 
     * @param {Pointer<BOOL>} pfCompressed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiomediatype/nf-audiomediatype-iaudiomediatype-iscompressedformat
     */
    IsCompressedFormat(pfCompressed) {
        result := ComCall(3, this, "ptr", pfCompressed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAudioMediaType} pIAudioType 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiomediatype/nf-audiomediatype-iaudiomediatype-isequal
     */
    IsEqual(pIAudioType, pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pIAudioType, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<WAVEFORMATEX>} 
     * @see https://learn.microsoft.com/windows/win32/api/audiomediatype/nf-audiomediatype-iaudiomediatype-getaudioformat
     */
    GetAudioFormat() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<UNCOMPRESSEDAUDIOFORMAT>} pUncompressedAudioFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiomediatype/nf-audiomediatype-iaudiomediatype-getuncompressedaudioformat
     */
    GetUncompressedAudioFormat(pUncompressedAudioFormat) {
        result := ComCall(6, this, "ptr", pUncompressedAudioFormat, "HRESULT")
        return result
    }
}
