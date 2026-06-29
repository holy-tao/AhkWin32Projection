#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TfLBBalloonStyle.ahk" { TfLBBalloonStyle }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfSpeechUIServer interface manages the speech-related user interface on the TSF language bar.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/ctfspui/nn-ctfspui-itfspeechuiserver
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfSpeechUIServer extends IUnknown {
    /**
     * The interface identifier for ITfSpeechUIServer
     * @type {Guid}
     */
    static IID := Guid("{90e9a944-9244-489f-a78f-de67afc013a7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfSpeechUIServer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize    : IntPtr
        ShowUI        : IntPtr
        UpdateBalloon : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfSpeechUIServer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfSpeechUIServer::Initialize method
     * @remarks
     * The standard speech text service usually initializes the speech-related user interface on the TSF language bar. When a TSF-enabled application, that does not use the speech text service, requires use of the <a href="https://docs.microsoft.com/windows/desktop/api/ctfspui/nn-ctfspui-itfspeechuiserver">ITfSpeechUIServer</a> interface, it initializes the user interface with this method.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctfspui/nf-ctfspui-itfspeechuiserver-initialize
     */
    Initialize() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * ITfSpeechUIServer::ShowUI method
     * @param {BOOL} fShow Specifies whether to show (TRUE) or not show (FALSE) the speech-related user interface elements.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctfspui/nf-ctfspui-itfspeechuiserver-showui
     */
    ShowUI(fShow) {
        result := ComCall(4, this, BOOL, fShow, "HRESULT")
        return result
    }

    /**
     * ITfSpeechUIServer::UpdateBalloon method
     * @param {TfLBBalloonStyle} style Contains a <a href="https://docs.microsoft.com/windows/win32/api/ctfutb/ne-ctfutb-tflbballoonstyle">TfLBBalloonStyle</a> element that specifies the balloon style.
     * @param {PWSTR} pch Pointer to a zero-terminated Unicode string that contains the text to show in the balloon.
     * @param {Integer} cch Specifies the number of characters in the string of the <i>pch</i> parameter.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctfspui/nf-ctfspui-itfspeechuiserver-updateballoon
     */
    UpdateBalloon(style, pch, cch) {
        pch := pch is String ? StrPtr(pch) : pch

        result := ComCall(5, this, TfLBBalloonStyle, style, "ptr", pch, "uint", cch, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfSpeechUIServer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 1)
        this.vtbl.ShowUI := CallbackCreate(GetMethod(implObj, "ShowUI"), flags, 2)
        this.vtbl.UpdateBalloon := CallbackCreate(GetMethod(implObj, "UpdateBalloon"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.ShowUI)
        CallbackFree(this.vtbl.UpdateBalloon)
    }
}
