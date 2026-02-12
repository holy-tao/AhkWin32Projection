#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\IModelObject.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IModelKeyReference extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IModelKeyReference
     * @type {Guid}
     */
    static IID => Guid("{5253dcf8-5aff-4c62-b302-56a289e00998}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetKeyName", "GetOriginalObject", "GetContextObject", "GetKey", "GetKeyValue", "SetKey", "SetKeyValue"]

    /**
     * Retrieves a string that represents the name of a key. (Unicode)
     * @remarks
     * The format of the key-name string depends on the current keyboard layout.
     * The keyboard driver maintains a list of names in the form of character strings for keys with names longer than a single character.
     * The key name is translated according to the layout of the currently installed keyboard, thus the function may give different results for different input locales.
     * The name of a character key is the character itself. The names of dead keys are spelled out in full.
     * 
     * > [!NOTE]
     * > The winuser.h header defines GetKeyNameText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getkeynametextw
     */
    GetKeyName() {
        keyName := BSTR()
        result := ComCall(3, this, "ptr", keyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return keyName
    }

    /**
     * 
     * @returns {Pointer<IModelObject>} 
     */
    GetOriginalObject() {
        result := ComCall(4, this, "ptr*", &originalObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return originalObject
    }

    /**
     * 
     * @returns {Pointer<IModelObject>} 
     */
    GetContextObject() {
        result := ComCall(5, this, "ptr*", &containingObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return containingObject
    }

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
     * @param {Pointer<IModelObject>} object_ 
     * @param {Pointer<Pointer<IKeyStore>>} metadata 
     * @returns {HRESULT} Type: <b>HKL</b>
     * 
     * The return value is the input locale identifier for the thread. The low word contains a <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">Language Identifier</a> for the input language and the high word contains a device handle to the physical layout of the keyboard.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getkeyboardlayout
     */
    GetKey(object_, metadata) {
        result := ComCall(6, this, "ptr*", object_, "ptr*", metadata, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} object_ 
     * @param {Pointer<Pointer<IKeyStore>>} metadata 
     * @returns {HRESULT} 
     */
    GetKeyValue(object_, metadata) {
        result := ComCall(7, this, "ptr*", object_, "ptr*", metadata, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Copies an array of keyboard key states into the calling thread's keyboard input-state table. This is the same table accessed by the GetKeyboardState and GetKeyState functions. Changes made to this table do not affect keyboard input to any other thread.
     * @remarks
     * Because the <b>SetKeyboardState</b> function alters the input state of the calling thread and not the global input state of the system, an application cannot use <b>SetKeyboardState</b> to set the NUM LOCK, CAPS LOCK, or SCROLL LOCK (or the Japanese KANA) indicator lights on the keyboard. These can be set or cleared using <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendinput">SendInput</a> to simulate keystrokes.
     * @param {IModelObject} object_ 
     * @param {IKeyStore} metadata 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-setkeyboardstate
     */
    SetKey(object_, metadata) {
        result := ComCall(8, this, "ptr", object_, "ptr", metadata, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IModelObject} object_ 
     * @returns {HRESULT} 
     */
    SetKeyValue(object_) {
        result := ComCall(9, this, "ptr", object_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
