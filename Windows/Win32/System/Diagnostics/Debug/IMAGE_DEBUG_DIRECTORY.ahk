#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_DEBUG_TYPE.ahk" { IMAGE_DEBUG_TYPE }

/**
 * Represents the debug directory format.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-image_debug_directory
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_DEBUG_DIRECTORY {
    #StructPack 4

    /**
     * Reserved.
     */
    Characteristics : UInt32

    /**
     * The time and date the debugging information was created.
     */
    TimeDateStamp : UInt32

    /**
     * The major version number of the debugging information format.
     */
    MajorVersion : UInt16

    /**
     * The minor version number of the debugging information format.
     */
    MinorVersion : UInt16

    Type : IMAGE_DEBUG_TYPE

    /**
     * The size of the debugging information, in bytes. This value does not include the debug directory itself.
     */
    SizeOfData : UInt32

    /**
     * The address of the debugging information when the image is loaded, relative to the image base.
     */
    AddressOfRawData : UInt32

    /**
     * A file pointer to the debugging information.
     */
    PointerToRawData : UInt32

}
