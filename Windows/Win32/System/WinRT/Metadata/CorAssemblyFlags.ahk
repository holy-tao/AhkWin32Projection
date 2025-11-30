#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorAssemblyFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static afPublicKey => 1

    /**
     * @type {Integer (Int32)}
     */
    static afPA_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static afPA_MSIL => 16

    /**
     * @type {Integer (Int32)}
     */
    static afPA_x86 => 32

    /**
     * @type {Integer (Int32)}
     */
    static afPA_IA64 => 48

    /**
     * @type {Integer (Int32)}
     */
    static afPA_AMD64 => 64

    /**
     * @type {Integer (Int32)}
     */
    static afPA_ARM => 80

    /**
     * @type {Integer (Int32)}
     */
    static afPA_NoPlatform => 112

    /**
     * @type {Integer (Int32)}
     */
    static afPA_Specified => 128

    /**
     * @type {Integer (Int32)}
     */
    static afPA_Mask => 112

    /**
     * @type {Integer (Int32)}
     */
    static afPA_FullMask => 240

    /**
     * @type {Integer (Int32)}
     */
    static afPA_Shift => 4

    /**
     * @type {Integer (Int32)}
     */
    static afEnableJITcompileTracking => 32768

    /**
     * @type {Integer (Int32)}
     */
    static afDisableJITcompileOptimizer => 16384

    /**
     * @type {Integer (Int32)}
     */
    static afRetargetable => 256

    /**
     * @type {Integer (Int32)}
     */
    static afContentType_Default => 0

    /**
     * @type {Integer (Int32)}
     */
    static afContentType_WindowsRuntime => 512

    /**
     * @type {Integer (Int32)}
     */
    static afContentType_Mask => 3584
}
