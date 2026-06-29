#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents the hang monitoring configuration for a COM+ component.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-componenthangmonitorinfo
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ComponentHangMonitorInfo {
    #StructPack 4

    /**
     * Indicates whether the component is configured for hang monitoring.
     */
    IsMonitored : BOOL

    /**
     * Indicates whether the hang monitoring configuration for the component specifies the process will be terminated on a hang. This member is meaningful only if <b>IsMonitored</b> is <b>TRUE</b>.
     */
    TerminateOnHang : BOOL

    /**
     * The average call response time threshold configured for the component. This member is meaningful only if <b>IsMonitored</b> is <b>TRUE</b>.
     */
    AvgCallThresholdInMs : UInt32

}
