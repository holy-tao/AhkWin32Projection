#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the data type of the values in a tensor. DirectML operators may not support all data types; see the documentation for each specific operator to find which data types it supports.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_tensor_data_type
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
class DML_TENSOR_DATA_TYPE extends Win32Enum {

    /**
     * Indicates an unknown data type. This value is never valid.
     * Native name: DML_TENSOR_DATA_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Indicates a 32-bit floating-point data type.
     * Native name: DML_TENSOR_DATA_TYPE_FLOAT32
     * @type {Integer (Int32)}
     */
    static FLOAT32 => 1

    /**
     * Indicates a 16-bit floating-point data type.
     * Native name: DML_TENSOR_DATA_TYPE_FLOAT16
     * @type {Integer (Int32)}
     */
    static FLOAT16 => 2

    /**
     * Indicates a 32-bit unsigned integer data type.
     * Native name: DML_TENSOR_DATA_TYPE_UINT32
     * @type {Integer (Int32)}
     */
    static UINT32 => 3

    /**
     * Indicates a 16-bit unsigned integer data type.
     * Native name: DML_TENSOR_DATA_TYPE_UINT16
     * @type {Integer (Int32)}
     */
    static UINT16 => 4

    /**
     * Indicates a 8-bit unsigned integer data type.
     * Native name: DML_TENSOR_DATA_TYPE_UINT8
     * @type {Integer (Int32)}
     */
    static UINT8 => 5

    /**
     * Indicates a 32-bit signed integer data type.
     * Native name: DML_TENSOR_DATA_TYPE_INT32
     * @type {Integer (Int32)}
     */
    static INT32 => 6

    /**
     * Indicates a 16-bit signed integer data type.
     * Native name: DML_TENSOR_DATA_TYPE_INT16
     * @type {Integer (Int32)}
     */
    static INT16 => 7

    /**
     * Indicates a 8-bit signed integer data type.
     * Native name: DML_TENSOR_DATA_TYPE_INT8
     * @type {Integer (Int32)}
     */
    static INT8 => 8

    /**
     * Native name: DML_TENSOR_DATA_TYPE_FLOAT64
     * @type {Integer (Int32)}
     */
    static FLOAT64 => 9

    /**
     * Native name: DML_TENSOR_DATA_TYPE_UINT64
     * @type {Integer (Int32)}
     */
    static UINT64 => 10

    /**
     * Native name: DML_TENSOR_DATA_TYPE_INT64
     * @type {Integer (Int32)}
     */
    static INT64 => 11
}
