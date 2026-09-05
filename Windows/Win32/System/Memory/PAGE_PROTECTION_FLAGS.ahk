#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 */
class PAGE_PROTECTION_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: PAGE_NOACCESS
     * @type {Integer (UInt32)}
     */
    static NOACCESS => 1

    /**
     * Native name: PAGE_READONLY
     * @type {Integer (UInt32)}
     */
    static READONLY => 2

    /**
     * Native name: PAGE_READWRITE
     * @type {Integer (UInt32)}
     */
    static READWRITE => 4

    /**
     * Native name: PAGE_WRITECOPY
     * @type {Integer (UInt32)}
     */
    static WRITECOPY => 8

    /**
     * Native name: PAGE_EXECUTE
     * @type {Integer (UInt32)}
     */
    static EXECUTE => 16

    /**
     * Native name: PAGE_EXECUTE_READ
     * @type {Integer (UInt32)}
     */
    static EXECUTE_READ => 32

    /**
     * Native name: PAGE_EXECUTE_READWRITE
     * @type {Integer (UInt32)}
     */
    static EXECUTE_READWRITE => 64

    /**
     * Native name: PAGE_EXECUTE_WRITECOPY
     * @type {Integer (UInt32)}
     */
    static EXECUTE_WRITECOPY => 128

    /**
     * Native name: PAGE_GUARD
     * @type {Integer (UInt32)}
     */
    static GUARD => 256

    /**
     * Native name: PAGE_NOCACHE
     * @type {Integer (UInt32)}
     */
    static NOCACHE => 512

    /**
     * Native name: PAGE_WRITECOMBINE
     * @type {Integer (UInt32)}
     */
    static WRITECOMBINE => 1024

    /**
     * Native name: PAGE_GRAPHICS_NOACCESS
     * @type {Integer (UInt32)}
     */
    static GRAPHICS_NOACCESS => 2048

    /**
     * Native name: PAGE_GRAPHICS_READONLY
     * @type {Integer (UInt32)}
     */
    static GRAPHICS_READONLY => 4096

    /**
     * Native name: PAGE_GRAPHICS_READWRITE
     * @type {Integer (UInt32)}
     */
    static GRAPHICS_READWRITE => 8192

    /**
     * Native name: PAGE_GRAPHICS_EXECUTE
     * @type {Integer (UInt32)}
     */
    static GRAPHICS_EXECUTE => 16384

    /**
     * Native name: PAGE_GRAPHICS_EXECUTE_READ
     * @type {Integer (UInt32)}
     */
    static GRAPHICS_EXECUTE_READ => 32768

    /**
     * Native name: PAGE_GRAPHICS_EXECUTE_READWRITE
     * @type {Integer (UInt32)}
     */
    static GRAPHICS_EXECUTE_READWRITE => 65536

    /**
     * Native name: PAGE_GRAPHICS_COHERENT
     * @type {Integer (UInt32)}
     */
    static GRAPHICS_COHERENT => 131072

    /**
     * Native name: PAGE_GRAPHICS_NOCACHE
     * @type {Integer (UInt32)}
     */
    static GRAPHICS_NOCACHE => 262144

    /**
     * Native name: PAGE_ENCLAVE_THREAD_CONTROL
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_THREAD_CONTROL => 2147483648

    /**
     * Native name: PAGE_REVERT_TO_FILE_MAP
     * @type {Integer (UInt32)}
     */
    static REVERT_TO_FILE_MAP => 2147483648

    /**
     * Native name: PAGE_TARGETS_NO_UPDATE
     * @type {Integer (UInt32)}
     */
    static TARGETS_NO_UPDATE => 1073741824

    /**
     * Native name: PAGE_TARGETS_INVALID
     * @type {Integer (UInt32)}
     */
    static TARGETS_INVALID => 1073741824

    /**
     * Native name: PAGE_ENCLAVE_UNVALIDATED
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_UNVALIDATED => 536870912

    /**
     * Native name: PAGE_ENCLAVE_MASK
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_MASK => 268435456

    /**
     * Native name: PAGE_ENCLAVE_DECOMMIT
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_DECOMMIT => 268435456

    /**
     * Native name: PAGE_ENCLAVE_SS_FIRST
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_SS_FIRST => 268435457

    /**
     * Native name: PAGE_ENCLAVE_SS_REST
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_SS_REST => 268435458

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
