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
     * See reference information about the AllocConsole function, which allocates a new console for the calling process.
     * @remarks
     * A process can be associated with only one console, so the **AllocConsole** function fails if the calling process already has a console. A process can use the [**FreeConsole**](freeconsole.md) function to detach itself from its current console, then it can call **AllocConsole** to create a new console or [**AttachConsole**](attachconsole.md) to attach to another console.
     * 
     * If the calling process creates a child process, the child inherits the new console.
     * 
     * **AllocConsole** initializes standard input, standard output, and standard error handles for the new console. The standard input handle is a handle to the console's input buffer, and the standard output and standard error handles are handles to the console's screen buffer. To retrieve these handles, use the [**GetStdHandle**](getstdhandle.md) function.
     * 
     * This function is primarily used by a graphical user interface (GUI) application to create a console window. GUI applications are initialized without a console. Console applications are initialized with a console, unless they are created as detached processes (by calling the [**CreateProcess**](/windows/win32/api/processthreadsapi/nf-processthreadsapi-createprocessa) function with the **DETACHED\_PROCESS** flag).
     * @returns {Integer} This function has no parameters.
     * 
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/allocconsole
     */
    static AllocConsole() {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\AllocConsole", "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the FreeConsole function, which detaches the calling process from its console.
     * @remarks
     * A process can be attached to at most one console. A process can use the **FreeConsole** function to detach itself from its console. If other processes share the console, the console is not destroyed, but the process that called **FreeConsole** cannot refer to it. A console is closed when the last process attached to it terminates or calls **FreeConsole**. After a process calls **FreeConsole**, it can call the [**AllocConsole**](allocconsole.md) function to create a new console or [**AttachConsole**](attachconsole.md) to attach to another console.
     * If the calling process is not already attached to a console, the **FreeConsole** request still succeeds.
     * @returns {Integer} This function has no parameters.
     * 
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/freeconsole
     */
    static FreeConsole() {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FreeConsole", "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the AttachConsole function, which attaches the calling process to the console of the specified process.
     * @remarks
     * A process can be attached to at most one console. If the calling process is already attached to a console, the error code returned is **ERROR\_ACCESS\_DENIED**. If the specified process does not have a console, the error code returned is **ERROR\_INVALID\_HANDLE**. If the specified process does not exist, the error code returned is **ERROR\_INVALID\_PARAMETER**.
     * 
     * A process can use the [**FreeConsole**](freeconsole.md) function to detach itself from its console. If other processes share the console, the console is not destroyed, but the process that called **FreeConsole** cannot refer to it. A console is closed when the last process attached to it terminates or calls **FreeConsole**. After a process calls **FreeConsole**, it can call the [**AllocConsole**](allocconsole.md) function to create a new console or **AttachConsole** to attach to another console.
     * 
     * This function is primarily useful to applications that were linked with [*SUBSYSTEM:WINDOWS**](/cpp/build/reference/subsystem-specify-subsystem), which implies to the operating system that a console is not needed before entering the program's main method. In that instance, the standard handles retrieved with [**GetStdHandle**](getstdhandle.md) will likely be invalid on startup until **AttachConsole** is called. The exception to this is if the application is launched with handle inheritance by its parent process.
     * 
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as `0x0501` or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * @param {Integer} dwProcessId The identifier of the process whose console is to be used. This parameter can be one of the following values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | *pid* | Use the console of the specified process. |
     * | **ATTACH\_PARENT\_PROCESS** `(DWORD)-1` | Use the console of the parent of the current process. |
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/attachconsole
     */
    static AttachConsole(dwProcessId) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\AttachConsole", "uint", dwProcessId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the input code page used by the console associated with the calling process.
     * @remarks
     * A code page maps 256 character codes to individual characters. Different code pages include different special characters, typically customized for a language or a group of languages. To retrieve more information about a code page, including it's name, see the [**GetCPInfoEx**](/windows/win32/api/winnls/nf-winnls-getcpinfoexa) function.
     * 
     * To set a console's input code page, use the [**SetConsoleCP**](setconsolecp.md) function. To set and query a console's output code page, use the [**SetConsoleOutputCP**](setconsoleoutputcp.md) and [**GetConsoleOutputCP**](getconsoleoutputcp.md) functions.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/console/getconsolecp
     */
    static GetConsoleCP() {
        A_LastError := 0

        DllCall("KERNEL32.dll\GetConsoleCP")
        if(A_LastError)
            throw OSError()

    }

    /**
     * Retrieves the output code page used by the console associated with the calling process.
     * @remarks
     * A code page maps 256 character codes to individual characters. Different code pages include different special characters, typically customized for a language or a group of languages. To retrieve more information about a code page, including it's name, see the [**GetCPInfoEx**](/windows/win32/api/winnls/nf-winnls-getcpinfoexa) function.
     * 
     * To set a console's output code page, use the [**SetConsoleOutputCP**](setconsoleoutputcp.md) function. To set and query a console's input code page, use the [**SetConsoleCP**](setconsolecp.md) and [**GetConsoleCP**](getconsolecp.md) functions.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/console/getconsoleoutputcp
     */
    static GetConsoleOutputCP() {
        A_LastError := 0

        DllCall("KERNEL32.dll\GetConsoleOutputCP")
        if(A_LastError)
            throw OSError()

    }

    /**
     * Retrieves the current input mode of a console's input buffer or the current output mode of a console screen buffer.
     * @remarks
     * [!INCLUDE [console-mode-remarks](./includes/console-mode-remarks.md)]
     * 
     * To change a console's I/O modes, call [**SetConsoleMode**](setconsolemode.md) function.
     * @param {Pointer<HANDLE>} hConsoleHandle A handle to the console input buffer or the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<UInt32>} lpMode A pointer to a variable that receives the current mode of the specified buffer.
     * 
     * [!INCLUDE [console-mode-flags](./includes/console-mode-flags.md)]
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/getconsolemode
     */
    static GetConsoleMode(hConsoleHandle, lpMode) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleMode", "ptr", hConsoleHandle, "ptr", lpMode, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the input mode of a console's input buffer or the output mode of a console screen buffer.
     * @remarks
     * [!INCLUDE [console-mode-remarks](./includes/console-mode-remarks.md)]
     * 
     * To determine the current mode of a console input buffer or a screen buffer, use the [**GetConsoleMode**](getconsolemode.md) function.
     * @param {Pointer<HANDLE>} hConsoleHandle A handle to the console input buffer or a console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Integer} dwMode The input or output mode to be set.
     * 
     * [!INCLUDE [console-mode-flags](./includes/console-mode-flags.md)]
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setconsolemode
     */
    static SetConsoleMode(hConsoleHandle, dwMode) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleMode", "ptr", hConsoleHandle, "uint", dwMode, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the number of unread input records in the console's input buffer.
     * @remarks
     * The **GetNumberOfConsoleInputEvents** function reports the total number of unread input records in the input buffer, including keyboard, mouse, and window-resizing input records. Processes using the [**ReadFile**](/windows/win32/api/fileapi/nf-fileapi-readfile) or [**ReadConsole**](readconsole.md) function can only read keyboard input. Processes using the [**ReadConsoleInput**](readconsoleinput.md) function can read all types of input records.
     * 
     * A process can specify a console input buffer handle in one of the [wait functions](/windows/win32/sync/wait-functions) to determine when there is unread console input. When the input buffer is not empty, the state of a console input buffer handle is signaled.
     * 
     * To read input records from a console input buffer without affecting the number of unread records, use the [**PeekConsoleInput**](peekconsoleinput.md) function. To discard all unread records in a console's input buffer, use the [**FlushConsoleInputBuffer**](flushconsoleinputbuffer.md) function.
     * @param {Pointer<HANDLE>} hConsoleInput A handle to the console input buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<UInt32>} lpNumberOfEvents 
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/getnumberofconsoleinputevents
     */
    static GetNumberOfConsoleInputEvents(hConsoleInput, lpNumberOfEvents) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNumberOfConsoleInputEvents", "ptr", hConsoleInput, "ptr", lpNumberOfEvents, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads data from a console input buffer and removes it from the buffer.
     * @remarks
     * If the number of records requested in the *nLength* parameter exceeds the number of records available in the buffer, the number available is read. The function does not return until at least one input record has been read.
     * 
     * A process can specify a console input buffer handle in one of the [wait functions](/windows/win32/sync/wait-functions) to determine when there is unread console input. When the input buffer is not empty, the state of a console input buffer handle is signaled.
     * 
     * To determine the number of unread input records in a console's input buffer, use the [**GetNumberOfConsoleInputEvents**](getnumberofconsoleinputevents.md) function. To read input records from a console input buffer without affecting the number of unread records, use the [**PeekConsoleInput**](peekconsoleinput.md) function. To discard all unread records in a console's input buffer, use the [**FlushConsoleInputBuffer**](flushconsoleinputbuffer.md) function.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * @param {Pointer<HANDLE>} hConsoleInput A handle to the console input buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<INPUT_RECORD>} lpBuffer A pointer to an array of [**INPUT\_RECORD**](input-record-str.md) structures that receives the input buffer data.
     * @param {Integer} nLength The size of the array pointed to by the *lpBuffer* parameter, in array elements.
     * @param {Pointer<UInt32>} lpNumberOfEventsRead A pointer to a variable that receives the number of input records read.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/readconsoleinput
     */
    static ReadConsoleInputA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleInputA", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "ptr", lpNumberOfEventsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads data from a console input buffer and removes it from the buffer.
     * @remarks
     * If the number of records requested in the *nLength* parameter exceeds the number of records available in the buffer, the number available is read. The function does not return until at least one input record has been read.
     * 
     * A process can specify a console input buffer handle in one of the [wait functions](/windows/win32/sync/wait-functions) to determine when there is unread console input. When the input buffer is not empty, the state of a console input buffer handle is signaled.
     * 
     * To determine the number of unread input records in a console's input buffer, use the [**GetNumberOfConsoleInputEvents**](getnumberofconsoleinputevents.md) function. To read input records from a console input buffer without affecting the number of unread records, use the [**PeekConsoleInput**](peekconsoleinput.md) function. To discard all unread records in a console's input buffer, use the [**FlushConsoleInputBuffer**](flushconsoleinputbuffer.md) function.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * @param {Pointer<HANDLE>} hConsoleInput A handle to the console input buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<INPUT_RECORD>} lpBuffer A pointer to an array of [**INPUT\_RECORD**](input-record-str.md) structures that receives the input buffer data.
     * @param {Integer} nLength The size of the array pointed to by the *lpBuffer* parameter, in array elements.
     * @param {Pointer<UInt32>} lpNumberOfEventsRead A pointer to a variable that receives the number of input records read.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/readconsoleinput
     */
    static ReadConsoleInputW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleInputW", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "ptr", lpNumberOfEventsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads data from the specified console input buffer without removing it from the buffer.
     * @remarks
     * If the number of records requested exceeds the number of records available in the buffer, the number available is read. If no data is available, the function returns immediately.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * @param {Pointer<HANDLE>} hConsoleInput A handle to the console input buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<INPUT_RECORD>} lpBuffer A pointer to an array of [**INPUT\_RECORD**](input-record-str.md) structures that receives the input buffer data.
     * @param {Integer} nLength The size of the array pointed to by the *lpBuffer* parameter, in array elements.
     * @param {Pointer<UInt32>} lpNumberOfEventsRead A pointer to a variable that receives the number of input records read.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/peekconsoleinput
     */
    static PeekConsoleInputA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\PeekConsoleInputA", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "ptr", lpNumberOfEventsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads data from the specified console input buffer without removing it from the buffer.
     * @remarks
     * If the number of records requested exceeds the number of records available in the buffer, the number available is read. If no data is available, the function returns immediately.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * @param {Pointer<HANDLE>} hConsoleInput A handle to the console input buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<INPUT_RECORD>} lpBuffer A pointer to an array of [**INPUT\_RECORD**](input-record-str.md) structures that receives the input buffer data.
     * @param {Integer} nLength The size of the array pointed to by the *lpBuffer* parameter, in array elements.
     * @param {Pointer<UInt32>} lpNumberOfEventsRead A pointer to a variable that receives the number of input records read.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/peekconsoleinput
     */
    static PeekConsoleInputW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\PeekConsoleInputW", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "ptr", lpNumberOfEventsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads character input from the console input buffer and removes it from the buffer.
     * @remarks
     * **ReadConsole** reads keyboard input from a console's input buffer. It behaves like the [**ReadFile**](/windows/win32/api/fileapi/nf-fileapi-readfile) function, except that it can read in either Unicode (wide-character) or ANSI mode. To have applications that maintain a single set of sources compatible with both modes, use **ReadConsole** rather than **ReadFile**. Although **ReadConsole** can only be used with a console input buffer handle, **ReadFile** can be used with other handles (such as files or pipes). **ReadConsole** fails if used with a standard handle that has been redirected to be something other than a console handle.
     * 
     * All of the input modes that affect the behavior of [**ReadFile**](/windows/win32/api/fileapi/nf-fileapi-readfile) have the same effect on **ReadConsole**. To retrieve and set the input modes of a console input buffer, use the [**GetConsoleMode**](getconsolemode.md) and [**SetConsoleMode**](setconsolemode.md) functions.
     * 
     * If the input buffer contains input events other than keyboard events (such as mouse events or window-resizing events), they are discarded. Those events can only be read by using the [**ReadConsoleInput**](readconsoleinput.md) function.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * The *pInputControl* parameter can be used to enable intermediate wakeups from the read in response to a file-completion control character specified in a [**CONSOLE\_READCONSOLE\_CONTROL**](console-readconsole-control.md) structure. This feature requires command extensions to be enabled, the standard output handle to be a console output handle, and input to be Unicode.
     * 
     * **Windows Server 2003 and Windows XP/2000:** The intermediate read feature is not supported.
     * 
     * **Cooked Mode** is when **ENABLE_LINE_INPUT** is set with [**SetConsoleMode**](setconsolemode.md) on the console input handle. In cooked mode, the console host will provide an edit line on the command-line application's behalf and calls to **ReadFile** or **ReadConsole** will not return until the enter key is pressed.
     * 
     * **Intermediate Read** is an augmentation to that behavior on the **ReadConsole** call in cooked read mode. Setting a flag in [**dwCtrlWakeupMask**](console-readconsole-control.md) on the [**CONSOLE\_READCONSOLE\_CONTROL**](console-readconsole-control.md) structure and pass it into *pinputControl* as it calls **ReadConsole**, will result in the read will not necessarily waiting for a newline, but returning on a specified character as well.
     * @param {Pointer<HANDLE>} hConsoleInput A handle to the console input buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<Void>} lpBuffer A pointer to a buffer that receives the data read from the console input buffer.
     * @param {Integer} nNumberOfCharsToRead The number of characters to be read. The size of the buffer pointed to by the *lpBuffer* parameter should be at least `nNumberOfCharsToRead * sizeof(TCHAR)` bytes.
     * @param {Pointer<UInt32>} lpNumberOfCharsRead A pointer to a variable that receives the number of characters actually read.
     * @param {Pointer<CONSOLE_READCONSOLE_CONTROL>} pInputControl A pointer to a [**CONSOLE\_READCONSOLE\_CONTROL**](console-readconsole-control.md) structure that specifies a control character to signal the end of the read operation. This parameter can be **NULL**.
     * 
     * This parameter requires Unicode input by default. For ANSI mode, set this parameter to **NULL**.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/readconsole
     */
    static ReadConsoleA(hConsoleInput, lpBuffer, nNumberOfCharsToRead, lpNumberOfCharsRead, pInputControl) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleA", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nNumberOfCharsToRead, "ptr", lpNumberOfCharsRead, "ptr", pInputControl, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads character input from the console input buffer and removes it from the buffer.
     * @remarks
     * **ReadConsole** reads keyboard input from a console's input buffer. It behaves like the [**ReadFile**](/windows/win32/api/fileapi/nf-fileapi-readfile) function, except that it can read in either Unicode (wide-character) or ANSI mode. To have applications that maintain a single set of sources compatible with both modes, use **ReadConsole** rather than **ReadFile**. Although **ReadConsole** can only be used with a console input buffer handle, **ReadFile** can be used with other handles (such as files or pipes). **ReadConsole** fails if used with a standard handle that has been redirected to be something other than a console handle.
     * 
     * All of the input modes that affect the behavior of [**ReadFile**](/windows/win32/api/fileapi/nf-fileapi-readfile) have the same effect on **ReadConsole**. To retrieve and set the input modes of a console input buffer, use the [**GetConsoleMode**](getconsolemode.md) and [**SetConsoleMode**](setconsolemode.md) functions.
     * 
     * If the input buffer contains input events other than keyboard events (such as mouse events or window-resizing events), they are discarded. Those events can only be read by using the [**ReadConsoleInput**](readconsoleinput.md) function.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * The *pInputControl* parameter can be used to enable intermediate wakeups from the read in response to a file-completion control character specified in a [**CONSOLE\_READCONSOLE\_CONTROL**](console-readconsole-control.md) structure. This feature requires command extensions to be enabled, the standard output handle to be a console output handle, and input to be Unicode.
     * 
     * **Windows Server 2003 and Windows XP/2000:** The intermediate read feature is not supported.
     * 
     * **Cooked Mode** is when **ENABLE_LINE_INPUT** is set with [**SetConsoleMode**](setconsolemode.md) on the console input handle. In cooked mode, the console host will provide an edit line on the command-line application's behalf and calls to **ReadFile** or **ReadConsole** will not return until the enter key is pressed.
     * 
     * **Intermediate Read** is an augmentation to that behavior on the **ReadConsole** call in cooked read mode. Setting a flag in [**dwCtrlWakeupMask**](console-readconsole-control.md) on the [**CONSOLE\_READCONSOLE\_CONTROL**](console-readconsole-control.md) structure and pass it into *pinputControl* as it calls **ReadConsole**, will result in the read will not necessarily waiting for a newline, but returning on a specified character as well.
     * @param {Pointer<HANDLE>} hConsoleInput A handle to the console input buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<Void>} lpBuffer A pointer to a buffer that receives the data read from the console input buffer.
     * @param {Integer} nNumberOfCharsToRead The number of characters to be read. The size of the buffer pointed to by the *lpBuffer* parameter should be at least `nNumberOfCharsToRead * sizeof(TCHAR)` bytes.
     * @param {Pointer<UInt32>} lpNumberOfCharsRead A pointer to a variable that receives the number of characters actually read.
     * @param {Pointer<CONSOLE_READCONSOLE_CONTROL>} pInputControl A pointer to a [**CONSOLE\_READCONSOLE\_CONTROL**](console-readconsole-control.md) structure that specifies a control character to signal the end of the read operation. This parameter can be **NULL**.
     * 
     * This parameter requires Unicode input by default. For ANSI mode, set this parameter to **NULL**.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/readconsole
     */
    static ReadConsoleW(hConsoleInput, lpBuffer, nNumberOfCharsToRead, lpNumberOfCharsRead, pInputControl) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleW", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nNumberOfCharsToRead, "ptr", lpNumberOfCharsRead, "ptr", pInputControl, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes a character string to a console screen buffer beginning at the current cursor location.
     * @remarks
     * The **WriteConsole** function writes characters to the console screen buffer at the current cursor position. The cursor position advances as characters are written. The [**SetConsoleCursorPosition**](setconsolecursorposition.md) function sets the current cursor position.
     * 
     * Characters are written using the foreground and background color attributes associated with the console screen buffer. The [**SetConsoleTextAttribute**](setconsoletextattribute.md) function changes these colors. To determine the current color attributes and the current cursor position, use [**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md).
     * 
     * All of the input modes that affect the behavior of the [**WriteFile**](/windows/win32/api/fileapi/nf-fileapi-writefile) function have the same effect on **WriteConsole**. To retrieve and set the output modes of a console screen buffer, use the [**GetConsoleMode**](getconsolemode.md) and [**SetConsoleMode**](setconsolemode.md) functions.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * **WriteConsole** fails if it is used with a standard handle that is redirected to a file. If an application processes multilingual output that can be redirected, determine whether the output handle is a console handle (one method is to call the [**GetConsoleMode**](getconsolemode.md) function and check whether it succeeds). If the handle is a console handle, call **WriteConsole**. If the handle is not a console handle, the output is redirected and you should call [**WriteFile**](/windows/win32/api/fileapi/nf-fileapi-writefile) to perform the I/O. Be sure to prefix a Unicode plain text file with a byte order mark. For more information, see [Using Byte Order Marks](/windows/win32/intl/using-byte-order-marks).
     * 
     * Although an application can use **WriteConsole** in ANSI mode to write ANSI characters, consoles do not support "ANSI escape" or "virtual terminal" sequences unless enabled. See [**Console Virtual Terminal Sequences**](console-virtual-terminal-sequences.md) for more information and for operating system version applicability.
     * 
     * When virtual terminal escape sequences are not enabled, console functions can provide equivalent functionality. For more information, see [**SetCursorPos**](/windows/win32/api/winuser/nf-winuser-setcursorpos), [**SetConsoleTextAttribute**](setconsoletextattribute.md), and [**GetConsoleCursorInfo**](getconsolecursorinfo.md).
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_WRITE** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<PSTR>} lpBuffer A pointer to a buffer that contains characters to be written to the console screen buffer. This is expected to be an array of either `char` for `WriteConsoleA` or `wchar_t` for `WriteConsoleW`.
     * @param {Integer} nNumberOfCharsToWrite The number of characters to be written. If the total size of the specified number of characters exceeds the available heap, the function fails with **ERROR\_NOT\_ENOUGH\_MEMORY**.
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten A pointer to a variable that receives the number of characters actually written.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/writeconsole
     */
    static WriteConsoleA(hConsoleOutput, lpBuffer, nNumberOfCharsToWrite, lpNumberOfCharsWritten) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleA", "ptr", hConsoleOutput, "ptr", lpBuffer, "uint", nNumberOfCharsToWrite, "ptr", lpNumberOfCharsWritten, "ptr", lpReserved, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes a character string to a console screen buffer beginning at the current cursor location.
     * @remarks
     * The **WriteConsole** function writes characters to the console screen buffer at the current cursor position. The cursor position advances as characters are written. The [**SetConsoleCursorPosition**](setconsolecursorposition.md) function sets the current cursor position.
     * 
     * Characters are written using the foreground and background color attributes associated with the console screen buffer. The [**SetConsoleTextAttribute**](setconsoletextattribute.md) function changes these colors. To determine the current color attributes and the current cursor position, use [**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md).
     * 
     * All of the input modes that affect the behavior of the [**WriteFile**](/windows/win32/api/fileapi/nf-fileapi-writefile) function have the same effect on **WriteConsole**. To retrieve and set the output modes of a console screen buffer, use the [**GetConsoleMode**](getconsolemode.md) and [**SetConsoleMode**](setconsolemode.md) functions.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * **WriteConsole** fails if it is used with a standard handle that is redirected to a file. If an application processes multilingual output that can be redirected, determine whether the output handle is a console handle (one method is to call the [**GetConsoleMode**](getconsolemode.md) function and check whether it succeeds). If the handle is a console handle, call **WriteConsole**. If the handle is not a console handle, the output is redirected and you should call [**WriteFile**](/windows/win32/api/fileapi/nf-fileapi-writefile) to perform the I/O. Be sure to prefix a Unicode plain text file with a byte order mark. For more information, see [Using Byte Order Marks](/windows/win32/intl/using-byte-order-marks).
     * 
     * Although an application can use **WriteConsole** in ANSI mode to write ANSI characters, consoles do not support "ANSI escape" or "virtual terminal" sequences unless enabled. See [**Console Virtual Terminal Sequences**](console-virtual-terminal-sequences.md) for more information and for operating system version applicability.
     * 
     * When virtual terminal escape sequences are not enabled, console functions can provide equivalent functionality. For more information, see [**SetCursorPos**](/windows/win32/api/winuser/nf-winuser-setcursorpos), [**SetConsoleTextAttribute**](setconsoletextattribute.md), and [**GetConsoleCursorInfo**](getconsolecursorinfo.md).
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_WRITE** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<PWSTR>} lpBuffer A pointer to a buffer that contains characters to be written to the console screen buffer. This is expected to be an array of either `char` for `WriteConsoleA` or `wchar_t` for `WriteConsoleW`.
     * @param {Integer} nNumberOfCharsToWrite The number of characters to be written. If the total size of the specified number of characters exceeds the available heap, the function fails with **ERROR\_NOT\_ENOUGH\_MEMORY**.
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten A pointer to a variable that receives the number of characters actually written.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/writeconsole
     */
    static WriteConsoleW(hConsoleOutput, lpBuffer, nNumberOfCharsToWrite, lpNumberOfCharsWritten) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleW", "ptr", hConsoleOutput, "ptr", lpBuffer, "uint", nNumberOfCharsToWrite, "ptr", lpNumberOfCharsWritten, "ptr", lpReserved, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds or removes an application-defined HandlerRoutine function from the list of handler functions for the calling process.
     * @remarks
     * This function provides a similar notification for console application and services that [**WM\_QUERYENDSESSION**](/windows/win32/shutdown/wm-queryendsession) provides for graphical applications with a message pump. You could also use this function from a graphical application, but there is no guarantee it would arrive before the notification from **WM\_QUERYENDSESSION**.
     * 
     * Each console process has its own list of application-defined [**HandlerRoutine**](handlerroutine.md) functions that handle <kbd>CTRL</kbd>+<kbd>C</kbd> and <kbd>CTRL</kbd>+<kbd>BREAK</kbd> signals. The handler functions also handle signals generated by the system when the user closes the console, logs off, or shuts down the system. Initially, the handler list for each process contains only a default handler function that calls the [**ExitProcess**](/windows/win32/api/processthreadsapi/nf-processthreadsapi-exitprocess) function. A console process adds or removes additional handler functions by calling the **SetConsoleCtrlHandler** function, which does not affect the list of handler functions for other processes. When a console process receives any of the control signals, its handler functions are called on a last-registered, first-called basis until one of the handlers returns `TRUE`. If none of the handlers returns `TRUE`, the default handler is called.
     * 
     * Calling [**AttachConsole**](attachconsole.md), [**AllocConsole**](allocconsole.md), or [**FreeConsole**](freeconsole.md) will reset the table of control handlers in the client process to its initial state. Handlers must be registered again when the attached console session changes.
     * 
     * For console processes, the <kbd>CTRL</kbd>+<kbd>C</kbd> and <kbd>CTRL</kbd>+<kbd>BREAK</kbd> key combinations are typically treated as signals (**CTRL\_C\_EVENT** and **CTRL\_BREAK\_EVENT**). When a console window with the keyboard focus receives <kbd>CTRL</kbd>+<kbd>C</kbd> or <kbd>CTRL</kbd>+<kbd>BREAK</kbd>, the signal is typically passed to all processes sharing that console.
     * 
     * <kbd>CTRL</kbd>+<kbd>BREAK</kbd> is always treated as a signal, but typical <kbd>CTRL</kbd>+<kbd>C</kbd> behavior can be changed in three ways that prevent the handler functions from being called:
     * 
     * - The [**SetConsoleMode**](setconsolemode.md) function can disable the **ENABLE\_PROCESSED\_INPUT** mode for a console's input buffer, so <kbd>CTRL</kbd>+<kbd>C</kbd> is reported as keyboard input rather than as a signal.
     * - Calling **SetConsoleCtrlHandler** with the **NULL** and **TRUE** arguments causes the calling process to ignore <kbd>CTRL</kbd>+<kbd>C</kbd> signals. This attribute is inherited by child processes, but it can be enabled or disabled by any process without affecting existing processes.
     * - If a console process is being debugged and <kbd>CTRL</kbd>+<kbd>C</kbd> signals have not been disabled, the system generates a **DBG\_CONTROL\_C** exception. This exception is raised only for the benefit of the debugger, and an application should never use an exception handler to deal with it. If the debugger handles the exception, an application will not notice the <kbd>CTRL</kbd>+<kbd>C</kbd>, with one exception: alertable waits will terminate. If the debugger passes the exception on unhandled, <kbd>CTRL</kbd>+<kbd>C</kbd> is passed to the console process and treated as a signal, as previously discussed.
     * 
     * A console process can use the [**GenerateConsoleCtrlEvent**](generateconsolectrlevent.md) function to send a <kbd>CTRL</kbd>+<kbd>C</kbd> or <kbd>CTRL</kbd>+<kbd>BREAK</kbd> signal to a console process group.
     * 
     * The system generates **CTRL\_CLOSE\_EVENT**, **CTRL\_LOGOFF\_EVENT**, and **CTRL\_SHUTDOWN\_EVENT** signals when the user closes the console, logs off, or shuts down the system so that the process has an opportunity to clean up before termination. Console functions, or any C run-time functions that call console functions, may not work reliably during processing of any of the three signals mentioned previously. The reason is that some or all of the internal console cleanup routines may have been called before executing the process signal handler.
     * 
     * **Windows 7, Windows 8, Windows 8.1 and Windows 10:**
     * 
     * If a console application loads the gdi32.dll or user32.dll library, the [**HandlerRoutine**](handlerroutine.md) function that you specify when you call **SetConsoleCtrlHandler** does not get called for the **CTRL\_LOGOFF\_EVENT** and **CTRL\_SHUTDOWN\_EVENT** events. The operating system recognizes processes that load gdi32.dll or user32.dll as Windows applications rather than console applications. This behavior also occurs for console applications that do not call functions in gdi32.dll or user32.dll directly, but do call functions such as [Shell functions](/previous-versions/windows/desktop/legacy/bb776426(v=vs.85)) that do in turn call functions in gdi32.dll or user32.dll.
     * 
     * To receive events when a user signs out or the device shuts down in these circumstances, create a hidden window in your console application, and then handle the [**WM\_QUERYENDSESSION**](/windows/win32/shutdown/wm-queryendsession) and [**WM\_ENDSESSION**](/windows/win32/shutdown/wm-endsession) window messages that the hidden window receives. You can create a hidden window by calling the [**CreateWindowEx**](/windows/win32/api/winuser/nf-winuser-createwindowexa) method with the *dwExStyle* parameter set to 0. An example of this is included with the basic handler example linked below.
     * @param {Pointer<PHANDLER_ROUTINE>} HandlerRoutine A pointer to the application-defined [**HandlerRoutine**](handlerroutine.md) function to be added or removed. This parameter can be **NULL**.
     * @param {Integer} Add If this parameter is **TRUE**, the handler is added; if it is **FALSE**, the handler is removed.
     * 
     * If the *HandlerRoutine* parameter is **NULL**, a **TRUE** value causes the calling process to ignore <kbd>CTRL</kbd>+<kbd>C</kbd> input, and a **FALSE** value restores normal processing of <kbd>CTRL</kbd>+<kbd>C</kbd> input. This attribute of ignoring or processing <kbd>CTRL</kbd>+<kbd>C</kbd> is inherited by child processes.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setconsolectrlhandler
     */
    static SetConsoleCtrlHandler(HandlerRoutine, Add) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleCtrlHandler", "ptr", HandlerRoutine, "int", Add, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the CreatePseudoConsole function, which allocates a new pseudoconsole for the calling process.
     * @remarks
     * This function is primarily used by applications attempting to be a terminal window for a command-line user interface (CUI) application. The callers become responsible for presentation of the information on the output stream and for collecting user input and serializing it into the input stream.
     * 
     * The input and output streams encoded as UTF-8 contain plain text interleaved with [Virtual Terminal Sequences](console-virtual-terminal-sequences.md).
     * 
     * On the output stream, the [virtual terminal sequences](console-virtual-terminal-sequences.md) can be decoded by the calling application to layout and present the plain text in a display window.
     * 
     * On the input stream, plain text represents standard keyboard keys input by a user. More complicated operations are represented by encoding control keys and mouse movements as [virtual terminal sequences](console-virtual-terminal-sequences.md) embedded in this stream.
     * 
     * The handle created by this function must be closed with [ClosePseudoConsole](closepseudoconsole.md) when operations are complete.
     * 
     * If using `PSEUDOCONSOLE_INHERIT_CURSOR`, the calling application should be prepared to respond to the request for the cursor state in an asynchronous fashion on a background thread by forwarding or interpreting the request for cursor information that will be received on `hOutput` and replying on `hInput`. Failure to do so may cause the calling application to hang while making another request of the pseudoconsole system.
     * @param {Pointer} size The dimensions of the window/buffer in count of characters that will be used on initial creation of the pseudoconsole. This can be adjusted later with [ResizePseudoConsole](resizepseudoconsole.md).
     * @param {Pointer<HANDLE>} hInput An open handle to a stream of data that represents user input to the device. This is currently restricted to [synchronous](/windows/desktop/Sync/synchronization-and-overlapped-input-and-output) I/O.
     * @param {Pointer<HANDLE>} hOutput An open handle to a stream of data that represents application output from the device. This is currently restricted to [synchronous](/windows/desktop/Sync/synchronization-and-overlapped-input-and-output) I/O.
     * @param {Integer} dwFlags The value can be one of the following:
     * 
     * | Value | Meaning |
     * |-|-|
     * | **0** | Perform a standard pseudoconsole creation. |
     * | **PSEUDOCONSOLE_INHERIT_CURSOR** (DWORD)1 | The created pseudoconsole session will attempt to inherit the cursor position of the parent console. |
     * @param {Pointer<IntPtr>} phPC Pointer to a location that will receive a handle to the new pseudoconsole device.
     * @returns {Integer} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/console/createpseudoconsole
     */
    static CreatePseudoConsole(size, hInput, hOutput, dwFlags, phPC) {
        result := DllCall("KERNEL32.dll\CreatePseudoConsole", "ptr", size, "ptr", hInput, "ptr", hOutput, "uint", dwFlags, "ptr", phPC, "int")
        return result
    }

    /**
     * See reference information about the ResizePseudoConsole function, which resizes the internal buffers for a pseudoconsole to the given size.
     * @remarks
     * This function can resize the internal buffers in the pseudoconsole session to match the window/buffer size being used for display on the terminal end. This ensures that attached Command-Line Interface (CUI) applications using the [Console Functions](console-functions.md) to communicate will have the correct dimensions returned in their calls.
     * @param {Pointer} hPC A handle to an active pseudoconsole as opened by [CreatePseudoConsole](createpseudoconsole.md).
     * @param {Pointer} size The dimensions of the window/buffer in count of characters that will be used for the internal buffer of this pseudoconsole.
     * @returns {Integer} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/console/resizepseudoconsole
     */
    static ResizePseudoConsole(hPC, size) {
        result := DllCall("KERNEL32.dll\ResizePseudoConsole", "ptr", hPC, "ptr", size, "int")
        return result
    }

    /**
     * See reference information about the ClosePseudoConsole function, which closes a pseudoconsole from the given handle.
     * @remarks
     * Upon closing a pseudoconsole, client applications attached to the session will be terminated as well.
     * 
     * A final painted frame may arrive on the `hOutput` handle originally provided to [CreatePseudoConsole](createpseudoconsole.md) when this API is called. It is expected that the caller will drain this information from the communication channel buffer and either present it or discard it. Failure to drain the buffer may cause the Close call to wait indefinitely until it is drained or the communication channels are broken another way.
     * @param {Pointer} hPC A handle to an active pseudoconsole as opened by [CreatePseudoConsole](createpseudoconsole.md).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/console/closepseudoconsole
     */
    static ClosePseudoConsole(hPC) {
        DllCall("KERNEL32.dll\ClosePseudoConsole", "ptr", hPC)
    }

    /**
     * Writes a character to the console screen buffer a specified number of times, beginning at the specified coordinates.
     * @remarks
     * If the number of characters to write to extends beyond the end of the specified row in the console screen buffer, characters are written to the next row. If the number of characters to write to extends beyond the end of the console screen buffer, the characters are written up to the end of the console screen buffer.
     * 
     * The attribute values at the positions written are not changed.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * > [!TIP]
     * > This API is not recommended and does not have a specific **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent. Filling the region outside the viewable window is not supported and is reserved for the terminal's history space. Filling a visible region with new text or color is performed through **[moving the cursor](console-virtual-terminal-sequences.md#cursor-positioning)**, **[setting the new attributes](console-virtual-terminal-sequences.md#text-formatting)**, then writing the desired text for that region, repeating characters if necessary for the length of the fill run. Additional cursor movement may be required followed by writing the desired text to fill a rectangular region. The client application is expected to keep its own memory of what is on the screen and is not able to query the remote state. More information can be found in **[classic console versus virtual terminal](classic-vs-vt.md)** documentation.
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_WRITE** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Integer} cCharacter The character to be written to the console screen buffer.
     * @param {Integer} nLength The number of character cells to which the character should be written.
     * @param {Pointer} dwWriteCoord A [**COORD**](coord-str.md) structure that specifies the character coordinates of the first cell to which the character is to be written.
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten A pointer to a variable that receives the number of characters actually written to the console screen buffer.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/fillconsoleoutputcharacter
     */
    static FillConsoleOutputCharacterA(hConsoleOutput, cCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FillConsoleOutputCharacterA", "ptr", hConsoleOutput, "char", cCharacter, "uint", nLength, "ptr", dwWriteCoord, "ptr", lpNumberOfCharsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes a character to the console screen buffer a specified number of times, beginning at the specified coordinates.
     * @remarks
     * If the number of characters to write to extends beyond the end of the specified row in the console screen buffer, characters are written to the next row. If the number of characters to write to extends beyond the end of the console screen buffer, the characters are written up to the end of the console screen buffer.
     * 
     * The attribute values at the positions written are not changed.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * > [!TIP]
     * > This API is not recommended and does not have a specific **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent. Filling the region outside the viewable window is not supported and is reserved for the terminal's history space. Filling a visible region with new text or color is performed through **[moving the cursor](console-virtual-terminal-sequences.md#cursor-positioning)**, **[setting the new attributes](console-virtual-terminal-sequences.md#text-formatting)**, then writing the desired text for that region, repeating characters if necessary for the length of the fill run. Additional cursor movement may be required followed by writing the desired text to fill a rectangular region. The client application is expected to keep its own memory of what is on the screen and is not able to query the remote state. More information can be found in **[classic console versus virtual terminal](classic-vs-vt.md)** documentation.
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_WRITE** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Integer} cCharacter The character to be written to the console screen buffer.
     * @param {Integer} nLength The number of character cells to which the character should be written.
     * @param {Pointer} dwWriteCoord A [**COORD**](coord-str.md) structure that specifies the character coordinates of the first cell to which the character is to be written.
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten A pointer to a variable that receives the number of characters actually written to the console screen buffer.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/fillconsoleoutputcharacter
     */
    static FillConsoleOutputCharacterW(hConsoleOutput, cCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FillConsoleOutputCharacterW", "ptr", hConsoleOutput, "char", cCharacter, "uint", nLength, "ptr", dwWriteCoord, "ptr", lpNumberOfCharsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the character attributes for a specified number of character cells, beginning at the specified coordinates in a screen buffer.
     * @remarks
     * If the number of character cells whose attributes are to be set extends beyond the end of the specified row in the console screen buffer, the cells of the next row are set. If the number of cells to write to extends beyond the end of the console screen buffer, the cells are written up to the end of the console screen buffer.
     * 
     * The character values at the positions written to are not changed.
     * 
     * > [!TIP]
     * > This API is not recommended and does not have a specific **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent. Filling the region outside the viewable window is not supported and is reserved for the terminal's history space. Filling a visible region with new text or color is performed through **[moving the cursor](console-virtual-terminal-sequences.md#cursor-positioning)**, **[setting the new attributes](console-virtual-terminal-sequences.md#text-formatting)**, then writing the desired text for that region, repeating characters if necessary for the length of the fill run. Additional cursor movement may be required followed by writing the desired text to fill a rectangular region. The client application is expected to keep its own memory of what is on the screen and is not able to query the remote state. More information can be found in **[classic console versus virtual terminal](classic-vs-vt.md)** documentation.
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_WRITE** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Integer} wAttribute The attributes to use when writing to the console screen buffer. For more information, see [Character Attributes](console-screen-buffers.md#character-attributes).
     * @param {Integer} nLength The number of character cells to be set to the specified color attributes.
     * @param {Pointer} dwWriteCoord A [**COORD**](coord-str.md) structure that specifies the character coordinates of the first cell whose attributes are to be set.
     * @param {Pointer<UInt32>} lpNumberOfAttrsWritten A pointer to a variable that receives the number of character cells whose attributes were actually set.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/fillconsoleoutputattribute
     */
    static FillConsoleOutputAttribute(hConsoleOutput, wAttribute, nLength, dwWriteCoord, lpNumberOfAttrsWritten) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FillConsoleOutputAttribute", "ptr", hConsoleOutput, "ushort", wAttribute, "uint", nLength, "ptr", dwWriteCoord, "ptr", lpNumberOfAttrsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends a specified signal to processes that share the console associated with the calling process.
     * @remarks
     * **GenerateConsoleCtrlEvent** causes the control handler functions of processes in the target group to be called. All console processes have a default handler function that calls the [**ExitProcess**](/windows/win32/api/processthreadsapi/nf-processthreadsapi-exitprocess) function. A console process can use the [**SetConsoleCtrlHandler**](setconsolectrlhandler.md) function to install or remove other handler functions.
     * 
     * [**SetConsoleCtrlHandler**](setconsolectrlhandler.md) can also enable an inheritable attribute that causes the calling process to ignore CTRL+C signals. If **GenerateConsoleCtrlEvent** sends a CTRL+C signal to a process for which this attribute is enabled, the handler functions for that process are not called. CTRL+BREAK signals always cause the handler functions to be called.
     * @param {Integer} dwCtrlEvent The type of signal to be generated. This parameter can be one of the following values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | **CTRL_C_EVENT** 0 | Generates a CTRL+C signal. This signal cannot be limited to a specific process group. If *dwProcessGroupId* is nonzero, this function will succeed, but the CTRL+C signal will not be received by processes within the specified process group. |
     * | **CTRL_BREAK_EVENT** 1 | Generates a CTRL+BREAK signal. |
     * @param {Integer} dwProcessGroupId The identifier of the process group to receive the signal. A process group is created when the **CREATE\_NEW\_PROCESS\_GROUP** flag is specified in a call to the [**CreateProcess**](/windows/win32/api/processthreadsapi/nf-processthreadsapi-createprocessa) function. The process identifier of the new process is also the process group identifier of a new process group. The process group includes all processes that are descendants of the root process. Only those processes in the group that share the same console as the calling process receive the signal. In other words, if a process in the group creates a new console, that process does not receive the signal, nor do its descendants.
     * 
     * If this parameter is zero, the signal is generated in all processes that share the console of the calling process.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/generateconsolectrlevent
     */
    static GenerateConsoleCtrlEvent(dwCtrlEvent, dwProcessGroupId) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GenerateConsoleCtrlEvent", "uint", dwCtrlEvent, "uint", dwProcessGroupId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * CreateConsoleScreenBuffer function creates a screen buffer for the Windows Console.
     * @remarks
     * A console can have multiple screen buffers but only one active screen buffer. Inactive screen buffers can be accessed for reading and writing, but only the active screen buffer is displayed. To make the new screen buffer the active screen buffer, use the [**SetConsoleActiveScreenBuffer**](setconsoleactivescreenbuffer.md) function.
     * 
     * The newly created screen buffer will copy some properties from the active screen buffer at the time that this function is called. The behavior is as follows:
     * 
     * - `Font` - copied from active screen buffer
     * - `Display Window Size` - copied from active screen buffer
     * - `Buffer Size` - matched to `Display Window Size` (**NOT** copied)
     * - `Default Attributes` (colors) - copied from active screen buffer
     * - `Default Popup Attributes` (colors) - copied from active screen buffer
     * 
     * The calling process can use the returned handle in any function that requires a handle to a console screen buffer, subject to the limitations of access specified by the *dwDesiredAccess* parameter.
     * 
     * The calling process can use the [**DuplicateHandle**](/windows/win32/api/handleapi/nf-handleapi-duplicatehandle) function to create a duplicate screen buffer handle that has different access or inheritability from the original handle. However, **DuplicateHandle** cannot be used to create a duplicate that is valid for a different process (except through inheritance).
     * 
     * To close the console screen buffer handle, use the [**CloseHandle**](/windows/win32/api/handleapi/nf-handleapi-closehandle) function.
     * 
     * [!INCLUDE [no-vt-equiv-alt-buf](./includes/no-vt-equiv-alt-buf.md)]
     * @param {Integer} dwDesiredAccess The access to the console screen buffer. For a list of access rights, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Integer} dwShareMode This parameter can be zero, indicating that the buffer cannot be shared, or it can be one or more of the following values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | **FILE_SHARE_READ** 0x00000001 | Other open operations can be performed on the console screen buffer for read access. |
     * | **FILE_SHARE_WRITE** 0x00000002 | Other open operations can be performed on the console screen buffer for write access. |
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a [**SECURITY\_ATTRIBUTES**](/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)) structure that determines whether the returned handle can be inherited by child processes. If *lpSecurityAttributes* is **NULL**, the handle cannot be inherited. The **lpSecurityDescriptor** member of the structure specifies a security descriptor for the new console screen buffer. If *lpSecurityAttributes* is **NULL**, the console screen buffer gets a default security descriptor. The ACLs in the default security descriptor for a console screen buffer come from the primary or impersonation token of the creator.
     * @param {Integer} dwFlags The type of console screen buffer to create. The only supported screen buffer type is **CONSOLE\_TEXTMODE\_BUFFER**.
     * @returns {Pointer<HANDLE>} If the function succeeds, the return value is a handle to the new console screen buffer.
     * 
     * If the function fails, the return value is **INVALID\_HANDLE\_VALUE**. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/createconsolescreenbuffer
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
     * Sets the specified screen buffer to be the currently displayed console screen buffer.
     * @remarks
     * A console can have multiple screen buffers. **SetConsoleActiveScreenBuffer** determines which one is displayed. You can write to an inactive screen buffer and then use **SetConsoleActiveScreenBuffer** to display the buffer's contents.
     * 
     * [!INCLUDE [no-vt-equiv-alt-buf](./includes/no-vt-equiv-alt-buf.md)]
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setconsoleactivescreenbuffer
     */
    static SetConsoleActiveScreenBuffer(hConsoleOutput) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleActiveScreenBuffer", "ptr", hConsoleOutput, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Flushes the console input buffer. All input records currently in the input buffer are discarded.
     * @remarks
     * > [!TIP]
     * > This API is not recommended and does not have a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent. Attempting to empty the input queue all at once can destroy state in the queue in an unexpected manner.
     * @param {Pointer<HANDLE>} hConsoleInput A handle to the console input buffer. The handle must have the **GENERIC\_WRITE** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/flushconsoleinputbuffer
     */
    static FlushConsoleInputBuffer(hConsoleInput) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FlushConsoleInputBuffer", "ptr", hConsoleInput, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the input code page used by the console associated with the calling process.
     * @remarks
     * A code page maps 256 character codes to individual characters. Different code pages include different special characters, typically customized for a language or a group of languages.
     * 
     * To find the code pages that are installed or supported by the operating system, use the [**EnumSystemCodePages**](/windows/win32/api/winnls/nf-winnls-enumsystemcodepagesa) function. The identifiers of the code pages available on the local computer are also stored in the registry under the following key:
     * 
     * `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\CodePage`
     * 
     * However, it is better to use [**EnumSystemCodePages**](/windows/win32/api/winnls/nf-winnls-enumsystemcodepagesa) to enumerate code pages because the registry can differ in different versions of Windows.
     * 
     * To determine whether a particular code page is valid, use the [**IsValidCodePage**](/windows/win32/api/winnls/nf-winnls-isvalidcodepage) function. To retrieve more information about a code page, including its name, use the [**GetCPInfoEx**](/windows/win32/api/winnls/nf-winnls-getcpinfoexa) function. For a list of available code page identifiers, see [Code Page Identifiers](/windows/win32/intl/code-page-identifiers).
     * 
     * To determine a console's current input code page, use the [**GetConsoleCP**](getconsolecp.md) function. To set and retrieve a console's output code page, use the [**SetConsoleOutputCP**](setconsoleoutputcp.md) and [**GetConsoleOutputCP**](getconsoleoutputcp.md) functions.
     * @param {Integer} wCodePageID The identifier of the code page to be set. For more information, see Remarks.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setconsolecp
     */
    static SetConsoleCP(wCodePageID) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleCP", "uint", wCodePageID, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the output code page used by the console associated with the calling process.
     * @remarks
     * A code page maps 256 character codes to individual characters. Different code pages include different special characters, typically customized for a language or a group of languages.
     * 
     * If the current font is a fixed-pitch Unicode font, **SetConsoleOutputCP** changes the mapping of the character values into the glyph set of the font, rather than loading a separate font each time it is called. This affects how extended characters (ASCII value greater than 127) are displayed in a console window. However, if the current font is a raster font, **SetConsoleOutputCP** does not affect how extended characters are displayed.
     * 
     * To find the code pages that are installed or supported by the operating system, use the [EnumSystemCodePages](/windows/win32/api/winnls/nf-winnls-enumsystemcodepagesa) function. The identifiers of the code pages available on the local computer are also stored in the registry under the following key:
     * 
     * `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\CodePage`
     * 
     * However, it is better to use [EnumSystemCodePages](/windows/win32/api/winnls/nf-winnls-enumsystemcodepagesa) to enumerate code pages because the registry can differ in different versions of Windows.
     * To determine whether a particular code page is valid, use the [IsValidCodePage](/windows/win32/api/winnls/nf-winnls-isvalidcodepage) function. To retrieve more information about a code page, including its name, use the [**GetCPInfoEx**](/windows/win32/api/winnls/nf-winnls-getcpinfoexa) function. For a list of available code page identifiers, see [Code Page Identifiers](/windows/win32/intl/code-page-identifiers).
     * 
     * To determine a console's current output code page, use the [**GetConsoleOutputCP**](getconsoleoutputcp.md) function. To set and retrieve a console's input code page, use the [**SetConsoleCP**](setconsolecp.md) and [**GetConsoleCP**](getconsolecp.md) functions.
     * @param {Integer} wCodePageID The identifier of the code page to set. For more information, see Remarks.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setconsoleoutputcp
     */
    static SetConsoleOutputCP(wCodePageID) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleOutputCP", "uint", wCodePageID, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the size and visibility of the cursor for the specified console screen buffer.
     * @remarks
     * [!INCLUDE [no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<CONSOLE_CURSOR_INFO>} lpConsoleCursorInfo A pointer to a [**CONSOLE\_CURSOR\_INFO**](console-cursor-info-str.md) structure that receives information about the console's cursor.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/getconsolecursorinfo
     */
    static GetConsoleCursorInfo(hConsoleOutput, lpConsoleCursorInfo) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleCursorInfo", "ptr", hConsoleOutput, "ptr", lpConsoleCursorInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the size and visibility of the cursor for the specified console screen buffer.
     * @remarks
     * When a screen buffer's cursor is visible, its appearance can vary, ranging from completely filling a character cell to showing up as a horizontal line at the bottom of the cell. The **dwSize** member of the [**CONSOLE\_CURSOR\_INFO**](console-cursor-info-str.md) structure specifies the percentage of a character cell that is filled by the cursor. If this member is less than 1 or greater than 100, **SetConsoleCursorInfo** fails.
     * 
     * > [!TIP]
     * > This API has a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent in the **[cursor visibility](console-virtual-terminal-sequences.md#cursor-visibility)** section with the `^[[?25h` and `^[[?25l` sequences.
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<CONSOLE_CURSOR_INFO>} lpConsoleCursorInfo A pointer to a [**CONSOLE\_CURSOR\_INFO**](console-cursor-info-str.md) structure that provides the new specifications for the console screen buffer's cursor.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setconsolecursorinfo
     */
    static SetConsoleCursorInfo(hConsoleOutput, lpConsoleCursorInfo) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleCursorInfo", "ptr", hConsoleOutput, "ptr", lpConsoleCursorInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the GetConsoleScreenBufferInfo function, which retrieves information about the specified console screen buffer.
     * @remarks
     * The rectangle returned in the **srWindow** member of the [**CONSOLE\_SCREEN\_BUFFER\_INFO**](console-screen-buffer-info-str.md) structure can be modified and then passed to the [**SetConsoleWindowInfo**](setconsolewindowinfo.md) function to scroll the console screen buffer in the window, to change the size of the window, or both.
     * 
     * All coordinates returned in the [**CONSOLE\_SCREEN\_BUFFER\_INFO**](console-screen-buffer-info-str.md) structure are in character-cell coordinates, where the origin (0, 0) is at the upper-left corner of the console screen buffer.
     * 
     * > [!TIP]
     * > This API does not have a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent. Its use may still be required for applications that are attempting to draw columns, grids, or fill the display to retrieve the window size. This window state is managed by the TTY/PTY/Pseudoconsole outside of the normal stream flow and is generally considered a user privilege not adjustable by the client application. Updates can be received on [**ReadConsoleInput**](readconsoleinput.md).
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<CONSOLE_SCREEN_BUFFER_INFO>} lpConsoleScreenBufferInfo A pointer to a [**CONSOLE\_SCREEN\_BUFFER\_INFO**](console-screen-buffer-info-str.md) structure that receives the console screen buffer information.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/getconsolescreenbufferinfo
     */
    static GetConsoleScreenBufferInfo(hConsoleOutput, lpConsoleScreenBufferInfo) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleScreenBufferInfo", "ptr", hConsoleOutput, "ptr", lpConsoleScreenBufferInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves extended information about the specified console screen buffer.
     * @remarks
     * The rectangle returned in the **srWindow** member of the [**CONSOLE\_SCREEN\_BUFFER\_INFOEX**](console-screen-buffer-infoex.md) structure can be modified and then passed to the [**SetConsoleWindowInfo**](setconsolewindowinfo.md) function to scroll the console screen buffer in the window, to change the size of the window, or both.
     * 
     * All coordinates returned in the [**CONSOLE\_SCREEN\_BUFFER\_INFOEX**](console-screen-buffer-infoex.md) structure are in character-cell coordinates, where the origin (0, 0) is at the upper-left corner of the console screen buffer.
     * 
     * > [!TIP]
     * > This API does not have a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent. Its use may still be required for applications that are attempting to draw columns, grids, or fill the display to retrieve the window size. This window state is managed by the TTY/PTY/Pseudoconsole outside of the normal stream flow and is generally considered a user privilege not adjustable by the client application. Updates can be received on [**ReadConsoleInput**](readconsoleinput.md).
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<CONSOLE_SCREEN_BUFFER_INFOEX>} lpConsoleScreenBufferInfoEx A [**CONSOLE\_SCREEN\_BUFFER\_INFOEX**](console-screen-buffer-infoex.md) structure that receives the requested console screen buffer information.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/getconsolescreenbufferinfoex
     */
    static GetConsoleScreenBufferInfoEx(hConsoleOutput, lpConsoleScreenBufferInfoEx) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleScreenBufferInfoEx", "ptr", hConsoleOutput, "ptr", lpConsoleScreenBufferInfoEx, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets extended information about the specified console screen buffer to the specified buffer.
     * @remarks
     * > [!TIP]
     * > This API has a partial **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent. **[Cursor positioning buffer](console-virtual-terminal-sequences.md#cursor-positioning)** and **[text attributes](console-virtual-terminal-sequences.md#text-formatting)** have specific sequence equivalents. The color table is not configurable, but **[extended colors](console-virtual-terminal-sequences.md#extended-colors)** are available beyond what is normally available through **[console functions](console-functions.md)**. Popup attributes have no equivalent as popup menus are the responsibility of the command-line client application in the **virtual terminal** world. Finally, the size of the window and the full screen status are considered privileges owned by the user in the **virtual terminal** world and have no equivalent sequence.
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_WRITE** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<CONSOLE_SCREEN_BUFFER_INFOEX>} lpConsoleScreenBufferInfoEx A [**CONSOLE\_SCREEN\_BUFFER\_INFOEX**](console-screen-buffer-infoex.md) structure that contains the console screen buffer information.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setconsolescreenbufferinfoex
     */
    static SetConsoleScreenBufferInfoEx(hConsoleOutput, lpConsoleScreenBufferInfoEx) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleScreenBufferInfoEx", "ptr", hConsoleOutput, "ptr", lpConsoleScreenBufferInfoEx, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the SetConsoleScreenBufferSize function, which changes the size of the specified console screen buffer.
     * @remarks
     * [!INCLUDE [no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer} dwSize A [**COORD**](coord-str.md) structure that specifies the new size of the console screen buffer, in character rows and columns. The specified width and height cannot be less than the width and height of the console screen buffer's window. The specified dimensions also cannot be less than the minimum size allowed by the system. This minimum depends on the current font size for the console (selected by the user) and the **SM\_CXMIN** and **SM\_CYMIN** values returned by the [**GetSystemMetrics**](/windows/win32/api/winuser/nf-winuser-getsystemmetrics) function.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setconsolescreenbuffersize
     */
    static SetConsoleScreenBufferSize(hConsoleOutput, dwSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleScreenBufferSize", "ptr", hConsoleOutput, "ptr", dwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the SetConsoleCursorPosition function, which sets the cursor position in the specified console screen buffer.
     * @remarks
     * The cursor position determines where characters written by the [**WriteFile**](/windows/win32/api/fileapi/nf-fileapi-writefile) or [**WriteConsole**](writeconsole.md) function, or echoed by the [**ReadFile**](/windows/win32/api/fileapi/nf-fileapi-readfile) or [**ReadConsole**](readconsole.md) function, are displayed. To determine the current position of the cursor, use the [**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md) function.
     * 
     * If the new cursor position is not within the boundaries of the console screen buffer's window, the window origin changes to make the cursor visible.
     * 
     * > [!TIP]
     * > This API has a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent in the **[simple cursor positioning](console-virtual-terminal-sequences.md#simple-cursor-positioning)** and **[cursor positioning](console-virtual-terminal-sequences.md#cursor-positioning)** sections. Use of the newline, carriage return, backspace, and tab control sequences can also assist with cursor positioning.
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer} dwCursorPosition A [**COORD**](coord-str.md) structure that specifies the new cursor position, in characters. The coordinates are the column and row of a screen buffer character cell. The coordinates must be within the boundaries of the console screen buffer.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setconsolecursorposition
     */
    static SetConsoleCursorPosition(hConsoleOutput, dwCursorPosition) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleCursorPosition", "ptr", hConsoleOutput, "ptr", dwCursorPosition, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the size of the largest possible console window, based on the current font and the size of the display.
     * @remarks
     * The function does not take into consideration the size of the console screen buffer, which means that the window size returned may be larger than the size of the console screen buffer. The [**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md) function can be used to determine the maximum size of the console window, given the current screen buffer size, the current font, and the display size.
     * 
     * [!INCLUDE [no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/console/getlargestconsolewindowsize
     */
    static GetLargestConsoleWindowSize(hConsoleOutput) {
        A_LastError := 0

        DllCall("KERNEL32.dll\GetLargestConsoleWindowSize", "ptr", hConsoleOutput)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Sets the attributes of characters written to the console screen buffer by the WriteFile or WriteConsole function, or echoed by the ReadFile or ReadConsole function.
     * @remarks
     * To determine the current color attributes of a screen buffer, call the [**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md) function.
     * 
     * > [!TIP]
     * > This API has a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent in the **[text formatting](console-virtual-terminal-sequences.md#text-formatting)** sequences. _Virtual terminal sequences_ are recommended for all new and ongoing development.
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Integer} wAttributes The [character attributes](console-screen-buffers.md#character-attributes).
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setconsoletextattribute
     */
    static SetConsoleTextAttribute(hConsoleOutput, wAttributes) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleTextAttribute", "ptr", hConsoleOutput, "ushort", wAttributes, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the current size and position of a console screen buffer's window.
     * @remarks
     * The function fails if the specified window rectangle extends beyond the boundaries of the console screen buffer. This means that the **Top** and **Left** members of the *lpConsoleWindow* rectangle (or the calculated top and left coordinates, if *bAbsolute* is FALSE) cannot be less than zero. Similarly, the **Bottom** and **Right** members (or the calculated bottom and right coordinates) cannot be greater than (screen buffer height – 1) and (screen buffer width – 1), respectively. The function also fails if the **Right** member (or calculated right coordinate) is less than or equal to the **Left** member (or calculated left coordinate) or if the **Bottom** member (or calculated bottom coordinate) is less than or equal to the **Top** member (or calculated top coordinate).
     * 
     * For consoles with more than one screen buffer, changing the window location for one screen buffer does not affect the window locations of the other screen buffers.
     * 
     * To determine the current size and position of a screen buffer's window, use the [**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md) function. This function also returns the maximum size of the window, given the current screen buffer size, the current font size, and the screen size. The [**GetLargestConsoleWindowSize**](getlargestconsolewindowsize.md) function returns the maximum window size given the current font and screen sizes, but it does not consider the size of the console screen buffer.
     * 
     * **SetConsoleWindowInfo** can be used to scroll the contents of the console screen buffer by shifting the position of the window rectangle without changing its size.
     * 
     * [!INCLUDE [no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Integer} bAbsolute If this parameter is **TRUE**, the coordinates specify the new upper-left and lower-right corners of the window. If it is **FALSE**, the coordinates are relative to the current window-corner coordinates.
     * @param {Pointer<SMALL_RECT>} lpConsoleWindow A pointer to a [**SMALL\_RECT**](small-rect-str.md) structure that specifies the new upper-left and lower-right corners of the window.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setconsolewindowinfo
     */
    static SetConsoleWindowInfo(hConsoleOutput, bAbsolute, lpConsoleWindow) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleWindowInfo", "ptr", hConsoleOutput, "int", bAbsolute, "ptr", lpConsoleWindow, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies a number of characters to consecutive cells of a console screen buffer, beginning at a specified location.
     * @remarks
     * If the number of characters to be written to extends beyond the end of the specified row in the console screen buffer, characters are written to the next row. If the number of characters to be written to extends beyond the end of the console screen buffer, characters are written up to the end of the console screen buffer.
     * 
     * The attribute values at the positions written to are not changed.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * > [!TIP]
     * > This API has a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent in the **[text formatting](console-virtual-terminal-sequences.md#text-formatting)** and **[cursor positioning](console-virtual-terminal-sequences.md#cursor-positioning)** sequences. Move the cursor to the location to insert, apply the formatting desired, and write out text to fill. There is no equivalent to emit text to an area without also applying the active color formatting. This decision intentionally aligns the Windows platform with other operating systems where the individual client application is expected to remember its own drawn state for further manipulation.
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_WRITE** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<PSTR>} lpCharacter The characters to be written to the console screen buffer.
     * @param {Integer} nLength The number of characters to be written.
     * @param {Pointer} dwWriteCoord A [**COORD**](coord-str.md) structure that specifies the character coordinates of the first cell in the console screen buffer to which characters will be written.
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten A pointer to a variable that receives the number of characters actually written.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/writeconsoleoutputcharacter
     */
    static WriteConsoleOutputCharacterA(hConsoleOutput, lpCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleOutputCharacterA", "ptr", hConsoleOutput, "ptr", lpCharacter, "uint", nLength, "ptr", dwWriteCoord, "ptr", lpNumberOfCharsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies a number of characters to consecutive cells of a console screen buffer, beginning at a specified location.
     * @remarks
     * If the number of characters to be written to extends beyond the end of the specified row in the console screen buffer, characters are written to the next row. If the number of characters to be written to extends beyond the end of the console screen buffer, characters are written up to the end of the console screen buffer.
     * 
     * The attribute values at the positions written to are not changed.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * > [!TIP]
     * > This API has a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent in the **[text formatting](console-virtual-terminal-sequences.md#text-formatting)** and **[cursor positioning](console-virtual-terminal-sequences.md#cursor-positioning)** sequences. Move the cursor to the location to insert, apply the formatting desired, and write out text to fill. There is no equivalent to emit text to an area without also applying the active color formatting. This decision intentionally aligns the Windows platform with other operating systems where the individual client application is expected to remember its own drawn state for further manipulation.
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_WRITE** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<PWSTR>} lpCharacter The characters to be written to the console screen buffer.
     * @param {Integer} nLength The number of characters to be written.
     * @param {Pointer} dwWriteCoord A [**COORD**](coord-str.md) structure that specifies the character coordinates of the first cell in the console screen buffer to which characters will be written.
     * @param {Pointer<UInt32>} lpNumberOfCharsWritten A pointer to a variable that receives the number of characters actually written.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/writeconsoleoutputcharacter
     */
    static WriteConsoleOutputCharacterW(hConsoleOutput, lpCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleOutputCharacterW", "ptr", hConsoleOutput, "ptr", lpCharacter, "uint", nLength, "ptr", dwWriteCoord, "ptr", lpNumberOfCharsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies a number of character attributes to consecutive cells of a console screen buffer, beginning at a specified location.
     * @remarks
     * If the number of attributes to be written to extends beyond the end of the specified row in the console screen buffer, attributes are written to the next row. If the number of attributes to be written to extends beyond the end of the console screen buffer, the attributes are written up to the end of the console screen buffer.
     * 
     * The character values at the positions written to are not changed.
     * 
     * > [!TIP]
     * > This API has a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent in the **[text formatting](console-virtual-terminal-sequences.md#text-formatting)** and **[cursor positioning](console-virtual-terminal-sequences.md#cursor-positioning)** sequences. Move the cursor to the location to insert, apply the formatting desired, and write out text to fill. There is no equivalent to apply color to an area without also emitting text. This decision intentionally aligns the Windows platform with other operating systems where the individual client application is expected to remember its own drawn state for further manipulation.
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_WRITE** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<UInt16>} lpAttribute The attributes to be used when writing to the console screen buffer. For more information, see [Character Attributes](console-screen-buffers.md#character-attributes).
     * @param {Integer} nLength The number of screen buffer character cells to which the attributes will be copied.
     * @param {Pointer} dwWriteCoord A [**COORD**](coord-str.md) structure that specifies the character coordinates of the first cell in the console screen buffer to which the attributes will be written.
     * @param {Pointer<UInt32>} lpNumberOfAttrsWritten A pointer to a variable that receives the number of attributes actually written to the console screen buffer.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/writeconsoleoutputattribute
     */
    static WriteConsoleOutputAttribute(hConsoleOutput, lpAttribute, nLength, dwWriteCoord, lpNumberOfAttrsWritten) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleOutputAttribute", "ptr", hConsoleOutput, "ptr", lpAttribute, "uint", nLength, "ptr", dwWriteCoord, "ptr", lpNumberOfAttrsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies a number of characters from consecutive cells of a console screen buffer, beginning at a specified location.
     * @remarks
     * If the number of characters to be read from extends beyond the end of the specified screen buffer row, characters are read from the next row. If the number of characters to be read from extends beyond the end of the console screen buffer, characters up to the end of the console screen buffer are read.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * [!INCLUDE [no-vt-equiv-banner](./includes/no-vt-equiv-banner.md)]
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<PSTR>} lpCharacter A pointer to a buffer that receives the characters read from the console screen buffer.
     * @param {Integer} nLength The number of screen buffer character cells from which to read. The size of the buffer pointed to by the *lpCharacter* parameter should be `nLength * sizeof(TCHAR)`.
     * @param {Pointer} dwReadCoord The coordinates of the first cell in the console screen buffer from which to read, in characters. The **X** member of the [**COORD**](coord-str.md) structure is the column, and the **Y** member is the row.
     * @param {Pointer<UInt32>} lpNumberOfCharsRead A pointer to a variable that receives the number of characters actually read.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/readconsoleoutputcharacter
     */
    static ReadConsoleOutputCharacterA(hConsoleOutput, lpCharacter, nLength, dwReadCoord, lpNumberOfCharsRead) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleOutputCharacterA", "ptr", hConsoleOutput, "ptr", lpCharacter, "uint", nLength, "ptr", dwReadCoord, "ptr", lpNumberOfCharsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies a number of characters from consecutive cells of a console screen buffer, beginning at a specified location.
     * @remarks
     * If the number of characters to be read from extends beyond the end of the specified screen buffer row, characters are read from the next row. If the number of characters to be read from extends beyond the end of the console screen buffer, characters up to the end of the console screen buffer are read.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * [!INCLUDE [no-vt-equiv-banner](./includes/no-vt-equiv-banner.md)]
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<PWSTR>} lpCharacter A pointer to a buffer that receives the characters read from the console screen buffer.
     * @param {Integer} nLength The number of screen buffer character cells from which to read. The size of the buffer pointed to by the *lpCharacter* parameter should be `nLength * sizeof(TCHAR)`.
     * @param {Pointer} dwReadCoord The coordinates of the first cell in the console screen buffer from which to read, in characters. The **X** member of the [**COORD**](coord-str.md) structure is the column, and the **Y** member is the row.
     * @param {Pointer<UInt32>} lpNumberOfCharsRead A pointer to a variable that receives the number of characters actually read.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/readconsoleoutputcharacter
     */
    static ReadConsoleOutputCharacterW(hConsoleOutput, lpCharacter, nLength, dwReadCoord, lpNumberOfCharsRead) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleOutputCharacterW", "ptr", hConsoleOutput, "ptr", lpCharacter, "uint", nLength, "ptr", dwReadCoord, "ptr", lpNumberOfCharsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies a specified number of character attributes from consecutive cells of a console screen buffer, beginning at a specified location.
     * @remarks
     * If the number of attributes to be read from extends beyond the end of the specified screen buffer row, attributes are read from the next row. If the number of attributes to be read from extends beyond the end of the console screen buffer, attributes up to the end of the console screen buffer are read.
     * 
     * [!INCLUDE [no-vt-equiv-banner](./includes/no-vt-equiv-banner.md)]
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<UInt16>} lpAttribute A pointer to a buffer that receives the attributes being used by the console screen buffer.
     * 
     * For more information, see [Character Attributes](console-screen-buffers.md#character-attributes).
     * @param {Integer} nLength The number of screen buffer character cells from which to read. The size of the buffer pointed to by the *lpAttribute* parameter should be `nLength * sizeof(WORD)`.
     * @param {Pointer} dwReadCoord The coordinates of the first cell in the console screen buffer from which to read, in characters. The **X** member of the [**COORD**](coord-str.md) structure is the column, and the **Y** member is the row.
     * @param {Pointer<UInt32>} lpNumberOfAttrsRead A pointer to a variable that receives the number of attributes actually read.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/readconsoleoutputattribute
     */
    static ReadConsoleOutputAttribute(hConsoleOutput, lpAttribute, nLength, dwReadCoord, lpNumberOfAttrsRead) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleOutputAttribute", "ptr", hConsoleOutput, "ptr", lpAttribute, "uint", nLength, "ptr", dwReadCoord, "ptr", lpNumberOfAttrsRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the WriteConsoleInput function, which writes data directly to the console input buffer.
     * @remarks
     * **WriteConsoleInput** places input records into the input buffer behind any pending events in the buffer. The input buffer grows dynamically, if necessary, to hold as many events as are written.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * > [!TIP]
     * > This API is not recommended and does not have a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent. This decision intentionally aligns the Windows platform with other operating systems. This operation is considered the **[wrong-way verb](console-buffer-security-and-access-rights.md#wrong-way-verbs)** for this buffer. Applications remoting via cross-platform utilities and transports like SSH may not work as expected if using this API.
     * @param {Pointer<HANDLE>} hConsoleInput A handle to the console input buffer. The handle must have the **GENERIC\_WRITE** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<INPUT_RECORD>} lpBuffer A pointer to an array of [**INPUT\_RECORD**](input-record-str.md) structures that contain data to be written to the input buffer.
     * @param {Integer} nLength The number of input records to be written.
     * @param {Pointer<UInt32>} lpNumberOfEventsWritten A pointer to a variable that receives the number of input records actually written.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/writeconsoleinput
     */
    static WriteConsoleInputA(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleInputA", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "ptr", lpNumberOfEventsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the WriteConsoleInput function, which writes data directly to the console input buffer.
     * @remarks
     * **WriteConsoleInput** places input records into the input buffer behind any pending events in the buffer. The input buffer grows dynamically, if necessary, to hold as many events as are written.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * > [!TIP]
     * > This API is not recommended and does not have a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent. This decision intentionally aligns the Windows platform with other operating systems. This operation is considered the **[wrong-way verb](console-buffer-security-and-access-rights.md#wrong-way-verbs)** for this buffer. Applications remoting via cross-platform utilities and transports like SSH may not work as expected if using this API.
     * @param {Pointer<HANDLE>} hConsoleInput A handle to the console input buffer. The handle must have the **GENERIC\_WRITE** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<INPUT_RECORD>} lpBuffer A pointer to an array of [**INPUT\_RECORD**](input-record-str.md) structures that contain data to be written to the input buffer.
     * @param {Integer} nLength The number of input records to be written.
     * @param {Pointer<UInt32>} lpNumberOfEventsWritten A pointer to a variable that receives the number of input records actually written.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/writeconsoleinput
     */
    static WriteConsoleInputW(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleInputW", "ptr", hConsoleInput, "ptr", lpBuffer, "uint", nLength, "ptr", lpNumberOfEventsWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the ScrollConsoleScreenBuffer function, which moves a block of data in a screen buffer.
     * @remarks
     * **ScrollConsoleScreenBuffer** copies the contents of a rectangular region of a screen buffer, specified by the *lpScrollRectangle* parameter, to another area of the console screen buffer. The target rectangle has the same dimensions as the *lpScrollRectangle* rectangle with its upper-left corner at the coordinates specified by the *dwDestinationOrigin* parameter. Those parts of *lpScrollRectangle* that do not overlap with the target rectangle are filled in with the character and color attributes specified by the *lpFill* parameter.
     * 
     * The clipping rectangle applies to changes made in both the *lpScrollRectangle* rectangle and the target rectangle. For example, if the clipping rectangle does not include a region that would have been filled by the contents of *lpFill*, the original contents of the region are left unchanged.
     * 
     * If the scroll or target regions extend beyond the dimensions of the console screen buffer, they are clipped. For example, if *lpScrollRectangle* is the region contained by (0,0) and (19,19) and *dwDestinationOrigin* is (10,15), the target rectangle is the region contained by (10,15) and (29,34). However, if the console screen buffer is 50 characters wide and 30 characters high, the target rectangle is clipped to (10,15) and (29,29). Changes to the console screen buffer are also clipped according to *lpClipRectangle*, if the parameter specifies a [**SMALL\_RECT**](small-rect-str.md) structure. If the clipping rectangle is specified as (0,0) and (49,19), only the changes that occur in that region of the console screen buffer are made.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * > [!TIP]
     * > This API is not recommended and does not have a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent. Use can be approximated with **[scroll margins](console-virtual-terminal-sequences.md#scrolling-margins)** to fix an area of the screen, **[cursor positioning](console-virtual-terminal-sequences.md#cursor-positioning)** to set the active position outside the region, and newlines to force text to move. The remaining space can be filled by moving the cursor, **[setting graphical attributes](console-virtual-terminal-sequences.md#text-formatting)**, and writing normal text.
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<SMALL_RECT>} lpScrollRectangle A pointer to a [**SMALL\_RECT**](small-rect-str.md) structure whose members specify the upper-left and lower-right coordinates of the console screen buffer rectangle to be moved.
     * @param {Pointer<SMALL_RECT>} lpClipRectangle A pointer to a [**SMALL\_RECT**](small-rect-str.md) structure whose members specify the upper-left and lower-right coordinates of the console screen buffer rectangle that is affected by the scrolling. This pointer can be **NULL**.
     * @param {Pointer} dwDestinationOrigin A [**COORD**](coord-str.md) structure that specifies the upper-left corner of the new location of the *lpScrollRectangle* contents, in characters.
     * @param {Pointer<CHAR_INFO>} lpFill A pointer to a [**CHAR\_INFO**](char-info-str.md) structure that specifies the character and color attributes to be used in filling the cells within the intersection of *lpScrollRectangle* and *lpClipRectangle* that were left empty as a result of the move.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/scrollconsolescreenbuffer
     */
    static ScrollConsoleScreenBufferA(hConsoleOutput, lpScrollRectangle, lpClipRectangle, dwDestinationOrigin, lpFill) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ScrollConsoleScreenBufferA", "ptr", hConsoleOutput, "ptr", lpScrollRectangle, "ptr", lpClipRectangle, "ptr", dwDestinationOrigin, "ptr", lpFill, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the ScrollConsoleScreenBuffer function, which moves a block of data in a screen buffer.
     * @remarks
     * **ScrollConsoleScreenBuffer** copies the contents of a rectangular region of a screen buffer, specified by the *lpScrollRectangle* parameter, to another area of the console screen buffer. The target rectangle has the same dimensions as the *lpScrollRectangle* rectangle with its upper-left corner at the coordinates specified by the *dwDestinationOrigin* parameter. Those parts of *lpScrollRectangle* that do not overlap with the target rectangle are filled in with the character and color attributes specified by the *lpFill* parameter.
     * 
     * The clipping rectangle applies to changes made in both the *lpScrollRectangle* rectangle and the target rectangle. For example, if the clipping rectangle does not include a region that would have been filled by the contents of *lpFill*, the original contents of the region are left unchanged.
     * 
     * If the scroll or target regions extend beyond the dimensions of the console screen buffer, they are clipped. For example, if *lpScrollRectangle* is the region contained by (0,0) and (19,19) and *dwDestinationOrigin* is (10,15), the target rectangle is the region contained by (10,15) and (29,34). However, if the console screen buffer is 50 characters wide and 30 characters high, the target rectangle is clipped to (10,15) and (29,29). Changes to the console screen buffer are also clipped according to *lpClipRectangle*, if the parameter specifies a [**SMALL\_RECT**](small-rect-str.md) structure. If the clipping rectangle is specified as (0,0) and (49,19), only the changes that occur in that region of the console screen buffer are made.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * > [!TIP]
     * > This API is not recommended and does not have a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent. Use can be approximated with **[scroll margins](console-virtual-terminal-sequences.md#scrolling-margins)** to fix an area of the screen, **[cursor positioning](console-virtual-terminal-sequences.md#cursor-positioning)** to set the active position outside the region, and newlines to force text to move. The remaining space can be filled by moving the cursor, **[setting graphical attributes](console-virtual-terminal-sequences.md#text-formatting)**, and writing normal text.
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<SMALL_RECT>} lpScrollRectangle A pointer to a [**SMALL\_RECT**](small-rect-str.md) structure whose members specify the upper-left and lower-right coordinates of the console screen buffer rectangle to be moved.
     * @param {Pointer<SMALL_RECT>} lpClipRectangle A pointer to a [**SMALL\_RECT**](small-rect-str.md) structure whose members specify the upper-left and lower-right coordinates of the console screen buffer rectangle that is affected by the scrolling. This pointer can be **NULL**.
     * @param {Pointer} dwDestinationOrigin A [**COORD**](coord-str.md) structure that specifies the upper-left corner of the new location of the *lpScrollRectangle* contents, in characters.
     * @param {Pointer<CHAR_INFO>} lpFill A pointer to a [**CHAR\_INFO**](char-info-str.md) structure that specifies the character and color attributes to be used in filling the cells within the intersection of *lpScrollRectangle* and *lpClipRectangle* that were left empty as a result of the move.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/scrollconsolescreenbuffer
     */
    static ScrollConsoleScreenBufferW(hConsoleOutput, lpScrollRectangle, lpClipRectangle, dwDestinationOrigin, lpFill) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ScrollConsoleScreenBufferW", "ptr", hConsoleOutput, "ptr", lpScrollRectangle, "ptr", lpClipRectangle, "ptr", dwDestinationOrigin, "ptr", lpFill, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes character and color attribute data to a specified rectangular block of character cells in a console screen buffer.
     * @remarks
     * **WriteConsoleOutput** treats the source buffer and the destination screen buffer as two-dimensional arrays (columns and rows of character cells). The rectangle pointed to by the *lpWriteRegion* parameter specifies the size and location of the block to be written to in the console screen buffer. A rectangle of the same size is located with its upper-left cell at the coordinates of the *dwBufferCoord* parameter in the *lpBuffer* array. Data from the cells that are in the intersection of this rectangle and the source buffer rectangle (whose dimensions are specified by the *dwBufferSize* parameter) is written to the destination rectangle.
     * 
     * Cells in the destination rectangle whose corresponding source location are outside the boundaries of the source buffer rectangle are left unaffected by the write operation. In other words, these are the cells for which no data is available to be written.
     * 
     * Before **WriteConsoleOutput** returns, it sets the members of *lpWriteRegion* to the actual screen buffer rectangle affected by the write operation. This rectangle reflects the cells in the destination rectangle for which there existed a corresponding cell in the source buffer, because **WriteConsoleOutput** clips the dimensions of the destination rectangle to the boundaries of the console screen buffer.
     * 
     * If the rectangle specified by *lpWriteRegion* lies completely outside the boundaries of the console screen buffer, or if the corresponding rectangle is positioned completely outside the boundaries of the source buffer, no data is written. In this case, the function returns with the members of the structure pointed to by the *lpWriteRegion* parameter set such that the **Right** member is less than the **Left**, or the **Bottom** member is less than the **Top**. To determine the size of the console screen buffer, use the [**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md) function.
     * 
     * **WriteConsoleOutput** has no effect on the cursor position.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * > [!TIP]
     * > This API has a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent in the **[text formatting](console-virtual-terminal-sequences.md#text-formatting)** and **[cursor positioning](console-virtual-terminal-sequences.md#cursor-positioning)** sequences. Move the cursor to the location to insert, apply the formatting desired, and write out the text. _Virtual terminal sequences_ are recommended for all new and ongoing development.
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_WRITE** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<CHAR_INFO>} lpBuffer The data to be written to the console screen buffer. This pointer is treated as the origin of a two-dimensional array of [**CHAR\_INFO**](char-info-str.md) structures whose size is specified by the *dwBufferSize* parameter.
     * @param {Pointer} dwBufferSize The size of the buffer pointed to by the *lpBuffer* parameter, in character cells. The **X** member of the [**COORD**](coord-str.md) structure is the number of columns; the **Y** member is the number of rows.
     * @param {Pointer} dwBufferCoord The coordinates of the upper-left cell in the buffer pointed to by the *lpBuffer* parameter. The **X** member of the [**COORD**](coord-str.md) structure is the column, and the **Y** member is the row.
     * @param {Pointer<SMALL_RECT>} lpWriteRegion A pointer to a [**SMALL\_RECT**](small-rect-str.md) structure. On input, the structure members specify the upper-left and lower-right coordinates of the console screen buffer rectangle to write to. On output, the structure members specify the actual rectangle that was used.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/writeconsoleoutput
     */
    static WriteConsoleOutputA(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpWriteRegion) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleOutputA", "ptr", hConsoleOutput, "ptr", lpBuffer, "ptr", dwBufferSize, "ptr", dwBufferCoord, "ptr", lpWriteRegion, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes character and color attribute data to a specified rectangular block of character cells in a console screen buffer.
     * @remarks
     * **WriteConsoleOutput** treats the source buffer and the destination screen buffer as two-dimensional arrays (columns and rows of character cells). The rectangle pointed to by the *lpWriteRegion* parameter specifies the size and location of the block to be written to in the console screen buffer. A rectangle of the same size is located with its upper-left cell at the coordinates of the *dwBufferCoord* parameter in the *lpBuffer* array. Data from the cells that are in the intersection of this rectangle and the source buffer rectangle (whose dimensions are specified by the *dwBufferSize* parameter) is written to the destination rectangle.
     * 
     * Cells in the destination rectangle whose corresponding source location are outside the boundaries of the source buffer rectangle are left unaffected by the write operation. In other words, these are the cells for which no data is available to be written.
     * 
     * Before **WriteConsoleOutput** returns, it sets the members of *lpWriteRegion* to the actual screen buffer rectangle affected by the write operation. This rectangle reflects the cells in the destination rectangle for which there existed a corresponding cell in the source buffer, because **WriteConsoleOutput** clips the dimensions of the destination rectangle to the boundaries of the console screen buffer.
     * 
     * If the rectangle specified by *lpWriteRegion* lies completely outside the boundaries of the console screen buffer, or if the corresponding rectangle is positioned completely outside the boundaries of the source buffer, no data is written. In this case, the function returns with the members of the structure pointed to by the *lpWriteRegion* parameter set such that the **Right** member is less than the **Left**, or the **Bottom** member is less than the **Top**. To determine the size of the console screen buffer, use the [**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md) function.
     * 
     * **WriteConsoleOutput** has no effect on the cursor position.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * > [!TIP]
     * > This API has a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent in the **[text formatting](console-virtual-terminal-sequences.md#text-formatting)** and **[cursor positioning](console-virtual-terminal-sequences.md#cursor-positioning)** sequences. Move the cursor to the location to insert, apply the formatting desired, and write out the text. _Virtual terminal sequences_ are recommended for all new and ongoing development.
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_WRITE** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<CHAR_INFO>} lpBuffer The data to be written to the console screen buffer. This pointer is treated as the origin of a two-dimensional array of [**CHAR\_INFO**](char-info-str.md) structures whose size is specified by the *dwBufferSize* parameter.
     * @param {Pointer} dwBufferSize The size of the buffer pointed to by the *lpBuffer* parameter, in character cells. The **X** member of the [**COORD**](coord-str.md) structure is the number of columns; the **Y** member is the number of rows.
     * @param {Pointer} dwBufferCoord The coordinates of the upper-left cell in the buffer pointed to by the *lpBuffer* parameter. The **X** member of the [**COORD**](coord-str.md) structure is the column, and the **Y** member is the row.
     * @param {Pointer<SMALL_RECT>} lpWriteRegion A pointer to a [**SMALL\_RECT**](small-rect-str.md) structure. On input, the structure members specify the upper-left and lower-right coordinates of the console screen buffer rectangle to write to. On output, the structure members specify the actual rectangle that was used.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/writeconsoleoutput
     */
    static WriteConsoleOutputW(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpWriteRegion) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteConsoleOutputW", "ptr", hConsoleOutput, "ptr", lpBuffer, "ptr", dwBufferSize, "ptr", dwBufferCoord, "ptr", lpWriteRegion, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads character and color attribute data from a rectangular block of character cells in a console screen buffer and writes data in the destination buffer.
     * @remarks
     * **ReadConsoleOutput** treats the console screen buffer and the destination buffer as two-dimensional arrays (columns and rows of character cells). The rectangle pointed to by the *lpReadRegion* parameter specifies the size and location of the block to be read from the console screen buffer. A destination rectangle of the same size is located with its upper-left cell at the coordinates of the *dwBufferCoord* parameter in the *lpBuffer* array. Data read from the cells in the console screen buffer source rectangle is copied to the corresponding cells in the destination buffer. If the corresponding cell is outside the boundaries of the destination buffer rectangle (whose dimensions are specified by the *dwBufferSize* parameter), the data is not copied.
     * 
     * Cells in the destination buffer corresponding to coordinates that are not within the boundaries of the console screen buffer are left unchanged. In other words, these are the cells for which no screen buffer data is available to be read.
     * 
     * Before **ReadConsoleOutput** returns, it sets the members of the structure pointed to by the *lpReadRegion* parameter to the actual screen buffer rectangle whose cells were copied into the destination buffer. This rectangle reflects the cells in the source rectangle for which there existed a corresponding cell in the destination buffer, because **ReadConsoleOutput** clips the dimensions of the source rectangle to fit the boundaries of the console screen buffer.
     * 
     * If the rectangle specified by *lpReadRegion* lies completely outside the boundaries of the console screen buffer, or if the corresponding rectangle is positioned completely outside the boundaries of the destination buffer, no data is copied. In this case, the function returns with the members of the structure pointed to by the *lpReadRegion* parameter set such that the **Right** member is less than the **Left**, or the **Bottom** member is less than the **Top**. To determine the size of the console screen buffer, use the [**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md) function.
     * 
     * The **ReadConsoleOutput** function has no effect on the console screen buffer's cursor position. The contents of the console screen buffer are not changed by the function.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * [!INCLUDE [no-vt-equiv-banner](./includes/no-vt-equiv-banner.md)]
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<CHAR_INFO>} lpBuffer A pointer to a destination buffer that receives the data read from the console screen buffer. This pointer is treated as the origin of a two-dimensional array of [**CHAR\_INFO**](char-info-str.md) structures whose size is specified by the *dwBufferSize* parameter.
     * @param {Pointer} dwBufferSize The size of the *lpBuffer* parameter, in character cells. The **X** member of the [**COORD**](coord-str.md) structure is the number of columns; the **Y** member is the number of rows.
     * @param {Pointer} dwBufferCoord The coordinates of the upper-left cell in the *lpBuffer* parameter that receives the data read from the console screen buffer. The **X** member of the [**COORD**](coord-str.md) structure is the column, and the **Y** member is the row.
     * @param {Pointer<SMALL_RECT>} lpReadRegion A pointer to a [**SMALL\_RECT**](small-rect-str.md) structure. On input, the structure members specify the upper-left and lower-right coordinates of the console screen buffer rectangle from which the function is to read. On output, the structure members specify the actual rectangle that was used.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/readconsoleoutput
     */
    static ReadConsoleOutputA(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpReadRegion) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleOutputA", "ptr", hConsoleOutput, "ptr", lpBuffer, "ptr", dwBufferSize, "ptr", dwBufferCoord, "ptr", lpReadRegion, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads character and color attribute data from a rectangular block of character cells in a console screen buffer and writes data in the destination buffer.
     * @remarks
     * **ReadConsoleOutput** treats the console screen buffer and the destination buffer as two-dimensional arrays (columns and rows of character cells). The rectangle pointed to by the *lpReadRegion* parameter specifies the size and location of the block to be read from the console screen buffer. A destination rectangle of the same size is located with its upper-left cell at the coordinates of the *dwBufferCoord* parameter in the *lpBuffer* array. Data read from the cells in the console screen buffer source rectangle is copied to the corresponding cells in the destination buffer. If the corresponding cell is outside the boundaries of the destination buffer rectangle (whose dimensions are specified by the *dwBufferSize* parameter), the data is not copied.
     * 
     * Cells in the destination buffer corresponding to coordinates that are not within the boundaries of the console screen buffer are left unchanged. In other words, these are the cells for which no screen buffer data is available to be read.
     * 
     * Before **ReadConsoleOutput** returns, it sets the members of the structure pointed to by the *lpReadRegion* parameter to the actual screen buffer rectangle whose cells were copied into the destination buffer. This rectangle reflects the cells in the source rectangle for which there existed a corresponding cell in the destination buffer, because **ReadConsoleOutput** clips the dimensions of the source rectangle to fit the boundaries of the console screen buffer.
     * 
     * If the rectangle specified by *lpReadRegion* lies completely outside the boundaries of the console screen buffer, or if the corresponding rectangle is positioned completely outside the boundaries of the destination buffer, no data is copied. In this case, the function returns with the members of the structure pointed to by the *lpReadRegion* parameter set such that the **Right** member is less than the **Left**, or the **Bottom** member is less than the **Top**. To determine the size of the console screen buffer, use the [**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md) function.
     * 
     * The **ReadConsoleOutput** function has no effect on the console screen buffer's cursor position. The contents of the console screen buffer are not changed by the function.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * [!INCLUDE [no-vt-equiv-banner](./includes/no-vt-equiv-banner.md)]
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Pointer<CHAR_INFO>} lpBuffer A pointer to a destination buffer that receives the data read from the console screen buffer. This pointer is treated as the origin of a two-dimensional array of [**CHAR\_INFO**](char-info-str.md) structures whose size is specified by the *dwBufferSize* parameter.
     * @param {Pointer} dwBufferSize The size of the *lpBuffer* parameter, in character cells. The **X** member of the [**COORD**](coord-str.md) structure is the number of columns; the **Y** member is the number of rows.
     * @param {Pointer} dwBufferCoord The coordinates of the upper-left cell in the *lpBuffer* parameter that receives the data read from the console screen buffer. The **X** member of the [**COORD**](coord-str.md) structure is the column, and the **Y** member is the row.
     * @param {Pointer<SMALL_RECT>} lpReadRegion A pointer to a [**SMALL\_RECT**](small-rect-str.md) structure. On input, the structure members specify the upper-left and lower-right coordinates of the console screen buffer rectangle from which the function is to read. On output, the structure members specify the actual rectangle that was used.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/readconsoleoutput
     */
    static ReadConsoleOutputW(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpReadRegion) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadConsoleOutputW", "ptr", hConsoleOutput, "ptr", lpBuffer, "ptr", dwBufferSize, "ptr", dwBufferCoord, "ptr", lpReadRegion, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the title and size of the title for the current console window.
     * @remarks
     * To set the title for a console window, use the [**SetConsoleTitle**](setconsoletitle.md) function. To retrieve the original title string, use the [**GetConsoleOriginalTitle**](getconsoleoriginaltitle.md) function.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * > [!TIP]
     * > This API is not recommended and does not have a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent. This decision intentionally aligns the Windows platform with other operating systems. Applications remoting via cross-platform utilities and transports like SSH may not work as expected if using this API.
     * @param {Pointer<PSTR>} lpConsoleTitle A pointer to a buffer that receives a null-terminated string containing the title. If the buffer is too small to store the title, the function stores as many characters of the title as will fit in the buffer, ending with a null terminator.
     * @param {Integer} nSize The size of the buffer pointed to by the *lpConsoleTitle* parameter, in characters.
     * @returns {Integer} If the function succeeds, the return value is the length of the console window's title, in characters.
     * 
     * If the function fails, the return value is zero and [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns the error code.
     * @see https://learn.microsoft.com/windows/console/getconsoletitle
     */
    static GetConsoleTitleA(lpConsoleTitle, nSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleTitleA", "ptr", lpConsoleTitle, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the title and size of the title for the current console window.
     * @remarks
     * To set the title for a console window, use the [**SetConsoleTitle**](setconsoletitle.md) function. To retrieve the original title string, use the [**GetConsoleOriginalTitle**](getconsoleoriginaltitle.md) function.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * > [!TIP]
     * > This API is not recommended and does not have a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent. This decision intentionally aligns the Windows platform with other operating systems. Applications remoting via cross-platform utilities and transports like SSH may not work as expected if using this API.
     * @param {Pointer<PWSTR>} lpConsoleTitle A pointer to a buffer that receives a null-terminated string containing the title. If the buffer is too small to store the title, the function stores as many characters of the title as will fit in the buffer, ending with a null terminator.
     * @param {Integer} nSize The size of the buffer pointed to by the *lpConsoleTitle* parameter, in characters.
     * @returns {Integer} If the function succeeds, the return value is the length of the console window's title, in characters.
     * 
     * If the function fails, the return value is zero and [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns the error code.
     * @see https://learn.microsoft.com/windows/console/getconsoletitle
     */
    static GetConsoleTitleW(lpConsoleTitle, nSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleTitleW", "ptr", lpConsoleTitle, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the GetConsoleOriginalTitle function, which retrieves the original title for the current console window.
     * @remarks
     * To set the title for a console window, use the [**SetConsoleTitle**](setconsoletitle.md) function. To retrieve the current title string, use the [**GetConsoleTitle**](getconsoletitle.md) function.
     * 
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0600 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * > [!TIP]
     * > This API is not recommended and does not have a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent. This decision intentionally aligns the Windows platform with other operating systems. Applications remoting via cross-platform utilities and transports like SSH may not work as expected if using this API.
     * @param {Pointer<PSTR>} lpConsoleTitle A pointer to a buffer that receives a null-terminated string containing the original title.
     * @param {Integer} nSize The size of the *lpConsoleTitle* buffer, in characters.
     * @returns {Integer} If *nSize* is zero, the return value is zero.
     * 
     * If the function succeeds, the return value is the length of the original console title, in characters.
     * 
     * If the function fails, the return value is zero and [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns the error code.
     * @see https://learn.microsoft.com/windows/console/getconsoleoriginaltitle
     */
    static GetConsoleOriginalTitleA(lpConsoleTitle, nSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleOriginalTitleA", "ptr", lpConsoleTitle, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the GetConsoleOriginalTitle function, which retrieves the original title for the current console window.
     * @remarks
     * To set the title for a console window, use the [**SetConsoleTitle**](setconsoletitle.md) function. To retrieve the current title string, use the [**GetConsoleTitle**](getconsoletitle.md) function.
     * 
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0600 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * > [!TIP]
     * > This API is not recommended and does not have a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent. This decision intentionally aligns the Windows platform with other operating systems. Applications remoting via cross-platform utilities and transports like SSH may not work as expected if using this API.
     * @param {Pointer<PWSTR>} lpConsoleTitle A pointer to a buffer that receives a null-terminated string containing the original title.
     * @param {Integer} nSize The size of the *lpConsoleTitle* buffer, in characters.
     * @returns {Integer} If *nSize* is zero, the return value is zero.
     * 
     * If the function succeeds, the return value is the length of the original console title, in characters.
     * 
     * If the function fails, the return value is zero and [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns the error code.
     * @see https://learn.microsoft.com/windows/console/getconsoleoriginaltitle
     */
    static GetConsoleOriginalTitleW(lpConsoleTitle, nSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleOriginalTitleW", "ptr", lpConsoleTitle, "uint", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the SetConsoleTitle function, which sets the title for the current console window.
     * @remarks
     * When the process terminates, the system restores the original console title.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * > [!TIP]
     * > This API has a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent in the **[window title](console-virtual-terminal-sequences.md#window-title)** sequences. _Virtual terminal sequences_ are recommended for all new and ongoing development.
     * @param {Pointer<PSTR>} lpConsoleTitle The string to be displayed in the title bar of the console window. The total size must be less than 64K.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setconsoletitle
     */
    static SetConsoleTitleA(lpConsoleTitle) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleTitleA", "ptr", lpConsoleTitle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the SetConsoleTitle function, which sets the title for the current console window.
     * @remarks
     * When the process terminates, the system restores the original console title.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * 
     * > [!TIP]
     * > This API has a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent in the **[window title](console-virtual-terminal-sequences.md#window-title)** sequences. _Virtual terminal sequences_ are recommended for all new and ongoing development.
     * @param {Pointer<PWSTR>} lpConsoleTitle The string to be displayed in the title bar of the console window. The total size must be less than 64K.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setconsoletitle
     */
    static SetConsoleTitleW(lpConsoleTitle) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleTitleW", "ptr", lpConsoleTitle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the number of buttons on the mouse used by the current console.
     * @remarks
     * When a console receives mouse input, an [**INPUT\_RECORD**](input-record-str.md) structure containing a [**MOUSE\_EVENT\_RECORD**](mouse-event-record-str.md) structure is placed in the console's input buffer. The **dwButtonState** member of **MOUSE\_EVENT\_RECORD** has a bit indicating the state of each mouse button. The bit is 1 if the button is down and 0 if the button is up. To determine the number of bits that are significant, use **GetNumberOfConsoleMouseButtons**.
     * 
     * > [!TIP]
     * > This API is not recommended and does not have a **[virtual terminal](console-virtual-terminal-sequences.md)** equivalent. This decision intentionally aligns the Windows platform with other operating systems. This state is only relevant to the local user, session, and privilege context. Applications remoting via cross-platform utilities and transports like SSH may not work as expected if using this API.
     * @param {Pointer<UInt32>} lpNumberOfMouseButtons A pointer to a variable that receives the number of mouse buttons.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/getnumberofconsolemousebuttons
     */
    static GetNumberOfConsoleMouseButtons(lpNumberOfMouseButtons) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNumberOfConsoleMouseButtons", "ptr", lpNumberOfMouseButtons, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the size of the font used by the specified console screen buffer.
     * @remarks
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0500 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Integer} nFont The index of the font whose size is to be retrieved. This index is obtained by calling the [**GetCurrentConsoleFont**](getcurrentconsolefont.md) function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/console/getconsolefontsize
     */
    static GetConsoleFontSize(hConsoleOutput, nFont) {
        A_LastError := 0

        DllCall("KERNEL32.dll\GetConsoleFontSize", "ptr", hConsoleOutput, "uint", nFont)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Retrieves information about the current console font for a specified console screen buffer.
     * @remarks
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0500 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Integer} bMaximumWindow If this parameter is **TRUE**, font information is retrieved for the maximum window size. If this parameter is **FALSE**, font information is retrieved for the current window size.
     * @param {Pointer<CONSOLE_FONT_INFO>} lpConsoleCurrentFont A pointer to a [**CONSOLE\_FONT\_INFO**](console-font-info-str.md) structure that receives the requested font information.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/getcurrentconsolefont
     */
    static GetCurrentConsoleFont(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFont) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCurrentConsoleFont", "ptr", hConsoleOutput, "int", bMaximumWindow, "ptr", lpConsoleCurrentFont, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the GetCurrentConsoleFontEx function, which retrieves extended information about the currently used console font.
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_READ** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Integer} bMaximumWindow If this parameter is **TRUE**, font information is retrieved for the maximum window size. If this parameter is **FALSE**, font information is retrieved for the current window size.
     * @param {Pointer<CONSOLE_FONT_INFOEX>} lpConsoleCurrentFontEx A pointer to a [**CONSOLE\_FONT\_INFOEX**](console-font-infoex.md) structure that receives the requested font information.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * 
     * [!INCLUDE [no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]
     * @see https://learn.microsoft.com/windows/console/getcurrentconsolefontex
     */
    static GetCurrentConsoleFontEx(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFontEx) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCurrentConsoleFontEx", "ptr", hConsoleOutput, "int", bMaximumWindow, "ptr", lpConsoleCurrentFontEx, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the SetCurrentConsoleFontEx function, which sets extended information about the current console font.
     * @remarks
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0500 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer. The handle must have the **GENERIC\_WRITE** access right. For more information, see [Console Buffer Security and Access Rights](console-buffer-security-and-access-rights.md).
     * @param {Integer} bMaximumWindow If this parameter is **TRUE**, font information is set for the maximum window size. If this parameter is **FALSE**, font information is set for the current window size.
     * @param {Pointer<CONSOLE_FONT_INFOEX>} lpConsoleCurrentFontEx A pointer to a [**CONSOLE\_FONT\_INFOEX**](console-font-infoex.md) structure that contains the font information.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setcurrentconsolefontex
     */
    static SetCurrentConsoleFontEx(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFontEx) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetCurrentConsoleFontEx", "ptr", hConsoleOutput, "int", bMaximumWindow, "ptr", lpConsoleCurrentFontEx, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the GetConsoleSelectionInfo function, which retrieves information about the current console selection.
     * @remarks
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0500 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]
     * @param {Pointer<CONSOLE_SELECTION_INFO>} lpConsoleSelectionInfo A pointer to a [**CONSOLE\_SELECTION\_INFO**](console-selection-info-str.md) structure that receives the selection information.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/getconsoleselectioninfo
     */
    static GetConsoleSelectionInfo(lpConsoleSelectionInfo) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleSelectionInfo", "ptr", lpConsoleSelectionInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the GetConsoleHistoryInfo function, which retrieves the history settings for the console of the calling process.
     * @remarks
     * If the calling process is not a console process, the function fails and sets the last error to **ERROR\_ACCESS\_DENIED**.
     * 
     * [!INCLUDE [no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]
     * @param {Pointer<CONSOLE_HISTORY_INFO>} lpConsoleHistoryInfo A pointer to a [**CONSOLE\_HISTORY\_INFO**](console-history-info.md) structure that receives the history settings for the calling process's console.
     * @returns {Integer} If the function succeeds the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/getconsolehistoryinfo
     */
    static GetConsoleHistoryInfo(lpConsoleHistoryInfo) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleHistoryInfo", "ptr", lpConsoleHistoryInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the history settings for the Windows Console of the calling process.
     * @remarks
     * If the calling process is not a console process, the function fails and sets the last error code to **ERROR\_ACCESS\_DENIED**.
     * 
     * [!INCLUDE [no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]
     * @param {Pointer<CONSOLE_HISTORY_INFO>} lpConsoleHistoryInfo A pointer to a [**CONSOLE\_HISTORY\_INFO**](console-history-info.md) structure that contains the history settings for the process's console.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setconsolehistoryinfo
     */
    static SetConsoleHistoryInfo(lpConsoleHistoryInfo) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleHistoryInfo", "ptr", lpConsoleHistoryInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the GetConsoleDisplayMode function, which retrieves the display mode of the current console.
     * @remarks
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0500 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]
     * @param {Pointer<UInt32>} lpModeFlags The display mode of the console. This parameter can be one or more of the following values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | **CONSOLE_FULLSCREEN** 1 | Full-screen console. The console is in this mode as soon as the window is maximized. At this point, the transition to full-screen mode can still fail. |
     * | **CONSOLE_FULLSCREEN_HARDWARE** 2 | Full-screen console communicating directly with the video hardware. This mode is set after the console is in **CONSOLE_FULLSCREEN** mode to indicate that the transition to full-screen mode has completed. |
     * 
     * > [!NOTE]
     * > The transition to a 100% full screen video hardware mode was removed in Windows Vista with the replatforming of the graphics stack to [WDDM](/windows-hardware/drivers/display/introduction-to-the-windows-vista-and-later-display-driver-model). On later versions of Windows, the maximum resulting state is **CONSOLE_FULLSCREEN** representing a frameless window that appears full screen but isn't in exclusive control of the hardware.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/getconsoledisplaymode
     */
    static GetConsoleDisplayMode(lpModeFlags) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleDisplayMode", "ptr", lpModeFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the SetConsoleDisplayMode function, which sets the display mode of the specified console screen buffer.
     * @remarks
     * [!INCLUDE [no-vt-equiv-user-priv](./includes/no-vt-equiv-user-priv.md)]
     * @param {Pointer<HANDLE>} hConsoleOutput A handle to the console screen buffer.
     * @param {Integer} dwFlags The display mode of the console. This parameter can be one or more of the following values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | **CONSOLE_FULLSCREEN_MODE** 1 | Text is displayed in full-screen mode. |
     * | **CONSOLE_WINDOWED_MODE** 2 | Text is displayed in a console window. |
     * @param {Pointer<COORD>} lpNewScreenBufferDimensions A pointer to a [**COORD**](coord-str.md) structure that receives the new dimensions of the screen buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setconsoledisplaymode
     */
    static SetConsoleDisplayMode(hConsoleOutput, dwFlags, lpNewScreenBufferDimensions) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetConsoleDisplayMode", "ptr", hConsoleOutput, "uint", dwFlags, "ptr", lpNewScreenBufferDimensions, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the window handle used by the console associated with the calling process.
     * @remarks
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0500 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * 
     * [!INCLUDE [no-vt-equiv-local-context](./includes/no-vt-equiv-local-context.md)]
     * 
     * For an application that is hosted inside a [**pseudoconsole**](pseudoconsoles.md) session, this function returns a window handle for message queue purposes only. The associated window is not displayed locally as the _pseudoconsole_ is serializing all actions to a stream for presentation on another terminal window elsewhere.
     * @returns {Pointer<HWND>} This function has no parameters.
     * 
     * 
     * The return value is a handle to the window used by the console associated with the calling process or **NULL** if there is no such associated console.
     * @see https://learn.microsoft.com/windows/console/getconsolewindow
     */
    static GetConsoleWindow() {
        result := DllCall("KERNEL32.dll\GetConsoleWindow", "ptr")
        return result
    }

    /**
     * See reference information about the AddConsoleAlias function, which defines a console alias for the specified executable.
     * @remarks
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0501 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]
     * @param {Pointer<PSTR>} Source The console alias to be mapped to the text specified by *Target*.
     * @param {Pointer<PSTR>} Target The text to be substituted for *Source*. If this parameter is **NULL**, then the console alias is removed.
     * @param {Pointer<PSTR>} ExeName The name of the executable file for which the console alias is to be defined.
     * @returns {Integer} If the function succeeds, the return value is **TRUE**.
     * 
     * If the function fails, the return value is **FALSE**. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/addconsolealias
     */
    static AddConsoleAliasA(Source, Target, ExeName) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\AddConsoleAliasA", "ptr", Source, "ptr", Target, "ptr", ExeName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * See reference information about the AddConsoleAlias function, which defines a console alias for the specified executable.
     * @remarks
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0501 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]
     * @param {Pointer<PWSTR>} Source The console alias to be mapped to the text specified by *Target*.
     * @param {Pointer<PWSTR>} Target The text to be substituted for *Source*. If this parameter is **NULL**, then the console alias is removed.
     * @param {Pointer<PWSTR>} ExeName The name of the executable file for which the console alias is to be defined.
     * @returns {Integer} If the function succeeds, the return value is **TRUE**.
     * 
     * If the function fails, the return value is **FALSE**. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/addconsolealias
     */
    static AddConsoleAliasW(Source, Target, ExeName) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\AddConsoleAliasW", "ptr", Source, "ptr", Target, "ptr", ExeName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the text for the specified console alias and the name of the executable.
     * @remarks
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0501 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]
     * @param {Pointer<PSTR>} Source 
     * @param {Pointer<PSTR>} TargetBuffer 
     * @param {Integer} TargetBufferLength The size of the buffer pointed to by *lpTargetBuffer*, in bytes.
     * @param {Pointer<PSTR>} ExeName 
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/getconsolealias
     */
    static GetConsoleAliasA(Source, TargetBuffer, TargetBufferLength, ExeName) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasA", "ptr", Source, "ptr", TargetBuffer, "uint", TargetBufferLength, "ptr", ExeName, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the text for the specified console alias and the name of the executable.
     * @remarks
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0501 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]
     * @param {Pointer<PWSTR>} Source 
     * @param {Pointer<PWSTR>} TargetBuffer 
     * @param {Integer} TargetBufferLength The size of the buffer pointed to by *lpTargetBuffer*, in bytes.
     * @param {Pointer<PWSTR>} ExeName 
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/getconsolealias
     */
    static GetConsoleAliasW(Source, TargetBuffer, TargetBufferLength, ExeName) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasW", "ptr", Source, "ptr", TargetBuffer, "uint", TargetBufferLength, "ptr", ExeName, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the required size for the buffer used by the GetConsoleAliases function.
     * @remarks
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0501 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]
     * @param {Pointer<PSTR>} ExeName 
     * @returns {Integer} The size of the buffer required to store all console aliases defined for this executable file, in bytes.
     * @see https://learn.microsoft.com/windows/console/getconsolealiaseslength
     */
    static GetConsoleAliasesLengthA(ExeName) {
        result := DllCall("KERNEL32.dll\GetConsoleAliasesLengthA", "ptr", ExeName, "uint")
        return result
    }

    /**
     * Retrieves the required size for the buffer used by the GetConsoleAliases function.
     * @remarks
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0501 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]
     * @param {Pointer<PWSTR>} ExeName 
     * @returns {Integer} The size of the buffer required to store all console aliases defined for this executable file, in bytes.
     * @see https://learn.microsoft.com/windows/console/getconsolealiaseslength
     */
    static GetConsoleAliasesLengthW(ExeName) {
        result := DllCall("KERNEL32.dll\GetConsoleAliasesLengthW", "ptr", ExeName, "uint")
        return result
    }

    /**
     * Retrieves the required size for the buffer used by the GetConsoleAliasExes function.
     * @remarks
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0501 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]
     * @returns {Integer} This function has no parameters.
     * 
     * 
     * The size of the buffer required to store the names of all executable files that have console aliases defined, in bytes.
     * @see https://learn.microsoft.com/windows/console/getconsolealiasexeslength
     */
    static GetConsoleAliasExesLengthA() {
        result := DllCall("KERNEL32.dll\GetConsoleAliasExesLengthA", "uint")
        return result
    }

    /**
     * Retrieves the required size for the buffer used by the GetConsoleAliasExes function.
     * @remarks
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0501 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]
     * @returns {Integer} This function has no parameters.
     * 
     * 
     * The size of the buffer required to store the names of all executable files that have console aliases defined, in bytes.
     * @see https://learn.microsoft.com/windows/console/getconsolealiasexeslength
     */
    static GetConsoleAliasExesLengthW() {
        result := DllCall("KERNEL32.dll\GetConsoleAliasExesLengthW", "uint")
        return result
    }

    /**
     * Retrieves all of the defined console aliases for the specified executable.
     * @remarks
     * To determine the required size for the *lpExeName* buffer, use the [**GetConsoleAliasesLength**](getconsolealiaseslength.md) function.
     * 
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0501 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]
     * @param {Pointer<PSTR>} AliasBuffer 
     * @param {Integer} AliasBufferLength The size of the buffer pointed to by *lpAliasBuffer*, in bytes.
     * @param {Pointer<PSTR>} ExeName 
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/getconsolealiases
     */
    static GetConsoleAliasesA(AliasBuffer, AliasBufferLength, ExeName) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasesA", "ptr", AliasBuffer, "uint", AliasBufferLength, "ptr", ExeName, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves all of the defined console aliases for the specified executable.
     * @remarks
     * To determine the required size for the *lpExeName* buffer, use the [**GetConsoleAliasesLength**](getconsolealiaseslength.md) function.
     * 
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0501 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]
     * @param {Pointer<PWSTR>} AliasBuffer 
     * @param {Integer} AliasBufferLength The size of the buffer pointed to by *lpAliasBuffer*, in bytes.
     * @param {Pointer<PWSTR>} ExeName 
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/getconsolealiases
     */
    static GetConsoleAliasesW(AliasBuffer, AliasBufferLength, ExeName) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasesW", "ptr", AliasBuffer, "uint", AliasBufferLength, "ptr", ExeName, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the names of all executable files with console aliases defined.
     * @remarks
     * To determine the required size for the *lpExeNameBuffer* buffer, use the [**GetConsoleAliasExesLength**](getconsolealiasexeslength.md) function.
     * 
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0501 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]
     * @param {Pointer<PSTR>} ExeNameBuffer 
     * @param {Integer} ExeNameBufferLength The size of the buffer pointed to by *lpExeNameBuffer*, in bytes.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/getconsolealiasexes
     */
    static GetConsoleAliasExesA(ExeNameBuffer, ExeNameBufferLength) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasExesA", "ptr", ExeNameBuffer, "uint", ExeNameBufferLength, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the names of all executable files with console aliases defined.
     * @remarks
     * To determine the required size for the *lpExeNameBuffer* buffer, use the [**GetConsoleAliasExesLength**](getconsolealiasexeslength.md) function.
     * 
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0501 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-shell-banner](./includes/no-vt-equiv-shell-banner.md)]
     * @param {Pointer<PWSTR>} ExeNameBuffer 
     * @param {Integer} ExeNameBufferLength The size of the buffer pointed to by *lpExeNameBuffer*, in bytes.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/getconsolealiasexes
     */
    static GetConsoleAliasExesW(ExeNameBuffer, ExeNameBufferLength) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleAliasExesW", "ptr", ExeNameBuffer, "uint", ExeNameBufferLength, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} ExeName 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExpungeConsoleCommandHistoryA(ExeName) {
        DllCall("KERNEL32.dll\ExpungeConsoleCommandHistoryA", "ptr", ExeName)
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ExeName 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExpungeConsoleCommandHistoryW(ExeName) {
        DllCall("KERNEL32.dll\ExpungeConsoleCommandHistoryW", "ptr", ExeName)
    }

    /**
     * 
     * @param {Integer} Number 
     * @param {Pointer<PSTR>} ExeName 
     * @returns {Integer} 
     */
    static SetConsoleNumberOfCommandsA(Number, ExeName) {
        result := DllCall("KERNEL32.dll\SetConsoleNumberOfCommandsA", "uint", Number, "ptr", ExeName, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Number 
     * @param {Pointer<PWSTR>} ExeName 
     * @returns {Integer} 
     */
    static SetConsoleNumberOfCommandsW(Number, ExeName) {
        result := DllCall("KERNEL32.dll\SetConsoleNumberOfCommandsW", "uint", Number, "ptr", ExeName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleCommandHistoryLengthA(ExeName) {
        result := DllCall("KERNEL32.dll\GetConsoleCommandHistoryLengthA", "ptr", ExeName, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleCommandHistoryLengthW(ExeName) {
        result := DllCall("KERNEL32.dll\GetConsoleCommandHistoryLengthW", "ptr", ExeName, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} Commands 
     * @param {Integer} CommandBufferLength 
     * @param {Pointer<PSTR>} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleCommandHistoryA(Commands, CommandBufferLength, ExeName) {
        result := DllCall("KERNEL32.dll\GetConsoleCommandHistoryA", "ptr", Commands, "uint", CommandBufferLength, "ptr", ExeName, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} Commands 
     * @param {Integer} CommandBufferLength 
     * @param {Pointer<PWSTR>} ExeName 
     * @returns {Integer} 
     */
    static GetConsoleCommandHistoryW(Commands, CommandBufferLength, ExeName) {
        result := DllCall("KERNEL32.dll\GetConsoleCommandHistoryW", "ptr", Commands, "uint", CommandBufferLength, "ptr", ExeName, "uint")
        return result
    }

    /**
     * See reference information about the GetConsoleProcessList function, which retrieves a list of the processes attached to the current console.
     * @remarks
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as 0x0501 or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * 
     * [!INCLUDE [no-vt-equiv-local-context](./includes/no-vt-equiv-local-context.md)]
     * @param {Pointer<UInt32>} lpdwProcessList A pointer to a buffer that receives an array of process identifiers upon success. This must be a valid buffer and cannot be `NULL`. The buffer must have space to receive at least 1 returned process id.
     * @param {Integer} dwProcessCount The maximum number of process identifiers that can be stored in the *lpdwProcessList* buffer. This must be greater than 0.
     * @returns {Integer} If the function succeeds, the return value is less than or equal to *dwProcessCount* and represents the number of process identifiers stored in the *lpdwProcessList* buffer.
     * 
     * If the buffer is too small to hold all the valid process identifiers, the return value is the required number of array elements. The function will have stored no identifiers in the buffer. In this situation, use the return value to allocate a buffer that is large enough to store the entire list and call the function again.
     * 
     * If the return value is zero, the function has failed, because every console has at least one process associated with it. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * 
     * If a `NULL` process list was provided or the process count was 0, the call will return 0 and `GetLastError` will return `ERROR_INVALID_PARAMETER`. Please provide a buffer of at least one element to call this function. Allocate a larger buffer and call again if the return code is larger than the length of the provided buffer.
     * @see https://learn.microsoft.com/windows/console/getconsoleprocesslist
     */
    static GetConsoleProcessList(lpdwProcessList, dwProcessCount) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetConsoleProcessList", "ptr", lpdwProcessList, "uint", dwProcessCount, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} Command 
     * @param {Pointer<Void>} ConsoleInformation 
     * @param {Integer} ConsoleInformationLength 
     * @returns {Integer} 
     */
    static ConsoleControl(Command, ConsoleInformation, ConsoleInformationLength) {
        result := DllCall("USER32.dll\ConsoleControl", "int", Command, "ptr", ConsoleInformation, "uint", ConsoleInformationLength, "int")
        return result
    }

    /**
     * Retrieves a handle to the specified standard device (standard input, standard output, or standard error).
     * @remarks
     * Handles returned by **GetStdHandle** can be used by applications that need to read from or write to the console. When a console is created, the standard input handle is a handle to the console's input buffer, and the standard output and standard error handles are handles of the console's active screen buffer. These handles can be used by the [**ReadFile**](/windows/win32/api/fileapi/nf-fileapi-readfile) and [**WriteFile**](/windows/win32/api/fileapi/nf-fileapi-writefile) functions, or by any of the console functions that access the console input buffer or a screen buffer (for example, the [**ReadConsoleInput**](readconsoleinput.md), [**WriteConsole**](writeconsole.md), or [**GetConsoleScreenBufferInfo**](getconsolescreenbufferinfo.md) functions).
     * 
     * The standard handles of a process may be redirected by a call to [**SetStdHandle**](setstdhandle.md), in which case **GetStdHandle** returns the redirected handle. If the standard handles have been redirected, you can specify the `CONIN$` value in a call to the [**CreateFile**](/windows/win32/api/fileapi/nf-fileapi-createfilea) function to get a handle to a console's input buffer. Similarly, you can specify the `CONOUT$` value to get a handle to a console's active screen buffer.
     * 
     * The standard handles of a process on entry of the main method are dictated by the configuration of the [*SUBSYSTEM**](/cpp/build/reference/subsystem-specify-subsystem) flag passed to the linker when the application was built. Specifying *SUBSYSTEM:CONSOLE** requests that the operating system fill the handles with a console session on startup, if the parent didn't already fill the standard handle table by inheritance. On the contrary, *SUBSYSTEM:WINDOWS** implies that the application does not need a console and will likely not be making use of the standard handles. More information on handle inheritance can be found in the documentation for [**STARTF\_USESTDHANDLES**](/windows/win32/api/processthreadsapi/ns-processthreadsapi-startupinfoa).
     * 
     * Some applications operate outside the boundaries of their declared subsystem; for instance, a *SUBSYSTEM:WINDOWS** application might check/use standard handles for logging or debugging purposes but operate normally with a graphical user interface. These applications will need to carefully probe the state of standard handles on startup and make use of [**AttachConsole**](attachconsole.md), [**AllocConsole**](allocconsole.md), and [**FreeConsole**](freeconsole.md) to add/remove a console if desired.
     * 
     * Some applications may also vary their behavior on the type of inherited handle. Disambiguating the type between console, pipe, file, and others can be performed with [**GetFileType**](/windows/win32/api/fileapi/nf-fileapi-getfiletype).
     * @param {Integer} nStdHandle The standard device. This parameter can be one of the following values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | **STD_INPUT_HANDLE** `((DWORD)-10)` | The standard input device. Initially, this is the console input buffer, `CONIN$`. |
     * | **STD_OUTPUT_HANDLE** `((DWORD)-11)` | The standard output device. Initially, this is the active console screen buffer, `CONOUT$`. |
     * | **STD_ERROR_HANDLE** `((DWORD)-12)` | The standard error device. Initially, this is the active console screen buffer, `CONOUT$`. |
     * 
     * > [!NOTE]
     * > The values for these constants are unsigned numbers, but are defined in the header files as a cast from a 
     * signed number and take advantage of the C compiler rolling them over to just under the maximum 32-bit value. When interfacing with these handles in a language that does not parse the headers and is re-defining the constants, please be aware of this constraint. As an example, `((DWORD)-10)` is actually the unsigned number `4294967286`.
     * @returns {Pointer<HANDLE>} If the function succeeds, the return value is a handle to the specified device, or a redirected handle set by a previous call to [**SetStdHandle**](setstdhandle.md). The handle has **GENERIC\_READ** and **GENERIC\_WRITE** access rights, unless the application has used **SetStdHandle** to set a standard handle with lesser access.
     * 
     * > [!TIP]
     * > It is not required to dispose of this handle with [**CloseHandle**](/windows/win32/api/handleapi/nf-handleapi-closehandle) when done. See [**Remarks**](#handle-disposal) for more information.
     * 
     * If the function fails, the return value is **INVALID\_HANDLE\_VALUE**. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * 
     * If an application does not have associated standard handles, such as a service running on an interactive desktop, and has not redirected them, the return value is **NULL**.
     * @see https://learn.microsoft.com/windows/console/getstdhandle
     */
    static GetStdHandle(nStdHandle) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetStdHandle", "uint", nStdHandle, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the handle for the specified standard device (standard input, standard output, or standard error).
     * @remarks
     * The standard handles of a process may have been redirected by a call to **SetStdHandle**, in which case [**GetStdHandle**](getstdhandle.md) will return the redirected handle. If the standard handles have been redirected, you can specify the CONIN$ value in a call to the [**CreateFile**](/windows/win32/api/fileapi/nf-fileapi-createfilea) function to get a handle to a console's input buffer. Similarly, you can specify the CONOUT$ value to get a handle to the console's active screen buffer.
     * @param {Integer} nStdHandle The standard device for which the handle is to be set. This parameter can be one of the following values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | **STD_INPUT_HANDLE** `((DWORD)-10)` | The standard input device. Initially, this is the console input buffer, `CONIN$`. |
     * | **STD_OUTPUT_HANDLE** `((DWORD)-11)` | The standard output device. Initially, this is the active console screen buffer, `CONOUT$`. |
     * | **STD_ERROR_HANDLE** `((DWORD)-12)` | The standard error device. Initially, this is the active console screen buffer, `CONOUT$`. |
     * 
     * > [!NOTE]
     * > The values for these constants are unsigned numbers, but are defined in the header files as a cast from a 
     * signed number and take advantage of the C compiler rolling them over to just under the maximum 32-bit value. When interfacing with these handles in a language that does not parse the headers and is re-defining the constants, please be aware of this constraint. As an example, `((DWORD)-10)` is actually the unsigned number `4294967286`.
     * @param {Pointer<HANDLE>} hHandle The handle for the standard device.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/setstdhandle
     */
    static SetStdHandle(nStdHandle, hHandle) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetStdHandle", "uint", nStdHandle, "ptr", hHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SetStdHandleEx function (processenv.h) sets the handle for the input, output, or error streams.
     * @param {Integer} nStdHandle A DWORD indicating the stream for which the handle is being set.
     * @param {Pointer<HANDLE>} hHandle The handle.
     * @param {Pointer<HANDLE>} phPrevValue Optional. Receives the previous handle.
     * @returns {Integer} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-setstdhandleex
     */
    static SetStdHandleEx(nStdHandle, hHandle, phPrevValue) {
        result := DllCall("KERNEL32.dll\SetStdHandleEx", "uint", nStdHandle, "ptr", hHandle, "ptr", phPrevValue, "int")
        return result
    }

;@endregion Methods
}
