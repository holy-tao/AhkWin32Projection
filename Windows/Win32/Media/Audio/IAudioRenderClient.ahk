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
     * 
     * @param {Integer} NumFramesRequested 
     * @param {Pointer<Byte>} ppData 
     * @returns {HRESULT} 
     */
    GetBuffer(NumFramesRequested, ppData) {
        result := ComCall(3, this, "uint", NumFramesRequested, "char*", ppData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NumFramesWritten 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    ReleaseBuffer(NumFramesWritten, dwFlags) {
        result := ComCall(4, this, "uint", NumFramesWritten, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
