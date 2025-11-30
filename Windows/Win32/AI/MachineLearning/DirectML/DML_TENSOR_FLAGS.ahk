#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies additional options in a tensor description. Values can be bitwise OR'd together.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ne-directml-dml_tensor_flags
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_TENSOR_FLAGS extends Win32BitflagEnum{

    /**
     * No options are specified.
     * @type {Integer (Int32)}
     */
    static DML_TENSOR_FLAG_NONE => 0

    /**
     * Indicates that the tensor data should be owned and managed by DirectML. The effect of this flag is that DirectML makes a copy of the tensor data during initialization of an operator, storing it in the persistent resource. This allows DirectML to perform reformatting of the tensor data into other, more efficient forms. Setting this flag may increase performance, but is typically only useful for tensors whose data doesn't change for the lifetime of the operator (for example, weight tensors).
     *       
     * This flag can only be used on input tensors.
     * 
     * When this flag is set on a particular tensor description, the corresponding tensor must be bound to the binding table during operator initialization, and not during execution. Attempting to bind the tensor during execution while this flag is set results in an error. This is the opposite of the default behavior (the behavior without the <b>DML_TENSOR_FLAG_OWNED_BY_DML</b> flag), where the tensor is expected to be bound during execution, and not during initialization.
     * @type {Integer (Int32)}
     */
    static DML_TENSOR_FLAG_OWNED_BY_DML => 1
}
