#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents types of applications tracked by the tracker server.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ne-comsvcs-complus_apptype
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct COMPLUS_APPTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * This value is not used.
     * @type {Integer (Int32)}
     */
    static APPTYPE_UNKNOWN => -1

    /**
     * COM+ server application.
     * @type {Integer (Int32)}
     */
    static APPTYPE_SERVER => 1

    /**
     * COM+ library application.
     * @type {Integer (Int32)}
     */
    static APPTYPE_LIBRARY => 0

    /**
     * COM+ services without components.
     * @type {Integer (Int32)}
     */
    static APPTYPE_SWC => 2
}
