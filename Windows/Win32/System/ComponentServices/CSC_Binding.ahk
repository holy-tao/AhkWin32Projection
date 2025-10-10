#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates whether all of the work that is submitted via the activity returned from CoCreateActivity should be bound to only one single-threaded apartment (STA). This enumeration has no impact on the multithreaded apartment (MTA).
 * @remarks
 * 
  * Binding all of the work submitted through the activity to a single STA involves a trade-off between avoiding the need to marshal interfaces to components used by many of the different bits of work versus needing to synchronize on a specific STA.
  * 
  * This enumeration is used only to set the thread pool binding for <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> when calling <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a>. An error is returned if you try to set the thread pool binding when calling <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a>. The values of this enumeration have no impact upon the MTA.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/ne-comsvcs-csc_binding
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class CSC_Binding{

    /**
     * The work submitted through the activity is not bound to a single STA.
     * @type {Integer (Int32)}
     */
    static CSC_NoBinding => 0

    /**
     * The work submitted through the activity is bound to a single STA.
     * @type {Integer (Int32)}
     */
    static CSC_BindToPoolThread => 1
}
