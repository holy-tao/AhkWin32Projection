#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the different data types of WinML tensors.
 * @see https://docs.microsoft.com/windows/win32/api//winml/ne-winml-winml_tensor_data_type
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class WINML_TENSOR_DATA_TYPE extends Win32Enum{

    /**
     * Tensor data type undefined.
     * @type {Integer (Int32)}
     */
    static WINML_TENSOR_UNDEFINED => 0

    /**
     * Tensor of data type float.
     * @type {Integer (Int32)}
     */
    static WINML_TENSOR_FLOAT => 1

    /**
     * Tensor of data type uint8.
     * @type {Integer (Int32)}
     */
    static WINML_TENSOR_UINT8 => 2

    /**
     * Tensor of data type int8.
     * @type {Integer (Int32)}
     */
    static WINML_TENSOR_INT8 => 3

    /**
     * Tensor of data type uint16.
     * @type {Integer (Int32)}
     */
    static WINML_TENSOR_UINT16 => 4

    /**
     * Tensor of data type int16.
     * @type {Integer (Int32)}
     */
    static WINML_TENSOR_INT16 => 5

    /**
     * Tensor of data type int32.
     * @type {Integer (Int32)}
     */
    static WINML_TENSOR_INT32 => 6

    /**
     * Tensor of data type int64.
     * @type {Integer (Int32)}
     */
    static WINML_TENSOR_INT64 => 7

    /**
     * Tensor of data type string.
     * @type {Integer (Int32)}
     */
    static WINML_TENSOR_STRING => 8

    /**
     * Tensor of data type Boolean.
     * @type {Integer (Int32)}
     */
    static WINML_TENSOR_BOOLEAN => 9

    /**
     * Tensor of data type float16.
     * @type {Integer (Int32)}
     */
    static WINML_TENSOR_FLOAT16 => 10

    /**
     * Tensor of data type double.
     * @type {Integer (Int32)}
     */
    static WINML_TENSOR_DOUBLE => 11

    /**
     * Tensor of data type uint32.
     * @type {Integer (Int32)}
     */
    static WINML_TENSOR_UINT32 => 12

    /**
     * Tensor of data type uint64.
     * @type {Integer (Int32)}
     */
    static WINML_TENSOR_UINT64 => 13

    /**
     * Tensor of data type complex64.
     * @type {Integer (Int32)}
     */
    static WINML_TENSOR_COMPLEX64 => 14

    /**
     * Tensor of data type complex128.
     * @type {Integer (Int32)}
     */
    static WINML_TENSOR_COMPLEX128 => 15
}
