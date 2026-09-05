#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents types of applications tracked by the tracker server.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ne-comsvcs-complus_apptype
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMPLUS_APPTYPE extends Win32Enum {

    /**
     * This value is not used.
     * Native name: APPTYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => -1

    /**
     * COM+ server application.
     * Native name: APPTYPE_SERVER
     * @type {Integer (Int32)}
     */
    static SERVER => 1

    /**
     * COM+ library application.
     * Native name: APPTYPE_LIBRARY
     * @type {Integer (Int32)}
     */
    static LIBRARY => 0

    /**
     * COM+ services without components.
     * Native name: APPTYPE_SWC
     * @type {Integer (Int32)}
     */
    static SWC => 2
}
