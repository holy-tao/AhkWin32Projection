#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_X64_APIC_WRITE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ApicWriteTypeLdr => 208

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ApicWriteTypeDfr => 224

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ApicWriteTypeSvr => 240

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ApicWriteTypeLint0 => 848

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ApicWriteTypeLint1 => 864
}
