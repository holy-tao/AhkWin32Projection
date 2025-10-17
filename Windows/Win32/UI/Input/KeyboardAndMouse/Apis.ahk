#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include .\HKL.ahk
#Include ..\..\..\Foundation\HWND.ahk
/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class KeyboardAndMouse {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static EXTENDED_BIT => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DONTCARE_BIT => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static FAKE_KEYSTROKE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static KBDBASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KBDSHIFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KBDCTRL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KBDALT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KBDKANA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KBDROYA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KBDLOYA => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KBDGRPSELTAP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static GRAVE => 768

    /**
     * @type {Integer (UInt32)}
     */
    static ACUTE => 769

    /**
     * @type {Integer (UInt32)}
     */
    static CIRCUMFLEX => 770

    /**
     * @type {Integer (UInt32)}
     */
    static TILDE => 771

    /**
     * @type {Integer (UInt32)}
     */
    static MACRON => 772

    /**
     * @type {Integer (UInt32)}
     */
    static OVERSCORE => 773

    /**
     * @type {Integer (UInt32)}
     */
    static BREVE => 774

    /**
     * @type {Integer (UInt32)}
     */
    static DOT_ABOVE => 775

    /**
     * @type {Integer (UInt32)}
     */
    static UMLAUT => 776

    /**
     * @type {Integer (UInt32)}
     */
    static DIARESIS => 776

    /**
     * @type {Integer (UInt32)}
     */
    static HOOK_ABOVE => 777

    /**
     * @type {Integer (UInt32)}
     */
    static RING => 778

    /**
     * @type {Integer (UInt32)}
     */
    static DOUBLE_ACUTE => 779

    /**
     * @type {Integer (UInt32)}
     */
    static HACEK => 780

    /**
     * @type {Integer (UInt32)}
     */
    static CEDILLA => 807

    /**
     * @type {Integer (UInt32)}
     */
    static OGONEK => 808

    /**
     * @type {Integer (UInt32)}
     */
    static TONOS => 900

    /**
     * @type {Integer (UInt32)}
     */
    static DIARESIS_TONOS => 901

    /**
     * @type {String}
     */
    static wszGRAVE => "̀"

    /**
     * @type {String}
     */
    static wszACUTE => "́"

    /**
     * @type {String}
     */
    static wszCIRCUMFLEX => "̂"

    /**
     * @type {String}
     */
    static wszTILDE => "̃"

    /**
     * @type {String}
     */
    static wszMACRON => "̄"

    /**
     * @type {String}
     */
    static wszOVERSCORE => "̅"

    /**
     * @type {String}
     */
    static wszBREVE => "̆"

    /**
     * @type {String}
     */
    static wszDOT_ABOVE => "̇"

    /**
     * @type {String}
     */
    static wszUMLAUT => "̈"

    /**
     * @type {String}
     */
    static wszHOOK_ABOVE => "̉"

    /**
     * @type {String}
     */
    static wszRING => "̊"

    /**
     * @type {String}
     */
    static wszDOUBLE_ACUTE => "̋"

    /**
     * @type {String}
     */
    static wszHACEK => "̌"

    /**
     * @type {String}
     */
    static wszCEDILLA => "̧"

    /**
     * @type {String}
     */
    static wszOGONEK => "̨"

    /**
     * @type {String}
     */
    static wszTONOS => "΄"

    /**
     * @type {String}
     */
    static wszDIARESIS_TONOS => "΅"

    /**
     * @type {Integer (UInt32)}
     */
    static SHFT_INVALID => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WCH_NONE => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static WCH_DEAD => 61441

    /**
     * @type {Integer (UInt32)}
     */
    static WCH_LGTR => 61442

    /**
     * @type {Integer (UInt32)}
     */
    static CAPLOK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SGCAPS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CAPLOKALTGR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KANALOK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GRPSELTAP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DKF_DEAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KBD_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KLLF_ALTGR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KLLF_SHIFTLOCK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KLLF_LRM_RLM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KLLF_GLOBAL_ATTRS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KBDTABLE_MULTI_MAX => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KEYBOARD_TYPE_GENERIC_101 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KEYBOARD_TYPE_JAPAN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static KEYBOARD_TYPE_KOREA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KEYBOARD_TYPE_UNKNOWN => 81

    /**
     * @type {Integer (UInt32)}
     */
    static NLSKBD_OEM_MICROSOFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NLSKBD_OEM_AX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NLSKBD_OEM_EPSON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NLSKBD_OEM_FUJITSU => 5

    /**
     * @type {Integer (UInt32)}
     */
    static NLSKBD_OEM_IBM => 7

    /**
     * @type {Integer (UInt32)}
     */
    static NLSKBD_OEM_MATSUSHITA => 10

    /**
     * @type {Integer (UInt32)}
     */
    static NLSKBD_OEM_NEC => 13

    /**
     * @type {Integer (UInt32)}
     */
    static NLSKBD_OEM_TOSHIBA => 18

    /**
     * @type {Integer (UInt32)}
     */
    static NLSKBD_OEM_DEC => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MICROSOFT_KBD_101_TYPE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MICROSOFT_KBD_AX_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MICROSOFT_KBD_106_TYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MICROSOFT_KBD_002_TYPE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MICROSOFT_KBD_001_TYPE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MICROSOFT_KBD_FUNC => 12

    /**
     * @type {Integer (UInt32)}
     */
    static AX_KBD_DESKTOP_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FMR_KBD_JIS_TYPE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FMR_KBD_OASYS_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FMV_KBD_OASYS_TYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NEC_KBD_NORMAL_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NEC_KBD_N_MODE_TYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NEC_KBD_H_MODE_TYPE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NEC_KBD_LAPTOP_TYPE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NEC_KBD_106_TYPE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static TOSHIBA_KBD_DESKTOP_TYPE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static TOSHIBA_KBD_LAPTOP_TYPE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DEC_KBD_ANSI_LAYOUT_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEC_KBD_JIS_LAYOUT_TYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MICROSOFT_KBD_101A_TYPE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MICROSOFT_KBD_101B_TYPE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MICROSOFT_KBD_101C_TYPE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MICROSOFT_KBD_103_TYPE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static NLSKBD_INFO_SEND_IME_NOTIFICATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NLSKBD_INFO_ACCESSIBILITY_KEYMAP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NLSKBD_INFO_EMURATE_101_KEYBOARD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NLSKBD_INFO_EMURATE_106_KEYBOARD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_TYPE_NULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_TYPE_NORMAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_TYPE_TOGGLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_INDEX_NORMAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_INDEX_ALT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_NULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_NOEVENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_SEND_BASE_VK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_SEND_PARAM_VK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_KANALOCK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_ALPHANUM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_HIRAGANA => 6

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_KATAKANA => 7

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_SBCSDBCS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_ROMAN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_CODEINPUT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_HELP_OR_END => 11

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_HOME_OR_CLEAR => 12

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_NUMPAD => 13

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_KANAEVENT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static KBDNLS_CONV_OR_NONCONV => 15

    /**
     * @type {Integer (UInt32)}
     */
    static KBD_TYPE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCANCODE_LSHIFT => 42

    /**
     * @type {Integer (UInt32)}
     */
    static SCANCODE_RSHIFT => 54

    /**
     * @type {Integer (UInt32)}
     */
    static SCANCODE_CTRL => 29

    /**
     * @type {Integer (UInt32)}
     */
    static SCANCODE_ALT => 56

    /**
     * @type {Integer (UInt32)}
     */
    static SCANCODE_NUMPAD_FIRST => 71

    /**
     * @type {Integer (UInt32)}
     */
    static SCANCODE_NUMPAD_LAST => 82

    /**
     * @type {Integer (UInt32)}
     */
    static SCANCODE_LWIN => 91

    /**
     * @type {Integer (UInt32)}
     */
    static SCANCODE_RWIN => 92

    /**
     * @type {Integer (UInt32)}
     */
    static SCANCODE_THAI_LAYOUT_TOGGLE => 41
;@endregion Constants

;@region Methods
    /**
     * Posts messages when the mouse pointer leaves a window or hovers over a window for a specified amount of time. This function calls TrackMouseEvent if it exists, otherwise it emulates it.
     * @param {Pointer<TRACKMOUSEEVENT>} lpEventTrack Type: <b>LPTRACKMOUSEEVENT</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-trackmouseevent">TRACKMOUSEEVENT</a> structure that contains tracking information.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//commctrl/nf-commctrl-_trackmouseevent
     * @since windows5.0
     */
    static _TrackMouseEvent(lpEventTrack) {
        result := DllCall("COMCTL32.dll\_TrackMouseEvent", "ptr", lpEventTrack, "int")
        return result
    }

    /**
     * Loads a new input locale identifier (formerly called the keyboard layout) into the system.
     * @param {PSTR} pwszKLID Type: <b>LPCTSTR</b>
     * 
     * The name of the input locale identifier to load. This name is a string composed of the hexadecimal value of the <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">Language Identifier</a> (low word) and a device identifier (high word). For example, U.S. English has a language identifier of 0x0409, so the primary U.S. English layout is named "00000409". Variants of U.S. English layout (such as the Dvorak layout) are named "00010409", "00020409", and so on.
     * @param {Integer} Flags Type: <b>UINT</b>
     * @returns {HKL} Type: <b>HKL</b>
     * 
     * If the function succeeds, the return value is the input locale identifier corresponding to the name specified in <i>pwszKLID</i>. If no matching locale is available, the return value is the default language of the system.
     * 
     * If the function fails, the return value is NULL. This can occur if the layout library is loaded from the application directory.
     * 
     * To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-loadkeyboardlayouta
     * @since windows5.0
     */
    static LoadKeyboardLayoutA(pwszKLID, Flags) {
        pwszKLID := pwszKLID is String ? StrPtr(pwszKLID) : pwszKLID

        A_LastError := 0

        result := DllCall("USER32.dll\LoadKeyboardLayoutA", "ptr", pwszKLID, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return HKL({Value: result}, True)
    }

    /**
     * Loads a new input locale identifier (formerly called the keyboard layout) into the system.
     * @param {PWSTR} pwszKLID Type: <b>LPCTSTR</b>
     * 
     * The name of the input locale identifier to load. This name is a string composed of the hexadecimal value of the <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">Language Identifier</a> (low word) and a device identifier (high word). For example, U.S. English has a language identifier of 0x0409, so the primary U.S. English layout is named "00000409". Variants of U.S. English layout (such as the Dvorak layout) are named "00010409", "00020409", and so on.
     * @param {Integer} Flags Type: <b>UINT</b>
     * @returns {HKL} Type: <b>HKL</b>
     * 
     * If the function succeeds, the return value is the input locale identifier corresponding to the name specified in <i>pwszKLID</i>. If no matching locale is available, the return value is the default language of the system.
     * 
     * If the function fails, the return value is NULL. This can occur if the layout library is loaded from the application directory.
     * 
     * To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-loadkeyboardlayoutw
     * @since windows5.0
     */
    static LoadKeyboardLayoutW(pwszKLID, Flags) {
        pwszKLID := pwszKLID is String ? StrPtr(pwszKLID) : pwszKLID

        A_LastError := 0

        result := DllCall("USER32.dll\LoadKeyboardLayoutW", "ptr", pwszKLID, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return HKL({Value: result}, True)
    }

    /**
     * Sets the input locale identifier (formerly called the keyboard layout handle) for the calling thread or the current process. The input locale identifier specifies a locale as well as the physical layout of the keyboard.
     * @param {HKL} hkl Type: <b>HKL</b>
     * 
     * Input locale identifier to be activated.
     * @param {Integer} Flags Type: <b>UINT</b>
     * @returns {HKL} Type: <b>HKL</b>
     * 
     * The return value is of type 
     *       <b>HKL</b>. If the function succeeds, the return value is the previous input locale identifier. Otherwise, it is zero.
     * 
     * To get extended error information, use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-activatekeyboardlayout
     * @since windows5.0
     */
    static ActivateKeyboardLayout(hkl, Flags) {
        hkl := hkl is Win32Handle ? NumGet(hkl, "ptr") : hkl

        A_LastError := 0

        result := DllCall("USER32.dll\ActivateKeyboardLayout", "ptr", hkl, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return HKL({Value: result}, True)
    }

    /**
     * Translates the specified virtual-key code and keyboard state to the corresponding Unicode character or characters.
     * @param {Integer} wVirtKey Type: <b>UINT</b>
     * 
     * The virtual-key code to be translated. See <a href="https://docs.microsoft.com/windows/desktop/inputdev/virtual-key-codes">Virtual-Key Codes</a>.
     * @param {Integer} wScanCode Type: <b>UINT</b>
     * 
     * The hardware scan code of the key to be translated. The high-order bit of this value is set if the key is up.
     * @param {Pointer<Byte>} lpKeyState Type: <b>const BYTE*</b>
     * 
     * A pointer to a 256-byte array that contains the current keyboard state. Each element (byte) in the array contains the state of one key. If the high-order bit of a byte is set, the key is down.
     * @param {PWSTR} pwszBuff Type: <b>LPWSTR</b>
     * 
     * The buffer that receives the translated Unicode character or characters. However, this buffer may be returned without being null-terminated even though the variable name suggests that it is null-terminated.
     * @param {Integer} cchBuff Type: <b>int</b>
     * 
     * The size, in characters, of the buffer pointed to by the <i>pwszBuff</i> parameter.
     * @param {Integer} wFlags Type: <b>UINT</b>
     * 
     * The behavior of the function. 
     * 
     * 
     * If bit 0 is set, a menu is active. 
     * 
     * 
     * If bit 2 is set, keyboard state is not changed (Windows 10, version 1607 and newer)
     * 
     * All other bits (through 31) are reserved.
     * @param {HKL} dwhkl Type: <b>HKL</b>
     * 
     * The input locale identifier used to translate the specified code. This parameter can be any input locale identifier previously returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadkeyboardlayouta">LoadKeyboardLayout</a> function.
     * @returns {Integer} Type: <b>int</b>
     * 
     * The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified virtual key is a dead-key character (accent or diacritic). This value is returned regardless of the keyboard layout, even if several characters have been typed and are stored in the keyboard state. If possible, even with Unicode keyboard layouts, the function has written a spacing version of the dead-key character to the buffer specified by <i>pwszBuff</i>. For example, the function writes the character SPACING ACUTE (0x00B4), rather than the character NON_SPACING ACUTE (0x0301).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified virtual key has no translation for the current state of the keyboard. Nothing was written to the buffer specified by <i>pwszBuff</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One character was written to the buffer specified by <i>pwszBuff</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2 ≤ <i>value</i> </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Two or more characters were written to the buffer specified by <i>pwszBuff</i>. The most common cause for this is that a dead-key character (accent or diacritic) stored in the keyboard layout could not be combined with the specified virtual key to form a single character. However, the buffer may contain more characters than the return value specifies. When this happens, any extra characters are invalid and should be ignored.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-tounicodeex
     * @since windows5.0
     */
    static ToUnicodeEx(wVirtKey, wScanCode, lpKeyState, pwszBuff, cchBuff, wFlags, dwhkl) {
        pwszBuff := pwszBuff is String ? StrPtr(pwszBuff) : pwszBuff
        dwhkl := dwhkl is Win32Handle ? NumGet(dwhkl, "ptr") : dwhkl

        result := DllCall("USER32.dll\ToUnicodeEx", "uint", wVirtKey, "uint", wScanCode, "char*", lpKeyState, "ptr", pwszBuff, "int", cchBuff, "uint", wFlags, "ptr", dwhkl, "int")
        return result
    }

    /**
     * Unloads an input locale identifier (formerly called a keyboard layout).
     * @param {HKL} hkl Type: <b>HKL</b>
     * 
     * The input locale identifier to be unloaded.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. The function can fail for the following reasons: 
     * 
     * <ul>
     * <li>An invalid input locale identifier was passed.</li>
     * <li>The input locale identifier was preloaded.</li>
     * <li>The input locale identifier is in use.</li>
     * </ul>
     * To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-unloadkeyboardlayout
     * @since windows5.0
     */
    static UnloadKeyboardLayout(hkl) {
        hkl := hkl is Win32Handle ? NumGet(hkl, "ptr") : hkl

        A_LastError := 0

        result := DllCall("USER32.dll\UnloadKeyboardLayout", "ptr", hkl, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the name of the active input locale identifier (formerly called the keyboard layout) for the system.
     * @param {PSTR} pwszKLID Type: <b>LPTSTR</b>
     * 
     * The buffer (of at least <b>KL_NAMELENGTH</b> characters in length) that receives the name of the input locale identifier, including the terminating null character. This will be a copy of the string provided to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadkeyboardlayouta">LoadKeyboardLayout</a> function, unless layout substitution took place.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getkeyboardlayoutnamea
     * @since windows5.0
     */
    static GetKeyboardLayoutNameA(pwszKLID) {
        pwszKLID := pwszKLID is String ? StrPtr(pwszKLID) : pwszKLID

        A_LastError := 0

        result := DllCall("USER32.dll\GetKeyboardLayoutNameA", "ptr", pwszKLID, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the name of the active input locale identifier (formerly called the keyboard layout) for the system.
     * @param {PWSTR} pwszKLID Type: <b>LPTSTR</b>
     * 
     * The buffer (of at least <b>KL_NAMELENGTH</b> characters in length) that receives the name of the input locale identifier, including the terminating null character. This will be a copy of the string provided to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadkeyboardlayouta">LoadKeyboardLayout</a> function, unless layout substitution took place.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getkeyboardlayoutnamew
     * @since windows5.0
     */
    static GetKeyboardLayoutNameW(pwszKLID) {
        pwszKLID := pwszKLID is String ? StrPtr(pwszKLID) : pwszKLID

        A_LastError := 0

        result := DllCall("USER32.dll\GetKeyboardLayoutNameW", "ptr", pwszKLID, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the input locale identifiers (formerly called keyboard layout handles) corresponding to the current set of input locales in the system. The function copies the identifiers to the specified buffer.
     * @param {Integer} nBuff Type: <b>int</b>
     * 
     * The maximum number of handles that the buffer can hold.
     * @param {Pointer<HKL>} lpList Type: <b>HKL*</b>
     * 
     * A pointer to the buffer that receives the array of input locale identifiers.
     * @returns {Integer} Type: <b>int</b>
     * 
     * If the function succeeds, the return value is the number of input locale identifiers copied to the buffer or, if 
     *       <i>nBuff</i> is zero, the return value is the size, in array elements, of the buffer needed to receive all current input locale identifiers.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getkeyboardlayoutlist
     * @since windows5.0
     */
    static GetKeyboardLayoutList(nBuff, lpList) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetKeyboardLayoutList", "int", nBuff, "ptr", lpList, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the active input locale identifier (formerly called the keyboard layout).
     * @param {Integer} idThread Type: <b>DWORD</b>
     * 
     * The identifier of the thread to query, or 0 for the current thread.
     * @returns {HKL} Type: <b>HKL</b>
     * 
     * The return value is the input locale identifier for the thread. The low word contains a <a href="/windows/desktop/Intl/language-identifiers">Language Identifier</a> for the input language and the high word contains a device handle to the physical layout of the keyboard.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getkeyboardlayout
     * @since windows5.0
     */
    static GetKeyboardLayout(idThread) {
        result := DllCall("USER32.dll\GetKeyboardLayout", "uint", idThread, "ptr")
        return HKL({Value: result}, True)
    }

    /**
     * Retrieves a history of up to 64 previous coordinates of the mouse or pen.
     * @param {Integer} cbSize Type: <b>UINT</b>
     * 
     * The size, in bytes, of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-mousemovepoint">MOUSEMOVEPOINT</a> structure.
     * @param {Pointer<MOUSEMOVEPOINT>} lppt Type: <b>LPMOUSEMOVEPOINT</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-mousemovepoint">MOUSEMOVEPOINT</a> structure containing valid mouse coordinates (in screen coordinates). It may also contain a time stamp. 
     * 
     * The <b>GetMouseMovePointsEx</b> function searches for the point in the mouse coordinates history. If the function finds the point, it returns the last 
     * 						<i>nBufPoints</i> prior to and including the supplied point. 
     * 
     * If your application supplies a time stamp, the <b>GetMouseMovePointsEx</b> function will use it to differentiate between two equal points that were recorded at different times. 
     * 
     * An application should call this function using the mouse coordinates received from the <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-mousemove">WM_MOUSEMOVE</a> message and convert them to screen coordinates.
     * @param {Pointer<MOUSEMOVEPOINT>} lpptBuf Type: <b>LPMOUSEMOVEPOINT</b>
     * 
     * A pointer to a buffer that will receive the points. It should be at least 
     * 					<i>cbSize</i>*
     * 					<i>nBufPoints</i> in size.
     * @param {Integer} nBufPoints Type: <b>int</b>
     * 
     * The number of points to be retrieved.
     * @param {Integer} resolution Type: <b>DWORD</b>
     * @returns {Integer} Type: <b>int</b>
     * 
     * If the function succeeds, the return value is the number of points in the buffer. Otherwise, the function returns 
     * 						–1. For extended error information, your application can call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getmousemovepointsex
     * @since windows5.0
     */
    static GetMouseMovePointsEx(cbSize, lppt, lpptBuf, nBufPoints, resolution) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetMouseMovePointsEx", "uint", cbSize, "ptr", lppt, "ptr", lpptBuf, "int", nBufPoints, "uint", resolution, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Posts messages when the mouse pointer leaves a window or hovers over a window for a specified amount of time.
     * @param {Pointer<TRACKMOUSEEVENT>} lpEventTrack Type: <b>LPTRACKMOUSEEVENT</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-trackmouseevent">TRACKMOUSEEVENT</a> structure that contains tracking information.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero . 
     * 
     * If the function fails, return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-trackmouseevent
     * @since windows5.0
     */
    static TrackMouseEvent(lpEventTrack) {
        A_LastError := 0

        result := DllCall("USER32.dll\TrackMouseEvent", "ptr", lpEventTrack, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Defines a system-wide hot key.
     * @param {HWND} hWnd Type: <b>HWND</b>
     * 
     * A handle to the window that will receive <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-hotkey">WM_HOTKEY</a> messages generated by the hot key. If this parameter is <b>NULL</b>, <b>WM_HOTKEY</b> messages are posted to the message queue of the calling thread and must be processed in the message loop.
     * @param {Integer} id Type: <b>int</b>
     * 
     * The identifier of the hot key.  If the <i>hWnd</i> parameter is NULL, then the hot key is associated with the current thread rather than with a particular window. If a hot key already exists with the same <i>hWnd</i> and <i>id</i> parameters, see Remarks for the action taken.
     * @param {Integer} fsModifiers Type: <b>UINT</b>
     * 
     * The keys that must be pressed in combination with the key specified by the
     * @param {Integer} vk Type: <b>UINT</b>
     * 
     * The virtual-key code of the hot key. See <a href="https://docs.microsoft.com/windows/desktop/inputdev/virtual-key-codes">Virtual Key Codes</a>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-registerhotkey
     * @since windows6.0.6000
     */
    static RegisterHotKey(hWnd, id, fsModifiers, vk) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        A_LastError := 0

        result := DllCall("USER32.dll\RegisterHotKey", "ptr", hWnd, "int", id, "uint", fsModifiers, "uint", vk, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees a hot key previously registered by the calling thread.
     * @param {HWND} hWnd Type: <b>HWND</b>
     * 
     * A handle to the window associated with the hot key to be freed. This parameter should be <b>NULL</b> if the hot key is not associated with a window.
     * @param {Integer} id Type: <b>int</b>
     * 
     * The identifier of the hot key to be freed.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-unregisterhotkey
     * @since windows5.0
     */
    static UnregisterHotKey(hWnd, id) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        A_LastError := 0

        result := DllCall("USER32.dll\UnregisterHotKey", "ptr", hWnd, "int", id, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reverses or restores the meaning of the left and right mouse buttons.
     * @param {BOOL} fSwap Type: <b>BOOL</b>
     * 
     * If this parameter is <b>TRUE</b>, the left button generates right-button messages and the right button generates left-button messages. If this parameter is <b>FALSE</b>, the buttons are restored to their original meanings.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the meaning of the mouse buttons was reversed previously, before the function was called, the return value is nonzero.
     * 
     * If the meaning of the mouse buttons was not reversed, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-swapmousebutton
     * @since windows5.0
     */
    static SwapMouseButton(fSwap) {
        result := DllCall("USER32.dll\SwapMouseButton", "int", fSwap, "int")
        return result
    }

    /**
     * Retrieves the current double-click time for the mouse.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * The return value specifies the current double-click time, in milliseconds. The maximum return value is 5000 milliseconds.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getdoubleclicktime
     * @since windows5.0
     */
    static GetDoubleClickTime() {
        result := DllCall("USER32.dll\GetDoubleClickTime", "uint")
        return result
    }

    /**
     * Sets the double-click time for the mouse.
     * @param {Integer} param0 
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setdoubleclicktime
     * @since windows5.0
     */
    static SetDoubleClickTime(param0) {
        A_LastError := 0

        result := DllCall("USER32.dll\SetDoubleClickTime", "uint", param0, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the keyboard focus to the specified window. The window must be attached to the calling thread's message queue.
     * @param {HWND} hWnd Type: **HWND**
     * 
     * A handle to the window that will receive the keyboard input. If this parameter is NULL, keystrokes are ignored.
     * @returns {HWND} Type: **HWND**
     * 
     * If the function succeeds, the return value is the handle to the window that previously had the keyboard focus. If the *hWnd* parameter is invalid or the window is not attached to the calling thread's message queue, the return value is NULL. To get extended error information, call [GetLastError function](../errhandlingapi/nf-errhandlingapi-getlasterror.md).
     * 
     * Extended error ERROR_INVALID_PARAMETER (0x57) means that window is in disabled state.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setfocus
     * @since windows5.0
     */
    static SetFocus(hWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        A_LastError := 0

        result := DllCall("USER32.dll\SetFocus", "ptr", hWnd, "ptr")
        if(A_LastError)
            throw OSError()

        return HWND({Value: result}, True)
    }

    /**
     * Retrieves the window handle to the active window attached to the calling thread's message queue.
     * @returns {HWND} Type: <b>HWND</b>
     * 
     * The return value is the handle to the active window attached to the calling thread's message queue. Otherwise, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getactivewindow
     * @since windows5.0
     */
    static GetActiveWindow() {
        result := DllCall("USER32.dll\GetActiveWindow", "ptr")
        return HWND({Value: result}, True)
    }

    /**
     * Retrieves the handle to the window that has the keyboard focus, if the window is attached to the calling thread's message queue.
     * @returns {HWND} Type: <b>HWND</b>
     * 
     * The return value is the handle to the window with the keyboard focus. If the calling thread's message queue does not have an associated window with the keyboard focus, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getfocus
     * @since windows5.0
     */
    static GetFocus() {
        result := DllCall("USER32.dll\GetFocus", "ptr")
        return HWND({Value: result}, True)
    }

    /**
     * Retrieves the current code page.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * The return value is an OEM code-page identifier, or it is the default identifier if the registry value is not readable. For a list of OEM code-page identifiers, see <a href="/windows/desktop/Intl/code-page-identifiers">Code Page Identifiers</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getkbcodepage
     * @since windows5.0
     */
    static GetKBCodePage() {
        result := DllCall("USER32.dll\GetKBCodePage", "uint")
        return result
    }

    /**
     * Retrieves the status of the specified virtual key. The status specifies whether the key is up, down, or toggled (on, off�alternating each time the key is pressed).
     * @param {Integer} nVirtKey Type: <b>int</b>
     * 
     * A virtual key. If the desired virtual key is a letter or digit (A through Z, a through z, or 0 through 9), 
     *      <i>nVirtKey</i> must be set to the ASCII value of that character. For other keys, it must be a virtual-key code.
     * 
     * If a non-English keyboard layout is used, virtual keys with values in the range ASCII A through Z and 0 through 9 are used to specify most of the character keys. For example, for the German keyboard layout, the virtual key of value ASCII O (0x4F) refers to the "o" key, whereas VK_OEM_1 refers to the "o with umlaut" key.
     * @returns {Integer} Type: <b>SHORT</b>
     * 
     * The return value specifies the status of the specified virtual key, as follows:
     * 
     * <ul>
     * <li>If the high-order bit is 1, the key is down; otherwise, it is up.</li>
     * <li>If the low-order bit is 1, the key is toggled. A key, such as the CAPS LOCK key, is toggled if it is turned on. The key is off and untoggled if the low-order bit is 0. A toggle key's indicator light (if any) on the keyboard will be on when the key is toggled, and off when the key is untoggled.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getkeystate
     * @since windows5.0
     */
    static GetKeyState(nVirtKey) {
        result := DllCall("USER32.dll\GetKeyState", "int", nVirtKey, "short")
        return result
    }

    /**
     * Determines whether a key is up or down at the time the function is called, and whether the key was pressed after a previous call to GetAsyncKeyState.
     * @param {Integer} vKey Type: <b>int</b>
     * 
     * The virtual-key code. For more information, see <a href="https://docs.microsoft.com/windows/desktop/inputdev/virtual-key-codes">Virtual Key Codes</a>.
     * 
     * You can use left- and right-distinguishing constants to specify certain keys. See the Remarks section for further information.
     * @returns {Integer} Type: <b>SHORT</b>
     * 
     * If the function succeeds, the return value specifies whether the key was pressed since the last call to <b>GetAsyncKeyState</b>, and whether the key is currently up or down. If the most significant bit is set, the key is down, and if the least significant bit is set, the key was pressed after the previous call to <b>GetAsyncKeyState</b>. However, you should not rely on this last behavior; for more information, see the Remarks.
     * 
     * The return value is zero for the following cases:
     * 
     * <ul>
     * <li>The current desktop is not the active desktop</li>
     * <li>The foreground thread belongs to another process and the desktop does not allow the hook or the journal record.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getasynckeystate
     * @since windows5.0
     */
    static GetAsyncKeyState(vKey) {
        result := DllCall("USER32.dll\GetAsyncKeyState", "int", vKey, "short")
        return result
    }

    /**
     * Copies the status of the 256 virtual keys to the specified buffer.
     * @param {Pointer<Byte>} lpKeyState Type: <b>PBYTE</b>
     * 
     * The 256-byte array that receives the status data for each virtual key.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getkeyboardstate
     * @since windows5.0
     */
    static GetKeyboardState(lpKeyState) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetKeyboardState", "char*", lpKeyState, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies an array of keyboard key states into the calling thread's keyboard input-state table. This is the same table accessed by the GetKeyboardState and GetKeyState functions. Changes made to this table do not affect keyboard input to any other thread.
     * @param {Pointer<Byte>} lpKeyState Type: <b>LPBYTE</b>
     * 
     * A pointer to a 256-byte array that contains keyboard key states.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setkeyboardstate
     * @since windows5.0
     */
    static SetKeyboardState(lpKeyState) {
        A_LastError := 0

        result := DllCall("USER32.dll\SetKeyboardState", "char*", lpKeyState, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a string that represents the name of a key.
     * @param {Integer} lParam Type: <b>LONG</b>
     * 
     * The second parameter of the keyboard message (such as 
     *      <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>) to be processed. The function interprets the following bit positions in the <i>lParam</i>.
     * 
     * <table>
     * <tr>
     * <th>Bits</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * 16-23
     * 
     * </td>
     * <td>
     * Scan code.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 24
     * 
     * </td>
     * <td>
     * Extended-key flag. Distinguishes some keys on an enhanced keyboard.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 25
     * 
     * </td>
     * <td>
     * "Do not care" bit. The application calling this function sets this bit to indicate that the function should not distinguish between left and right CTRL and SHIFT keys, for example.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PSTR} lpString Type: <b>LPTSTR</b>
     * 
     * The buffer that will receive the key name.
     * @param {Integer} cchSize Type: <b>int</b>
     * 
     * The maximum length, in characters, of the key name, including the terminating null character. (This parameter should be equal to the size of the buffer pointed to by the 
     *      <i>lpString</i> parameter.)
     * @returns {Integer} Type: <b>int</b>
     * 
     * If the function succeeds, a null-terminated string is copied into the specified buffer, and the return value is the length of the string, in 
     *       characters, not counting the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getkeynametexta
     * @since windows5.0
     */
    static GetKeyNameTextA(lParam, lpString, cchSize) {
        lpString := lpString is String ? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("USER32.dll\GetKeyNameTextA", "int", lParam, "ptr", lpString, "int", cchSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a string that represents the name of a key.
     * @param {Integer} lParam Type: <b>LONG</b>
     * 
     * The second parameter of the keyboard message (such as 
     *      <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>) to be processed. The function interprets the following bit positions in the <i>lParam</i>.
     * 
     * <table>
     * <tr>
     * <th>Bits</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * 16-23
     * 
     * </td>
     * <td>
     * Scan code.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 24
     * 
     * </td>
     * <td>
     * Extended-key flag. Distinguishes some keys on an enhanced keyboard.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 25
     * 
     * </td>
     * <td>
     * "Do not care" bit. The application calling this function sets this bit to indicate that the function should not distinguish between left and right CTRL and SHIFT keys, for example.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} lpString Type: <b>LPTSTR</b>
     * 
     * The buffer that will receive the key name.
     * @param {Integer} cchSize Type: <b>int</b>
     * 
     * The maximum length, in characters, of the key name, including the terminating null character. (This parameter should be equal to the size of the buffer pointed to by the 
     *      <i>lpString</i> parameter.)
     * @returns {Integer} Type: <b>int</b>
     * 
     * If the function succeeds, a null-terminated string is copied into the specified buffer, and the return value is the length of the string, in 
     *       characters, not counting the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getkeynametextw
     * @since windows5.0
     */
    static GetKeyNameTextW(lParam, lpString, cchSize) {
        lpString := lpString is String ? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("USER32.dll\GetKeyNameTextW", "int", lParam, "ptr", lpString, "int", cchSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the current keyboard.
     * @param {Integer} nTypeFlag Type: <b>int</b>
     * @returns {Integer} Type: <b>int</b>
     * 
     * If the function succeeds, the return value specifies the requested information.
     * 
     * If the function fails and <i>nTypeFlag</i> is not 1, the return value is 0; 0 is a valid return value when <i>nTypeFlag</i> is 1 (keyboard subtype). To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getkeyboardtype
     * @since windows5.0
     */
    static GetKeyboardType(nTypeFlag) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetKeyboardType", "int", nTypeFlag, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Translates the specified virtual-key code and keyboard state to the corresponding character or characters.
     * @param {Integer} uVirtKey Type: <b>UINT</b>
     * 
     * The virtual-key code to be translated. See <a href="https://docs.microsoft.com/windows/desktop/inputdev/virtual-key-codes">Virtual-Key Codes</a>.
     * @param {Integer} uScanCode Type: <b>UINT</b>
     * 
     * The hardware scan code of the key to be translated. The high-order bit of this value is set if the key is up (not pressed).
     * @param {Pointer<Byte>} lpKeyState Type: <b>const BYTE*</b>
     * 
     * A pointer to a 256-byte array that contains the current keyboard state. Each element (byte) in the array contains the state of one key. If the high-order bit of a byte is set, the key is down (pressed).
     * 
     * The low bit, if set, indicates that the key is toggled on. In this function, only the toggle bit of the CAPS LOCK key is relevant. The toggle state of the NUM LOCK and SCROLL LOCK keys is ignored.
     * @param {Pointer<UInt16>} lpChar Type: <b>LPWORD</b>
     * 
     * The buffer that receives the translated character or characters.
     * @param {Integer} uFlags Type: <b>UINT</b>
     * 
     * This parameter must be 1 if a menu is active, or 0 otherwise.
     * @returns {Integer} Type: <b>int</b>
     * 
     * If the specified key is a dead key, the return value is negative. Otherwise, it is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified virtual key has no translation for the current state of the keyboard.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One character was copied to the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Two characters were copied to the buffer. This usually happens when a dead-key character (accent or diacritic) stored in the keyboard layout cannot be composed with the specified virtual key to form a single character.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-toascii
     * @since windows5.0
     */
    static ToAscii(uVirtKey, uScanCode, lpKeyState, lpChar, uFlags) {
        result := DllCall("USER32.dll\ToAscii", "uint", uVirtKey, "uint", uScanCode, "char*", lpKeyState, "ushort*", lpChar, "uint", uFlags, "int")
        return result
    }

    /**
     * Translates the specified virtual-key code and keyboard state to the corresponding character or characters. The function translates the code using the input language and physical keyboard layout identified by the input locale identifier.
     * @param {Integer} uVirtKey Type: <b>UINT</b>
     * 
     * The virtual-key code to be translated. See <a href="https://docs.microsoft.com/windows/desktop/inputdev/virtual-key-codes">Virtual-Key Codes</a>.
     * @param {Integer} uScanCode Type: <b>UINT</b>
     * 
     * The hardware scan code of the key to be translated. The high-order bit of this value is set if the key is up (not pressed).
     * @param {Pointer<Byte>} lpKeyState Type: <b>const BYTE*</b>
     * 
     * A pointer to a 256-byte array that contains the current keyboard state. Each element (byte) in the array contains the state of one key. If the high-order bit of a byte is set, the key is down (pressed).
     * 
     * The low bit, if set, indicates that the key is toggled on. In this function, only the toggle bit of the CAPS LOCK key is relevant. The toggle state of the NUM LOCK and SCOLL LOCK keys is ignored.
     * @param {Pointer<UInt16>} lpChar Type: <b>LPWORD</b>
     * 
     * A pointer to the buffer that receives the translated character or characters.
     * @param {Integer} uFlags Type: <b>UINT</b>
     * 
     * This parameter must be 1 if a menu is active, zero otherwise.
     * @param {HKL} dwhkl Type: <b>HKL</b>
     * 
     * Input locale identifier to use to translate the code. This parameter can be any input locale identifier previously returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadkeyboardlayouta">LoadKeyboardLayout</a> function.
     * @returns {Integer} Type: <b>int</b>
     * 
     * If the specified key is a dead key, the return value is negative. Otherwise, it is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified virtual key has no translation for the current state of the keyboard.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One character was copied to the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Two characters were copied to the buffer. This usually happens when a dead-key character (accent or diacritic) stored in the keyboard layout cannot be composed with the specified virtual key to form a single character.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-toasciiex
     * @since windows5.0
     */
    static ToAsciiEx(uVirtKey, uScanCode, lpKeyState, lpChar, uFlags, dwhkl) {
        dwhkl := dwhkl is Win32Handle ? NumGet(dwhkl, "ptr") : dwhkl

        result := DllCall("USER32.dll\ToAsciiEx", "uint", uVirtKey, "uint", uScanCode, "char*", lpKeyState, "ushort*", lpChar, "uint", uFlags, "ptr", dwhkl, "int")
        return result
    }

    /**
     * Translates the specified virtual-key code and keyboard state to the corresponding Unicode character or characters.
     * @param {Integer} wVirtKey Type: <b>UINT</b>
     * 
     * The virtual-key code to be translated. See <a href="https://docs.microsoft.com/windows/desktop/inputdev/virtual-key-codes">Virtual-Key Codes</a>.
     * @param {Integer} wScanCode Type: <b>UINT</b>
     * 
     * The hardware scan code of the key to be translated. The high-order bit of this value is set if the key is up.
     * @param {Pointer<Byte>} lpKeyState Type: <b>const BYTE*</b>
     * 
     * A pointer to a 256-byte array that contains the current keyboard state. Each element (byte) in the array contains the state of one key. If the high-order bit of a byte is set, the key is down.
     * @param {PWSTR} pwszBuff Type: <b>LPWSTR</b>
     * 
     * The buffer that receives the translated Unicode character or characters. However, this buffer may be returned without being null-terminated even though the variable name suggests that it is null-terminated.
     * @param {Integer} cchBuff Type: <b>int</b>
     * 
     * The size, in characters, of the buffer pointed to by the <i>pwszBuff</i> parameter.
     * @param {Integer} wFlags Type: <b>UINT</b>
     * 
     * The behavior of the function. 
     * 
     * 
     * If bit 0 is set, a menu is active. 
     * 
     * 
     * If bit 2 is set, keyboard state is not changed (Windows 10, version 1607 and newer)
     * 
     * All other bits (through 31) are reserved.
     * @returns {Integer} Type: <b>int</b>
     * 
     * The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified virtual key is a dead-key character (accent or diacritic). This value is returned regardless of the keyboard layout, even if several characters have been typed and are stored in the keyboard state. If possible, even with Unicode keyboard layouts, the function has written a spacing version of the dead-key character to the buffer specified by <i>pwszBuff</i>. For example, the function writes the character SPACING ACUTE (0x00B4), rather than the character NON_SPACING ACUTE (0x0301).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified virtual key has no translation for the current state of the keyboard. Nothing was written to the buffer specified by <i>pwszBuff</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One character was written to the buffer specified by <i>pwszBuff</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2 ≤ <i>value</i> </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Two or more characters were written to the buffer specified by <i>pwszBuff</i>. The most common cause for this is that a dead-key character (accent or diacritic) stored in the keyboard layout could not be combined with the specified virtual key to form a single character. However, the buffer may contain more characters than the return value specifies. When this happens, any extra characters are invalid and should be ignored.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-tounicode
     * @since windows5.0
     */
    static ToUnicode(wVirtKey, wScanCode, lpKeyState, pwszBuff, cchBuff, wFlags) {
        pwszBuff := pwszBuff is String ? StrPtr(pwszBuff) : pwszBuff

        result := DllCall("USER32.dll\ToUnicode", "uint", wVirtKey, "uint", wScanCode, "char*", lpKeyState, "ptr", pwszBuff, "int", cchBuff, "uint", wFlags, "int")
        return result
    }

    /**
     * Maps OEMASCII codes 0 through 0x0FF into the OEM scan codes and shift states. The function provides information that allows a program to send OEM text to another program by simulating keyboard input.
     * @param {Integer} wOemChar Type: <b>WORD</b>
     * 
     * The ASCII value of the OEM character.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * The low-order word of the return value contains the scan code of the OEM character, and the high-order word contains the shift state, which can be a combination of the following bits. 
     * 
     * <table>
     * <tr>
     * <th>Bit</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either SHIFT key is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either CTRL key is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either ALT key is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Hankaku key is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>16</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved (defined by the keyboard layout driver).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>32</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved (defined by the keyboard layout driver).
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the character cannot be produced by a single keystroke using the current keyboard layout, the return value is 
     * 						–1.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-oemkeyscan
     * @since windows5.0
     */
    static OemKeyScan(wOemChar) {
        result := DllCall("USER32.dll\OemKeyScan", "ushort", wOemChar, "uint")
        return result
    }

    /**
     * Translates a character to the corresponding virtual-key code and shift state for the current keyboard.
     * @param {CHAR} ch Type: <b>TCHAR</b>
     * 
     * The character to be translated into a virtual-key code.
     * @returns {Integer} Type: <b>SHORT</b>
     * 
     * If the function succeeds, the low-order byte of the return value contains the virtual-key code and the high-order byte contains the shift state, which can be a combination of the following flag bits.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either SHIFT key is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either CTRL key is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either ALT key is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Hankaku key is pressed
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>16</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved (defined by the keyboard layout driver).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>32</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved (defined by the keyboard layout driver).
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function finds no key that translates to the passed character code, both the low-order and high-order bytes contain 
     *       –1.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-vkkeyscana
     * @since windows5.0
     */
    static VkKeyScanA(ch) {
        result := DllCall("USER32.dll\VkKeyScanA", "char", ch, "short")
        return result
    }

    /**
     * Translates a character to the corresponding virtual-key code and shift state for the current keyboard.
     * @param {Integer} ch Type: <b>TCHAR</b>
     * 
     * The character to be translated into a virtual-key code.
     * @returns {Integer} Type: <b>SHORT</b>
     * 
     * If the function succeeds, the low-order byte of the return value contains the virtual-key code and the high-order byte contains the shift state, which can be a combination of the following flag bits.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either SHIFT key is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either CTRL key is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either ALT key is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Hankaku key is pressed
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>16</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved (defined by the keyboard layout driver).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>32</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved (defined by the keyboard layout driver).
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function finds no key that translates to the passed character code, both the low-order and high-order bytes contain 
     *       –1.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-vkkeyscanw
     * @since windows5.0
     */
    static VkKeyScanW(ch) {
        result := DllCall("USER32.dll\VkKeyScanW", "char", ch, "short")
        return result
    }

    /**
     * Translates a character to the corresponding virtual-key code and shift state. The function translates the character using the input language and physical keyboard layout identified by the input locale identifier.
     * @param {CHAR} ch Type: <b>TCHAR</b>
     * 
     * The character to be translated into a virtual-key code.
     * @param {HKL} dwhkl Type: <b>HKL</b>
     * 
     * Input locale identifier used to translate the character. This parameter can be any input locale identifier previously returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadkeyboardlayouta">LoadKeyboardLayout</a> function.
     * @returns {Integer} Type: <b>SHORT</b>
     * 
     * If the function succeeds, the low-order byte of the return value contains the virtual-key code and the high-order byte contains the shift state, which can be a combination of the following flag bits.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either SHIFT key is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either CTRL key is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either ALT key is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Hankaku key is pressed
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>16</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved (defined by the keyboard layout driver).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>32</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved (defined by the keyboard layout driver).
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function finds no key that translates to the passed character code, both the low-order and high-order bytes contain 
     *       –1.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-vkkeyscanexa
     * @since windows5.0
     */
    static VkKeyScanExA(ch, dwhkl) {
        dwhkl := dwhkl is Win32Handle ? NumGet(dwhkl, "ptr") : dwhkl

        result := DllCall("USER32.dll\VkKeyScanExA", "char", ch, "ptr", dwhkl, "short")
        return result
    }

    /**
     * Translates a character to the corresponding virtual-key code and shift state. The function translates the character using the input language and physical keyboard layout identified by the input locale identifier.
     * @param {Integer} ch Type: <b>TCHAR</b>
     * 
     * The character to be translated into a virtual-key code.
     * @param {HKL} dwhkl Type: <b>HKL</b>
     * 
     * Input locale identifier used to translate the character. This parameter can be any input locale identifier previously returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadkeyboardlayouta">LoadKeyboardLayout</a> function.
     * @returns {Integer} Type: <b>SHORT</b>
     * 
     * If the function succeeds, the low-order byte of the return value contains the virtual-key code and the high-order byte contains the shift state, which can be a combination of the following flag bits.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either SHIFT key is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either CTRL key is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either ALT key is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Hankaku key is pressed
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>16</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved (defined by the keyboard layout driver).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>32</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved (defined by the keyboard layout driver).
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function finds no key that translates to the passed character code, both the low-order and high-order bytes contain 
     *       –1.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-vkkeyscanexw
     * @since windows5.0
     */
    static VkKeyScanExW(ch, dwhkl) {
        dwhkl := dwhkl is Win32Handle ? NumGet(dwhkl, "ptr") : dwhkl

        result := DllCall("USER32.dll\VkKeyScanExW", "char", ch, "ptr", dwhkl, "short")
        return result
    }

    /**
     * Synthesizes a keystroke.
     * @remarks
     * 
     * An application can simulate a press of the PRINTSCRN key in order to obtain a screen snapshot and save it to the clipboard. To do this, call <b>keybd_event</b> with the 
     * 				<i>bVk</i> parameter set to <b>VK_SNAPSHOT</b>. 
     * 
     * 
     * 
     * @param {Integer} bVk Type: <b>BYTE</b>
     * 
     * A virtual-key code. The code must be a value in the range 1 to 254. For a complete list, see <a href="https://docs.microsoft.com/windows/desktop/inputdev/virtual-key-codes">Virtual Key Codes</a>.
     * @param {Integer} bScan Type: <b>BYTE</b>
     * 
     * A hardware scan code for the key.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * @param {Pointer} dwExtraInfo Type: <b>ULONG_PTR</b>
     * 
     * An additional value associated with the key stroke.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-keybd_event
     * @since windows5.0
     */
    static keybd_event(bVk, bScan, dwFlags, dwExtraInfo) {
        DllCall("USER32.dll\keybd_event", "char", bVk, "char", bScan, "uint", dwFlags, "ptr", dwExtraInfo)
    }

    /**
     * The mouse_event function synthesizes mouse motion and button clicks.
     * @remarks
     * 
     * If the mouse has moved, indicated by <b>MOUSEEVENTF_MOVE</b> being set, 
     * 				<i>dx</i> and 
     * 				<i>dy</i> hold information about that motion. The information is specified as absolute or relative integer values. 
     * 
     * If <b>MOUSEEVENTF_ABSOLUTE</b> value is specified, 
     * 				<i>dx</i> and 
     * 				<i>dy</i> contain normalized absolute coordinates between 0 and 65,535. The event procedure maps these coordinates onto the display surface. Coordinate (0,0) maps onto the upper-left corner of the display surface, (65535,65535) maps onto the lower-right corner. 
     * 
     * If the <b>MOUSEEVENTF_ABSOLUTE</b> value is not specified, 
     * 				<i>dx</i> and 
     * 				<i>dy</i> specify relative motions from when the last mouse event was generated (the last reported position). Positive values mean the mouse moved right (or down); negative values mean the mouse moved left (or up). 
     * 
     * Relative mouse motion is subject to the settings for mouse speed and acceleration level. An end user sets these values using the Mouse application in Control Panel. An application obtains and sets these values with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> function. 
     * 
     * The system applies two tests to the specified relative mouse motion when applying acceleration. If the specified distance along either the x or y axis is greater than the first mouse threshold value, and the mouse acceleration level is not zero, the operating system doubles the distance. If the specified distance along either the x- or y-axis is greater than the second mouse threshold value, and the mouse acceleration level is equal to two, the operating system doubles the distance that resulted from applying the first threshold test. It is thus possible for the operating system to multiply relatively-specified mouse motion along the x- or y-axis by up to four times.
     * 
     * Once acceleration has been applied, the system scales the resultant value by the desired mouse speed. Mouse speed can range from 1 (slowest) to 20 (fastest) and represents how much the pointer moves based on the distance the mouse moves. The default value is 10, which results in no additional modification to the mouse motion. 
     * 
     * The <b>mouse_event</b> function is used to synthesize mouse events by applications that need to do so. It is also used by applications that need to obtain more information from the mouse than its position and button state. For example, if a tablet manufacturer wants to pass pen-based information to its own applications, it can write a DLL that communicates directly to the tablet hardware, obtains the extra information, and saves it in a queue. The DLL then calls <b>mouse_event</b> with the standard button and x/y position data, along with, in the <i>dwExtraInfo</i> parameter, some pointer or index to the queued extra information. When the application needs the extra information, it calls the DLL with the pointer or index stored in 
     * 				<i>dwExtraInfo</i>, and the DLL returns the extra information.
     * 
     * 
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * @param {Integer} dx Type: <b>DWORD</b>
     * 
     * The mouse's absolute position along the x-axis or its amount of motion since the last mouse event was generated, depending on the setting of <b>MOUSEEVENTF_ABSOLUTE</b>. Absolute data is specified as the mouse's actual x-coordinate; relative data is specified as the number of mickeys moved. A 
     * 					<i>mickey</i> is the amount that a mouse has to move for it to report that it has moved.
     * @param {Integer} dy Type: <b>DWORD</b>
     * 
     * The mouse's absolute position along the y-axis or its amount of motion since the last mouse event was generated, depending on the setting of <b>MOUSEEVENTF_ABSOLUTE</b>. Absolute data is specified as the mouse's actual y-coordinate; relative data is specified as the number of mickeys moved.
     * @param {Integer} dwData Type: <b>DWORD</b>
     * 
     * If 
     * 					<i>dwFlags</i> contains <b>MOUSEEVENTF_WHEEL</b>, then 
     * 					<i>dwData</i> specifies the amount of wheel movement. A positive value indicates that the wheel was rotated forward, away from the user; a negative value indicates that the wheel was rotated backward, toward the user. One wheel click is defined as <b>WHEEL_DELTA</b>, which is 120. 
     * 
     * If <i>dwFlags</i> contains <b>MOUSEEVENTF_HWHEEL</b>, then 
     * 					<i>dwData</i> specifies the amount of wheel movement. A positive value indicates that the wheel was tilted to the right; a negative value indicates that the wheel was tilted to the left.
     * 
     * If 
     * 						<i>dwFlags</i> contains <b>MOUSEEVENTF_XDOWN</b> or <b>MOUSEEVENTF_XUP</b>, then 
     * 						<i>dwData</i> specifies which X buttons were pressed or released. This value may be any combination of the following flags. 
     * 
     * If 
     * 						<i>dwFlags</i> is not <b>MOUSEEVENTF_WHEEL</b>, <b>MOUSEEVENTF_XDOWN</b>, or <b>MOUSEEVENTF_XUP</b>, then 
     * 						<i>dwData</i> should be zero. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XBUTTON1"></a><a id="xbutton1"></a><dl>
     * <dt><b>XBUTTON1</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set if the first X button was pressed or released.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XBUTTON2"></a><a id="xbutton2"></a><dl>
     * <dt><b>XBUTTON2</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set if the second X button was pressed or released.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} dwExtraInfo Type: <b>ULONG_PTR</b>
     * 
     * An additional value associated with the mouse event. An application calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmessageextrainfo">GetMessageExtraInfo</a> to obtain this extra information.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-mouse_event
     * @since windows5.0
     */
    static mouse_event(dwFlags, dx, dy, dwData, dwExtraInfo) {
        DllCall("USER32.dll\mouse_event", "uint", dwFlags, "int", dx, "int", dy, "int", dwData, "ptr", dwExtraInfo)
    }

    /**
     * Synthesizes keystrokes, mouse motions, and button clicks.
     * @param {Integer} cInputs Type: <b>UINT</b>
     * 
     * The number of structures in the <i>pInputs</i> array.
     * @param {Pointer<INPUT>} pInputs Type: <b>LPINPUT</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-input">INPUT</a> structures. Each structure represents an event to be inserted into the keyboard or mouse input stream.
     * @param {Integer} cbSize Type: <b>int</b>
     * 
     * The size, in bytes, of an <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-input">INPUT</a> structure. If <i>cbSize</i> is not the size of an <b>INPUT</b> structure, the function fails.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * The function returns the number of events that it successfully inserted into the keyboard or mouse input stream. If the function returns zero, the input was already blocked by another thread. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * This function fails when it is blocked by UIPI. Note that neither <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> nor the return value will indicate the failure was caused by UIPI blocking.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-sendinput
     * @since windows5.0
     */
    static SendInput(cInputs, pInputs, cbSize) {
        A_LastError := 0

        result := DllCall("USER32.dll\SendInput", "uint", cInputs, "ptr", pInputs, "int", cbSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the time of the last input event.
     * @param {Pointer<LASTINPUTINFO>} plii Type: <b>PLASTINPUTINFO</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-lastinputinfo">LASTINPUTINFO</a> structure that receives the time of the last input event.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getlastinputinfo
     * @since windows5.0
     */
    static GetLastInputInfo(plii) {
        result := DllCall("USER32.dll\GetLastInputInfo", "ptr", plii, "int")
        return result
    }

    /**
     * Translates (maps) a virtual-key code into a scan code or character value, or translates a scan code into a virtual-key code.
     * @param {Integer} uCode Type: **UINT**
     * 
     * The [virtual key code](/windows/desktop/inputdev/virtual-key-codes) or scan code for a key. How this value is interpreted depends on the value of the *uMapType* parameter.
     * 
     * **Starting with Windows Vista**, the high byte of the *uCode* value can contain either 0xe0 or 0xe1 to specify the extended scan code.
     * @param {Integer} uMapType Type: **UINT**
     * 
     * The translation to be performed. The value of this parameter depends on the value of the *uCode* parameter.
     * 
     * | Value | Meaning |
     * |-------|---------|
     * | **MAPVK\_VK\_TO\_VSC**<br>0 | The *uCode* parameter is a virtual-key code and is translated into a scan code. If it is a virtual-key code that does not distinguish between left- and right-hand keys, the left-hand scan code is returned. If there is no translation, the function returns 0. |
     * | **MAPVK\_VSC\_TO\_VK**<br>1 | The *uCode* parameter is a scan code and is translated into a virtual-key code that does not distinguish between left- and right-hand keys. If there is no translation, the function returns 0. |
     * | **MAPVK\_VK\_TO\_CHAR**<br>2 | The *uCode* parameter is a virtual-key code and is translated into an unshifted character value in the low order word of the return value. Dead keys (diacritics) are indicated by setting the top bit of the return value. If there is no translation, the function returns 0. |
     * | **MAPVK\_VSC\_TO\_VK\_EX**<br>3 | The *uCode* parameter is a scan code and is translated into a virtual-key code that distinguishes between left- and right-hand keys. If there is no translation, the function returns 0. |
     * | **MAPVK\_VK\_TO\_VSC\_EX**<br>4 | **Windows Vista and later:** The *uCode* parameter is a virtual-key code and is translated into a scan code. If it is a virtual-key code that does not distinguish between left- and right-hand keys, the left-hand scan code is returned. If the scan code is an extended scan code, the high byte of the *uCode* value can contain either 0xe0 or 0xe1 to specify the extended scan code. If there is no translation, the function returns 0. |
     * @returns {Integer} Type: **UINT**
     * 
     * The return value is either a scan code, a virtual-key code, or a character value, depending on the value of *uCode* and *uMapType*. If there is no translation, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-mapvirtualkeya
     * @since windows5.0
     */
    static MapVirtualKeyA(uCode, uMapType) {
        result := DllCall("USER32.dll\MapVirtualKeyA", "uint", uCode, "uint", uMapType, "uint")
        return result
    }

    /**
     * Translates (maps) a virtual-key code into a scan code or character value, or translates a scan code into a virtual-key code.
     * @param {Integer} uCode Type: **UINT**
     * 
     * The [virtual key code](/windows/desktop/inputdev/virtual-key-codes) or scan code for a key. How this value is interpreted depends on the value of the *uMapType* parameter.
     * 
     * **Starting with Windows Vista**, the high byte of the *uCode* value can contain either 0xe0 or 0xe1 to specify the extended scan code.
     * @param {Integer} uMapType Type: **UINT**
     * 
     * The translation to be performed. The value of this parameter depends on the value of the *uCode* parameter.
     * 
     * | Value | Meaning |
     * |-------|---------|
     * | **MAPVK\_VK\_TO\_VSC**<br>0 | The *uCode* parameter is a virtual-key code and is translated into a scan code. If it is a virtual-key code that does not distinguish between left- and right-hand keys, the left-hand scan code is returned. If there is no translation, the function returns 0. |
     * | **MAPVK\_VSC\_TO\_VK**<br>1 | The *uCode* parameter is a scan code and is translated into a virtual-key code that does not distinguish between left- and right-hand keys. If there is no translation, the function returns 0. |
     * | **MAPVK\_VK\_TO\_CHAR**<br>2 | The *uCode* parameter is a virtual-key code and is translated into an unshifted character value in the low order word of the return value. Dead keys (diacritics) are indicated by setting the top bit of the return value. If there is no translation, the function returns 0. |
     * | **MAPVK\_VSC\_TO\_VK\_EX**<br>3 | The *uCode* parameter is a scan code and is translated into a virtual-key code that distinguishes between left- and right-hand keys. If there is no translation, the function returns 0. |
     * | **MAPVK\_VK\_TO\_VSC\_EX**<br>4 | **Windows Vista and later:** The *uCode* parameter is a virtual-key code and is translated into a scan code. If it is a virtual-key code that does not distinguish between left- and right-hand keys, the left-hand scan code is returned. If the scan code is an extended scan code, the high byte of the *uCode* value can contain either 0xe0 or 0xe1 to specify the extended scan code. If there is no translation, the function returns 0. |
     * @returns {Integer} Type: **UINT**
     * 
     * The return value is either a scan code, a virtual-key code, or a character value, depending on the value of *uCode* and *uMapType*. If there is no translation, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-mapvirtualkeyw
     * @since windows5.0
     */
    static MapVirtualKeyW(uCode, uMapType) {
        result := DllCall("USER32.dll\MapVirtualKeyW", "uint", uCode, "uint", uMapType, "uint")
        return result
    }

    /**
     * Translates (maps) a virtual-key code into a scan code or character value, or translates a scan code into a virtual-key code. The function translates the codes using the input language and an input locale identifier.
     * @param {Integer} uCode Type: **UINT**
     * 
     * The [virtual key code](/windows/desktop/inputdev/virtual-key-codes) or scan code for a key. How this value is interpreted depends on the value of the *uMapType* parameter.
     * 
     * **Starting with Windows Vista**, the high byte of the *uCode* value can contain either 0xe0 or 0xe1 to specify the extended scan code.
     * @param {Integer} uMapType Type: **UINT**
     * 
     * The translation to perform. The value of this parameter depends on the value of the <i>uCode</i> parameter.
     * 
     * | Value | Meaning |
     * |-------|---------|
     * | **MAPVK\_VK\_TO\_VSC**<br>0 | The *uCode* parameter is a virtual-key code and is translated into a scan code. If it is a virtual-key code that does not distinguish between left- and right-hand keys, the left-hand scan code is returned. If there is no translation, the function returns 0. |
     * | **MAPVK\_VSC\_TO\_VK**<br>1 | The *uCode* parameter is a scan code and is translated into a virtual-key code that does not distinguish between left- and right-hand keys. If there is no translation, the function returns 0. |
     * | **MAPVK\_VK\_TO\_CHAR**<br>2 | The *uCode* parameter is a virtual-key code and is translated into an unshifted character value in the low order word of the return value. Dead keys (diacritics) are indicated by setting the top bit of the return value. If there is no translation, the function returns 0. |
     * | **MAPVK\_VSC\_TO\_VK\_EX**<br>3 | The *uCode* parameter is a scan code and is translated into a virtual-key code that distinguishes between left- and right-hand keys. If there is no translation, the function returns 0. |
     * | **MAPVK\_VK\_TO\_VSC\_EX**<br>4 | **Windows Vista and later:** The *uCode* parameter is a virtual-key code and is translated into a scan code. If it is a virtual-key code that does not distinguish between left- and right-hand keys, the left-hand scan code is returned. If the scan code is an extended scan code, the high byte of the *uCode* value can contain either 0xe0 or 0xe1 to specify the extended scan code. If there is no translation, the function returns 0. |
     * @param {HKL} dwhkl Type: **HKL**
     * 
     * Input locale identifier to use for translating the specified code. This parameter can be any input locale identifier previously returned by the [LoadKeyboardLayout](nf-winuser-loadkeyboardlayouta.md) function.
     * @returns {Integer} Type: **UINT**
     * 
     * The return value is either a scan code, a virtual-key code, or a character value, depending on the value of *uCode* and *uMapType*. If there is no translation, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-mapvirtualkeyexa
     * @since windows5.0
     */
    static MapVirtualKeyExA(uCode, uMapType, dwhkl) {
        dwhkl := dwhkl is Win32Handle ? NumGet(dwhkl, "ptr") : dwhkl

        result := DllCall("USER32.dll\MapVirtualKeyExA", "uint", uCode, "uint", uMapType, "ptr", dwhkl, "uint")
        return result
    }

    /**
     * Translates (maps) a virtual-key code into a scan code or character value, or translates a scan code into a virtual-key code. The function translates the codes using the input language and an input locale identifier.
     * @param {Integer} uCode Type: **UINT**
     * 
     * The [virtual key code](/windows/desktop/inputdev/virtual-key-codes) or scan code for a key. How this value is interpreted depends on the value of the *uMapType* parameter.
     * 
     * **Starting with Windows Vista**, the high byte of the *uCode* value can contain either 0xe0 or 0xe1 to specify the extended scan code.
     * @param {Integer} uMapType Type: **UINT**
     * 
     * The translation to perform. The value of this parameter depends on the value of the <i>uCode</i> parameter.
     * 
     * | Value | Meaning |
     * |-------|---------|
     * | **MAPVK\_VK\_TO\_VSC**<br>0 | The *uCode* parameter is a virtual-key code and is translated into a scan code. If it is a virtual-key code that does not distinguish between left- and right-hand keys, the left-hand scan code is returned. If there is no translation, the function returns 0. |
     * | **MAPVK\_VSC\_TO\_VK**<br>1 | The *uCode* parameter is a scan code and is translated into a virtual-key code that does not distinguish between left- and right-hand keys. If there is no translation, the function returns 0. |
     * | **MAPVK\_VK\_TO\_CHAR**<br>2 | The *uCode* parameter is a virtual-key code and is translated into an unshifted character value in the low order word of the return value. Dead keys (diacritics) are indicated by setting the top bit of the return value. If there is no translation, the function returns 0. |
     * | **MAPVK\_VSC\_TO\_VK\_EX**<br>3 | The *uCode* parameter is a scan code and is translated into a virtual-key code that distinguishes between left- and right-hand keys. If there is no translation, the function returns 0. |
     * | **MAPVK\_VK\_TO\_VSC\_EX**<br>4 | **Windows Vista and later:** The *uCode* parameter is a virtual-key code and is translated into a scan code. If it is a virtual-key code that does not distinguish between left- and right-hand keys, the left-hand scan code is returned. If the scan code is an extended scan code, the high byte of the *uCode* value can contain either 0xe0 or 0xe1 to specify the extended scan code. If there is no translation, the function returns 0. |
     * @param {HKL} dwhkl Type: **HKL**
     * 
     * Input locale identifier to use for translating the specified code. This parameter can be any input locale identifier previously returned by the [LoadKeyboardLayout](nf-winuser-loadkeyboardlayoutw.md) function.
     * @returns {Integer} Type: **UINT**
     * 
     * The return value is either a scan code, a virtual-key code, or a character value, depending on the value of *uCode* and *uMapType*. If there is no translation, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-mapvirtualkeyexw
     * @since windows5.0
     */
    static MapVirtualKeyExW(uCode, uMapType, dwhkl) {
        dwhkl := dwhkl is Win32Handle ? NumGet(dwhkl, "ptr") : dwhkl

        result := DllCall("USER32.dll\MapVirtualKeyExW", "uint", uCode, "uint", uMapType, "ptr", dwhkl, "uint")
        return result
    }

    /**
     * Retrieves a handle to the window (if any) that has captured the mouse. Only one window at a time can capture the mouse; this window receives mouse input whether or not the cursor is within its borders.
     * @returns {HWND} Type: <b>HWND</b>
     * 
     * The return value is a handle to the capture window associated with the current thread. If no window in the thread has captured the mouse, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getcapture
     * @since windows5.0
     */
    static GetCapture() {
        result := DllCall("USER32.dll\GetCapture", "ptr")
        return HWND({Value: result}, True)
    }

    /**
     * Sets the mouse capture to the specified window belonging to the current thread.
     * @param {HWND} hWnd Type: <b>HWND</b>
     * 
     * A handle to the window in the current thread that is to capture the mouse.
     * @returns {HWND} Type: <b>HWND</b>
     * 
     * The return value is a handle to the window that had previously captured the mouse. If there is no such window, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setcapture
     * @since windows5.0
     */
    static SetCapture(hWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("USER32.dll\SetCapture", "ptr", hWnd, "ptr")
        return HWND({Value: result}, True)
    }

    /**
     * Releases the mouse capture from a window in the current thread and restores normal mouse input processing.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-releasecapture
     * @since windows5.0
     */
    static ReleaseCapture() {
        A_LastError := 0

        result := DllCall("USER32.dll\ReleaseCapture", "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables or disables mouse and keyboard input to the specified window or control. When input is disabled, the window does not receive input such as mouse clicks and key presses. When input is enabled, the window receives all input.
     * @param {HWND} hWnd Type: <b>HWND</b>
     * 
     * A handle to the window to be enabled or disabled.
     * @param {BOOL} bEnable Type: <b>BOOL</b>
     * 
     * Indicates whether to enable or disable the window. If this parameter is <b>TRUE</b>, the window is enabled. If the parameter is <b>FALSE</b>, the window is disabled.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the window was previously disabled, the return value is nonzero.
     * 
     * If the window was not previously disabled, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-enablewindow
     * @since windows5.0
     */
    static EnableWindow(hWnd, bEnable) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("USER32.dll\EnableWindow", "ptr", hWnd, "int", bEnable, "int")
        return result
    }

    /**
     * Determines whether the specified window is enabled for mouse and keyboard input.
     * @param {HWND} hWnd Type: <b>HWND</b>
     * 
     * A handle to the window to be tested.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the window is enabled, the return value is nonzero.
     * 
     * If the window is not enabled, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-iswindowenabled
     * @since windows5.0
     */
    static IsWindowEnabled(hWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("USER32.dll\IsWindowEnabled", "ptr", hWnd, "int")
        return result
    }

    /**
     * Captures the mouse and tracks its movement until the user releases the left button, presses the ESC key, or moves the mouse outside the drag rectangle around the specified point.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * A handle to the window receiving mouse input.
     * @param {POINT} pt Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * Initial position of the mouse, in screen coordinates. The function determines the coordinates of the drag rectangle by using this point.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the user moved the mouse outside of the drag rectangle while holding down the left button, the return value is nonzero.
     * 
     * If the user did not move the mouse outside of the drag rectangle while holding down the left button, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-dragdetect
     * @since windows5.0
     */
    static DragDetect(hwnd, pt) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("USER32.dll\DragDetect", "ptr", hwnd, "ptr", pt, "int")
        return result
    }

    /**
     * Activates a window. The window must be attached to the calling thread's message queue.
     * @param {HWND} hWnd Type: <b>HWND</b>
     * 
     * A handle to the top-level window to be activated.
     * @returns {HWND} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the handle to the window that was previously active.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setactivewindow
     * @since windows5.0
     */
    static SetActiveWindow(hWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        A_LastError := 0

        result := DllCall("USER32.dll\SetActiveWindow", "ptr", hWnd, "ptr")
        if(A_LastError)
            throw OSError()

        return HWND({Value: result}, True)
    }

    /**
     * Blocks keyboard and mouse input events from reaching applications.
     * @param {BOOL} fBlockIt Type: <b>BOOL</b>
     * 
     * The function's purpose. If this parameter is <b>TRUE</b>, keyboard and mouse input events are blocked. If this parameter is <b>FALSE</b>, keyboard and mouse events are unblocked. Note that only the thread that blocked input can successfully unblock input.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If input is already blocked, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-blockinput
     * @since windows5.0
     */
    static BlockInput(fBlockIt) {
        A_LastError := 0

        result := DllCall("USER32.dll\BlockInput", "int", fBlockIt, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}
