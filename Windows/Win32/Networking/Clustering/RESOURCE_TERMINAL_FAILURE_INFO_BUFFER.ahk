#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct RESOURCE_TERMINAL_FAILURE_INFO_BUFFER {
    #StructPack 4

    isTerminalFailure : BOOL

    restartPeriodRemaining : UInt32

}
