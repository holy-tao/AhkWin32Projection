#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the thread pool in which the work runs that is submitted through the activity returned from CoCreateActivity.
 * @remarks
 * 
 * This enumeration is used to set the thread pool for <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> only when calling <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a>. An error is returned if you try to set the thread pool when calling <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/ne-comsvcs-csc_threadpool
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class CSC_ThreadPool extends Win32Enum{

    /**
     * No thread pool is used. If this value is used to configure a <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> object that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a>, an error (CO_E_THREADPOOL_CONFIG) is returned. This is the default thread pool setting for <b>CServiceConfig</b> when <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_inheritanceconfig">CSC_InheritanceConfig</a> is set to CSC_Ignore.
     * @type {Integer (Int32)}
     */
    static CSC_ThreadPoolNone => 0

    /**
     * The same type of thread pool apartment as the caller's thread apartment is used. If the caller's thread apartment is the neutral apartment, a single-threaded apartment is used. This is the default thread pool setting for <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> when <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_inheritanceconfig">CSC_InheritanceConfig</a> is set to CSC_Inherit.
     * @type {Integer (Int32)}
     */
    static CSC_ThreadPoolInherit => 1

    /**
     * A single-threaded apartment (STA) is used.
     * @type {Integer (Int32)}
     */
    static CSC_STAThreadPool => 2

    /**
     * A multithreaded apartment (MTA) is used.
     * @type {Integer (Int32)}
     */
    static CSC_MTAThreadPool => 3
}
