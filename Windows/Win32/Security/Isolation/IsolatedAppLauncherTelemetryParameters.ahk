#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Security.Isolation
 */
export default struct IsolatedAppLauncherTelemetryParameters {
    #StructPack 4

    EnableForLaunch : BOOL

    CorrelationGUID : Guid

}
