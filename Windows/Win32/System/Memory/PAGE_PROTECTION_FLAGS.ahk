#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class PAGE_PROTECTION_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_NOACCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_READONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_READWRITE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_WRITECOPY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_EXECUTE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_EXECUTE_READ => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_EXECUTE_READWRITE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_EXECUTE_WRITECOPY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GUARD => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_NOCACHE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_WRITECOMBINE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GRAPHICS_NOACCESS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GRAPHICS_READONLY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GRAPHICS_READWRITE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GRAPHICS_EXECUTE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GRAPHICS_EXECUTE_READ => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GRAPHICS_EXECUTE_READWRITE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GRAPHICS_COHERENT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GRAPHICS_NOCACHE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_ENCLAVE_THREAD_CONTROL => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_REVERT_TO_FILE_MAP => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_TARGETS_NO_UPDATE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_TARGETS_INVALID => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_ENCLAVE_UNVALIDATED => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_ENCLAVE_MASK => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_ENCLAVE_DECOMMIT => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_ENCLAVE_SS_FIRST => 268435457

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_ENCLAVE_SS_REST => 268435458

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_PARTITION_OWNER_HANDLE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_64K_PAGES => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_FILE => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_IMAGE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_PROTECTED_IMAGE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_RESERVE => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_COMMIT => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_NOCACHE => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WRITECOMBINE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_LARGE_PAGES => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_IMAGE_NO_EXECUTE => 285212672
}
