#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IKeyEnumerator.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDynamicKeyProviderConcept extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDynamicKeyProviderConcept
     * @type {Guid}
     */
    static IID => Guid("{e7983fa1-80a7-498c-988f-518ddc5d4025}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetKey", "SetKey", "EnumerateKeys"]

    /**
     * Retrieves the active input locale identifier (formerly called the keyboard layout).
     * @remarks
     * The input locale identifier is a broader concept than a keyboard layout, since it can also encompass a speech-to-text converter, an Input Method Editor (IME), or any other form of input.
     * 
     * Since the keyboard layout can be dynamically changed, applications that cache information about the current keyboard layout should process the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-inputlangchange">WM_INPUTLANGCHANGE</a> message to be informed of changes in the input language.
     * 
     * To get the KLID (keyboard layout ID) of the currently active HKL, call the  <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getkeyboardlayoutnamea">GetKeyboardLayoutName</a>.
     * 
     * <b>Beginning in Windows 8:</b> The preferred method to retrieve the language associated with the current keyboard layout or input method is a call to <a href="https://docs.microsoft.com/uwp/api/windows.globalization.language.currentinputmethodlanguagetag">Windows.Globalization.Language.CurrentInputMethodLanguageTag</a>. If your app passes language tags from <b>CurrentInputMethodLanguageTag</b> to any <a href="https://docs.microsoft.com/windows/desktop/Intl/national-language-support-functions">National Language Support</a> functions, it must first convert the tags by calling <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-resolvelocalename">ResolveLocaleName</a>.
     * @param {IModelObject} contextObject 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} keyValue 
     * @param {Pointer<IKeyStore>} metadata 
     * @param {Pointer<Boolean>} hasKey 
     * @returns {HRESULT} Type: <b>HKL</b>
     * 
     * The return value is the input locale identifier for the thread. The low word contains a <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">Language Identifier</a> for the input language and the high word contains a device handle to the physical layout of the keyboard.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getkeyboardlayout
     */
    GetKey(contextObject, key, keyValue, metadata, hasKey) {
        key := key is String ? StrPtr(key) : key

        hasKeyMarshal := hasKey is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", contextObject, "ptr", key, "ptr*", keyValue, "ptr*", metadata, hasKeyMarshal, hasKey, "HRESULT")
        return result
    }

    /**
     * Copies an array of keyboard key states into the calling thread's keyboard input-state table. This is the same table accessed by the GetKeyboardState and GetKeyState functions. Changes made to this table do not affect keyboard input to any other thread.
     * @remarks
     * Because the <b>SetKeyboardState</b> function alters the input state of the calling thread and not the global input state of the system, an application cannot use <b>SetKeyboardState</b> to set the NUM LOCK, CAPS LOCK, or SCROLL LOCK (or the Japanese KANA) indicator lights on the keyboard. These can be set or cleared using <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendinput">SendInput</a> to simulate keystrokes.
     * @param {IModelObject} contextObject 
     * @param {PWSTR} key 
     * @param {IModelObject} keyValue 
     * @param {IKeyStore} metadata 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setkeyboardstate
     */
    SetKey(contextObject, key, keyValue, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(4, this, "ptr", contextObject, "ptr", key, "ptr", keyValue, "ptr", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @returns {IKeyEnumerator} 
     */
    EnumerateKeys(contextObject) {
        result := ComCall(5, this, "ptr", contextObject, "ptr*", &ppEnumerator := 0, "HRESULT")
        return IKeyEnumerator(ppEnumerator)
    }
}
