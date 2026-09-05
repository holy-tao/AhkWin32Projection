#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class IMAGE_SECTION_CHARACTERISTICS extends Win32BitflagEnum {

    /**
     * Native name: IMAGE_SCN_TYPE_NO_PAD
     * @type {Integer (UInt32)}
     */
    static SCN_TYPE_NO_PAD => 8

    /**
     * Native name: IMAGE_SCN_CNT_CODE
     * @type {Integer (UInt32)}
     */
    static SCN_CNT_CODE => 32

    /**
     * Native name: IMAGE_SCN_CNT_INITIALIZED_DATA
     * @type {Integer (UInt32)}
     */
    static SCN_CNT_INITIALIZED_DATA => 64

    /**
     * Native name: IMAGE_SCN_CNT_UNINITIALIZED_DATA
     * @type {Integer (UInt32)}
     */
    static SCN_CNT_UNINITIALIZED_DATA => 128

    /**
     * Native name: IMAGE_SCN_LNK_OTHER
     * @type {Integer (UInt32)}
     */
    static SCN_LNK_OTHER => 256

    /**
     * Native name: IMAGE_SCN_LNK_INFO
     * @type {Integer (UInt32)}
     */
    static SCN_LNK_INFO => 512

    /**
     * Native name: IMAGE_SCN_LNK_REMOVE
     * @type {Integer (UInt32)}
     */
    static SCN_LNK_REMOVE => 2048

    /**
     * Native name: IMAGE_SCN_LNK_COMDAT
     * @type {Integer (UInt32)}
     */
    static SCN_LNK_COMDAT => 4096

    /**
     * Native name: IMAGE_SCN_NO_DEFER_SPEC_EXC
     * @type {Integer (UInt32)}
     */
    static SCN_NO_DEFER_SPEC_EXC => 16384

    /**
     * Native name: IMAGE_SCN_GPREL
     * @type {Integer (UInt32)}
     */
    static SCN_GPREL => 32768

    /**
     * Native name: IMAGE_SCN_MEM_FARDATA
     * @type {Integer (UInt32)}
     */
    static SCN_MEM_FARDATA => 32768

    /**
     * Native name: IMAGE_SCN_MEM_PURGEABLE
     * @type {Integer (UInt32)}
     */
    static SCN_MEM_PURGEABLE => 131072

    /**
     * Native name: IMAGE_SCN_MEM_16BIT
     * @type {Integer (UInt32)}
     */
    static SCN_MEM_16BIT => 131072

    /**
     * Native name: IMAGE_SCN_MEM_LOCKED
     * @type {Integer (UInt32)}
     */
    static SCN_MEM_LOCKED => 262144

    /**
     * Native name: IMAGE_SCN_MEM_PRELOAD
     * @type {Integer (UInt32)}
     */
    static SCN_MEM_PRELOAD => 524288

    /**
     * Native name: IMAGE_SCN_ALIGN_1BYTES
     * @type {Integer (UInt32)}
     */
    static SCN_ALIGN_1BYTES => 1048576

    /**
     * Native name: IMAGE_SCN_ALIGN_2BYTES
     * @type {Integer (UInt32)}
     */
    static SCN_ALIGN_2BYTES => 2097152

    /**
     * Native name: IMAGE_SCN_ALIGN_4BYTES
     * @type {Integer (UInt32)}
     */
    static SCN_ALIGN_4BYTES => 3145728

    /**
     * Native name: IMAGE_SCN_ALIGN_8BYTES
     * @type {Integer (UInt32)}
     */
    static SCN_ALIGN_8BYTES => 4194304

    /**
     * Native name: IMAGE_SCN_ALIGN_16BYTES
     * @type {Integer (UInt32)}
     */
    static SCN_ALIGN_16BYTES => 5242880

    /**
     * Native name: IMAGE_SCN_ALIGN_32BYTES
     * @type {Integer (UInt32)}
     */
    static SCN_ALIGN_32BYTES => 6291456

    /**
     * Native name: IMAGE_SCN_ALIGN_64BYTES
     * @type {Integer (UInt32)}
     */
    static SCN_ALIGN_64BYTES => 7340032

    /**
     * Native name: IMAGE_SCN_ALIGN_128BYTES
     * @type {Integer (UInt32)}
     */
    static SCN_ALIGN_128BYTES => 8388608

    /**
     * Native name: IMAGE_SCN_ALIGN_256BYTES
     * @type {Integer (UInt32)}
     */
    static SCN_ALIGN_256BYTES => 9437184

    /**
     * Native name: IMAGE_SCN_ALIGN_512BYTES
     * @type {Integer (UInt32)}
     */
    static SCN_ALIGN_512BYTES => 10485760

    /**
     * Native name: IMAGE_SCN_ALIGN_1024BYTES
     * @type {Integer (UInt32)}
     */
    static SCN_ALIGN_1024BYTES => 11534336

    /**
     * Native name: IMAGE_SCN_ALIGN_2048BYTES
     * @type {Integer (UInt32)}
     */
    static SCN_ALIGN_2048BYTES => 12582912

    /**
     * Native name: IMAGE_SCN_ALIGN_4096BYTES
     * @type {Integer (UInt32)}
     */
    static SCN_ALIGN_4096BYTES => 13631488

    /**
     * Native name: IMAGE_SCN_ALIGN_8192BYTES
     * @type {Integer (UInt32)}
     */
    static SCN_ALIGN_8192BYTES => 14680064

    /**
     * Native name: IMAGE_SCN_ALIGN_MASK
     * @type {Integer (UInt32)}
     */
    static SCN_ALIGN_MASK => 15728640

    /**
     * Native name: IMAGE_SCN_LNK_NRELOC_OVFL
     * @type {Integer (UInt32)}
     */
    static SCN_LNK_NRELOC_OVFL => 16777216

    /**
     * Native name: IMAGE_SCN_MEM_DISCARDABLE
     * @type {Integer (UInt32)}
     */
    static SCN_MEM_DISCARDABLE => 33554432

    /**
     * Native name: IMAGE_SCN_MEM_NOT_CACHED
     * @type {Integer (UInt32)}
     */
    static SCN_MEM_NOT_CACHED => 67108864

    /**
     * Native name: IMAGE_SCN_MEM_NOT_PAGED
     * @type {Integer (UInt32)}
     */
    static SCN_MEM_NOT_PAGED => 134217728

    /**
     * Native name: IMAGE_SCN_MEM_SHARED
     * @type {Integer (UInt32)}
     */
    static SCN_MEM_SHARED => 268435456

    /**
     * Native name: IMAGE_SCN_MEM_EXECUTE
     * @type {Integer (UInt32)}
     */
    static SCN_MEM_EXECUTE => 536870912

    /**
     * Native name: IMAGE_SCN_MEM_READ
     * @type {Integer (UInt32)}
     */
    static SCN_MEM_READ => 1073741824

    /**
     * Native name: IMAGE_SCN_MEM_WRITE
     * @type {Integer (UInt32)}
     */
    static SCN_MEM_WRITE => 2147483648

    /**
     * Native name: IMAGE_SCN_SCALE_INDEX
     * @type {Integer (UInt32)}
     */
    static SCN_SCALE_INDEX => 1
}
