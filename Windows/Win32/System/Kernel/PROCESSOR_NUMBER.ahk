#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a logical processor in a processor group.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-processor_number
 * @namespace Windows.Win32.System.Kernel
 */
export default struct PROCESSOR_NUMBER {
    #StructPack 2

    /**
     * The processor group to which the logical processor is assigned.
     */
    Group : UInt16

    /**
     * The number of the logical processor relative to the group.
     */
    Number : Int8

    /**
     * This parameter is reserved.
     */
    Reserved : Int8

}
