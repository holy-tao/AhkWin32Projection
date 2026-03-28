#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpDataKey.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpRegDataKey extends ISpDataKey{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpRegDataKey
     * @type {Guid}
     */
    static IID => Guid("{92a66e2b-c830-4149-83df-6fc2ba1e7a5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetKey"]

    /**
     * Copies an array of keyboard key states into the calling thread's keyboard input-state table. This is the same table accessed by the GetKeyboardState and GetKeyState functions. Changes made to this table do not affect keyboard input to any other thread.
     * @remarks
     * Because the <b>SetKeyboardState</b> function alters the input state of the calling thread and not the global input state of the system, an application cannot use <b>SetKeyboardState</b> to set the NUM LOCK, CAPS LOCK, or SCROLL LOCK (or the Japanese KANA) indicator lights on the keyboard. These can be set or cleared using <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendinput">SendInput</a> to simulate keystrokes.
     * @param {HKEY} _hkey 
     * @param {BOOL} fReadOnly 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setkeyboardstate
     */
    SetKey(_hkey, fReadOnly) {
        _hkey := _hkey is Win32Handle ? NumGet(_hkey, "ptr") : _hkey

        result := ComCall(15, this, "ptr", _hkey, "int", fReadOnly, "HRESULT")
        return result
    }
}
