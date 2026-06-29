#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NTMS_I1_LIBRARYINFORMATION {
    #StructPack 4

    LibraryType : UInt32

    CleanerSlot : Guid

    CleanerSlotDefault : Guid

    LibrarySupportsDriveCleaning : BOOL

    BarCodeReaderInstalled : BOOL

    InventoryMethod : UInt32

    dwCleanerUsesRemaining : UInt32

    FirstDriveNumber : UInt32

    dwNumberOfDrives : UInt32

    FirstSlotNumber : UInt32

    dwNumberOfSlots : UInt32

    FirstDoorNumber : UInt32

    dwNumberOfDoors : UInt32

    FirstPortNumber : UInt32

    dwNumberOfPorts : UInt32

    FirstChangerNumber : UInt32

    dwNumberOfChangers : UInt32

    dwNumberOfMedia : UInt32

    dwNumberOfMediaTypes : UInt32

    dwNumberOfLibRequests : UInt32

    Reserved : Guid

}
