#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RIP_INFO_TYPE.ahk" { RIP_INFO_TYPE }
#Import ".\LOAD_DLL_DEBUG_INFO.ahk" { LOAD_DLL_DEBUG_INFO }
#Import ".\UNLOAD_DLL_DEBUG_INFO.ahk" { UNLOAD_DLL_DEBUG_INFO }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DEBUG_EVENT_CODE.ahk" { DEBUG_EVENT_CODE }
#Import ".\RIP_INFO.ahk" { RIP_INFO }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\OUTPUT_DEBUG_STRING_INFO.ahk" { OUTPUT_DEBUG_STRING_INFO }
#Import ".\CREATE_THREAD_DEBUG_INFO.ahk" { CREATE_THREAD_DEBUG_INFO }
#Import ".\EXCEPTION_DEBUG_INFO.ahk" { EXCEPTION_DEBUG_INFO }
#Import ".\EXIT_THREAD_DEBUG_INFO.ahk" { EXIT_THREAD_DEBUG_INFO }
#Import ".\EXCEPTION_RECORD.ahk" { EXCEPTION_RECORD }
#Import ".\EXIT_PROCESS_DEBUG_INFO.ahk" { EXIT_PROCESS_DEBUG_INFO }
#Import ".\CREATE_PROCESS_DEBUG_INFO.ahk" { CREATE_PROCESS_DEBUG_INFO }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes a debugging event.
 * @remarks
 * If the <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-waitfordebugevent">WaitForDebugEvent</a> function succeeds, it 
 *     fills in the members of a <b>DEBUG_EVENT</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-debug_event
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct DEBUG_EVENT {
    #StructPack 8


    struct _u {
        Exception : EXCEPTION_DEBUG_INFO

        static __New() {
            DefineProp(this.Prototype, 'CreateThread', { type: CREATE_THREAD_DEBUG_INFO, offset: 0 })
            DefineProp(this.Prototype, 'CreateProcessInfo', { type: CREATE_PROCESS_DEBUG_INFO, offset: 0 })
            DefineProp(this.Prototype, 'ExitThread', { type: EXIT_THREAD_DEBUG_INFO, offset: 0 })
            DefineProp(this.Prototype, 'ExitProcess', { type: EXIT_PROCESS_DEBUG_INFO, offset: 0 })
            DefineProp(this.Prototype, 'LoadDll', { type: LOAD_DLL_DEBUG_INFO, offset: 0 })
            DefineProp(this.Prototype, 'UnloadDll', { type: UNLOAD_DLL_DEBUG_INFO, offset: 0 })
            DefineProp(this.Prototype, 'DebugString', { type: OUTPUT_DEBUG_STRING_INFO, offset: 0 })
            DefineProp(this.Prototype, 'RipInfo', { type: RIP_INFO, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Type: <b>DWORD</b>
     */
    dwDebugEventCode : DEBUG_EVENT_CODE

    /**
     * Type: <b>DWORD</b>
     * 
     * The identifier of the process in which the debugging event occurred. A debugger uses this value to locate 
     *       the debugger's per-process structure. These values are not necessarily small integers that can be used as table 
     *       indices.
     */
    dwProcessId : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The identifier of the thread in which the debugging event occurred. A debugger uses this value to locate 
     *       the debugger's per-thread structure. These values are not necessarily small integers that can be used as table 
     *       indices.
     */
    dwThreadId : UInt32

    /**
     * Any additional information relating to the debugging event. This union takes on the type and value 
     *       appropriate to the type of debugging event, as described in the <b>dwDebugEventCode</b> 
     *       member.
     */
    u : DEBUG_EVENT._u

}
