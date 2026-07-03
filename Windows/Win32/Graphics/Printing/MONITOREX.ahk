#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MONITOR.ahk" { MONITOR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct MONITOREX {
    #StructPack 8

    dwMonitorSize : UInt32

    Monitor : MONITOR

}
