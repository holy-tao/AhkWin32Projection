#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the specific reduction algorithm to use for the DirectML reduce operator (as described by the DML_REDUCE_OPERATOR_DESC structure).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_reduce_function
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_REDUCE_FUNCTION extends Win32Enum{

    /**
     * Indicates a reduction function that computes the indices of the max elements of the input tensor's elements along the specified axis, int32 {i j k ..} = maxindex(X Y Z …).
     * @type {Integer (Int32)}
     */
    static DML_REDUCE_FUNCTION_ARGMAX => 0

    /**
     * Indicates a reduction function that computes the indices of the min elements of the input tensor's elements along the specified axis, int32 {i j k ..} = minindex(X Y Z …).
     * @type {Integer (Int32)}
     */
    static DML_REDUCE_FUNCTION_ARGMIN => 1

    /**
     * Indicates a reduction function that computes the mean of the input tensor's elements along the specified axes, x = (x1 + x2 + ... + xn) / n.
     * @type {Integer (Int32)}
     */
    static DML_REDUCE_FUNCTION_AVERAGE => 2

    /**
     * Indicates a reduction function that computes the L1 norm of the input tensor's elements along the specified axes, x = \|x1\| + \|x2\| + ... + \|xn\|.
     * @type {Integer (Int32)}
     */
    static DML_REDUCE_FUNCTION_L1 => 3

    /**
     * Indicates a reduction function that computes the L2 norm of the input tensor's elements along the specified axes, x = sqrt(x1^2 + x2^2 + ... + xn^2).
     * @type {Integer (Int32)}
     */
    static DML_REDUCE_FUNCTION_L2 => 4

    /**
     * Indicates a reduction function that computes the log sum of the input tensor's elements along the specified axes, x = log(x1 + x2 + ... + xn).
     * @type {Integer (Int32)}
     */
    static DML_REDUCE_FUNCTION_LOG_SUM => 5

    /**
     * Indicates a reduction function that computes the log sum exponent of the input tensor's elements along the specified axes, x = log(exp(x1) + exp(x2) + ... + exp(xn)).
     * @type {Integer (Int32)}
     */
    static DML_REDUCE_FUNCTION_LOG_SUM_EXP => 6

    /**
     * Indicates a reduction function that computes the max of the input tensor's elements along the specified axes, x = max(max(max(x1, x2), x3), ..., xn).
     * @type {Integer (Int32)}
     */
    static DML_REDUCE_FUNCTION_MAX => 7

    /**
     * Indicates a reduction function that computes the min of the input tensor's elements along the specified axes, x = min(min(min(x1, x2), x3), ..., xn).
     * @type {Integer (Int32)}
     */
    static DML_REDUCE_FUNCTION_MIN => 8

    /**
     * Indicates a reduction function that computes the product of the input tensor's elements along the specified axes, x = (x1 * x2 * ... * xn).
     * @type {Integer (Int32)}
     */
    static DML_REDUCE_FUNCTION_MULTIPLY => 9

    /**
     * Indicates a reduction function that computes the sum  of the input tensor's elements along the specified axes, x = (x1 + x2 + ... + xn).
     * @type {Integer (Int32)}
     */
    static DML_REDUCE_FUNCTION_SUM => 10

    /**
     * Indicates a reduction function that computes the sum square of the input tensor's elements along the specified axes, x = x1^2 + x2^2 + ... + xn^2.
     * @type {Integer (Int32)}
     */
    static DML_REDUCE_FUNCTION_SUM_SQUARE => 11
}
