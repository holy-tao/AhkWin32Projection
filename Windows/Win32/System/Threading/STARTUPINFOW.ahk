#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Specifies the window station, desktop, standard handles, and appearance of the main window for a process at creation time.
 * @remarks
 * 
  * For graphical user interface (GUI) processes, this information affects the first window created by the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a> function and shown by the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showwindow">ShowWindow</a> function. For console processes, this information affects the console window if a new console is created for the process. A process can use the 
  * [GetStartupInfo](./nf-processthreadsapi-getstartupinfow.md) function to retrieve the 
  * <b>STARTUPINFO</b> structure specified when the process was created.
  * 
  * If a GUI process is being started and neither STARTF_FORCEONFEEDBACK or STARTF_FORCEOFFFEEDBACK is specified, the process feedback cursor is used. A GUI process is one whose subsystem is specified as "windows."
  * 
  * If a process is launched from the taskbar or jump list, the system sets [GetStartupInfo](./nf-processthreadsapi-getstartupinfow.md) to retrieve the <b>STARTUPINFO</b> structure and check that <b>hStdOutput</b> is set. If so, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmonitorinfoa">GetMonitorInfo</a> to check whether <b>hStdOutput</b> is a valid monitor handle (HMONITOR). The process can then use the handle to position its windows.
  * 
  * If the [GetStartupInfo](./nf-processthreadsapi-getstartupinfow.md) function, then applications should be aware that the command line is untrusted. If this flag is set, applications should disable potentially dangerous features such as macros, downloaded content, and automatic printing. This flag is optional. Applications that call <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> are encouraged to set this flag when launching a program with a untrusted command line so that the created process can apply appropriate policy.
  * 
  * The <b>STARTF_UNTRUSTEDSOURCE</b> flag is supported starting in Windows Vista, but it is not defined in the SDK header files prior to the Windows 10 SDK. To use the flag in versions prior to Windows 10, you can define it manually in your program.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/ns-processthreadsapi-startupinfow
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 * @charset Unicode
 */
class STARTUPINFOW extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved; must be NULL.
     * @type {PWSTR}
     */
    lpReserved{
        get {
            if(!this.HasProp("__lpReserved"))
                this.__lpReserved := PWSTR(this.ptr + 8)
            return this.__lpReserved
        }
    }

    /**
     * The name of the desktop, or the name of both the desktop and window station for this process. A backslash in the string indicates that the string includes both the desktop and window station names. 
     * 
     * For more information, see [Thread Connection to a Desktop](/windows/desktop/winstation/thread-connection-to-a-desktop).
     * @type {PWSTR}
     */
    lpDesktop{
        get {
            if(!this.HasProp("__lpDesktop"))
                this.__lpDesktop := PWSTR(this.ptr + 16)
            return this.__lpDesktop
        }
    }

    /**
     * For console processes, this is the title displayed in the title bar if a new console window is created. If NULL, the name of the executable file is used as the window title instead. This parameter must be NULL for GUI or console processes that do not create a new console window.
     * @type {PWSTR}
     */
    lpTitle{
        get {
            if(!this.HasProp("__lpTitle"))
                this.__lpTitle := PWSTR(this.ptr + 24)
            return this.__lpTitle
        }
    }

    /**
     * If <b>dwFlags</b> specifies STARTF_USEPOSITION, this member is the x offset of the upper left corner of a window if a new window is created, in pixels. Otherwise, this member is ignored. 
     * 
     * 
     * 
     * 
     * The offset is from the upper left corner of the screen. For GUI processes, the specified position is used the first time the new process calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a> to create an overlapped window if the <i>x</i> parameter of <b>CreateWindow</b> is CW_USEDEFAULT.
     * @type {Integer}
     */
    dwX {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * If <b>dwFlags</b> specifies STARTF_USEPOSITION, this member is the y offset of the upper left corner of a window if a new window is created, in pixels. Otherwise, this member is ignored. 
     * 
     * 
     * 
     * 
     * The offset is from the upper left corner of the screen. For GUI processes, the specified position is used the first time the new process calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a> to create an overlapped window if the <i>y</i> parameter of <b>CreateWindow</b> is CW_USEDEFAULT.
     * @type {Integer}
     */
    dwY {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * If <b>dwFlags</b> specifies STARTF_USESIZE, this member is the width of the window if a new window is created, in pixels. Otherwise, this member is ignored. 
     * 
     * 
     * 
     * 
     * For GUI processes, this is used only the first time the new process calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a> to create an overlapped window if the <i>nWidth</i> parameter of <b>CreateWindow</b> is CW_USEDEFAULT.
     * @type {Integer}
     */
    dwXSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * If <b>dwFlags</b> specifies STARTF_USESIZE, this member is the height of the window if a new window is created, in pixels. Otherwise, this member is ignored. 
     * 
     * 
     * 
     * 
     * For GUI processes, this is used only the first time the new process calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a> to create an overlapped window if the <i>nHeight</i> parameter of <b>CreateWindow</b> is CW_USEDEFAULT.
     * @type {Integer}
     */
    dwYSize {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * If <b>dwFlags</b> specifies STARTF_USECOUNTCHARS, if a new console window is created in a console process, this member specifies the screen buffer width, in character columns. Otherwise, this member is ignored.
     * @type {Integer}
     */
    dwXCountChars {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * If <b>dwFlags</b> specifies STARTF_USECOUNTCHARS, if a new console window is created in a console process, this member specifies the screen buffer height, in character rows. Otherwise, this member is ignored.
     * @type {Integer}
     */
    dwYCountChars {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * If <b>dwFlags</b> specifies STARTF_USEFILLATTRIBUTE, this member is the initial text and background colors if a new console window is created in a console application. Otherwise, this member is ignored.
     * @type {Integer}
     */
    dwFillAttribute {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * A bitfield that determines whether certain
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * If <b>dwFlags</b> specifies STARTF_USESHOWWINDOW, this member can be any of the values that can be specified in the <i>nCmdShow</i> parameter for the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showwindow">ShowWindow</a> function, except for SW_SHOWDEFAULT. Otherwise, this member is ignored. 
     * 
     * 
     * 
     * 
     * For GUI processes, the first time 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showwindow">ShowWindow</a> is called, its <i>nCmdShow</i> parameter is ignored <b>wShowWindow</b> specifies the default value. In subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showwindow">ShowWindow</a>, the <b>wShowWindow</b> member is used if the <i>nCmdShow</i> parameter of <b>ShowWindow</b> is set to SW_SHOWDEFAULT.
     * @type {Integer}
     */
    wShowWindow {
        get => NumGet(this, 64, "ushort")
        set => NumPut("ushort", value, this, 64)
    }

    /**
     * Reserved for use by the C Run-time; must be zero.
     * @type {Integer}
     */
    cbReserved2 {
        get => NumGet(this, 66, "ushort")
        set => NumPut("ushort", value, this, 66)
    }

    /**
     * Reserved for use by the C Run-time; must be NULL.
     * @type {Pointer<Byte>}
     */
    lpReserved2 {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * If <b>dwFlags</b> specifies STARTF_USESTDHANDLES, this member is the standard input handle for the process. If STARTF_USESTDHANDLES is not specified, the default for standard input is the keyboard buffer.
     * 
     * If <b>dwFlags</b> specifies STARTF_USEHOTKEY, this member specifies a hotkey value that is sent as the <i>wParam</i> parameter of a <a href="https://docs.microsoft.com/windows/win32/inputdev/wm-sethotkey">WM_SETHOTKEY</a> message to the first  eligible top-level window created by the application that owns the process. If the window is created with the WS_POPUP window style, it is not eligible unless the WS_EX_APPWINDOW extended window style is also set. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-createwindowexa">CreateWindowEx</a>.  
     * 
     * Otherwise, this member is ignored.
     * @type {HANDLE}
     */
    hStdInput{
        get {
            if(!this.HasProp("__hStdInput"))
                this.__hStdInput := HANDLE(this.ptr + 80)
            return this.__hStdInput
        }
    }

    /**
     * If <b>dwFlags</b> specifies STARTF_USESTDHANDLES, this member is the standard output handle for the process. Otherwise, this member is ignored and the default for standard output is the console window's buffer.
     * 
     * If a process is launched from the taskbar or jump list, the system sets <b>hStdOutput</b> to a handle to the monitor that contains the taskbar or jump list used to launch the process. For more information, see Remarks.<b>Windows 7, Windows Server 2008 R2, Windows Vista, Windows Server 2008, Windows XP and Windows Server 2003:  </b>This behavior was introduced in Windows 8 and Windows Server 2012.
     * @type {HANDLE}
     */
    hStdOutput{
        get {
            if(!this.HasProp("__hStdOutput"))
                this.__hStdOutput := HANDLE(this.ptr + 88)
            return this.__hStdOutput
        }
    }

    /**
     * If <b>dwFlags</b> specifies STARTF_USESTDHANDLES, this member is the standard error handle for the process. Otherwise, this member is ignored and the default for standard error is the console window's buffer.
     * @type {HANDLE}
     */
    hStdError{
        get {
            if(!this.HasProp("__hStdError"))
                this.__hStdError := HANDLE(this.ptr + 96)
            return this.__hStdError
        }
    }
}
