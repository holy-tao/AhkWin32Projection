#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents types of applications tracked by the tracker server.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/ne-comsvcs-complus_apptype
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class COMPLUS_APPTYPE extends Win32Enum{

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
