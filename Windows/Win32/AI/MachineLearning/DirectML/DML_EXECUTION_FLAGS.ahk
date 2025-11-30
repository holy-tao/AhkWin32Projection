#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Supplies options to DirectML to control execution of operators. These flags can be bitwise OR'd together to specify multiple flags at once.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ne-directml-dml_execution_flags
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_EXECUTION_FLAGS extends Win32BitflagEnum{

    /**
     * No execution flags are specified.
     * @type {Integer (Int32)}
     */
    static DML_EXECUTION_FLAG_NONE => 0

    /**
     * Allows DirectML to perform computation using half-precision floating-point (FP16), if supported by the hardware device.
     * @type {Integer (Int32)}
     */
    static DML_EXECUTION_FLAG_ALLOW_HALF_PRECISION_COMPUTATION => 1

    /**
     * Forces DirectML execute the operator using DirectCompute instead of meta commands. DirectML uses meta commands by default, if available.
     * @type {Integer (Int32)}
     */
    static DML_EXECUTION_FLAG_DISABLE_META_COMMANDS => 2

    /**
     * Allows changes to bindings after an operator's execution has been recorded in a command list, but before it has been submitted to the command queue. By default, without this flag set, you must set all bindings on the binding table before you record an operator into a command list.
     * 
     * This flag allows you to perform late binding—that is, to set (or to change) bindings on operators that you've already recorded into a command list. However, this may result in a performance penalty on some hardware, as it prohibits drivers from promoting static descriptor accesses to root descriptor accesses.
     * 
     * For more info, see <a href="https://docs.microsoft.com/windows/win32/direct3d12/root-signature-version-1-1#descriptors_volatile">DESCRIPTORS_VOLATILE</a>.
     * @type {Integer (Int32)}
     */
    static DML_EXECUTION_FLAG_DESCRIPTORS_VOLATILE => 4
}
