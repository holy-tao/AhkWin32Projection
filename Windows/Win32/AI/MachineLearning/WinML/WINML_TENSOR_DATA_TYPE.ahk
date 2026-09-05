#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the different data types of WinML tensors.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ne-winml-winml_tensor_data_type
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
class WINML_TENSOR_DATA_TYPE extends Win32Enum {

    /**
     * Tensor data type undefined.
     * Native name: WINML_TENSOR_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 0

    /**
     * Tensor of data type float.
     * Native name: WINML_TENSOR_FLOAT
     * @type {Integer (Int32)}
     */
    static FLOAT => 1

    /**
     * Tensor of data type uint8.
     * Native name: WINML_TENSOR_UINT8
     * @type {Integer (Int32)}
     */
    static UINT8 => 2

    /**
     * Tensor of data type int8.
     * Native name: WINML_TENSOR_INT8
     * @type {Integer (Int32)}
     */
    static INT8 => 3

    /**
     * Tensor of data type uint16.
     * Native name: WINML_TENSOR_UINT16
     * @type {Integer (Int32)}
     */
    static UINT16 => 4

    /**
     * Tensor of data type int16.
     * Native name: WINML_TENSOR_INT16
     * @type {Integer (Int32)}
     */
    static INT16 => 5

    /**
     * Tensor of data type int32.
     * Native name: WINML_TENSOR_INT32
     * @type {Integer (Int32)}
     */
    static INT32 => 6

    /**
     * Tensor of data type int64.
     * Native name: WINML_TENSOR_INT64
     * @type {Integer (Int32)}
     */
    static INT64 => 7

    /**
     * Tensor of data type string.
     * Native name: WINML_TENSOR_STRING
     * @type {Integer (Int32)}
     */
    static STRING => 8

    /**
     * Tensor of data type Boolean.
     * Native name: WINML_TENSOR_BOOLEAN
     * @type {Integer (Int32)}
     */
    static BOOLEAN => 9

    /**
     * Tensor of data type float16.
     * Native name: WINML_TENSOR_FLOAT16
     * @type {Integer (Int32)}
     */
    static FLOAT16 => 10

    /**
     * Tensor of data type double.
     * Native name: WINML_TENSOR_DOUBLE
     * @type {Integer (Int32)}
     */
    static DOUBLE => 11

    /**
     * Tensor of data type uint32.
     * Native name: WINML_TENSOR_UINT32
     * @type {Integer (Int32)}
     */
    static UINT32 => 12

    /**
     * Tensor of data type uint64.
     * Native name: WINML_TENSOR_UINT64
     * @type {Integer (Int32)}
     */
    static UINT64 => 13

    /**
     * Tensor of data type complex64.
     * Native name: WINML_TENSOR_COMPLEX64
     * @type {Integer (Int32)}
     */
    static COMPLEX64 => 14

    /**
     * Tensor of data type complex128.
     * Native name: WINML_TENSOR_COMPLEX128
     * @type {Integer (Int32)}
     */
    static COMPLEX128 => 15
}
