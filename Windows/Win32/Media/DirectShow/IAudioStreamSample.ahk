#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAudioData.ahk
#Include .\IStreamSample.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//austream/nn-austream-iaudiostreamsample
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAudioStreamSample extends IStreamSample{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioStreamSample
     * @type {Guid}
     */
    static IID => Guid("{345fee00-aba5-11d0-8212-00c04fc32c45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAudioData"]

    /**
     * Note  This interface is deprecated. New applications should not use it. Retrieves the address of a pointer to the IAudioData object associated with the sample.
     * @returns {IAudioData} Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/austream/nn-austream-iaudiodata">IAudioData</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//austream/nf-austream-iaudiostreamsample-getaudiodata
     */
    GetAudioData() {
        result := ComCall(8, this, "ptr*", &ppAudio := 0, "HRESULT")
        return IAudioData(ppAudio)
    }
}
