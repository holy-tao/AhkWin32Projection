#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_SECTION_CHARACTERISTICS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_TYPE_NO_PAD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_CNT_CODE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_CNT_INITIALIZED_DATA => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_CNT_UNINITIALIZED_DATA => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_LNK_OTHER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_LNK_INFO => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_LNK_REMOVE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_LNK_COMDAT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_NO_DEFER_SPEC_EXC => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_GPREL => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_MEM_FARDATA => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_MEM_PURGEABLE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_MEM_16BIT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_MEM_LOCKED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_MEM_PRELOAD => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_ALIGN_1BYTES => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_ALIGN_2BYTES => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_ALIGN_4BYTES => 3145728

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_ALIGN_8BYTES => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_ALIGN_16BYTES => 5242880

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_ALIGN_32BYTES => 6291456

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_ALIGN_64BYTES => 7340032

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_ALIGN_128BYTES => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_ALIGN_256BYTES => 9437184

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_ALIGN_512BYTES => 10485760

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_ALIGN_1024BYTES => 11534336

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_ALIGN_2048BYTES => 12582912

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_ALIGN_4096BYTES => 13631488

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_ALIGN_8192BYTES => 14680064

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_ALIGN_MASK => 15728640

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_LNK_NRELOC_OVFL => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_MEM_DISCARDABLE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_MEM_NOT_CACHED => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_MEM_NOT_PAGED => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_MEM_SHARED => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_MEM_EXECUTE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_MEM_READ => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_MEM_WRITE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SCN_SCALE_INDEX => 1
}
