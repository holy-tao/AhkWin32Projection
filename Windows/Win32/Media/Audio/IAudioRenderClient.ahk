#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioRenderClient interface enables a client to write output data to a rendering endpoint buffer.
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-iaudiorenderclient
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioRenderClient extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioRenderClient
     * @type {Guid}
     */
    static IID => Guid("{f294acfc-3146-4483-a7bf-addca7c260e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBuffer", "ReleaseBuffer"]

    /**
     * 
     * @param {Integer} NumFramesRequested 
     * @param {Pointer<Pointer<Integer>>} ppData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudiorenderclient-getbuffer
     */
    GetBuffer(NumFramesRequested, ppData) {
        result := ComCall(3, this, "uint", NumFramesRequested, "ptr*", ppData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NumFramesWritten 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudiorenderclient-releasebuffer
     */
    ReleaseBuffer(NumFramesWritten, dwFlags) {
        result := ComCall(4, this, "uint", NumFramesWritten, "uint", dwFlags, "HRESULT")
        return result
    }
}
