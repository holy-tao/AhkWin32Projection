#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the result of a query for hardware DRM capability support using [IsTypeSupported](protectioncapabilities_istypesupported_2024884020.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.protectioncapabilityresult
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class ProtectionCapabilityResult extends Win32Enum{

    /**
     * The queried features are not supported.
     * @type {Integer (Int32)}
     */
    static NotSupported => 0

    /**
     * Only relevant to output protection (HDCP) subsystem queries.  [ProtectionCapabilities.IsTypeSupported](protectioncapabilities_istypesupported_2024884020.md) is a synchronous, blocking call which is constrained to only block for very short periods (goal is < 100 milliseconds).  As underlying HDCP establishment may take significantly longer than the blocking period, this **Maybe** result is returned while establishment is in progress.  Once establishment succeeds or fails, the HDCP subsystem query will stabilize on **Probably** or **NotSupported**, respectively.  As no event or promise mechanism is provided, the query must be repeated until **NotSupported** or **Probably** is returned.
     * @type {Integer (Int32)}
     */
    static Maybe => 1

    /**
     * The queried features are supported as of the time of the query.  Display configurations can change dynamically, so Display subsystem and HDCP subsystem query results may become invalid after the query.
     * @type {Integer (Int32)}
     */
    static Probably => 2
}
