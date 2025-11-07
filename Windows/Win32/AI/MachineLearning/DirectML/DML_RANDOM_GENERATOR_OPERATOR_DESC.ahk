#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Fills an output tensor with deterministically-generated, pseudo-random, uniformly-distributed bits. This operator optionally may also output an updated internal generator state, which can be used during subsequent executions of the operator.
 * @remarks
 * 
 * On each execution of this operator, the 128-bit counter should be incremented. If the *OutputStateTensor* is supplied, THEN this operator increments the counter with the correct value on your behalf, and writes the result into the *OutputStateTensor*. The amount it should be incremented by depends on the number of 32-bit output elements generated, and the type of the generator.
 * 
 * For **DML_RANDOM_GENERATOR_TYPE_PHILOX_4X32_10**, the 128-bit counter should be incremented by `ceil(outputSize / 4)` on each execution, where `outputSize` is the number of elements in the *OutputTensor*.
 * 
 * Consider an example where the value of the 128-bit counter is currently `0x48656c6c'6f46726f'6d536561'74746c65`, and the OutputTensor's size is `{3,3,20,7219}`. After executing this operator once, the counter should be incremented by 324,855 (the number of output elements generated divided by 4, rounded up) resulting in a counter value of `0x48656c6c'6f46726f'6d536561'746f776e`. This updated value should then be supplied as an input for the next execution of this operator.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_random_generator_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_RANDOM_GENERATOR_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An input tensor containing the internal generator state. The size and format of this input tensor depends on the [DML_RANDOM_GENERATOR_TYPE](/windows/win32/api/directml/ne-directml-dml_random_generator_type).
     * 
     * For **DML_RANDOM_GENERATOR_TYPE_PHILOX_4X32_10**, this tensor must be of type **UINT32**, and have sizes `{1,1,1,6}`. The first four 32-bit values contain a monotonically increasing 128-bit counter. The last two 32-bit values contain the 64-bit key value for the generator.
     * 
     * ```
     *     Element        0       1       2       3       4       5
     * (32-bits each) |-------|-------|-------|-------|-------|-------|
     *                 <--------128-bit counter------> <-64-bit key-->
     * ```
     * 
     * When initializing the generator's input state for the first time, typically the 128-bit counter (the first four 32-bit UINT32 values) should be initialized to 0. The key can be arbitrarily chosen; different key values will produce different sequences of numbers. The value for the key is usually generated using a user-provided *seed*.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputStateTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor which holds the resulting pseudo-random values. This tensor can be of any size.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional output tensor THAT holds the updated internal generator state. If supplied, this operator uses the *InputStateTensor* to compute an appropriate updated generator state, and writes the result into the *OutputStateTensor*. Typically, callers would save this result and supply it as the input state on a subsequent execution of this operator.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputStateTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **[DML_RANDOM_GENERATOR_TYPE](/windows/win32/api/directml/ne-directml-dml_random_generator_type)**
     * 
     * One of the values from the [DML_RANDOM_GENERATOR_TYPE](/windows/win32/api/directml/ne-directml-dml_random_generator_type) enum, indicating the type of generator to use. Currently the only valid value is **DML_RANDOM_GENERATOR_TYPE_PHILOX_4X32_10**, which generates pseudo-random numbers according to the [Philox 4x32-10 algorithm](http://www.thesalmons.org/john/random123/papers/random123sc11.pdf).
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
