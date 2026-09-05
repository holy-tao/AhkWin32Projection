#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 */
class MEM_SECTION_EXTENDED_PARAMETER_TYPE extends Win32Enum {

    /**
     * Native name: MemSectionExtendedParameterInvalidType
     * @type {Integer (Int32)}
     */
    static InvalidType => 0

    /**
     * Native name: MemSectionExtendedParameterUserPhysicalFlags
     * @type {Integer (Int32)}
     */
    static UserPhysicalFlags => 1

    /**
     * Native name: MemSectionExtendedParameterNumaNode
     * @type {Integer (Int32)}
     */
    static NumaNode => 2

    /**
     * Native name: MemSectionExtendedParameterSigningLevel
     * @type {Integer (Int32)}
     */
    static SigningLevel => 3

    /**
     * Native name: MemSectionExtendedParameterMax
     * @type {Integer (Int32)}
     */
    static Max => 4
}
