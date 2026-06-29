#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The NTMS_LIBRARYINFORMATION structure defines properties specific to a library object.
 * @remarks
 * For offline libraries, only <b>LibraryType</b> and <b>dwNumberOfMedia</b> are reported. All other values should be ignored.
 * 
 * The 
 * <b>NTMS_LIBRARYINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_libraryinformation
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NTMS_LIBRARYINFORMATION {
    #StructPack 4

    LibraryType : UInt32

    /**
     * For each library, this represents the slot that was assigned to the cleaner cartridge. If this member is <b>NULL</b>, there is no cleaner slot defined for this library.
     */
    CleanerSlot : Guid

    /**
     * Represents a libraries' default or preferred cleaner slot. If <b>NULL</b>, there is not a preferred slot.
     */
    CleanerSlotDefault : Guid

    /**
     * Used by drives that require cleaning under robotics control. If <b>TRUE</b>, automatic drive cleaning operations are enabled.
     */
    LibrarySupportsDriveCleaning : BOOL

    /**
     * Returns <b>TRUE</b> if a bar code reader is installed in a library; otherwise returns <b>FALSE</b>.
     */
    BarCodeReaderInstalled : BOOL

    InventoryMethod : UInt32

    /**
     * Number of uses remaining on the cleaner in the library. This member is zero if no cleaner is present or if the library does not support cleaning.
     */
    dwCleanerUsesRemaining : UInt32

    /**
     * Number of the first drive in the library.
     */
    FirstDriveNumber : UInt32

    /**
     * Number of drives in the library.
     */
    dwNumberOfDrives : UInt32

    /**
     * Number of the first slot in the library.
     */
    FirstSlotNumber : UInt32

    /**
     * Number of slots in the library.
     */
    dwNumberOfSlots : UInt32

    /**
     * Number of the first access door in the library.
     */
    FirstDoorNumber : UInt32

    /**
     * Number of access doors in the library.
     */
    dwNumberOfDoors : UInt32

    /**
     * Number of the first insert/eject port in the library.
     */
    FirstPortNumber : UInt32

    /**
     * Number of insert/eject ports in the library.
     */
    dwNumberOfPorts : UInt32

    /**
     * Number of the first changer in the library.
     */
    FirstChangerNumber : UInt32

    /**
     * Number of changers in the library.
     */
    dwNumberOfChangers : UInt32

    /**
     * Number of media in the online or offline library.
     */
    dwNumberOfMedia : UInt32

    /**
     * Number of media types supported by the library.
     */
    dwNumberOfMediaTypes : UInt32

    /**
     * Number of current library requests.
     */
    dwNumberOfLibRequests : UInt32

    /**
     * Reserved.
     */
    Reserved : Guid

    /**
     * If this member is <b>TRUE</b>, a full inventory will be performed if a mount fails. The failure may be either hardware or label mismatch. For ATAPI CD libraries, this parameter cannot be disabled. The default is <b>TRUE</b>. Large library owners should disable this feature.
     */
    AutoRecovery : BOOL

    dwFlags : UInt32

}
