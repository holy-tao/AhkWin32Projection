#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the type of object-specific information.
 * @remarks
 * 
 * The information represented by each of these values can vary by operating system and procesor architecture. Per-handle object-specific information is automatically gathered when minidump type is MiniDumpWithHandleData. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-minidump_type">MINIDUMP_TYPE</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ne-minidumpapiset-minidump_handle_object_information_type
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_HANDLE_OBJECT_INFORMATION_TYPE{

    /**
     * There is no object-specific information for this handle type.
     * @type {Integer (Int32)}
     */
    static MiniHandleObjectInformationNone => 0

    /**
     * The information is specific to thread objects.
     * @type {Integer (Int32)}
     */
    static MiniThreadInformation1 => 1

    /**
     * The information is specific to mutant objects.
     * @type {Integer (Int32)}
     */
    static MiniMutantInformation1 => 2

    /**
     * The information is specific to mutant objects.
     * @type {Integer (Int32)}
     */
    static MiniMutantInformation2 => 3

    /**
     * The information is specific to process objects.
     * @type {Integer (Int32)}
     */
    static MiniProcessInformation1 => 4

    /**
     * The information is specific to process objects.
     * @type {Integer (Int32)}
     */
    static MiniProcessInformation2 => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MiniEventInformation1 => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MiniSectionInformation1 => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MiniSemaphoreInformation1 => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MiniHandleObjectInformationTypeMax => 9
}
