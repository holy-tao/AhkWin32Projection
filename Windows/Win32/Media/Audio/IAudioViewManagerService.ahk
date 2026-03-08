#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides APIs for associating an HWND with an audio stream.
 * @remarks
 * Get an instance of the [IAudioViewManagerService](nn-audioclient-iaudioviewmanagerservice.md) by calling [GetService](nf-audioclient-iaudioclient-getservice) on an instance of [IAudioClient](nn-audioclient-iaudioclient.md).
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/nn-audioclient-iaudioviewmanagerservice
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioViewManagerService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioViewManagerService
     * @type {Guid}
     */
    static IID => Guid("{a7a7ef10-1f49-45e0-ad35-612057cc8f74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAudioStreamWindow"]

    /**
     * Associates the specified HWND window handle with an audio stream.
     * @remarks
     * An app can choose to associate audio streams with a particular window of their app for proper audio location representation in a Mixed Reality scenario
     * 
     * Get an instance of the [IAudioViewManagerService](nn-audioclient-iaudioviewmanagerservice.md) by calling [GetService](nf-audioclient-iaudioclient-getservice) on the [IAudioClient](nn-audioclient-iaudioclient.md) instance representing the stream you want to associate a window with. The following code example illustrates creating an audio stream on the default audio render endpoint and associating it with an **HWND**.
     * 
     * ```cpp
     * @param {HWND} hwnd The [HWND](https://docs.microsoft.com/en-us/windows/win32/winprog/windows-data-types) with which the audio stream wll be associated.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioviewmanagerservice-setaudiostreamwindow
     */
    SetAudioStreamWindow(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "ptr", hwnd, "HRESULT")
        return result
    }
}
