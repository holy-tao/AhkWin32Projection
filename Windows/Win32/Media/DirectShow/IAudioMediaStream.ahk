#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Audio\WAVEFORMATEX.ahk
#Include .\IAudioStreamSample.ahk
#Include .\IMediaStream.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//austream/nn-austream-iaudiomediastream
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAudioMediaStream extends IMediaStream{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFormat", "SetFormat", "CreateSample"]

    /**
     * 
     * @returns {WAVEFORMATEX} 
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-iaudiomediastream-getformat
     */
    GetFormat() {
        pWaveFormatCurrent := WAVEFORMATEX()
        result := ComCall(9, this, "ptr", pWaveFormatCurrent, "HRESULT")
        return pWaveFormatCurrent
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} lpWaveFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-iaudiomediastream-setformat
     */
    SetFormat(lpWaveFormat) {
        result := ComCall(10, this, "ptr", lpWaveFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAudioData} pAudioData 
     * @param {Integer} dwFlags 
     * @returns {IAudioStreamSample} 
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-iaudiomediastream-createsample
     */
    CreateSample(pAudioData, dwFlags) {
        result := ComCall(11, this, "ptr", pAudioData, "uint", dwFlags, "ptr*", &ppSample := 0, "HRESULT")
        return IAudioStreamSample(ppSample)
    }
}
