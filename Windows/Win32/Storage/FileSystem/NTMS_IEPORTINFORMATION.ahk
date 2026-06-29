#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The NTMS_IEPORTINFORMATION structure defines properties specific to an insert/eject port object.
 * @remarks
 * The 
 * <b>NTMS_IEPORTINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_ieportinformation
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NTMS_IEPORTINFORMATION {
    #StructPack 4

    /**
     * Library port number.
     */
    Number : UInt32

    Content : UInt32

    Position : UInt32

    /**
     * Maximum number of seconds the port is allowed to remain open before an operator request is issued. Valid values are between 0 and 65,535 seconds. This member is writable.
     */
    MaxExtendSecs : UInt16

    /**
     * Library that contains the port.
     */
    Library : Guid

}
