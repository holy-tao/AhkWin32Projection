#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Controls what data is returned from calls to the IGetAppTrackerData interface.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ne-comsvcs-getapptrackerdataflags
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct GetAppTrackerDataFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Include the name of the process's executable image in the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-applicationprocesssummary">ApplicationProcessSummary</a> structure. If set, it is the caller's responsibility to free the memory allocated for this string.
     * @type {Integer (Int32)}
     */
    static GATD_INCLUDE_PROCESS_EXE_NAME => 1

    /**
     * Include COM+ library applications in the tracking data. By default, these are excluded.
     * @type {Integer (Int32)}
     */
    static GATD_INCLUDE_LIBRARY_APPS => 2

    /**
     * Include Services Without Components contexts in the tracking data. By default, these are excluded.
     * @type {Integer (Int32)}
     */
    static GATD_INCLUDE_SWC => 4

    /**
     * Include the class name in the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-componentsummary">ComponentSummary</a> structure. If set, it is the caller's responsibility to free the memory allocated for this string.
     * @type {Integer (Int32)}
     */
    static GATD_INCLUDE_CLASS_NAME => 8

    /**
     * Include the application name in the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-applicationsummary">ApplicationSummary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-componentsummary">ComponentSummary</a> structures. If set, it is the caller's responsibility to free the memory allocated for this string.
     * @type {Integer (Int32)}
     */
    static GATD_INCLUDE_APPLICATION_NAME => 16
}
