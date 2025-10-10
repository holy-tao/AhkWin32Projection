#Requires AutoHotkey v2.0.0 64-bit

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
     * @returns {Integer} 
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
     * @returns {Integer} 
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
     * @returns {Integer} 
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
     * @param {Pointer<Void>} hConsoleHandle 
     * @param {Pointer<UInt32>} lpMode 
     * @returns {Integer} 
     */
    static GetConsoleMode(hConsoleHandle, lpMode) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleMode", "ptr", hConsoleHandle, "uint*", lpMode, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleHandle 
     * @param {Integer} dwMode 
     * @returns {Integer} 
     */
    static SetConsoleMode(hConsoleHandle, dwMode) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleMode", "ptr", hConsoleHandle, "uint", dwMode, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleInput 
     * @param {Pointer<UInt32>} lpNumberOfEvents 
     * @returns {Integer} 
     */
    static GetNumberOfConsoleInputEvents(hConsoleInput, lpNumberOfEvents) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNumberOfConsoleInputEvents", "ptr", hConsoleInput, "uint*", lpNumberOfEvents, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsRead 
     * @returns {Integer} 
     */
    static ReadConsoleInputA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleInputA", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsRead 
     * @returns {Integer} 
     */
    static ReadConsoleInputW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleInputW", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsRead 
     * @returns {Integer} 
     */
    static PeekConsoleInputA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\PeekConsoleInputA", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsRead 
     * @returns {Integer} 
     */
    static PeekConsoleInputW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\PeekConsoleInputW", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleInput 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Integer} nNumberOfCharsToRead 
     * @param {Pointer<UInt32>} lpNumberOfCharsRead 
     * @param {Pointer<CONSOLE_READCONSOLE_CONTROL>} pInputControl 
     * @returns {Integer} 
     */
    static ReadConsoleA(hConsoleInput, lpBuffer, nNumberOfCharsToRead, lpNumberOfCharsRead, pInputControl) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleA", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nNumberOfCharsToRead, "uint*", lpNumberOfCharsRead, "ptr", pInputControl, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleInput 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Integer} nNumberOfCharsToRead 
     * @param {Pointer<UInt32>} lpNumberOfCharsRead 
     * @param {Pointer<CONSOLE_READCONSOLE_CONTROL>} pInputControl 
     * @returns {Integer} 
     */
    static ReadConsoleW(hConsoleInput, lpBuffer, nNumberOfCharsToRead, lpNumberOfCharsRead, pInputControl) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleW", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nNumberOfCharsToRead, "uint*", lpNumberOfCharsRead, "ptr", pInputControl, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<Byte>} lpBuffer 
     * @param {Integer} nNumberOfCharsToWrite 
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten 
     * @returns {Integer} 
     */
    static WriteConsoleA(hConsoleOutput, lpBuffer, nNumberOfCharsToWrite, lpNumberOfCharsWritten) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        lpBuffer := lpBuffer is String? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleA", "ptr", hConsoleOutput, "ptr", lpBuffer, "uint", nNumberOfCharsToWrite, "uint*", lpNumberOfCharsWritten, "ptr", lpReserved, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<Char>} lpBuffer 
     * @param {Integer} nNumberOfCharsToWrite 
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten 
     * @returns {Integer} 
     */
    static WriteConsoleW(hConsoleOutput, lpBuffer, nNumberOfCharsToWrite, lpNumberOfCharsWritten) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        lpBuffer := lpBuffer is String? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleW", "ptr", hConsoleOutput, "ptr", lpBuffer, "uint", nNumberOfCharsToWrite, "uint*", lpNumberOfCharsWritten, "ptr", lpReserved, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<PHANDLER_ROUTINE>} HandlerRoutine 
     * @param {Integer} Add 
     * @returns {Integer} 
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
     * @param {Pointer} size 
     * @param {Pointer<Void>} hInput 
     * @param {Pointer<Void>} hOutput 
     * @param {Integer} dwFlags 
     * @param {Pointer<IntPtr>} phPC 
     * @returns {HRESULT} 
     */
    static CreatePseudoConsole(size, hInput, hOutput, dwFlags, phPC) {
        result := DllCall("KERNEL32.dll\CreatePseudoConsole", "ptr", size, "ptr", hInput, "ptr", hOutput, "uint", dwFlags, "ptr*", phPC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hPC 
     * @param {Pointer} size 
     * @returns {HRESULT} 
     */
    static ResizePseudoConsole(hPC, size) {
        result := DllCall("KERNEL32.dll\ResizePseudoConsole", "ptr", hPC, "ptr", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hPC 
     * @returns {String} Nothing - always returns an empty string
     */
    static ClosePseudoConsole(hPC) {
        DllCall("KERNEL32.dll\ClosePseudoConsole", "ptr", hPC)
    }

    /**
     * 
     * @param {Pointer} hPC 
     * @returns {HRESULT} 
     */
    static ReleasePseudoConsole(hPC) {
        result := DllCall("KERNEL32.dll\ReleasePseudoConsole", "ptr", hPC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Integer} cCharacter 
     * @param {Integer} nLength 
     * @param {Pointer} dwWriteCoord 
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten 
     * @returns {Integer} 
     */
    static FillConsoleOutputCharacterA(hConsoleOutput, cCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FillConsoleOutputCharacterA", "ptr", hConsoleOutput, "char", cCharacter, "uint", nLength, "ptr", dwWriteCoord, "uint*", lpNumberOfCharsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Integer} cCharacter 
     * @param {Integer} nLength 
     * @param {Pointer} dwWriteCoord 
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten 
     * @returns {Integer} 
     */
    static FillConsoleOutputCharacterW(hConsoleOutput, cCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FillConsoleOutputCharacterW", "ptr", hConsoleOutput, "char", cCharacter, "uint", nLength, "ptr", dwWriteCoord, "uint*", lpNumberOfCharsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Integer} wAttribute 
     * @param {Integer} nLength 
     * @param {Pointer} dwWriteCoord 
     * @param {Pointer<UInt32>} lpNumberOfAttrsWritten 
     * @returns {Integer} 
     */
    static FillConsoleOutputAttribute(hConsoleOutput, wAttribute, nLength, dwWriteCoord, lpNumberOfAttrsWritten) {
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
     * @returns {Integer} 
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
     * @returns {Pointer<Void>} 
     */
    static CreateConsoleScreenBuffer(dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwFlags) {
        static lpScreenBufferData := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateConsoleScreenBuffer", "uint", dwDesiredAccess, "uint", dwShareMode, "ptr", lpSecurityAttributes, "uint", dwFlags, "ptr", lpScreenBufferData, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @returns {Integer} 
     */
    static SetConsoleActiveScreenBuffer(hConsoleOutput) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleActiveScreenBuffer", "ptr", hConsoleOutput, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleInput 
     * @returns {Integer} 
     */
    static FlushConsoleInputBuffer(hConsoleInput) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FlushConsoleInputBuffer", "ptr", hConsoleInput, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} wCodePageID 
     * @returns {Integer} 
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
     * @returns {Integer} 
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
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<CONSOLE_CURSOR_INFO>} lpConsoleCursorInfo 
     * @returns {Integer} 
     */
    static GetConsoleCursorInfo(hConsoleOutput, lpConsoleCursorInfo) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleCursorInfo", "ptr", hConsoleOutput, "ptr", lpConsoleCursorInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<CONSOLE_CURSOR_INFO>} lpConsoleCursorInfo 
     * @returns {Integer} 
     */
    static SetConsoleCursorInfo(hConsoleOutput, lpConsoleCursorInfo) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleCursorInfo", "ptr", hConsoleOutput, "ptr", lpConsoleCursorInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<CONSOLE_SCREEN_BUFFER_INFO>} lpConsoleScreenBufferInfo 
     * @returns {Integer} 
     */
    static GetConsoleScreenBufferInfo(hConsoleOutput, lpConsoleScreenBufferInfo) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleScreenBufferInfo", "ptr", hConsoleOutput, "ptr", lpConsoleScreenBufferInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<CONSOLE_SCREEN_BUFFER_INFOEX>} lpConsoleScreenBufferInfoEx 
     * @returns {Integer} 
     */
    static GetConsoleScreenBufferInfoEx(hConsoleOutput, lpConsoleScreenBufferInfoEx) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleScreenBufferInfoEx", "ptr", hConsoleOutput, "ptr", lpConsoleScreenBufferInfoEx, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<CONSOLE_SCREEN_BUFFER_INFOEX>} lpConsoleScreenBufferInfoEx 
     * @returns {Integer} 
     */
    static SetConsoleScreenBufferInfoEx(hConsoleOutput, lpConsoleScreenBufferInfoEx) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleScreenBufferInfoEx", "ptr", hConsoleOutput, "ptr", lpConsoleScreenBufferInfoEx, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer} dwSize 
     * @returns {Integer} 
     */
    static SetConsoleScreenBufferSize(hConsoleOutput, dwSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleScreenBufferSize", "ptr", hConsoleOutput, "ptr", dwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer} dwCursorPosition 
     * @returns {Integer} 
     */
    static SetConsoleCursorPosition(hConsoleOutput, dwCursorPosition) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleCursorPosition", "ptr", hConsoleOutput, "ptr", dwCursorPosition, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @returns {Pointer} 
     */
    static GetLargestConsoleWindowSize(hConsoleOutput) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetLargestConsoleWindowSize", "ptr", hConsoleOutput, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Integer} wAttributes 
     * @returns {Integer} 
     */
    static SetConsoleTextAttribute(hConsoleOutput, wAttributes) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleTextAttribute", "ptr", hConsoleOutput, "ushort", wAttributes, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Integer} bAbsolute 
     * @param {Pointer<SMALL_RECT>} lpConsoleWindow 
     * @returns {Integer} 
     */
    static SetConsoleWindowInfo(hConsoleOutput, bAbsolute, lpConsoleWindow) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleWindowInfo", "ptr", hConsoleOutput, "int", bAbsolute, "ptr", lpConsoleWindow, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<Byte>} lpCharacter 
     * @param {Integer} nLength 
     * @param {Pointer} dwWriteCoord 
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten 
     * @returns {Integer} 
     */
    static WriteConsoleOutputCharacterA(hConsoleOutput, lpCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten) {
        lpCharacter := lpCharacter is String? StrPtr(lpCharacter) : lpCharacter

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleOutputCharacterA", "ptr", hConsoleOutput, "ptr", lpCharacter, "uint", nLength, "ptr", dwWriteCoord, "uint*", lpNumberOfCharsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<Char>} lpCharacter 
     * @param {Integer} nLength 
     * @param {Pointer} dwWriteCoord 
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten 
     * @returns {Integer} 
     */
    static WriteConsoleOutputCharacterW(hConsoleOutput, lpCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten) {
        lpCharacter := lpCharacter is String? StrPtr(lpCharacter) : lpCharacter

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleOutputCharacterW", "ptr", hConsoleOutput, "ptr", lpCharacter, "uint", nLength, "ptr", dwWriteCoord, "uint*", lpNumberOfCharsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<UInt16>} lpAttribute 
     * @param {Integer} nLength 
     * @param {Pointer} dwWriteCoord 
     * @param {Pointer<UInt32>} lpNumberOfAttrsWritten 
     * @returns {Integer} 
     */
    static WriteConsoleOutputAttribute(hConsoleOutput, lpAttribute, nLength, dwWriteCoord, lpNumberOfAttrsWritten) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleOutputAttribute", "ptr", hConsoleOutput, "ushort*", lpAttribute, "uint", nLength, "ptr", dwWriteCoord, "uint*", lpNumberOfAttrsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<Byte>} lpCharacter 
     * @param {Integer} nLength 
     * @param {Pointer} dwReadCoord 
     * @param {Pointer<UInt32>} lpNumberOfCharsRead 
     * @returns {Integer} 
     */
    static ReadConsoleOutputCharacterA(hConsoleOutput, lpCharacter, nLength, dwReadCoord, lpNumberOfCharsRead) {
        lpCharacter := lpCharacter is String? StrPtr(lpCharacter) : lpCharacter

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleOutputCharacterA", "ptr", hConsoleOutput, "ptr", lpCharacter, "uint", nLength, "ptr", dwReadCoord, "uint*", lpNumberOfCharsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<Char>} lpCharacter 
     * @param {Integer} nLength 
     * @param {Pointer} dwReadCoord 
     * @param {Pointer<UInt32>} lpNumberOfCharsRead 
     * @returns {Integer} 
     */
    static ReadConsoleOutputCharacterW(hConsoleOutput, lpCharacter, nLength, dwReadCoord, lpNumberOfCharsRead) {
        lpCharacter := lpCharacter is String? StrPtr(lpCharacter) : lpCharacter

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleOutputCharacterW", "ptr", hConsoleOutput, "ptr", lpCharacter, "uint", nLength, "ptr", dwReadCoord, "uint*", lpNumberOfCharsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<UInt16>} lpAttribute 
     * @param {Integer} nLength 
     * @param {Pointer} dwReadCoord 
     * @param {Pointer<UInt32>} lpNumberOfAttrsRead 
     * @returns {Integer} 
     */
    static ReadConsoleOutputAttribute(hConsoleOutput, lpAttribute, nLength, dwReadCoord, lpNumberOfAttrsRead) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleOutputAttribute", "ptr", hConsoleOutput, "ushort*", lpAttribute, "uint", nLength, "ptr", dwReadCoord, "uint*", lpNumberOfAttrsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsWritten 
     * @returns {Integer} 
     */
    static WriteConsoleInputA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleInputA", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsWritten 
     * @returns {Integer} 
     */
    static WriteConsoleInputW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleInputW", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<SMALL_RECT>} lpScrollRectangle 
     * @param {Pointer<SMALL_RECT>} lpClipRectangle 
     * @param {Pointer} dwDestinationOrigin 
     * @param {Pointer<CHAR_INFO>} lpFill 
     * @returns {Integer} 
     */
    static ScrollConsoleScreenBufferA(hConsoleOutput, lpScrollRectangle, lpClipRectangle, dwDestinationOrigin, lpFill) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ScrollConsoleScreenBufferA", "ptr", hConsoleOutput, "ptr", lpScrollRectangle, "ptr", lpClipRectangle, "ptr", dwDestinationOrigin, "ptr", lpFill, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<SMALL_RECT>} lpScrollRectangle 
     * @param {Pointer<SMALL_RECT>} lpClipRectangle 
     * @param {Pointer} dwDestinationOrigin 
     * @param {Pointer<CHAR_INFO>} lpFill 
     * @returns {Integer} 
     */
    static ScrollConsoleScreenBufferW(hConsoleOutput, lpScrollRectangle, lpClipRectangle, dwDestinationOrigin, lpFill) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ScrollConsoleScreenBufferW", "ptr", hConsoleOutput, "ptr", lpScrollRectangle, "ptr", lpClipRectangle, "ptr", dwDestinationOrigin, "ptr", lpFill, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<CHAR_INFO>} lpBuffer 
     * @param {Pointer} dwBufferSize 
     * @param {Pointer} dwBufferCoord 
     * @param {Pointer<SMALL_RECT>} lpWriteRegion 
     * @returns {Integer} 
     */
    static WriteConsoleOutputA(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpWriteRegion) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleOutputA", "ptr", hConsoleOutput, "ptr", lpBuffer, "ptr", dwBufferSize, "ptr", dwBufferCoord, "ptr", lpWriteRegion, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<CHAR_INFO>} lpBuffer 
     * @param {Pointer} dwBufferSize 
     * @param {Pointer} dwBufferCoord 
     * @param {Pointer<SMALL_RECT>} lpWriteRegion 
     * @returns {Integer} 
     */
    static WriteConsoleOutputW(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpWriteRegion) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleOutputW", "ptr", hConsoleOutput, "ptr", lpBuffer, "ptr", dwBufferSize, "ptr", dwBufferCoord, "ptr", lpWriteRegion, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<CHAR_INFO>} lpBuffer 
     * @param {Pointer} dwBufferSize 
     * @param {Pointer} dwBufferCoord 
     * @param {Pointer<SMALL_RECT>} lpReadRegion 
     * @returns {Integer} 
     */
    static ReadConsoleOutputA(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpReadRegion) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleOutputA", "ptr", hConsoleOutput, "ptr", lpBuffer, "ptr", dwBufferSize, "ptr", dwBufferCoord, "ptr", lpReadRegion, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<CHAR_INFO>} lpBuffer 
     * @param {Pointer} dwBufferSize 
     * @param {Pointer} dwBufferCoord 
     * @param {Pointer<SMALL_RECT>} lpReadRegion 
     * @returns {Integer} 
     */
    static ReadConsoleOutputW(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpReadRegion) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleOutputW", "ptr", hConsoleOutput, "ptr", lpBuffer, "ptr", dwBufferSize, "ptr", dwBufferCoord, "ptr", lpReadRegion, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} lpConsoleTitle 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static GetConsoleTitleA(lpConsoleTitle, nSize) {
        lpConsoleTitle := lpConsoleTitle is String? StrPtr(lpConsoleTitle) : lpConsoleTitle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleTitleA", "ptr", lpConsoleTitle, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Char>} lpConsoleTitle 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static GetConsoleTitleW(lpConsoleTitle, nSize) {
        lpConsoleTitle := lpConsoleTitle is String? StrPtr(lpConsoleTitle) : lpConsoleTitle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleTitleW", "ptr", lpConsoleTitle, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} lpConsoleTitle 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static GetConsoleOriginalTitleA(lpConsoleTitle, nSize) {
        lpConsoleTitle := lpConsoleTitle is String? StrPtr(lpConsoleTitle) : lpConsoleTitle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleOriginalTitleA", "ptr", lpConsoleTitle, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Char>} lpConsoleTitle 
     * @param {Integer} nSize 
     * @returns {Integer} 
     */
    static GetConsoleOriginalTitleW(lpConsoleTitle, nSize) {
        lpConsoleTitle := lpConsoleTitle is String? StrPtr(lpConsoleTitle) : lpConsoleTitle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleOriginalTitleW", "ptr", lpConsoleTitle, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} lpConsoleTitle 
     * @returns {Integer} 
     */
    static SetConsoleTitleA(lpConsoleTitle) {
        lpConsoleTitle := lpConsoleTitle is String? StrPtr(lpConsoleTitle) : lpConsoleTitle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleTitleA", "ptr", lpConsoleTitle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Char>} lpConsoleTitle 
     * @returns {Integer} 
     */
    static SetConsoleTitleW(lpConsoleTitle) {
        lpConsoleTitle := lpConsoleTitle is String? StrPtr(lpConsoleTitle) : lpConsoleTitle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleTitleW", "ptr", lpConsoleTitle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpNumberOfMouseButtons 
     * @returns {Integer} 
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
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Integer} nFont 
     * @returns {Pointer} 
     */
    static GetConsoleFontSize(hConsoleOutput, nFont) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleFontSize", "ptr", hConsoleOutput, "uint", nFont, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Integer} bMaximumWindow 
     * @param {Pointer<CONSOLE_FONT_INFO>} lpConsoleCurrentFont 
     * @returns {Integer} 
     */
    static GetCurrentConsoleFont(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFont) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCurrentConsoleFont", "ptr", hConsoleOutput, "int", bMaximumWindow, "ptr", lpConsoleCurrentFont, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Integer} bMaximumWindow 
     * @param {Pointer<CONSOLE_FONT_INFOEX>} lpConsoleCurrentFontEx 
     * @returns {Integer} 
     */
    static GetCurrentConsoleFontEx(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFontEx) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCurrentConsoleFontEx", "ptr", hConsoleOutput, "int", bMaximumWindow, "ptr", lpConsoleCurrentFontEx, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Integer} bMaximumWindow 
     * @param {Pointer<CONSOLE_FONT_INFOEX>} lpConsoleCurrentFontEx 
     * @returns {Integer} 
     */
    static SetCurrentConsoleFontEx(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFontEx) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetCurrentConsoleFontEx", "ptr", hConsoleOutput, "int", bMaximumWindow, "ptr", lpConsoleCurrentFontEx, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<CONSOLE_SELECTION_INFO>} lpConsoleSelectionInfo 
     * @returns {Integer} 
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
     * @returns {Integer} 
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
     * @returns {Integer} 
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
     * @returns {Integer} 
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
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Integer} dwFlags 
     * @param {Pointer<COORD>} lpNewScreenBufferDimensions 
     * @returns {Integer} 
     */
    static SetConsoleDisplayMode(hConsoleOutput, dwFlags, lpNewScreenBufferDimensions) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleDisplayMode", "ptr", hConsoleOutput, "uint", dwFlags, "ptr", lpNewScreenBufferDimensions, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    static GetConsoleWindow() {
        result := DllCall("KERNEL32.dll\GetConsoleWindow", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} Source 
     * @param {Pointer<Byte>} Target 
     * @param {Pointer<Byte>} ExeName 
     * @returns {Integer} 
     */
    static AddConsoleAliasA(Source, Target, ExeName) {
        Source := Source is String? StrPtr(Source) : Source
        Target := Target is String? StrPtr(Target) : Target
        ExeName := ExeName is String? StrPtr(ExeName) : ExeName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\AddConsoleAliasA", "ptr", Source, "ptr", Target, "ptr", ExeName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Char>} Source 
     * @param {Pointer<Char>} Target 
     * @param {Pointer<Char>} ExeName 
     * @returns {Integer} 
     */
    static AddConsoleAliasW(Source, Target, ExeName) {
        Source := Source is String? StrPtr(Source) : Source
        Target := Target is String? StrPtr(Target) : Target
        ExeName := ExeName is String? StrPtr(ExeName) : ExeName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\AddConsoleAliasW", "ptr", Source, "ptr", Target, "ptr", ExeName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} Source 
     * @param {Pointer<Byte>} TargetBuffer 
     * @param {Integer} TargetBufferLength 
     * @param {Pointer<Byte>} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleAliasA(Source, TargetBuffer, TargetBufferLength, ExeName) {
        Source := Source is String? StrPtr(Source) : Source
        TargetBuffer := TargetBuffer is String? StrPtr(TargetBuffer) : TargetBuffer
        ExeName := ExeName is String? StrPtr(ExeName) : ExeName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasA", "ptr", Source, "ptr", TargetBuffer, "uint", TargetBufferLength, "ptr", ExeName, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Char>} Source 
     * @param {Pointer<Char>} TargetBuffer 
     * @param {Integer} TargetBufferLength 
     * @param {Pointer<Char>} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleAliasW(Source, TargetBuffer, TargetBufferLength, ExeName) {
        Source := Source is String? StrPtr(Source) : Source
        TargetBuffer := TargetBuffer is String? StrPtr(TargetBuffer) : TargetBuffer
        ExeName := ExeName is String? StrPtr(ExeName) : ExeName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasW", "ptr", Source, "ptr", TargetBuffer, "uint", TargetBufferLength, "ptr", ExeName, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleAliasesLengthA(ExeName) {
        ExeName := ExeName is String? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\GetConsoleAliasesLengthA", "ptr", ExeName, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleAliasesLengthW(ExeName) {
        ExeName := ExeName is String? StrPtr(ExeName) : ExeName

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
     * @param {Pointer<Byte>} AliasBuffer 
     * @param {Integer} AliasBufferLength 
     * @param {Pointer<Byte>} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleAliasesA(AliasBuffer, AliasBufferLength, ExeName) {
        AliasBuffer := AliasBuffer is String? StrPtr(AliasBuffer) : AliasBuffer
        ExeName := ExeName is String? StrPtr(ExeName) : ExeName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasesA", "ptr", AliasBuffer, "uint", AliasBufferLength, "ptr", ExeName, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Char>} AliasBuffer 
     * @param {Integer} AliasBufferLength 
     * @param {Pointer<Char>} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleAliasesW(AliasBuffer, AliasBufferLength, ExeName) {
        AliasBuffer := AliasBuffer is String? StrPtr(AliasBuffer) : AliasBuffer
        ExeName := ExeName is String? StrPtr(ExeName) : ExeName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasesW", "ptr", AliasBuffer, "uint", AliasBufferLength, "ptr", ExeName, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ExeNameBuffer 
     * @param {Integer} ExeNameBufferLength 
     * @returns {Integer} 
     */
    static GetConsoleAliasExesA(ExeNameBuffer, ExeNameBufferLength) {
        ExeNameBuffer := ExeNameBuffer is String? StrPtr(ExeNameBuffer) : ExeNameBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasExesA", "ptr", ExeNameBuffer, "uint", ExeNameBufferLength, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Char>} ExeNameBuffer 
     * @param {Integer} ExeNameBufferLength 
     * @returns {Integer} 
     */
    static GetConsoleAliasExesW(ExeNameBuffer, ExeNameBufferLength) {
        ExeNameBuffer := ExeNameBuffer is String? StrPtr(ExeNameBuffer) : ExeNameBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasExesW", "ptr", ExeNameBuffer, "uint", ExeNameBufferLength, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ExeName 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExpungeConsoleCommandHistoryA(ExeName) {
        ExeName := ExeName is String? StrPtr(ExeName) : ExeName

        DllCall("KERNEL32.dll\ExpungeConsoleCommandHistoryA", "ptr", ExeName)
    }

    /**
     * 
     * @param {Pointer<Char>} ExeName 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExpungeConsoleCommandHistoryW(ExeName) {
        ExeName := ExeName is String? StrPtr(ExeName) : ExeName

        DllCall("KERNEL32.dll\ExpungeConsoleCommandHistoryW", "ptr", ExeName)
    }

    /**
     * 
     * @param {Integer} Number 
     * @param {Pointer<Byte>} ExeName 
     * @returns {Integer} 
     */
    static SetConsoleNumberOfCommandsA(Number, ExeName) {
        ExeName := ExeName is String? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\SetConsoleNumberOfCommandsA", "uint", Number, "ptr", ExeName, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Number 
     * @param {Pointer<Char>} ExeName 
     * @returns {Integer} 
     */
    static SetConsoleNumberOfCommandsW(Number, ExeName) {
        ExeName := ExeName is String? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\SetConsoleNumberOfCommandsW", "uint", Number, "ptr", ExeName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleCommandHistoryLengthA(ExeName) {
        ExeName := ExeName is String? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\GetConsoleCommandHistoryLengthA", "ptr", ExeName, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleCommandHistoryLengthW(ExeName) {
        ExeName := ExeName is String? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\GetConsoleCommandHistoryLengthW", "ptr", ExeName, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} Commands 
     * @param {Integer} CommandBufferLength 
     * @param {Pointer<Byte>} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleCommandHistoryA(Commands, CommandBufferLength, ExeName) {
        ExeName := ExeName is String? StrPtr(ExeName) : ExeName

        result := DllCall("KERNEL32.dll\GetConsoleCommandHistoryA", "ptr", Commands, "uint", CommandBufferLength, "ptr", ExeName, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} Commands 
     * @param {Integer} CommandBufferLength 
     * @param {Pointer<Char>} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleCommandHistoryW(Commands, CommandBufferLength, ExeName) {
        ExeName := ExeName is String? StrPtr(ExeName) : ExeName

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
     * @param {Pointer<Byte>} pszLayout 
     * @returns {Integer} 
     */
    static GetConsoleKeyboardLayoutNameA(pszLayout) {
        pszLayout := pszLayout is String? StrPtr(pszLayout) : pszLayout

        result := DllCall("user32.dll\GetConsoleKeyboardLayoutNameA", "ptr", pszLayout, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} pszLayout 
     * @returns {Integer} 
     */
    static GetConsoleKeyboardLayoutNameW(pszLayout) {
        pszLayout := pszLayout is String? StrPtr(pszLayout) : pszLayout

        result := DllCall("user32.dll\GetConsoleKeyboardLayoutNameW", "ptr", pszLayout, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<SMALL_RECT>} lpRect 
     * @returns {Integer} 
     */
    static InvalidateConsoleDIBits(hConsoleOutput, lpRect) {
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
     * @returns {Integer} 
     */
    static VDMConsoleOperation(iFunction, lpData) {
        result := DllCall("KERNEL32.dll\VDMConsoleOperation", "uint", iFunction, "ptr", lpData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hIcon 
     * @returns {Integer} 
     */
    static SetConsoleIcon(hIcon) {
        result := DllCall("KERNEL32.dll\SetConsoleIcon", "ptr", hIcon, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Integer} nFont 
     * @returns {Integer} 
     */
    static SetConsoleFont(hConsoleOutput, nFont) {
        result := DllCall("KERNEL32.dll\SetConsoleFont", "ptr", hConsoleOutput, "uint", nFont, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Integer} bMaximumWindow 
     * @param {Integer} nLength 
     * @param {Pointer<CONSOLE_FONT_INFO>} lpConsoleFontInfo 
     * @returns {Integer} 
     */
    static GetConsoleFontInfo(hConsoleOutput, bMaximumWindow, nLength, lpConsoleFontInfo) {
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
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<Void>} hCursor 
     * @returns {Integer} 
     */
    static SetConsoleCursor(hConsoleOutput, hCursor) {
        result := DllCall("KERNEL32.dll\SetConsoleCursor", "ptr", hConsoleOutput, "ptr", hCursor, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Integer} bShow 
     * @returns {Integer} 
     */
    static ShowConsoleCursor(hConsoleOutput, bShow) {
        result := DllCall("KERNEL32.dll\ShowConsoleCursor", "ptr", hConsoleOutput, "int", bShow, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Integer} dwCommandIdLow 
     * @param {Integer} dwCommandIdHigh 
     * @returns {Pointer<Void>} 
     */
    static ConsoleMenuControl(hConsoleOutput, dwCommandIdLow, dwCommandIdHigh) {
        result := DllCall("KERNEL32.dll\ConsoleMenuControl", "ptr", hConsoleOutput, "uint", dwCommandIdLow, "uint", dwCommandIdHigh, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<Void>} hPalette 
     * @param {Integer} dwUsage 
     * @returns {Integer} 
     */
    static SetConsolePalette(hConsoleOutput, hPalette, dwUsage) {
        result := DllCall("KERNEL32.dll\SetConsolePalette", "ptr", hConsoleOutput, "ptr", hPalette, "uint", dwUsage, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwRegisterFlags 
     * @param {Pointer<Void>} hStartHardwareEvent 
     * @param {Pointer<Void>} hEndHardwareEvent 
     * @param {Pointer<Void>} hErrorhardwareEvent 
     * @param {Pointer<UInt32>} lpStateLength 
     * @param {Pointer<Void>} lpState 
     * @param {Pointer} VDMBufferSize 
     * @param {Pointer<Void>} lpVDMBuffer 
     * @returns {Integer} 
     */
    static RegisterConsoleVDM(dwRegisterFlags, hStartHardwareEvent, hEndHardwareEvent, hErrorhardwareEvent, lpStateLength, lpState, VDMBufferSize, lpVDMBuffer) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("KERNEL32.dll\RegisterConsoleVDM", "uint", dwRegisterFlags, "ptr", hStartHardwareEvent, "ptr", hEndHardwareEvent, "ptr", hErrorhardwareEvent, "uint", Reserved, "uint*", lpStateLength, "ptr", lpState, "ptr", VDMBufferSize, "ptr", lpVDMBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer<COORD>} lpResolution 
     * @param {Pointer<COORD>} lpFontSize 
     * @returns {Integer} 
     */
    static GetConsoleHardwareState(hConsoleOutput, lpResolution, lpFontSize) {
        result := DllCall("KERNEL32.dll\GetConsoleHardwareState", "ptr", hConsoleOutput, "ptr", lpResolution, "ptr", lpFontSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleOutput 
     * @param {Pointer} dwResolution 
     * @param {Pointer} dwFontSize 
     * @returns {Integer} 
     */
    static SetConsoleHardwareState(hConsoleOutput, dwResolution, dwFontSize) {
        result := DllCall("KERNEL32.dll\SetConsoleHardwareState", "ptr", hConsoleOutput, "ptr", dwResolution, "ptr", dwFontSize, "int")
        return result
    }

    /**
     * 
     * @param {Integer} bSet 
     * @param {Integer} bReserveKeys 
     * @param {Pointer<APPKEY>} lpAppKeys 
     * @param {Integer} dwNumAppKeys 
     * @returns {Integer} 
     */
    static SetConsoleKeyShortcuts(bSet, bReserveKeys, lpAppKeys, dwNumAppKeys) {
        result := DllCall("KERNEL32.dll\SetConsoleKeyShortcuts", "int", bSet, "char", bReserveKeys, "ptr", lpAppKeys, "uint", dwNumAppKeys, "int")
        return result
    }

    /**
     * 
     * @param {Integer} bEnable 
     * @returns {Integer} 
     */
    static SetConsoleMenuClose(bEnable) {
        result := DllCall("KERNEL32.dll\SetConsoleMenuClose", "int", bEnable, "int")
        return result
    }

    /**
     * 
     * @param {Integer} nBufferLength 
     * @param {Pointer<Byte>} lpBuffer 
     * @returns {Integer} 
     */
    static GetConsoleInputExeNameA(nBufferLength, lpBuffer) {
        lpBuffer := lpBuffer is String? StrPtr(lpBuffer) : lpBuffer

        result := DllCall("KERNEL32.dll\GetConsoleInputExeNameA", "uint", nBufferLength, "ptr", lpBuffer, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} nBufferLength 
     * @param {Pointer<Char>} lpBuffer 
     * @returns {Integer} 
     */
    static GetConsoleInputExeNameW(nBufferLength, lpBuffer) {
        lpBuffer := lpBuffer is String? StrPtr(lpBuffer) : lpBuffer

        result := DllCall("KERNEL32.dll\GetConsoleInputExeNameW", "uint", nBufferLength, "ptr", lpBuffer, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} lpExeName 
     * @returns {Integer} 
     */
    static SetConsoleInputExeNameA(lpExeName) {
        lpExeName := lpExeName is String? StrPtr(lpExeName) : lpExeName

        result := DllCall("KERNEL32.dll\SetConsoleInputExeNameA", "ptr", lpExeName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} lpExeName 
     * @returns {Integer} 
     */
    static SetConsoleInputExeNameW(lpExeName) {
        lpExeName := lpExeName is String? StrPtr(lpExeName) : lpExeName

        result := DllCall("KERNEL32.dll\SetConsoleInputExeNameW", "ptr", lpExeName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsRead 
     * @param {Integer} wFlags 
     * @returns {Integer} 
     */
    static ReadConsoleInputExA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead, wFlags) {
        result := DllCall("KERNEL32.dll\ReadConsoleInputExA", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsRead, "ushort", wFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsRead 
     * @param {Integer} wFlags 
     * @returns {Integer} 
     */
    static ReadConsoleInputExW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead, wFlags) {
        result := DllCall("KERNEL32.dll\ReadConsoleInputExW", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsRead, "ushort", wFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsWritten 
     * @returns {Integer} 
     */
    static WriteConsoleInputVDMA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten) {
        result := DllCall("KERNEL32.dll\WriteConsoleInputVDMA", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsWritten, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleInput 
     * @param {Pointer<INPUT_RECORD>} lpBuffer 
     * @param {Integer} nLength 
     * @param {Pointer<UInt32>} lpNumberOfEventsWritten 
     * @returns {Integer} 
     */
    static WriteConsoleInputVDMW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten) {
        result := DllCall("KERNEL32.dll\WriteConsoleInputVDMW", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "uint*", lpNumberOfEventsWritten, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsole 
     * @param {Pointer<UInt32>} lpdwNlsMode 
     * @returns {Integer} 
     */
    static GetConsoleNlsMode(hConsole, lpdwNlsMode) {
        result := DllCall("KERNEL32.dll\GetConsoleNlsMode", "ptr", hConsole, "uint*", lpdwNlsMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsole 
     * @param {Integer} fdwNlsMode 
     * @returns {Integer} 
     */
    static SetConsoleNlsMode(hConsole, fdwNlsMode) {
        result := DllCall("KERNEL32.dll\SetConsoleNlsMode", "ptr", hConsole, "uint", fdwNlsMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsole 
     * @param {Pointer} coordCheck 
     * @param {Pointer<UInt32>} pdwType 
     * @returns {Integer} 
     */
    static GetConsoleCharType(hConsole, coordCheck, pdwType) {
        result := DllCall("KERNEL32.dll\GetConsoleCharType", "ptr", hConsole, "ptr", coordCheck, "uint*", pdwType, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleHandle 
     * @param {Integer} wCodePoint 
     * @param {Pointer} cFontSize 
     * @param {Pointer<Byte>} lpSB 
     * @returns {Integer} 
     */
    static SetConsoleLocalEUDC(hConsoleHandle, wCodePoint, cFontSize, lpSB) {
        lpSB := lpSB is String? StrPtr(lpSB) : lpSB

        result := DllCall("KERNEL32.dll\SetConsoleLocalEUDC", "ptr", hConsoleHandle, "ushort", wCodePoint, "ptr", cFontSize, "ptr", lpSB, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleHandle 
     * @param {Integer} Blink 
     * @param {Integer} DBEnable 
     * @returns {Integer} 
     */
    static SetConsoleCursorMode(hConsoleHandle, Blink, DBEnable) {
        result := DllCall("KERNEL32.dll\SetConsoleCursorMode", "ptr", hConsoleHandle, "int", Blink, "int", DBEnable, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsoleHandle 
     * @param {Pointer<Int32>} pbBlink 
     * @param {Pointer<Int32>} pbDBEnable 
     * @returns {Integer} 
     */
    static GetConsoleCursorMode(hConsoleHandle, pbBlink, pbDBEnable) {
        result := DllCall("KERNEL32.dll\GetConsoleCursorMode", "ptr", hConsoleHandle, "int*", pbBlink, "int*", pbDBEnable, "int")
        return result
    }

    /**
     * 
     * @param {Integer} fOs2Register 
     * @returns {Integer} 
     */
    static RegisterConsoleOS2(fOs2Register) {
        result := DllCall("KERNEL32.dll\RegisterConsoleOS2", "int", fOs2Register, "int")
        return result
    }

    /**
     * 
     * @param {Integer} fOs2OemFormat 
     * @returns {Integer} 
     */
    static SetConsoleOS2OemFormat(fOs2OemFormat) {
        result := DllCall("KERNEL32.dll\SetConsoleOS2OemFormat", "int", fOs2OemFormat, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hWndConsoleIME 
     * @param {Pointer<UInt32>} lpdwConsoleThreadId 
     * @returns {Integer} 
     */
    static RegisterConsoleIME(hWndConsoleIME, lpdwConsoleThreadId) {
        result := DllCall("KERNEL32.dll\RegisterConsoleIME", "ptr", hWndConsoleIME, "uint*", lpdwConsoleThreadId, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static UnregisterConsoleIME() {
        result := DllCall("KERNEL32.dll\UnregisterConsoleIME", "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} lpConsoleDevice 
     * @param {Integer} dwDesiredAccess 
     * @param {Integer} bInheritHandle 
     * @param {Integer} dwShareMode 
     * @returns {Pointer<Void>} 
     */
    static OpenConsoleW(lpConsoleDevice, dwDesiredAccess, bInheritHandle, dwShareMode) {
        lpConsoleDevice := lpConsoleDevice is String? StrPtr(lpConsoleDevice) : lpConsoleDevice

        result := DllCall("KERNEL32.dll\OpenConsoleW", "ptr", lpConsoleDevice, "uint", dwDesiredAccess, "int", bInheritHandle, "uint", dwShareMode, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hSourceHandle 
     * @param {Integer} dwDesiredAccess 
     * @param {Integer} bInheritHandle 
     * @param {Integer} dwOptions 
     * @returns {Pointer<Void>} 
     */
    static DuplicateConsoleHandle(hSourceHandle, dwDesiredAccess, bInheritHandle, dwOptions) {
        result := DllCall("KERNEL32.dll\DuplicateConsoleHandle", "ptr", hSourceHandle, "uint", dwDesiredAccess, "int", bInheritHandle, "uint", dwOptions, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hConsole 
     * @returns {Integer} 
     */
    static CloseConsoleHandle(hConsole) {
        result := DllCall("KERNEL32.dll\CloseConsoleHandle", "ptr", hConsole, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hIoHandle 
     * @returns {Integer} 
     */
    static VerifyConsoleIoHandle(hIoHandle) {
        result := DllCall("KERNEL32.dll\VerifyConsoleIoHandle", "ptr", hIoHandle, "int")
        return result
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    static GetConsoleInputWaitHandle() {
        result := DllCall("KERNEL32.dll\GetConsoleInputWaitHandle", "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Command 
     * @param {Pointer} ConsoleInformation 
     * @param {Integer} ConsoleInformationLength 
     * @returns {Integer} 
     */
    static ConsoleControl(Command, ConsoleInformation, ConsoleInformationLength) {
        result := DllCall("USER32.dll\ConsoleControl", "int", Command, "ptr", ConsoleInformation, "uint", ConsoleInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} nStdHandle 
     * @returns {Pointer<Void>} 
     */
    static GetStdHandle(nStdHandle) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetStdHandle", "uint", nStdHandle, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} nStdHandle 
     * @param {Pointer<Void>} hHandle 
     * @returns {Integer} 
     */
    static SetStdHandle(nStdHandle, hHandle) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetStdHandle", "uint", nStdHandle, "ptr", hHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} nStdHandle A DWORD indicating the stream for which the handle is being set.
     * @param {Pointer<Void>} hHandle The handle.
     * @param {Pointer<Void>} phPrevValue Optional. Receives the previous handle.
     * @returns {Integer} Returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-setstdhandleex
     */
    static SetStdHandleEx(nStdHandle, hHandle, phPrevValue) {
        result := DllCall("KERNEL32.dll\SetStdHandleEx", "uint", nStdHandle, "ptr", hHandle, "ptr", phPrevValue, "int")
        return result
    }

;@endregion Methods
}
