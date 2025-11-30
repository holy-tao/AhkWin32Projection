#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class MEM_SECTION_EXTENDED_PARAMETER_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MemSectionExtendedParameterInvalidType => 0

    /**
     * @type {Integer (Int32)}
     */
    static MemSectionExtendedParameterUserPhysicalFlags => 1

    /**
     * @type {Integer (Int32)}
     */
    static MemSectionExtendedParameterNumaNode => 2

    /**
     * @type {Integer (Int32)}
     */
    static MemSectionExtendedParameterSigningLevel => 3

    /**
     * @type {Integer (Int32)}
     */
    static MemSectionExtendedParameterMax => 4
}
