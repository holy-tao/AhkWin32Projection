#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RIP_INFO_TYPE.ahk" { RIP_INFO_TYPE }

/**
 * Contains the error that caused the RIP debug event.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-rip_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct RIP_INFO {
    #StructPack 4

    /**
     * The error that caused the RIP debug event. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/error-handling">Error Handling</a>.
     */
    dwError : UInt32

    dwType : RIP_INFO_TYPE

}
