#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The NTMS_IEDOORINFORMATION structure defines properties specific to an insert/eject door object.
 * @remarks
 * The 
 * <b>NTMS_IEDOORINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * 
 * If the <b>MaxOpenSecs</b> member is zero, an operator request to close the door is generated as soon as the door is open.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_iedoorinformation
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NTMS_IEDOORINFORMATION {
    #StructPack 4

    /**
     * Number of the door in the library. Typically, libraries have one door.
     */
    Number : UInt32

    State : UInt32

    /**
     * Maximum number of seconds the door is to remain open. Valid values are between 0-65,535 seconds This member is writable.
     */
    MaxOpenSecs : UInt16

    /**
     * Library that contains this door.
     */
    Library : Guid

}
