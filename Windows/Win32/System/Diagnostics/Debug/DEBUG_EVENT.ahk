#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\NTSTATUS.ahk
#Include .\EXCEPTION_RECORD.ahk
#Include .\EXCEPTION_DEBUG_INFO.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include .\CREATE_THREAD_DEBUG_INFO.ahk
#Include .\CREATE_PROCESS_DEBUG_INFO.ahk
#Include .\EXIT_THREAD_DEBUG_INFO.ahk
#Include .\EXIT_PROCESS_DEBUG_INFO.ahk
#Include .\LOAD_DLL_DEBUG_INFO.ahk
#Include .\UNLOAD_DLL_DEBUG_INFO.ahk
#Include ..\..\..\Foundation\PSTR.ahk
#Include .\OUTPUT_DEBUG_STRING_INFO.ahk
#Include .\RIP_INFO.ahk

/**
 * Describes a debugging event.
 * @remarks
 * 
  * If the <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-waitfordebugevent">WaitForDebugEvent</a> function succeeds, it 
  *     fills in the members of a <b>DEBUG_EVENT</b> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//minwinbase/ns-minwinbase-debug_event
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class DEBUG_EVENT extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwDebugEventCode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The identifier of the process in which the debugging event occurred. A debugger uses this value to locate 
     *       the debugger's per-process structure. These values are not necessarily small integers that can be used as table 
     *       indices.
     * @type {Integer}
     */
    dwProcessId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The identifier of the thread in which the debugging event occurred. A debugger uses this value to locate 
     *       the debugger's per-thread structure. These values are not necessarily small integers that can be used as table 
     *       indices.
     * @type {Integer}
     */
    dwThreadId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {EXCEPTION_DEBUG_INFO}
     */
    Exception{
        get {
            if(!this.HasProp("__Exception"))
                this.__Exception := EXCEPTION_DEBUG_INFO(this.ptr + 16)
            return this.__Exception
        }
    }

    /**
     * @type {CREATE_THREAD_DEBUG_INFO}
     */
    CreateThread{
        get {
            if(!this.HasProp("__CreateThread"))
                this.__CreateThread := CREATE_THREAD_DEBUG_INFO(this.ptr + 16)
            return this.__CreateThread
        }
    }

    /**
     * @type {CREATE_PROCESS_DEBUG_INFO}
     */
    CreateProcessInfo{
        get {
            if(!this.HasProp("__CreateProcessInfo"))
                this.__CreateProcessInfo := CREATE_PROCESS_DEBUG_INFO(this.ptr + 16)
            return this.__CreateProcessInfo
        }
    }

    /**
     * @type {EXIT_THREAD_DEBUG_INFO}
     */
    ExitThread{
        get {
            if(!this.HasProp("__ExitThread"))
                this.__ExitThread := EXIT_THREAD_DEBUG_INFO(this.ptr + 16)
            return this.__ExitThread
        }
    }

    /**
     * @type {EXIT_PROCESS_DEBUG_INFO}
     */
    ExitProcess{
        get {
            if(!this.HasProp("__ExitProcess"))
                this.__ExitProcess := EXIT_PROCESS_DEBUG_INFO(this.ptr + 16)
            return this.__ExitProcess
        }
    }

    /**
     * @type {LOAD_DLL_DEBUG_INFO}
     */
    LoadDll{
        get {
            if(!this.HasProp("__LoadDll"))
                this.__LoadDll := LOAD_DLL_DEBUG_INFO(this.ptr + 16)
            return this.__LoadDll
        }
    }

    /**
     * @type {UNLOAD_DLL_DEBUG_INFO}
     */
    UnloadDll{
        get {
            if(!this.HasProp("__UnloadDll"))
                this.__UnloadDll := UNLOAD_DLL_DEBUG_INFO(this.ptr + 16)
            return this.__UnloadDll
        }
    }

    /**
     * @type {OUTPUT_DEBUG_STRING_INFO}
     */
    DebugString{
        get {
            if(!this.HasProp("__DebugString"))
                this.__DebugString := OUTPUT_DEBUG_STRING_INFO(this.ptr + 16)
            return this.__DebugString
        }
    }

    /**
     * @type {RIP_INFO}
     */
    RipInfo{
        get {
            if(!this.HasProp("__RipInfo"))
                this.__RipInfo := RIP_INFO(this.ptr + 16)
            return this.__RipInfo
        }
    }
}
