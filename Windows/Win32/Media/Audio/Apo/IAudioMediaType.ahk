#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\UNCOMPRESSEDAUDIOFORMAT.ahk
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
     * The IsCompressedFormat method determines whether the audio data format is a compressed format.
     * @returns {BOOL} Receives a Boolean value. The value is <b>TRUE</b> if the format is compressed or <b>FALSE</b> if the format is uncompressed.
     * @see https://docs.microsoft.com/windows/win32/api//audiomediatype/nf-audiomediatype-iaudiomediatype-iscompressedformat
     */
    IsCompressedFormat() {
        result := ComCall(3, this, "int*", &pfCompressed := 0, "HRESULT")
        return pfCompressed
    }

    /**
     * The IsEqual method compares two media types and determines whether they are identical.
     * @param {IAudioMediaType} pIAudioType Specifies a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/audiomediatype/nn-audiomediatype-iaudiomediatype">IAudioMediaType</a> interface of the media type to compare.
     * @returns {Integer} Specifies a pointer to a DWORD variable that contains the bitwise OR result of zero or more flags. These flags indicate the degree of similarity between the two media types. The following table shows the supported flags.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * AUDIOMEDIATYPE_EQUAL_FORMAT_TYPES
     * 
     * </td>
     * <td>
     * The audio format types are the same.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * AUDIOMEDIATYPE_EQUAL_FORMAT_DATA
     * 
     * </td>
     * <td>
     * The format information matches, not including extra data beyond the base <a href="https://docs.microsoft.com/windows/win32/api/mmreg/ns-mmreg-waveformatex">WAVEFORMATEX</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * AUDIOMEDIATYPE_EQUAL_FORMAT_USER_DATA
     * 
     * </td>
     * <td>
     * The extra data is identical, or neither media type contains extra data.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audiomediatype/nf-audiomediatype-iaudiomediatype-isequal
     */
    IsEqual(pIAudioType) {
        result := ComCall(4, this, "ptr", pIAudioType, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * The GetAudioFormat method returns the WAVEFORMATEX structure for the audio data format.
     * @returns {Pointer<WAVEFORMATEX>} The <code>GetAudioFormat</code> method returns a pointer to a <a href="/windows/win32/api/mmreg/ns-mmreg-waveformatex">WAVEFORMATEX</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//audiomediatype/nf-audiomediatype-iaudiomediatype-getaudioformat
     */
    GetAudioFormat() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * The IAudioMediaType::GetUncompressedAudioFormat returns information about the audio data format.
     * @returns {UNCOMPRESSEDAUDIOFORMAT} Specifies a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/audiomediatype/ns-audiomediatype-uncompressedaudioformat">UNCOMPRESSEDAUDIOFORMAT</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//audiomediatype/nf-audiomediatype-iaudiomediatype-getuncompressedaudioformat
     */
    GetUncompressedAudioFormat() {
        pUncompressedAudioFormat := UNCOMPRESSEDAUDIOFORMAT()
        result := ComCall(6, this, "ptr", pUncompressedAudioFormat, "HRESULT")
        return pUncompressedAudioFormat
    }
}
