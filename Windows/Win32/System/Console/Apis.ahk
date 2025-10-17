#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\UI\WindowsAndMessaging\HMENU.ahk
/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class Console {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_TEXTMODE_BUFFER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_SELECTION_INVERTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static VDM_HIDE_WINDOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VDM_IS_ICONIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VDM_CLIENT_RECT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static VDM_CLIENT_TO_SCREEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VDM_SCREEN_TO_CLIENT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static VDM_IS_HIDDEN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static VDM_FULLSCREEN_NOPAINT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static VDM_SET_VIDEO_MODE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_UNREGISTER_VDM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_REGISTER_VDM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_REGISTER_WOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_NOSHORTCUTKEY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_ALTTAB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_ALTESC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_ALTSPACE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_ALTENTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_ALTPRTSC => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_PRTSC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_CTRLESC => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_MODIFIER_SHIFT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_MODIFIER_CONTROL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_MODIFIER_ALT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CHAR_TYPE_SBCS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CHAR_TYPE_LEADING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CHAR_TYPE_TRAILING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_HANDLE_SIGNATURE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_HANDLE_NEVERSET => 268435456

    /**
     * @type {String}
     */
    static CONSOLE_INPUT_STRING => "CONIN$"

    /**
     * @type {String}
     */
    static CONSOLE_OUTPUT_STRING => "CONOUT$"

    /**
     * @type {String}
     */
    static CONSOLE_GENERIC => "CON"

    /**
     * @type {Integer (UInt32)}
     */
    static PID_CONSOLE_FORCEV2 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PID_CONSOLE_WRAPTEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PID_CONSOLE_FILTERONPASTE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PID_CONSOLE_CTRLKEYSDISABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PID_CONSOLE_LINESELECTION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PID_CONSOLE_WINDOWTRANSPARENCY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PID_CONSOLE_WINDOWMAXIMIZED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PID_CONSOLE_CURSOR_TYPE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PID_CONSOLE_CURSOR_COLOR => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PID_CONSOLE_INTERCEPT_COPY_PASTE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PID_CONSOLE_DEFAULTFOREGROUND => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PID_CONSOLE_DEFAULTBACKGROUND => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PID_CONSOLE_TERMINALSCROLLING => 13

    /**
     * @type {Integer (UInt32)}
     */
    static ATTACH_PARENT_PROCESS => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static CTRL_C_EVENT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CTRL_BREAK_EVENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CTRL_CLOSE_EVENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CTRL_LOGOFF_EVENT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CTRL_SHUTDOWN_EVENT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PSEUDOCONSOLE_INHERIT_CURSOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_NO_SELECTION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_SELECTION_IN_PROGRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_SELECTION_NOT_EMPTY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_MOUSE_SELECTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_MOUSE_DOWN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HISTORY_NO_DUP_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_FULLSCREEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_FULLSCREEN_HARDWARE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_FULLSCREEN_MODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONSOLE_WINDOWED_MODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RIGHT_ALT_PRESSED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LEFT_ALT_PRESSED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RIGHT_CTRL_PRESSED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LEFT_CTRL_PRESSED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SHIFT_PRESSED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NUMLOCK_ON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SCROLLLOCK_ON => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CAPSLOCK_ON => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ENHANCED_KEY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NLS_DBCSCHAR => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NLS_ALPHANUMERIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NLS_KATAKANA => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static NLS_HIRAGANA => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static NLS_ROMAN => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static NLS_IME_CONVERSION => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static ALTNUMPAD_BIT => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static NLS_IME_DISABLE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static FROM_LEFT_1ST_BUTTON_PRESSED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RIGHTMOST_BUTTON_PRESSED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FROM_LEFT_2ND_BUTTON_PRESSED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FROM_LEFT_3RD_BUTTON_PRESSED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FROM_LEFT_4TH_BUTTON_PRESSED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_MOVED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOUBLE_CLICK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_WHEELED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_HWHEELED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_EVENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_EVENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINDOW_BUFFER_SIZE_EVENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MENU_EVENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FOCUS_EVENT => 16
;@endregion Constants

;@region Methods
    /**
     * 
     * @returns {BOOL} 
     */
    static AllocConsole() {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\AllocConsole", "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<ALLOC_CONSOLE_OPTIONS>} options 
     * @param {Pointer<Int32>} result 
     * @returns {HRESULT} 
     */
    static AllocConsoleWithOptions(options, result) {
        result := DllCall("KERNEL32.dll\AllocConsoleWithOptions", "ptr", options, "int*", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    static FreeConsole() {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FreeConsole", "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} dwProcessId 
     * @returns {BOOL} 
     */
    static AttachConsole(dwProcessId) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\AttachConsole", "uint", dwProcessId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static GetConsoleCP() {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleCP", "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static GetConsoleOutputCP() {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleOutputCP", "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleHandle 
     * @param {Pointer<UInt32>} lpMode 
     * @returns {BOOL} 
     */
    static GetConsoleMode(hConsoleHandle, lpMode) {
        hConsoleHandle := hConsoleHandle is Win32Handle ? NumGet(hConsoleHandle, "ptr") : hConsoleHandle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleMode", "ptr", hConsoleHandle, "uint*", lpMode, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleHandle 
     * @param {Integer} dwMode 
     * @returns {BOOL} 
     */
    static SetConsoleMode(hConsoleHandle, dwMode) {
        hConsoleHandle := hConsoleHandle is Win32Handle ? NumGet(hConsoleHandle, "ptr") : hConsoleHandle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleMode", "ptr", hConsoleHandle, "uint", dwMode, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleInput 
     * @param {Pointer<UInt32>} lpNumberOfEvents 
     * @returns {BOOL} 
     */
    static GetNumberOfConsoleInputEvents(hConsoleInput, lpNumberOfEvents) {
        hConsoleInput := hConsoleInput is Win32Handle ? NumGet(hConsoleInput, "ptr") : hConsoleInput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNumberOfConsoleInputEvents", "ptr", hConsoleInput, "uint*", lpNumberOfEvents, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsRead 
     * @returns {BOOL} 
     */
    static ReadConsoleInputA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead) {
        hConsoleInput := hConsoleInput is Win32Handle ? NumGet(hConsoleInput, "ptr") : hConsoleInput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleInputA", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsRead 
     * @returns {BOOL} 
     */
    static ReadConsoleInputW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead) {
        hConsoleInput := hConsoleInput is Win32Handle ? NumGet(hConsoleInput, "ptr") : hConsoleInput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleInputW", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsRead 
     * @returns {BOOL} 
     */
    static PeekConsoleInputA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead) {
        hConsoleInput := hConsoleInput is Win32Handle ? NumGet(hConsoleInput, "ptr") : hConsoleInput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\PeekConsoleInputA", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsRead 
     * @returns {BOOL} 
     */
    static PeekConsoleInputW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead) {
        hConsoleInput := hConsoleInput is Win32Handle ? NumGet(hConsoleInput, "ptr") : hConsoleInput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\PeekConsoleInputW", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleInput 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Integer} nNumberOfCharsToRead 
     * @param {Pointer<UInt32>} lpNumberOfCharsRead 
     * @param {Pointer<CONSOLE_READCONSOLE_CONTROL>} pInputControl 
     * @returns {BOOL} 
     */
    static ReadConsoleA(hConsoleInput, lpBuffer, nNumberOfCharsToRead, lpNumberOfCharsRead, pInputControl) {
        hConsoleInput := hConsoleInput is Win32Handle ? NumGet(hConsoleInput, "ptr") : hConsoleInput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleA", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nNumberOfCharsToRead, "uint*", lpNumberOfCharsRead, "ptr", pInputControl, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleInput 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Integer} nNumberOfCharsToRead 
     * @param {Pointer<UInt32>} lpNumberOfCharsRead 
     * @param {Pointer<CONSOLE_READCONSOLE_CONTROL>} pInputControl 
     * @returns {BOOL} 
     */
    static ReadConsoleW(hConsoleInput, lpBuffer, nNumberOfCharsToRead, lpNumberOfCharsRead, pInputControl) {
        hConsoleInput := hConsoleInput is Win32Handle ? NumGet(hConsoleInput, "ptr") : hConsoleInput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleW", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nNumberOfCharsToRead, "uint*", lpNumberOfCharsRead, "ptr", pInputControl, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {PSTR} lpBuffer 
     * @param {Integer} nNumberOfCharsToWrite 
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten 
     * @returns {BOOL} 
     */
    static WriteConsoleA(hConsoleOutput, lpBuffer, nNumberOfCharsToWrite, lpNumberOfCharsWritten) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleA", "ptr", hConsoleOutput, "ptr", lpBuffer, "uint", nNumberOfCharsToWrite, "uint*", lpNumberOfCharsWritten, "ptr", lpReserved, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {PWSTR} lpBuffer 
     * @param {Integer} nNumberOfCharsToWrite 
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten 
     * @returns {BOOL} 
     */
    static WriteConsoleW(hConsoleOutput, lpBuffer, nNumberOfCharsToWrite, lpNumberOfCharsWritten) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleW", "ptr", hConsoleOutput, "ptr", lpBuffer, "uint", nNumberOfCharsToWrite, "uint*", lpNumberOfCharsWritten, "ptr", lpReserved, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<PHANDLER_ROUTINE>} HandlerRoutine 
     * @param {BOOL} Add 
     * @returns {BOOL} 
     */
    static SetConsoleCtrlHandler(HandlerRoutine, Add) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleCtrlHandler", "ptr", HandlerRoutine, "int", Add, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {COORD} size 
     * @param {HANDLE} hInput 
     * @param {HANDLE} hOutput 
     * @param {Integer} dwFlags 
     * @param {Pointer<HPCON>} phPC 
     * @returns {HRESULT} 
     */
    static CreatePseudoConsole(size, hInput, hOutput, dwFlags, phPC) {
        hInput := hInput is Win32Handle ? NumGet(hInput, "ptr") : hInput
        hOutput := hOutput is Win32Handle ? NumGet(hOutput, "ptr") : hOutput

        result := DllCall("KERNEL32.dll\CreatePseudoConsole", "ptr", size, "ptr", hInput, "ptr", hOutput, "uint", dwFlags, "ptr", phPC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HPCON} hPC 
     * @param {COORD} size 
     * @returns {HRESULT} 
     */
    static ResizePseudoConsole(hPC, size) {
        hPC := hPC is Win32Handle ? NumGet(hPC, "ptr") : hPC

        result := DllCall("KERNEL32.dll\ResizePseudoConsole", "ptr", hPC, "ptr", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HPCON} hPC 
     * @returns {String} Nothing - always returns an empty string
     */
    static ClosePseudoConsole(hPC) {
        hPC := hPC is Win32Handle ? NumGet(hPC, "ptr") : hPC

        DllCall("KERNEL32.dll\ClosePseudoConsole", "ptr", hPC)
    }

    /**
     * 
     * @param {HPCON} hPC 
     * @returns {HRESULT} 
     */
    static ReleasePseudoConsole(hPC) {
        hPC := hPC is Win32Handle ? NumGet(hPC, "ptr") : hPC

        result := DllCall("KERNEL32.dll\ReleasePseudoConsole", "ptr", hPC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {CHAR} cCharacter 
     * @param {Integer} nLength 
     * @param {COORD} dwWriteCoord 
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten 
     * @returns {BOOL} 
     */
    static FillConsoleOutputCharacterA(hConsoleOutput, cCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FillConsoleOutputCharacterA", "ptr", hConsoleOutput, "char", cCharacter, "uint", nLength, "ptr", dwWriteCoord, "uint*", lpNumberOfCharsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Integer} cCharacter 
     * @param {Integer} nLength 
     * @param {COORD} dwWriteCoord 
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten 
     * @returns {BOOL} 
     */
    static FillConsoleOutputCharacterW(hConsoleOutput, cCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FillConsoleOutputCharacterW", "ptr", hConsoleOutput, "char", cCharacter, "uint", nLength, "ptr", dwWriteCoord, "uint*", lpNumberOfCharsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Integer} wAttribute 
     * @param {Integer} nLength 
     * @param {COORD} dwWriteCoord 
     * @param {Pointer<UInt32>} lpNumberOfAttrsWritten 
     * @returns {BOOL} 
     */
    static FillConsoleOutputAttribute(hConsoleOutput, wAttribute, nLength, dwWriteCoord, lpNumberOfAttrsWritten) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FillConsoleOutputAttribute", "ptr", hConsoleOutput, "ushort", wAttribute, "uint", nLength, "ptr", dwWriteCoord, "uint*", lpNumberOfAttrsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} dwCtrlEvent 
     * @param {Integer} dwProcessGroupId 
     * @returns {BOOL} 
     */
    static GenerateConsoleCtrlEvent(dwCtrlEvent, dwProcessGroupId) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GenerateConsoleCtrlEvent", "uint", dwCtrlEvent, "uint", dwProcessGroupId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} dwDesiredAccess 
     * @param {Integer} dwShareMode 
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes 
     * @param {Integer} dwFlags 
     * @returns {HANDLE} 
     */
    static CreateConsoleScreenBuffer(dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwFlags) {
        static lpScreenBufferData := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateConsoleScreenBuffer", "uint", dwDesiredAccess, "uint", dwShareMode, "ptr", lpSecurityAttributes, "uint", dwFlags, "ptr", lpScreenBufferData, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @returns {BOOL} 
     */
    static SetConsoleActiveScreenBuffer(hConsoleOutput) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleActiveScreenBuffer", "ptr", hConsoleOutput, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleInput 
     * @returns {BOOL} 
     */
    static FlushConsoleInputBuffer(hConsoleInput) {
        hConsoleInput := hConsoleInput is Win32Handle ? NumGet(hConsoleInput, "ptr") : hConsoleInput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FlushConsoleInputBuffer", "ptr", hConsoleInput, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} wCodePageID 
     * @returns {BOOL} 
     */
    static SetConsoleCP(wCodePageID) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleCP", "uint", wCodePageID, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} wCodePageID 
     * @returns {BOOL} 
     */
    static SetConsoleOutputCP(wCodePageID) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleOutputCP", "uint", wCodePageID, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Pointer<CONSOLE_CURSOR_INFO>} lpConsoleCursorInfo 
     * @returns {BOOL} 
     */
    static GetConsoleCursorInfo(hConsoleOutput, lpConsoleCursorInfo) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleCursorInfo", "ptr", hConsoleOutput, "ptr", lpConsoleCursorInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Pointer<CONSOLE_CURSOR_INFO>} lpConsoleCursorInfo 
     * @returns {BOOL} 
     */
    static SetConsoleCursorInfo(hConsoleOutput, lpConsoleCursorInfo) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleCursorInfo", "ptr", hConsoleOutput, "ptr", lpConsoleCursorInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Pointer<CONSOLE_SCREEN_BUFFER_INFO>} lpConsoleScreenBufferInfo 
     * @returns {BOOL} 
     */
    static GetConsoleScreenBufferInfo(hConsoleOutput, lpConsoleScreenBufferInfo) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleScreenBufferInfo", "ptr", hConsoleOutput, "ptr", lpConsoleScreenBufferInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Pointer<CONSOLE_SCREEN_BUFFER_INFOEX>} lpConsoleScreenBufferInfoEx 
     * @returns {BOOL} 
     */
    static GetConsoleScreenBufferInfoEx(hConsoleOutput, lpConsoleScreenBufferInfoEx) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleScreenBufferInfoEx", "ptr", hConsoleOutput, "ptr", lpConsoleScreenBufferInfoEx, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Pointer<CONSOLE_SCREEN_BUFFER_INFOEX>} lpConsoleScreenBufferInfoEx 
     * @returns {BOOL} 
     */
    static SetConsoleScreenBufferInfoEx(hConsoleOutput, lpConsoleScreenBufferInfoEx) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleScreenBufferInfoEx", "ptr", hConsoleOutput, "ptr", lpConsoleScreenBufferInfoEx, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {COORD} dwSize 
     * @returns {BOOL} 
     */
    static SetConsoleScreenBufferSize(hConsoleOutput, dwSize) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleScreenBufferSize", "ptr", hConsoleOutput, "ptr", dwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {COORD} dwCursorPosition 
     * @returns {BOOL} 
     */
    static SetConsoleCursorPosition(hConsoleOutput, dwCursorPosition) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleCursorPosition", "ptr", hConsoleOutput, "ptr", dwCursorPosition, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @returns {COORD} 
     */
    static GetLargestConsoleWindowSize(hConsoleOutput) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetLargestConsoleWindowSize", "ptr", hConsoleOutput, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Integer} wAttributes 
     * @returns {BOOL} 
     */
    static SetConsoleTextAttribute(hConsoleOutput, wAttributes) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleTextAttribute", "ptr", hConsoleOutput, "ushort", wAttributes, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {BOOL} bAbsolute 
     * @param {Pointer<SMALL_RECT>} lpConsoleWindow 
     * @returns {BOOL} 
     */
    static SetConsoleWindowInfo(hConsoleOutput, bAbsolute, lpConsoleWindow) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleWindowInfo", "ptr", hConsoleOutput, "int", bAbsolute, "ptr", lpConsoleWindow, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {PSTR} lpCharacter 
     * @param {Integer} nLength 
     * @param {COORD} dwWriteCoord 
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten 
     * @returns {BOOL} 
     */
    static WriteConsoleOutputCharacterA(hConsoleOutput, lpCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten) {
        lpCharacter := lpCharacter is String ? StrPtr(lpCharacter) : lpCharacter
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleOutputCharacterA", "ptr", hConsoleOutput, "ptr", lpCharacter, "uint", nLength, "ptr", dwWriteCoord, "uint*", lpNumberOfCharsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {PWSTR} lpCharacter 
     * @param {Integer} nLength 
     * @param {COORD} dwWriteCoord 
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten 
     * @returns {BOOL} 
     */
    static WriteConsoleOutputCharacterW(hConsoleOutput, lpCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten) {
        lpCharacter := lpCharacter is String ? StrPtr(lpCharacter) : lpCharacter
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleOutputCharacterW", "ptr", hConsoleOutput, "ptr", lpCharacter, "uint", nLength, "ptr", dwWriteCoord, "uint*", lpNumberOfCharsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Pointer<UInt16>} lpAttribute 
     * @param {Integer} nLength 
     * @param {COORD} dwWriteCoord 
     * @param {Pointer<UInt32>} lpNumberOfAttrsWritten 
     * @returns {BOOL} 
     */
    static WriteConsoleOutputAttribute(hConsoleOutput, lpAttribute, nLength, dwWriteCoord, lpNumberOfAttrsWritten) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleOutputAttribute", "ptr", hConsoleOutput, "ushort*", lpAttribute, "uint", nLength, "ptr", dwWriteCoord, "uint*", lpNumberOfAttrsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {PSTR} lpCharacter 
     * @param {Integer} nLength 
     * @param {COORD} dwReadCoord 
     * @param {Pointer<UInt32>} lpNumberOfCharsRead 
     * @returns {BOOL} 
     */
    static ReadConsoleOutputCharacterA(hConsoleOutput, lpCharacter, nLength, dwReadCoord, lpNumberOfCharsRead) {
        lpCharacter := lpCharacter is String ? StrPtr(lpCharacter) : lpCharacter
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleOutputCharacterA", "ptr", hConsoleOutput, "ptr", lpCharacter, "uint", nLength, "ptr", dwReadCoord, "uint*", lpNumberOfCharsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {PWSTR} lpCharacter 
     * @param {Integer} nLength 
     * @param {COORD} dwReadCoord 
     * @param {Pointer<UInt32>} lpNumberOfCharsRead 
     * @returns {BOOL} 
     */
    static ReadConsoleOutputCharacterW(hConsoleOutput, lpCharacter, nLength, dwReadCoord, lpNumberOfCharsRead) {
        lpCharacter := lpCharacter is String ? StrPtr(lpCharacter) : lpCharacter
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleOutputCharacterW", "ptr", hConsoleOutput, "ptr", lpCharacter, "uint", nLength, "ptr", dwReadCoord, "uint*", lpNumberOfCharsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Pointer<UInt16>} lpAttribute 
     * @param {Integer} nLength 
     * @param {COORD} dwReadCoord 
     * @param {Pointer<UInt32>} lpNumberOfAttrsRead 
     * @returns {BOOL} 
     */
    static ReadConsoleOutputAttribute(hConsoleOutput, lpAttribute, nLength, dwReadCoord, lpNumberOfAttrsRead) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleOutputAttribute", "ptr", hConsoleOutput, "ushort*", lpAttribute, "uint", nLength, "ptr", dwReadCoord, "uint*", lpNumberOfAttrsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsWritten 
     * @returns {BOOL} 
     */
    static WriteConsoleInputA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten) {
        hConsoleInput := hConsoleInput is Win32Handle ? NumGet(hConsoleInput, "ptr") : hConsoleInput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleInputA", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsWritten 
     * @returns {BOOL} 
     */
    static WriteConsoleInputW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten) {
        hConsoleInput := hConsoleInput is Win32Handle ? NumGet(hConsoleInput, "ptr") : hConsoleInput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleInputW", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Pointer<SMALL_RECT>} lpScrollRectangle 
     * @param {Pointer<SMALL_RECT>} lpClipRectangle 
     * @param {COORD} dwDestinationOrigin 
     * @param {Pointer<CHAR_INFO>} lpFill 
     * @returns {BOOL} 
     */
    static ScrollConsoleScreenBufferA(hConsoleOutput, lpScrollRectangle, lpClipRectangle, dwDestinationOrigin, lpFill) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ScrollConsoleScreenBufferA", "ptr", hConsoleOutput, "ptr", lpScrollRectangle, "ptr", lpClipRectangle, "ptr", dwDestinationOrigin, "ptr", lpFill, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Pointer<SMALL_RECT>} lpScrollRectangle 
     * @param {Pointer<SMALL_RECT>} lpClipRectangle 
     * @param {COORD} dwDestinationOrigin 
     * @param {Pointer<CHAR_INFO>} lpFill 
     * @returns {BOOL} 
     */
    static ScrollConsoleScreenBufferW(hConsoleOutput, lpScrollRectangle, lpClipRectangle, dwDestinationOrigin, lpFill) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ScrollConsoleScreenBufferW", "ptr", hConsoleOutput, "ptr", lpScrollRectangle, "ptr", lpClipRectangle, "ptr", dwDestinationOrigin, "ptr", lpFill, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Pointer<CHAR_INFO>} lpBuffer 
     * @param {COORD} dwBufferSize 
     * @param {COORD} dwBufferCoord 
     * @param {Pointer<SMALL_RECT>} lpWriteRegion 
     * @returns {BOOL} 
     */
    static WriteConsoleOutputA(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpWriteRegion) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleOutputA", "ptr", hConsoleOutput, "ptr", lpBuffer, "ptr", dwBufferSize, "ptr", dwBufferCoord, "ptr", lpWriteRegion, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Pointer<CHAR_INFO>} lpBuffer 
     * @param {COORD} dwBufferSize 
     * @param {COORD} dwBufferCoord 
     * @param {Pointer<SMALL_RECT>} lpWriteRegion 
     * @returns {BOOL} 
     */
    static WriteConsoleOutputW(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpWriteRegion) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleOutputW", "ptr", hConsoleOutput, "ptr", lpBuffer, "ptr", dwBufferSize, "ptr", dwBufferCoord, "ptr", lpWriteRegion, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Pointer<CHAR_INFO>} lpBuffer 
     * @param {COORD} dwBufferSize 
     * @param {COORD} dwBufferCoord 
     * @param {Pointer<SMALL_RECT>} lpReadRegion 
     * @returns {BOOL} 
     */
    static ReadConsoleOutputA(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpReadRegion) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleOutputA", "ptr", hConsoleOutput, "ptr", lpBuffer, "ptr", dwBufferSize, "ptr", dwBufferCoord, "ptr", lpReadRegion, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Pointer<CHAR_INFO>} lpBuffer 
     * @param {COORD} dwBufferSize 
     * @param {COORD} dwBufferCoord 
     * @param {Pointer<SMALL_RECT>} lpReadRegion 
     * @returns {BOOL} 
     */
    static ReadConsoleOutputW(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpReadRegion) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleOutputW", "ptr", hConsoleOutput, "ptr", lpBuffer, "ptr", dwBufferSize, "ptr", dwBufferCoord, "ptr", lpReadRegion, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PSTR} lpConsoleTitle 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static GetConsoleTitleA(lpConsoleTitle, nSize) {
        lpConsoleTitle := lpConsoleTitle is String ? StrPtr(lpConsoleTitle) : lpConsoleTitle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleTitleA", "ptr", lpConsoleTitle, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} lpConsoleTitle 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static GetConsoleTitleW(lpConsoleTitle, nSize) {
        lpConsoleTitle := lpConsoleTitle is String ? StrPtr(lpConsoleTitle) : lpConsoleTitle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleTitleW", "ptr", lpConsoleTitle, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PSTR} lpConsoleTitle 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static GetConsoleOriginalTitleA(lpConsoleTitle, nSize) {
        lpConsoleTitle := lpConsoleTitle is String ? StrPtr(lpConsoleTitle) : lpConsoleTitle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleOriginalTitleA", "ptr", lpConsoleTitle, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} lpConsoleTitle 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static GetConsoleOriginalTitleW(lpConsoleTitle, nSize) {
        lpConsoleTitle := lpConsoleTitle is String ? StrPtr(lpConsoleTitle) : lpConsoleTitle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleOriginalTitleW", "ptr", lpConsoleTitle, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PSTR} lpConsoleTitle 
     * @returns {BOOL} 
     */
    static SetConsoleTitleA(lpConsoleTitle) {
        lpConsoleTitle := lpConsoleTitle is String ? StrPtr(lpConsoleTitle) : lpConsoleTitle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleTitleA", "ptr", lpConsoleTitle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} lpConsoleTitle 
     * @returns {BOOL} 
     */
    static SetConsoleTitleW(lpConsoleTitle) {
        lpConsoleTitle := lpConsoleTitle is String ? StrPtr(lpConsoleTitle) : lpConsoleTitle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleTitleW", "ptr", lpConsoleTitle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpNumberOfMouseButtons 
     * @returns {BOOL} 
     */
    static GetNumberOfConsoleMouseButtons(lpNumberOfMouseButtons) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNumberOfConsoleMouseButtons", "uint*", lpNumberOfMouseButtons, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Integer} nFont 
     * @returns {COORD} 
     */
    static GetConsoleFontSize(hConsoleOutput, nFont) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleFontSize", "ptr", hConsoleOutput, "uint", nFont, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {BOOL} bMaximumWindow 
     * @param {Pointer<CONSOLE_FONT_INFO>} lpConsoleCurrentFont 
     * @returns {BOOL} 
     */
    static GetCurrentConsoleFont(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFont) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCurrentConsoleFont", "ptr", hConsoleOutput, "int", bMaximumWindow, "ptr", lpConsoleCurrentFont, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {BOOL} bMaximumWindow 
     * @param {Pointer<CONSOLE_FONT_INFOEX>} lpConsoleCurrentFontEx 
     * @returns {BOOL} 
     */
    static GetCurrentConsoleFontEx(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFontEx) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCurrentConsoleFontEx", "ptr", hConsoleOutput, "int", bMaximumWindow, "ptr", lpConsoleCurrentFontEx, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {BOOL} bMaximumWindow 
     * @param {Pointer<CONSOLE_FONT_INFOEX>} lpConsoleCurrentFontEx 
     * @returns {BOOL} 
     */
    static SetCurrentConsoleFontEx(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFontEx) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetCurrentConsoleFontEx", "ptr", hConsoleOutput, "int", bMaximumWindow, "ptr", lpConsoleCurrentFontEx, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<CONSOLE_SELECTION_INFO>} lpConsoleSelectionInfo 
     * @returns {BOOL} 
     */
    static GetConsoleSelectionInfo(lpConsoleSelectionInfo) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleSelectionInfo", "ptr", lpConsoleSelectionInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<CONSOLE_HISTORY_INFO>} lpConsoleHistoryInfo 
     * @returns {BOOL} 
     */
    static GetConsoleHistoryInfo(lpConsoleHistoryInfo) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleHistoryInfo", "ptr", lpConsoleHistoryInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<CONSOLE_HISTORY_INFO>} lpConsoleHistoryInfo 
     * @returns {BOOL} 
     */
    static SetConsoleHistoryInfo(lpConsoleHistoryInfo) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleHistoryInfo", "ptr", lpConsoleHistoryInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpModeFlags 
     * @returns {BOOL} 
     */
    static GetConsoleDisplayMode(lpModeFlags) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleDisplayMode", "uint*", lpModeFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Integer} dwFlags 
     * @param {Pointer<COORD>} lpNewScreenBufferDimensions 
     * @returns {BOOL} 
     */
    static SetConsoleDisplayMode(hConsoleOutput, dwFlags, lpNewScreenBufferDimensions) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleDisplayMode", "ptr", hConsoleOutput, "uint", dwFlags, "ptr", lpNewScreenBufferDimensions, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @returns {HWND} 
     */
    static GetConsoleWindow() {
        result := DllCall("KERNEL32.dll\GetConsoleWindow", "ptr")
        return HWND({Value: result}, True)
    }

    /**
     * 
     * @param {PSTR} Source 
     * @param {PSTR} Target 
     * @param {PSTR} ExeName 
     * @returns {BOOL} 
     */
    static AddConsoleAliasA(Source, Target, ExeName) {
        Source := Source is String ? StrPtr(Source) : Source
        Target := Target is String ? StrPtr(Target) : Target
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\AddConsoleAliasA", "ptr", Source, "ptr", Target, "ptr", ExeName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} Source 
     * @param {PWSTR} Target 
     * @param {PWSTR} ExeName 
     * @returns {BOOL} 
     */
    static AddConsoleAliasW(Source, Target, ExeName) {
        Source := Source is String ? StrPtr(Source) : Source
        Target := Target is String ? StrPtr(Target) : Target
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\AddConsoleAliasW", "ptr", Source, "ptr", Target, "ptr", ExeName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PSTR} Source 
     * @param {PSTR} TargetBuffer 
     * @param {Integer} TargetBufferLength 
     * @param {PSTR} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleAliasA(Source, TargetBuffer, TargetBufferLength, ExeName) {
        Source := Source is String ? StrPtr(Source) : Source
        TargetBuffer := TargetBuffer is String ? StrPtr(TargetBuffer) : TargetBuffer
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasA", "ptr", Source, "ptr", TargetBuffer, "uint", TargetBufferLength, "ptr", ExeName, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} Source 
     * @param {PWSTR} TargetBuffer 
     * @param {Integer} TargetBufferLength 
     * @param {PWSTR} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleAliasW(Source, TargetBuffer, TargetBufferLength, ExeName) {
        Source := Source is String ? StrPtr(Source) : Source
        TargetBuffer := TargetBuffer is String ? StrPtr(TargetBuffer) : TargetBuffer
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasW", "ptr", Source, "ptr", TargetBuffer, "uint", TargetBufferLength, "ptr", ExeName, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PSTR} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleAliasesLengthA(ExeName) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\GetConsoleAliasesLengthA", "ptr", ExeName, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleAliasesLengthW(ExeName) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\GetConsoleAliasesLengthW", "ptr", ExeName, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static GetConsoleAliasExesLengthA() {
        result := DllCall("KERNEL32.dll\GetConsoleAliasExesLengthA", "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static GetConsoleAliasExesLengthW() {
        result := DllCall("KERNEL32.dll\GetConsoleAliasExesLengthW", "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} AliasBuffer 
     * @param {Integer} AliasBufferLength 
     * @param {PSTR} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleAliasesA(AliasBuffer, AliasBufferLength, ExeName) {
        AliasBuffer := AliasBuffer is String ? StrPtr(AliasBuffer) : AliasBuffer
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasesA", "ptr", AliasBuffer, "uint", AliasBufferLength, "ptr", ExeName, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} AliasBuffer 
     * @param {Integer} AliasBufferLength 
     * @param {PWSTR} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleAliasesW(AliasBuffer, AliasBufferLength, ExeName) {
        AliasBuffer := AliasBuffer is String ? StrPtr(AliasBuffer) : AliasBuffer
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasesW", "ptr", AliasBuffer, "uint", AliasBufferLength, "ptr", ExeName, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PSTR} ExeNameBuffer 
     * @param {Integer} ExeNameBufferLength 
     * @returns {Integer} 
     */
    static GetConsoleAliasExesA(ExeNameBuffer, ExeNameBufferLength) {
        ExeNameBuffer := ExeNameBuffer is String ? StrPtr(ExeNameBuffer) : ExeNameBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasExesA", "ptr", ExeNameBuffer, "uint", ExeNameBufferLength, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} ExeNameBuffer 
     * @param {Integer} ExeNameBufferLength 
     * @returns {Integer} 
     */
    static GetConsoleAliasExesW(ExeNameBuffer, ExeNameBufferLength) {
        ExeNameBuffer := ExeNameBuffer is String ? StrPtr(ExeNameBuffer) : ExeNameBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasExesW", "ptr", ExeNameBuffer, "uint", ExeNameBufferLength, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PSTR} ExeName 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExpungeConsoleCommandHistoryA(ExeName) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        DllCall("KERNEL32.dll\ExpungeConsoleCommandHistoryA", "ptr", ExeName)
    }

    /**
     * 
     * @param {PWSTR} ExeName 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExpungeConsoleCommandHistoryW(ExeName) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        DllCall("KERNEL32.dll\ExpungeConsoleCommandHistoryW", "ptr", ExeName)
    }

    /**
     * 
     * @param {Integer} Number 
     * @param {PSTR} ExeName 
     * @returns {BOOL} 
     */
    static SetConsoleNumberOfCommandsA(Number, ExeName) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\SetConsoleNumberOfCommandsA", "uint", Number, "ptr", ExeName, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Number 
     * @param {PWSTR} ExeName 
     * @returns {BOOL} 
     */
    static SetConsoleNumberOfCommandsW(Number, ExeName) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\SetConsoleNumberOfCommandsW", "uint", Number, "ptr", ExeName, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleCommandHistoryLengthA(ExeName) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\GetConsoleCommandHistoryLengthA", "ptr", ExeName, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleCommandHistoryLengthW(ExeName) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\GetConsoleCommandHistoryLengthW", "ptr", ExeName, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} Commands 
     * @param {Integer} CommandBufferLength 
     * @param {PSTR} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleCommandHistoryA(Commands, CommandBufferLength, ExeName) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\GetConsoleCommandHistoryA", "ptr", Commands, "uint", CommandBufferLength, "ptr", ExeName, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} Commands 
     * @param {Integer} CommandBufferLength 
     * @param {PWSTR} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleCommandHistoryW(Commands, CommandBufferLength, ExeName) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\GetConsoleCommandHistoryW", "ptr", Commands, "uint", CommandBufferLength, "ptr", ExeName, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpdwProcessList 
     * @param {Integer} dwProcessCount 
     * @returns {Integer} 
     */
    static GetConsoleProcessList(lpdwProcessList, dwProcessCount) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleProcessList", "uint*", lpdwProcessList, "uint", dwProcessCount, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PSTR} pszLayout 
     * @returns {BOOL} 
     */
    static GetConsoleKeyboardLayoutNameA(pszLayout) {
        pszLayout := pszLayout is String ? StrPtr(pszLayout) : pszLayout

        result := DllCall("user32.dll\GetConsoleKeyboardLayoutNameA", "ptr", pszLayout, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszLayout 
     * @returns {BOOL} 
     */
    static GetConsoleKeyboardLayoutNameW(pszLayout) {
        pszLayout := pszLayout is String ? StrPtr(pszLayout) : pszLayout

        result := DllCall("user32.dll\GetConsoleKeyboardLayoutNameW", "ptr", pszLayout, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Pointer<SMALL_RECT>} lpRect 
     * @returns {BOOL} 
     */
    static InvalidateConsoleDIBits(hConsoleOutput, lpRect) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        result := DllCall("KERNEL32.dll\InvalidateConsoleDIBits", "ptr", hConsoleOutput, "ptr", lpRect, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static SetLastConsoleEventActive() {
        DllCall("KERNEL32.dll\SetLastConsoleEventActive")
    }

    /**
     * 
     * @param {Integer} iFunction 
     * @param {Pointer<Void>} lpData 
     * @returns {BOOL} 
     */
    static VDMConsoleOperation(iFunction, lpData) {
        result := DllCall("KERNEL32.dll\VDMConsoleOperation", "uint", iFunction, "ptr", lpData, "int")
        return result
    }

    /**
     * 
     * @param {HICON} hIcon 
     * @returns {BOOL} 
     */
    static SetConsoleIcon(hIcon) {
        hIcon := hIcon is Win32Handle ? NumGet(hIcon, "ptr") : hIcon

        result := DllCall("KERNEL32.dll\SetConsoleIcon", "ptr", hIcon, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Integer} nFont 
     * @returns {BOOL} 
     */
    static SetConsoleFont(hConsoleOutput, nFont) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        result := DllCall("KERNEL32.dll\SetConsoleFont", "ptr", hConsoleOutput, "uint", nFont, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {BOOL} bMaximumWindow 
     * @param {Integer} nLength 
     * @param {Pointer<CONSOLE_FONT_INFO>} lpConsoleFontInfo 
     * @returns {Integer} 
     */
    static GetConsoleFontInfo(hConsoleOutput, bMaximumWindow, nLength, lpConsoleFontInfo) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        result := DllCall("KERNEL32.dll\GetConsoleFontInfo", "ptr", hConsoleOutput, "int", bMaximumWindow, "uint", nLength, "ptr", lpConsoleFontInfo, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static GetNumberOfConsoleFonts() {
        result := DllCall("KERNEL32.dll\GetNumberOfConsoleFonts", "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {HCURSOR} hCursor 
     * @returns {BOOL} 
     */
    static SetConsoleCursor(hConsoleOutput, hCursor) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput
        hCursor := hCursor is Win32Handle ? NumGet(hCursor, "ptr") : hCursor

        result := DllCall("KERNEL32.dll\SetConsoleCursor", "ptr", hConsoleOutput, "ptr", hCursor, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {BOOL} bShow 
     * @returns {Integer} 
     */
    static ShowConsoleCursor(hConsoleOutput, bShow) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        result := DllCall("KERNEL32.dll\ShowConsoleCursor", "ptr", hConsoleOutput, "int", bShow, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Integer} dwCommandIdLow 
     * @param {Integer} dwCommandIdHigh 
     * @returns {HMENU} 
     */
    static ConsoleMenuControl(hConsoleOutput, dwCommandIdLow, dwCommandIdHigh) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        result := DllCall("KERNEL32.dll\ConsoleMenuControl", "ptr", hConsoleOutput, "uint", dwCommandIdLow, "uint", dwCommandIdHigh, "ptr")
        return HMENU({Value: result}, True)
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {HPALETTE} hPalette 
     * @param {Integer} dwUsage 
     * @returns {BOOL} 
     */
    static SetConsolePalette(hConsoleOutput, hPalette, dwUsage) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput
        hPalette := hPalette is Win32Handle ? NumGet(hPalette, "ptr") : hPalette

        result := DllCall("KERNEL32.dll\SetConsolePalette", "ptr", hConsoleOutput, "ptr", hPalette, "uint", dwUsage, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwRegisterFlags 
     * @param {HANDLE} hStartHardwareEvent 
     * @param {HANDLE} hEndHardwareEvent 
     * @param {HANDLE} hErrorhardwareEvent 
     * @param {Pointer<UInt32>} lpStateLength 
     * @param {Pointer<Void>} lpState 
     * @param {COORD} VDMBufferSize 
     * @param {Pointer<Void>} lpVDMBuffer 
     * @returns {BOOL} 
     */
    static RegisterConsoleVDM(dwRegisterFlags, hStartHardwareEvent, hEndHardwareEvent, hErrorhardwareEvent, lpStateLength, lpState, VDMBufferSize, lpVDMBuffer) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        hStartHardwareEvent := hStartHardwareEvent is Win32Handle ? NumGet(hStartHardwareEvent, "ptr") : hStartHardwareEvent
        hEndHardwareEvent := hEndHardwareEvent is Win32Handle ? NumGet(hEndHardwareEvent, "ptr") : hEndHardwareEvent
        hErrorhardwareEvent := hErrorhardwareEvent is Win32Handle ? NumGet(hErrorhardwareEvent, "ptr") : hErrorhardwareEvent

        result := DllCall("KERNEL32.dll\RegisterConsoleVDM", "uint", dwRegisterFlags, "ptr", hStartHardwareEvent, "ptr", hEndHardwareEvent, "ptr", hErrorhardwareEvent, "uint", Reserved, "uint*", lpStateLength, "ptr", lpState, "ptr", VDMBufferSize, "ptr", lpVDMBuffer, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {Pointer<COORD>} lpResolution 
     * @param {Pointer<COORD>} lpFontSize 
     * @returns {BOOL} 
     */
    static GetConsoleHardwareState(hConsoleOutput, lpResolution, lpFontSize) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        result := DllCall("KERNEL32.dll\GetConsoleHardwareState", "ptr", hConsoleOutput, "ptr", lpResolution, "ptr", lpFontSize, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleOutput 
     * @param {COORD} dwResolution 
     * @param {COORD} dwFontSize 
     * @returns {BOOL} 
     */
    static SetConsoleHardwareState(hConsoleOutput, dwResolution, dwFontSize) {
        hConsoleOutput := hConsoleOutput is Win32Handle ? NumGet(hConsoleOutput, "ptr") : hConsoleOutput

        result := DllCall("KERNEL32.dll\SetConsoleHardwareState", "ptr", hConsoleOutput, "ptr", dwResolution, "ptr", dwFontSize, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} bSet 
     * @param {Integer} bReserveKeys 
     * @param {Pointer<APPKEY>} lpAppKeys 
     * @param {Integer} dwNumAppKeys 
     * @returns {BOOL} 
     */
    static SetConsoleKeyShortcuts(bSet, bReserveKeys, lpAppKeys, dwNumAppKeys) {
        result := DllCall("KERNEL32.dll\SetConsoleKeyShortcuts", "int", bSet, "char", bReserveKeys, "ptr", lpAppKeys, "uint", dwNumAppKeys, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} bEnable 
     * @returns {BOOL} 
     */
    static SetConsoleMenuClose(bEnable) {
        result := DllCall("KERNEL32.dll\SetConsoleMenuClose", "int", bEnable, "int")
        return result
    }

    /**
     * 
     * @param {Integer} nBufferLength 
     * @param {PSTR} lpBuffer 
     * @returns {Integer} 
     */
    static GetConsoleInputExeNameA(nBufferLength, lpBuffer) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        result := DllCall("KERNEL32.dll\GetConsoleInputExeNameA", "uint", nBufferLength, "ptr", lpBuffer, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} nBufferLength 
     * @param {PWSTR} lpBuffer 
     * @returns {Integer} 
     */
    static GetConsoleInputExeNameW(nBufferLength, lpBuffer) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        result := DllCall("KERNEL32.dll\GetConsoleInputExeNameW", "uint", nBufferLength, "ptr", lpBuffer, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} lpExeName 
     * @returns {BOOL} 
     */
    static SetConsoleInputExeNameA(lpExeName) {
        lpExeName := lpExeName is String ? StrPtr(lpExeName) : lpExeName

        result := DllCall("KERNEL32.dll\SetConsoleInputExeNameA", "ptr", lpExeName, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpExeName 
     * @returns {BOOL} 
     */
    static SetConsoleInputExeNameW(lpExeName) {
        lpExeName := lpExeName is String ? StrPtr(lpExeName) : lpExeName

        result := DllCall("KERNEL32.dll\SetConsoleInputExeNameW", "ptr", lpExeName, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsRead 
     * @param {Integer} wFlags 
     * @returns {BOOL} 
     */
    static ReadConsoleInputExA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead, wFlags) {
        hConsoleInput := hConsoleInput is Win32Handle ? NumGet(hConsoleInput, "ptr") : hConsoleInput

        result := DllCall("KERNEL32.dll\ReadConsoleInputExA", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsRead, "ushort", wFlags, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsRead 
     * @param {Integer} wFlags 
     * @returns {BOOL} 
     */
    static ReadConsoleInputExW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead, wFlags) {
        hConsoleInput := hConsoleInput is Win32Handle ? NumGet(hConsoleInput, "ptr") : hConsoleInput

        result := DllCall("KERNEL32.dll\ReadConsoleInputExW", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsRead, "ushort", wFlags, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsWritten 
     * @returns {BOOL} 
     */
    static WriteConsoleInputVDMA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten) {
        hConsoleInput := hConsoleInput is Win32Handle ? NumGet(hConsoleInput, "ptr") : hConsoleInput

        result := DllCall("KERNEL32.dll\WriteConsoleInputVDMA", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsWritten, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsWritten 
     * @returns {BOOL} 
     */
    static WriteConsoleInputVDMW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten) {
        hConsoleInput := hConsoleInput is Win32Handle ? NumGet(hConsoleInput, "ptr") : hConsoleInput

        result := DllCall("KERNEL32.dll\WriteConsoleInputVDMW", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsWritten, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsole 
     * @param {Pointer<UInt32>} lpdwNlsMode 
     * @returns {BOOL} 
     */
    static GetConsoleNlsMode(hConsole, lpdwNlsMode) {
        hConsole := hConsole is Win32Handle ? NumGet(hConsole, "ptr") : hConsole

        result := DllCall("KERNEL32.dll\GetConsoleNlsMode", "ptr", hConsole, "uint*", lpdwNlsMode, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsole 
     * @param {Integer} fdwNlsMode 
     * @returns {BOOL} 
     */
    static SetConsoleNlsMode(hConsole, fdwNlsMode) {
        hConsole := hConsole is Win32Handle ? NumGet(hConsole, "ptr") : hConsole

        result := DllCall("KERNEL32.dll\SetConsoleNlsMode", "ptr", hConsole, "uint", fdwNlsMode, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsole 
     * @param {COORD} coordCheck 
     * @param {Pointer<UInt32>} pdwType 
     * @returns {BOOL} 
     */
    static GetConsoleCharType(hConsole, coordCheck, pdwType) {
        hConsole := hConsole is Win32Handle ? NumGet(hConsole, "ptr") : hConsole

        result := DllCall("KERNEL32.dll\GetConsoleCharType", "ptr", hConsole, "ptr", coordCheck, "uint*", pdwType, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleHandle 
     * @param {Integer} wCodePoint 
     * @param {COORD} cFontSize 
     * @param {PSTR} lpSB 
     * @returns {BOOL} 
     */
    static SetConsoleLocalEUDC(hConsoleHandle, wCodePoint, cFontSize, lpSB) {
        lpSB := lpSB is String ? StrPtr(lpSB) : lpSB
        hConsoleHandle := hConsoleHandle is Win32Handle ? NumGet(hConsoleHandle, "ptr") : hConsoleHandle

        result := DllCall("KERNEL32.dll\SetConsoleLocalEUDC", "ptr", hConsoleHandle, "ushort", wCodePoint, "ptr", cFontSize, "ptr", lpSB, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleHandle 
     * @param {BOOL} Blink 
     * @param {BOOL} DBEnable 
     * @returns {BOOL} 
     */
    static SetConsoleCursorMode(hConsoleHandle, Blink, DBEnable) {
        hConsoleHandle := hConsoleHandle is Win32Handle ? NumGet(hConsoleHandle, "ptr") : hConsoleHandle

        result := DllCall("KERNEL32.dll\SetConsoleCursorMode", "ptr", hConsoleHandle, "int", Blink, "int", DBEnable, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hConsoleHandle 
     * @param {Pointer<BOOL>} pbBlink 
     * @param {Pointer<BOOL>} pbDBEnable 
     * @returns {BOOL} 
     */
    static GetConsoleCursorMode(hConsoleHandle, pbBlink, pbDBEnable) {
        hConsoleHandle := hConsoleHandle is Win32Handle ? NumGet(hConsoleHandle, "ptr") : hConsoleHandle

        result := DllCall("KERNEL32.dll\GetConsoleCursorMode", "ptr", hConsoleHandle, "ptr", pbBlink, "ptr", pbDBEnable, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} fOs2Register 
     * @returns {BOOL} 
     */
    static RegisterConsoleOS2(fOs2Register) {
        result := DllCall("KERNEL32.dll\RegisterConsoleOS2", "int", fOs2Register, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} fOs2OemFormat 
     * @returns {BOOL} 
     */
    static SetConsoleOS2OemFormat(fOs2OemFormat) {
        result := DllCall("KERNEL32.dll\SetConsoleOS2OemFormat", "int", fOs2OemFormat, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hWndConsoleIME 
     * @param {Pointer<UInt32>} lpdwConsoleThreadId 
     * @returns {BOOL} 
     */
    static RegisterConsoleIME(hWndConsoleIME, lpdwConsoleThreadId) {
        hWndConsoleIME := hWndConsoleIME is Win32Handle ? NumGet(hWndConsoleIME, "ptr") : hWndConsoleIME

        result := DllCall("KERNEL32.dll\RegisterConsoleIME", "ptr", hWndConsoleIME, "uint*", lpdwConsoleThreadId, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    static UnregisterConsoleIME() {
        result := DllCall("KERNEL32.dll\UnregisterConsoleIME", "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpConsoleDevice 
     * @param {Integer} dwDesiredAccess 
     * @param {BOOL} bInheritHandle 
     * @param {Integer} dwShareMode 
     * @returns {HANDLE} 
     */
    static OpenConsoleW(lpConsoleDevice, dwDesiredAccess, bInheritHandle, dwShareMode) {
        lpConsoleDevice := lpConsoleDevice is String ? StrPtr(lpConsoleDevice) : lpConsoleDevice

        result := DllCall("KERNEL32.dll\OpenConsoleW", "ptr", lpConsoleDevice, "uint", dwDesiredAccess, "int", bInheritHandle, "uint", dwShareMode, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {HANDLE} hSourceHandle 
     * @param {Integer} dwDesiredAccess 
     * @param {BOOL} bInheritHandle 
     * @param {Integer} dwOptions 
     * @returns {HANDLE} 
     */
    static DuplicateConsoleHandle(hSourceHandle, dwDesiredAccess, bInheritHandle, dwOptions) {
        hSourceHandle := hSourceHandle is Win32Handle ? NumGet(hSourceHandle, "ptr") : hSourceHandle

        result := DllCall("KERNEL32.dll\DuplicateConsoleHandle", "ptr", hSourceHandle, "uint", dwDesiredAccess, "int", bInheritHandle, "uint", dwOptions, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {HANDLE} hConsole 
     * @returns {BOOL} 
     */
    static CloseConsoleHandle(hConsole) {
        hConsole := hConsole is Win32Handle ? NumGet(hConsole, "ptr") : hConsole

        result := DllCall("KERNEL32.dll\CloseConsoleHandle", "ptr", hConsole, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hIoHandle 
     * @returns {BOOL} 
     */
    static VerifyConsoleIoHandle(hIoHandle) {
        hIoHandle := hIoHandle is Win32Handle ? NumGet(hIoHandle, "ptr") : hIoHandle

        result := DllCall("KERNEL32.dll\VerifyConsoleIoHandle", "ptr", hIoHandle, "int")
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    static GetConsoleInputWaitHandle() {
        result := DllCall("KERNEL32.dll\GetConsoleInputWaitHandle", "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {Integer} Command 
     * @param {Pointer} ConsoleInformation 
     * @param {Integer} ConsoleInformationLength 
     * @returns {NTSTATUS} 
     */
    static ConsoleControl(Command, ConsoleInformation, ConsoleInformationLength) {
        result := DllCall("USER32.dll\ConsoleControl", "int", Command, "ptr", ConsoleInformation, "uint", ConsoleInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} nStdHandle 
     * @returns {HANDLE} 
     */
    static GetStdHandle(nStdHandle) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetStdHandle", "uint", nStdHandle, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, False)
    }

    /**
     * 
     * @param {Integer} nStdHandle 
     * @param {HANDLE} hHandle 
     * @returns {BOOL} 
     */
    static SetStdHandle(nStdHandle, hHandle) {
        hHandle := hHandle is Win32Handle ? NumGet(hHandle, "ptr") : hHandle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetStdHandle", "uint", nStdHandle, "ptr", hHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} nStdHandle A DWORD indicating the stream for which the handle is being set.
     * @param {HANDLE} hHandle The handle.
     * @param {Pointer<HANDLE>} phPrevValue Optional. Receives the previous handle.
     * @returns {BOOL} Returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-setstdhandleex
     */
    static SetStdHandleEx(nStdHandle, hHandle, phPrevValue) {
        hHandle := hHandle is Win32Handle ? NumGet(hHandle, "ptr") : hHandle

        result := DllCall("KERNEL32.dll\SetStdHandleEx", "uint", nStdHandle, "ptr", hHandle, "ptr", phPrevValue, "int")
        return result
    }

;@endregion Methods
}
