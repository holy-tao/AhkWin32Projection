#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether the tracker property is added to the context in which the enclosed code runs.
 * @remarks
 * 
 * This enumeration is used to configure the tracker property through <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> for either the work submitted through the activity created by <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a> or the work that is enclosed between calls to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a> and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coleaveservicedomain">CoLeaveServiceDomain</a>.
 * 
 * The tracker property is a reporting mechanism used by monitoring code to watch which code is running at a given time. It is the reporting mechanism behind the spinning balls in the Component Services administrative tool.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/ne-comsvcs-csc_trackerconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class CSC_TrackerConfig extends Win32Enum{

    /**
     * The tracker property is not added to the context in which the enclosed code runs.
     * @type {Integer (Int32)}
     */
    static CSC_DontUseTracker => 0

    /**
     * The tracker property is added to the context in which the enclosed code runs.
     * @type {Integer (Int32)}
     */
    static CSC_UseTracker => 1
}
