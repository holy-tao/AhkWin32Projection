#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Isolation
 */
export default struct IsolatedAppLauncherTelemetryParameters {
    #StructPack 4

    EnableForLaunch : BOOL

    CorrelationGUID : Guid

}
