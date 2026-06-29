#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The NTMS_STORAGESLOTINFORMATION structure defines properties specific to a storage slot object.
 * @remarks
 * The 
 * <b>NTMS_STORAGESLOTINFORMATION</b> structure is part of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_storageslotinformation
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NTMS_STORAGESLOTINFORMATION {
    #StructPack 4

    /**
     * Number of the slot in the library.
     */
    Number : UInt32

    State : UInt32

    /**
     * Library that contains the slot.
     */
    Library : Guid

}
