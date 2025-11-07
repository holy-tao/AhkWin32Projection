#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfSpeechUIServer interface manages the speech-related user interface on the TSF language bar.
 * @remarks
 * 
 * The user interface elements on the TSF language bar managed by this interface include the microphone button, the speech configuration menu button, the dictation button, the command button, and the speech balloon. The standard speech text service usually manages these user interface elements in an application, including initialization. This type of application does not require the <b>ITfSpeechUIServer</b> interface.
 * 
 * An application that does not use the speech text service might require use of the features provided by the speech-related interface elements. In that case, the following code example shows how an application can obtain a pointer to the <b>ITfSpeechUIServer</b> interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> function with the CLSID_SpeechUIServer <b>CLSID</b>.
 * 
 * 
 * ```cpp
 * 
 * HRESULT hr;
 * ITfSpeechUIServer* piSpeechUIServer;
 * 
 * hr = CoCreateInstance(CLSID_SpeechUIServer,
 *                       NULL,
 *                       CLSCTX_INPROC_SERVER,
 *                       IID_ITfSpeechUIServer,
 *                       (void**)&piSpeechUIServer);
 * 
 * ```
 * 
 * 
 * Subsequently, the application can use the <a href="https://docs.microsoft.com/windows/desktop/api/ctfspui/nf-ctfspui-itfspeechuiserver-initialize">ITfSpeechUIServer::Initialize</a> method to initialize the user interface and the other methods of the <b>ITfSpeechUIServer</b> interface to manage the user interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ctfspui/nn-ctfspui-itfspeechuiserver
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfSpeechUIServer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfSpeechUIServer
     * @type {Guid}
     */
    static IID => Guid("{90e9a944-9244-489f-a78f-de67afc013a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "ShowUI", "UpdateBalloon"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfspui/nf-ctfspui-itfspeechuiserver-showui
     */
    ShowUI(fShow) {
        result := ComCall(4, this, "int", fShow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} style 
     * @param {PWSTR} pch 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfspui/nf-ctfspui-itfspeechuiserver-updateballoon
     */
    UpdateBalloon(style, pch, cch) {
        pch := pch is String ? StrPtr(pch) : pch

        result := ComCall(5, this, "int", style, "ptr", pch, "uint", cch, "HRESULT")
        return result
    }
}
