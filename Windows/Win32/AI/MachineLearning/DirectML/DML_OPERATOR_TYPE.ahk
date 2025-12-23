#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the type of an operator description.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_operator_type
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_OPERATOR_TYPE extends Win32Enum{

    /**
     * Indicates an unknown operator type, and is never valid. Using this value results in an error.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_INVALID => 0

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_identity_operator_desc">DML_ELEMENT_WISE_IDENTITY_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_IDENTITY => 1

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_abs_operator_desc">DML_ELEMENT_WISE_ABS_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_ABS => 2

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_acos_operator_desc">DML_ELEMENT_WISE_ACOS_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_ACOS => 3

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_add_operator_desc">DML_ELEMENT_WISE_ADD_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_ADD => 4

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_asin_operator_desc">DML_ELEMENT_WISE_ASIN_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_ASIN => 5

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_atan_operator_desc">DML_ELEMENT_WISE_ATAN_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_ATAN => 6

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_ceil_operator_desc">DML_ELEMENT_WISE_CEIL_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_CEIL => 7

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_clip_operator_desc">DML_ELEMENT_WISE_CLIP_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_CLIP => 8

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_cos_operator_desc">DML_ELEMENT_WISE_COS_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_COS => 9

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_divide_operator_desc">DML_ELEMENT_WISE_DIVIDE_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_DIVIDE => 10

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_exp_operator_desc">DML_ELEMENT_WISE_EXP_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_EXP => 11

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_floor_operator_desc">DML_ELEMENT_WISE_FLOOR_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_FLOOR => 12

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_log_operator_desc">DML_ELEMENT_WISE_LOG_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_LOG => 13

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_logical_and_operator_desc">DML_ELEMENT_WISE_LOGICAL_AND_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_LOGICAL_AND => 14

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_logical_equals_operator_desc">DML_ELEMENT_WISE_LOGICAL_EQUALS_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_LOGICAL_EQUALS => 15

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_logical_greater_than_operator_desc">DML_ELEMENT_WISE_LOGICAL_GREATER_THAN_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_LOGICAL_GREATER_THAN => 16

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_logical_less_than_operator_desc">DML_ELEMENT_WISE_LOGICAL_LESS_THAN_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_LOGICAL_LESS_THAN => 17

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_logical_not_operator_desc">DML_ELEMENT_WISE_LOGICAL_NOT_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_LOGICAL_NOT => 18

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_logical_or_operator_desc">DML_ELEMENT_WISE_LOGICAL_OR_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_LOGICAL_OR => 19

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_logical_xor_operator_desc">DML_ELEMENT_WISE_LOGICAL_XOR_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_LOGICAL_XOR => 20

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_max_operator_desc">DML_ELEMENT_WISE_MAX_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_MAX => 21

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_mean_operator_desc">DML_ELEMENT_WISE_MEAN_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_MEAN => 22

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_min_operator_desc">DML_ELEMENT_WISE_MIN_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_MIN => 23

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_multiply_operator_desc">DML_ELEMENT_WISE_MULTIPLY_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_MULTIPLY => 24

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_pow_operator_desc">DML_ELEMENT_WISE_POW_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_POW => 25

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_constant_pow_operator_desc">DML_ELEMENT_WISE_CONSTANT_POW_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_CONSTANT_POW => 26

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_recip_operator_desc">DML_ELEMENT_WISE_RECIP_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_RECIP => 27

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_sin_operator_desc">DML_ELEMENT_WISE_SIN_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_SIN => 28

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_sqrt_operator_desc">DML_ELEMENT_WISE_SQRT_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_SQRT => 29

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_subtract_operator_desc">DML_ELEMENT_WISE_SUBTRACT_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_SUBTRACT => 30

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_tan_operator_desc">DML_ELEMENT_WISE_TAN_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_TAN => 31

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_threshold_operator_desc">DML_ELEMENT_WISE_THRESHOLD_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_THRESHOLD => 32

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_quantize_linear_operator_desc">DML_ELEMENT_WISE_QUANTIZE_LINEAR_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_QUANTIZE_LINEAR => 33

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_dequantize_linear_operator_desc">DML_ELEMENT_WISE_DEQUANTIZE_LINEAR_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_DEQUANTIZE_LINEAR => 34

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_elu_operator_desc">DML_ACTIVATION_ELU_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_ELU => 35

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_hardmax_operator_desc">DML_ACTIVATION_HARDMAX_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_HARDMAX => 36

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_hard_sigmoid_operator_desc">DML_ACTIVATION_HARD_SIGMOID_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_HARD_SIGMOID => 37

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_identity_operator_desc">DML_ACTIVATION_IDENTITY_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_IDENTITY => 38

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_leaky_relu_operator_desc">DML_ACTIVATION_LEAKY_RELU_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_LEAKY_RELU => 39

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_linear_operator_desc">DML_ACTIVATION_LINEAR_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_LINEAR => 40

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_log_softmax_operator_desc">DML_ACTIVATION_LOG_SOFTMAX_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_LOG_SOFTMAX => 41

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_parameterized_relu_operator_desc">DML_ACTIVATION_PARAMETERIZED_RELU_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_PARAMETERIZED_RELU => 42

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_parametric_softplus_operator_desc">DML_ACTIVATION_PARAMETRIC_SOFTPLUS_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_PARAMETRIC_SOFTPLUS => 43

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_relu_operator_desc">DML_ACTIVATION_RELU_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_RELU => 44

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_scaled_elu_operator_desc">DML_ACTIVATION_SCALED_ELU_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_SCALED_ELU => 45

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_scaled_tanh_operator_desc">DML_ACTIVATION_SCALED_TANH_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_SCALED_TANH => 46

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_sigmoid_operator_desc">DML_ACTIVATION_SIGMOID_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_SIGMOID => 47

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_softmax_operator_desc">DML_ACTIVATION_SOFTMAX_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_SOFTMAX => 48

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_softplus_operator_desc">DML_ACTIVATION_SOFTPLUS_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_SOFTPLUS => 49

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_softsign_operator_desc">DML_ACTIVATION_SOFTSIGN_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_SOFTSIGN => 50

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_tanh_operator_desc">DML_ACTIVATION_TANH_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_TANH => 51

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_thresholded_relu_operator_desc">DML_ACTIVATION_THRESHOLDED_RELU_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_THRESHOLDED_RELU => 52

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_convolution_operator_desc">DML_CONVOLUTION_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_CONVOLUTION => 53

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_gemm_operator_desc">DML_GEMM_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_GEMM => 54

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_reduce_operator_desc">DML_REDUCE_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_REDUCE => 55

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_average_pooling_operator_desc">DML_AVERAGE_POOLING_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_AVERAGE_POOLING => 56

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_lp_pooling_operator_desc">DML_LP_POOLING_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_LP_POOLING => 57

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_max_pooling_operator_desc">DML_MAX_POOLING_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_MAX_POOLING => 58

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_roi_pooling_operator_desc">DML_ROI_POOLING_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ROI_POOLING => 59

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_slice_operator_desc">DML_SLICE_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_SLICE => 60

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_cast_operator_desc">DML_CAST_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_CAST => 61

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_split_operator_desc">DML_SPLIT_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_SPLIT => 62

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_join_operator_desc">DML_JOIN_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_JOIN => 63

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_padding_operator_desc">DML_PADDING_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_PADDING => 64

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_value_scale_2d_operator_desc">DML_VALUE_SCALE_2D_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_VALUE_SCALE_2D => 65

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_upsample_2d_operator_desc">DML_UPSAMPLE_2D_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_UPSAMPLE_2D => 66

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_gather_operator_desc">DML_GATHER_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_GATHER => 67

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_space_to_depth_operator_desc">DML_SPACE_TO_DEPTH_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_SPACE_TO_DEPTH => 68

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_depth_to_space_operator_desc">DML_DEPTH_TO_SPACE_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_DEPTH_TO_SPACE => 69

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_tile_operator_desc">DML_TILE_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_TILE => 70

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_top_k_operator_desc">DML_TOP_K_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_TOP_K => 71

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_batch_normalization_operator_desc">DML_BATCH_NORMALIZATION_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_BATCH_NORMALIZATION => 72

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_mean_variance_normalization_operator_desc">DML_MEAN_VARIANCE_NORMALIZATION_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_MEAN_VARIANCE_NORMALIZATION => 73

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_local_response_normalization_operator_desc">DML_LOCAL_RESPONSE_NORMALIZATION_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_LOCAL_RESPONSE_NORMALIZATION => 74

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_lp_normalization_operator_desc">DML_LP_NORMALIZATION_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_LP_NORMALIZATION => 75

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_rnn_operator_desc">DML_RNN_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_RNN => 76

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_lstm_operator_desc">DML_LSTM_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_LSTM => 77

    /**
     * Indicates the operator described by the <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_gru_operator_desc">DML_GRU_OPERATOR_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_GRU => 78

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_SIGN_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_sign_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_SIGN => 79

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_IS_NAN_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_is_nan_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_IS_NAN => 80

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_ERF_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_erf_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_ERF => 81

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_SINH_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_sinh_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_SINH => 82

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_COSH_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_cosh_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_COSH => 83

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_TANH_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_tanh_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_TANH => 84

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_ASINH_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_asinh_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_ASINH => 85

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_ACOSH_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_acosh_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_ACOSH => 86

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_ATANH_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_atanh_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_ATANH => 87

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_IF_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_if_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_IF => 88

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_ADD1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_add1_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_ADD1 => 89

    /**
     * Indicates the operator described by the [DML_ACTIVATION_SHRINK_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_activation_shrink_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_SHRINK => 90

    /**
     * Indicates the operator described by the [DML_MAX_POOLING1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling1_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_MAX_POOLING1 => 91

    /**
     * Indicates the operator described by the [DML_MAX_UNPOOLING_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_unpooling_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_MAX_UNPOOLING => 92

    /**
     * Indicates the operator described by the [DML_DIAGONAL_MATRIX_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_diagonal_matrix_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_DIAGONAL_MATRIX => 93

    /**
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_SCATTER_ELEMENTS => 94

    /**
     * Indicates the operator described by the [DML_SCATTER_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_scatter_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_SCATTER => 94

    /**
     * Indicates the operator described by the [DML_ONE_HOT_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_one_hot_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ONE_HOT => 95

    /**
     * Indicates the operator described by the [DML_RESAMPLE_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_resample_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_RESAMPLE => 96

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_BIT_SHIFT_LEFT_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_bit_shift_left_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_BIT_SHIFT_LEFT => 97

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_BIT_SHIFT_RIGHT_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_bit_shift_right_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_BIT_SHIFT_RIGHT => 98

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_ROUND_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_round_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_ROUND => 99

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_IS_INFINITY_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_is_infinity_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_IS_INFINITY => 100

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_MODULUS_TRUNCATE_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_modulus_truncate_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_MODULUS_TRUNCATE => 101

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_MODULUS_FLOOR_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_modulus_floor_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_MODULUS_FLOOR => 102

    /**
     * Indicates the operator described by the [DML_FILL_VALUE_CONSTANT_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_fill_value_constant_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_FILL_VALUE_CONSTANT => 103

    /**
     * Indicates the operator described by the [DML_FILL_VALUE_SEQUENCE_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_fill_value_sequence_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_FILL_VALUE_SEQUENCE => 104

    /**
     * Indicates the operator described by the [DML_CUMULATIVE_SUMMATION_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_cumulative_summation_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_CUMULATIVE_SUMMATION => 105

    /**
     * Indicates the operator described by the [DML_REVERSE_SUBSEQUENCES_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_reverse_subsequences_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_REVERSE_SUBSEQUENCES => 106

    /**
     * Indicates the operator described by the [DML_GATHER_ELEMENTS_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_gather_elements_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_GATHER_ELEMENTS => 107

    /**
     * Indicates the operator described by the [DML_GATHER_ND_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_gather_nd_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_GATHER_ND => 108

    /**
     * Indicates the operator described by the [DML_SCATTER_ND_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_scatter_nd_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_SCATTER_ND => 109

    /**
     * Indicates the operator described by the [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_MAX_POOLING2 => 110

    /**
     * Indicates the operator described by the [DML_SLICE1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_slice1_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_SLICE1 => 111

    /**
     * Indicates the operator described by the [DML_TOP_K1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_top_k1_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_TOP_K1 => 112

    /**
     * Indicates the operator described by the [DML_DEPTH_TO_SPACE1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_depth_to_space1_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_DEPTH_TO_SPACE1 => 113

    /**
     * Indicates the operator described by the [DML_SPACE_TO_DEPTH1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_space_to_depth1_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_SPACE_TO_DEPTH1 => 114

    /**
     * Indicates the operator described by the [DML_MEAN_VARIANCE_NORMALIZATION1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_mean_variance_normalization1_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_MEAN_VARIANCE_NORMALIZATION1 => 115

    /**
     * Indicates the operator described by the [DML_RESAMPLE1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_resample1_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_RESAMPLE1 => 116

    /**
     * Indicates the operator described by the [DML_MATRIX_MULTIPLY_INTEGER_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_matrix_multiply_integer_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_MATRIX_MULTIPLY_INTEGER => 117

    /**
     * Indicates the operator described by the [DML_QUANTIZED_LINEAR_MATRIX_MULTIPLY_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_quantized_linear_matrix_multiply_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_QUANTIZED_LINEAR_MATRIX_MULTIPLY => 118

    /**
     * Indicates the operator described by the [DML_CONVOLUTION_INTEGER_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_convolution_integer_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_CONVOLUTION_INTEGER => 119

    /**
     * Indicates the operator described by the [DML_QUANTIZED_LINEAR_CONVOLUTION_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_quantized_linear_convolution_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_QUANTIZED_LINEAR_CONVOLUTION => 120

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_BIT_AND_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_bit_and_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_BIT_AND => 121

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_BIT_OR_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_bit_or_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_BIT_OR => 122

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_BIT_XOR_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_bit_xor_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_BIT_XOR => 123

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_BIT_NOT_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_bit_not_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_BIT_NOT => 124

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_BIT_COUNT_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_bit_count_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_BIT_COUNT => 125

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_LOGICAL_GREATER_THAN_OR_EQUAL_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_logical_greater_than_or_equal_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_LOGICAL_GREATER_THAN_OR_EQUAL => 126

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_LOGICAL_LESS_THAN_OR_EQUAL_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_logical_less_than_or_equal_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_LOGICAL_LESS_THAN_OR_EQUAL => 127

    /**
     * Indicates the operator described by the [DML_ACTIVATION_CELU_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_activation_celu_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_CELU => 128

    /**
     * Indicates the operator described by the [DML_ACTIVATION_RELU_GRAD_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_activation_relu_grad_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ACTIVATION_RELU_GRAD => 129

    /**
     * Indicates the operator described by the [DML_AVERAGE_POOLING_GRAD_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_average_pooling_grad_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_AVERAGE_POOLING_GRAD => 130

    /**
     * Indicates the operator described by the [DML_MAX_POOLING_GRAD_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling_grad_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_MAX_POOLING_GRAD => 131

    /**
     * Indicates the operator described by the [DML_RANDOM_GENERATOR_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_random_generator_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_RANDOM_GENERATOR => 132

    /**
     * Indicates the operator described by the [DML_NONZERO_COORDINATES_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_nonzero_coordinates_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_NONZERO_COORDINATES => 133

    /**
     * Indicates the operator described by the [DML_RESAMPLE_GRAD_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_resample_grad_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_RESAMPLE_GRAD => 134

    /**
     * Indicates the operator described by the [DML_SLICE_GRAD_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_slice_grad_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_SLICE_GRAD => 135

    /**
     * Indicates the operator described by the [DML_ADAM_OPTIMIZER_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_adam_optimizer_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ADAM_OPTIMIZER => 136

    /**
     * Indicates the operator described by the [DML_ARGMIN_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_argmin_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ARGMIN => 137

    /**
     * Indicates the operator described by the [DML_ARGMAX_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_argmax_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ARGMAX => 138

    /**
     * Indicates the operator described by the [DML_ROI_ALIGN_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_roi_align_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ROI_ALIGN => 139

    /**
     * Indicates the operator described by the [DML_GATHER_ND1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_gather_nd1_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_GATHER_ND1 => 140

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_ATAN_YX_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_atan_yx_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_ATAN_YX => 141

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_CLIP_GRAD_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_clip_grad_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_CLIP_GRAD => 142

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_DIFFERENCE_SQUARE_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_difference_square_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_DIFFERENCE_SQUARE => 143

    /**
     * Indicates the operator described by the [DML_LOCAL_RESPONSE_NORMALIZATION_GRAD_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_local_response_normalization_grad_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_LOCAL_RESPONSE_NORMALIZATION_GRAD => 144

    /**
     * Indicates the operator described by the [DML_CUMULATIVE_PRODUCT_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_cumulative_product_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_CUMULATIVE_PRODUCT => 145

    /**
     * Indicates the operator described by the [DML_BATCH_NORMALIZATION_GRAD_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_batch_normalization_grad_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_BATCH_NORMALIZATION_GRAD => 146

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_QUANTIZED_LINEAR_ADD_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_quantized_linear_add_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_QUANTIZED_LINEAR_ADD => 147

    /**
     * Indicates the operator described by the [DML_DYNAMIC_QUANTIZE_LINEAR_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_dynamic_quantize_linear_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_DYNAMIC_QUANTIZE_LINEAR => 148

    /**
     * Indicates the operator described by the [DML_ROI_ALIGN1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_roi_align1_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ROI_ALIGN1 => 149

    /**
     * Indicates the operator described by the [DML_ROI_ALIGN_GRAD_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_roi_align_grad_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ROI_ALIGN_GRAD => 150

    /**
     * Indicates the operator described by the [DML_BATCH_NORMALIZATION_TRAINING_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_batch_normalization_training_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_BATCH_NORMALIZATION_TRAINING => 151

    /**
     * Indicates the operator described by the [DML_BATCH_NORMALIZATION_TRAINING_GRAD_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_batch_normalization_training_grad_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_BATCH_NORMALIZATION_TRAINING_GRAD => 152

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_CLIP1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_clip1_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_CLIP1 => 153

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_CLIP_GRAD1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_clip_grad1_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_CLIP_GRAD1 => 154

    /**
     * Indicates the operator described by the [DML_PADDING1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_padding1_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_PADDING1 => 155

    /**
     * Indicates the operator described by the [DML_ELEMENT_WISE_NEGATE_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_negate_operator_desc) structure.
     * @type {Integer (Int32)}
     */
    static DML_OPERATOR_ELEMENT_WISE_NEGATE => 156
}
