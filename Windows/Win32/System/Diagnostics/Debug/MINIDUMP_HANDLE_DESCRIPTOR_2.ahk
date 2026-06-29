#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the state of an individual system handle at the time the minidump was written.
 * @remarks
 * The first descriptor in the handle data stream follows the header, 
 * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_handle_data_stream">MINIDUMP_HANDLE_DATA_STREAM</a>.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_handle_descriptor_2
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_HANDLE_DESCRIPTOR_2 {
    #StructPack 8

    /**
     * The operating system handle value.
     */
    Handle : Int64

    /**
     * An RVA to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_string">MINIDUMP_STRING</a> structure that specifies the object type of the handle. This member can be zero.
     */
    TypeNameRva : UInt32

    /**
     * An RVA to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_string">MINIDUMP_STRING</a> structure that specifies the object name of the handle. This member can be 0.
     */
    ObjectNameRva : UInt32

    /**
     * The meaning of this member depends on the handle type and the operating system.
     */
    Attributes : UInt32

    /**
     * The meaning of this member depends on the handle type and the operating system.
     */
    GrantedAccess : UInt32

    /**
     * The meaning of this member depends on the handle type and the operating system.
     */
    HandleCount : UInt32

    /**
     * The meaning of this member depends on the handle type and the operating system.
     */
    PointerCount : UInt32

    /**
     * An RVA to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_handle_object_information">MINIDUMP_HANDLE_OBJECT_INFORMATION</a> structure that specifies object-specific information. This member can be 0 if there is no extra information.
     */
    ObjectInfoRva : UInt32

    /**
     * Reserved for future use; must be zero.
     */
    Reserved0 : UInt32

}
