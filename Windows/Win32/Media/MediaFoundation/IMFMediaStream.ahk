#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaEventGenerator.ahk

/**
 * Represents one stream in a media source.
 * @remarks
 * 
  * Streams are created when a media source is started. For each stream, the media source sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/menewstream">MENewStream</a> event with a pointer to the stream's <b>IMFMediaStream</b> interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediastream
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaStream extends IMFMediaEventGenerator{
    /**
     * The interface identifier for IMFMediaStream
     * @type {Guid}
     */
    static IID => Guid("{d182108f-4ec6-443f-aa42-a71106ec825f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IMFMediaSource>} ppMediaSource 
     * @returns {HRESULT} 
     */
    GetMediaSource(ppMediaSource) {
        result := ComCall(7, this, "ptr", ppMediaSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFStreamDescriptor>} ppStreamDescriptor 
     * @returns {HRESULT} 
     */
    GetStreamDescriptor(ppStreamDescriptor) {
        result := ComCall(8, this, "ptr", ppStreamDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pToken 
     * @returns {HRESULT} 
     */
    RequestSample(pToken) {
        result := ComCall(9, this, "ptr", pToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
