#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains object-specific information for a handle.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_handle_object_information
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_HANDLE_OBJECT_INFORMATION {
    #StructPack 4

    /**
     * An RVA to a 
     * <b>MINIDUMP_HANDLE_OBJECT_INFORMATION</b> structure that specifies additional object-specific information. This member is 0 if there are no more elements in the list.
     */
    NextInfoRva : UInt32

    /**
     * The object information type. This member is one of the values from the <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ne-minidumpapiset-minidump_handle_object_information_type">MINIDUMP_HANDLE_OBJECT_INFORMATION_TYPE</a> enumeration.
     */
    InfoType : UInt32

    /**
     * The size of the information that follows this member, in bytes.
     */
    SizeOfInfo : UInt32

}
