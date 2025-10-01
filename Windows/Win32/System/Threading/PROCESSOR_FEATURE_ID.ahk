#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESSOR_FEATURE_ID{

    /**
     * @type {Integer (UInt32)}
     */
    static PF_FLOATING_POINT_PRECISION_ERRATA => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PF_FLOATING_POINT_EMULATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PF_COMPARE_EXCHANGE_DOUBLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PF_MMX_INSTRUCTIONS_AVAILABLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PF_PPC_MOVEMEM_64BIT_OK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ALPHA_BYTE_INSTRUCTIONS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PF_XMMI_INSTRUCTIONS_AVAILABLE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PF_3DNOW_INSTRUCTIONS_AVAILABLE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PF_RDTSC_INSTRUCTION_AVAILABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PF_PAE_ENABLED => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PF_XMMI64_INSTRUCTIONS_AVAILABLE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PF_SSE_DAZ_MODE_AVAILABLE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PF_NX_ENABLED => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PF_SSE3_INSTRUCTIONS_AVAILABLE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PF_COMPARE_EXCHANGE128 => 14

    /**
     * @type {Integer (UInt32)}
     */
    static PF_COMPARE64_EXCHANGE128 => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PF_CHANNELS_ENABLED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PF_XSAVE_ENABLED => 17

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_VFP_32_REGISTERS_AVAILABLE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_NEON_INSTRUCTIONS_AVAILABLE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static PF_SECOND_LEVEL_ADDRESS_TRANSLATION => 20

    /**
     * @type {Integer (UInt32)}
     */
    static PF_VIRT_FIRMWARE_ENABLED => 21

    /**
     * @type {Integer (UInt32)}
     */
    static PF_RDWRFSGSBASE_AVAILABLE => 22

    /**
     * @type {Integer (UInt32)}
     */
    static PF_FASTFAIL_AVAILABLE => 23

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_DIVIDE_INSTRUCTION_AVAILABLE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_64BIT_LOADSTORE_ATOMIC => 25

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_EXTERNAL_CACHE_AVAILABLE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_FMAC_INSTRUCTIONS_AVAILABLE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static PF_RDRAND_INSTRUCTION_AVAILABLE => 28

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_V8_INSTRUCTIONS_AVAILABLE => 29

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_V8_CRYPTO_INSTRUCTIONS_AVAILABLE => 30

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_V8_CRC32_INSTRUCTIONS_AVAILABLE => 31

    /**
     * @type {Integer (UInt32)}
     */
    static PF_RDTSCP_INSTRUCTION_AVAILABLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PF_RDPID_INSTRUCTION_AVAILABLE => 33

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_V81_ATOMIC_INSTRUCTIONS_AVAILABLE => 34

    /**
     * @type {Integer (UInt32)}
     */
    static PF_MONITORX_INSTRUCTION_AVAILABLE => 35

    /**
     * @type {Integer (UInt32)}
     */
    static PF_SSSE3_INSTRUCTIONS_AVAILABLE => 36

    /**
     * @type {Integer (UInt32)}
     */
    static PF_SSE4_1_INSTRUCTIONS_AVAILABLE => 37

    /**
     * @type {Integer (UInt32)}
     */
    static PF_SSE4_2_INSTRUCTIONS_AVAILABLE => 38

    /**
     * @type {Integer (UInt32)}
     */
    static PF_AVX_INSTRUCTIONS_AVAILABLE => 39

    /**
     * @type {Integer (UInt32)}
     */
    static PF_AVX2_INSTRUCTIONS_AVAILABLE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static PF_AVX512F_INSTRUCTIONS_AVAILABLE => 41

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ERMS_AVAILABLE => 42

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_V82_DP_INSTRUCTIONS_AVAILABLE => 43

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_V83_JSCVT_INSTRUCTIONS_AVAILABLE => 44

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_V83_LRCPC_INSTRUCTIONS_AVAILABLE => 45

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_SVE_INSTRUCTIONS_AVAILABLE => 46

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_SVE2_INSTRUCTIONS_AVAILABLE => 47

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_SVE2_1_INSTRUCTIONS_AVAILABLE => 48

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_SVE_AES_INSTRUCTIONS_AVAILABLE => 49

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_SVE_PMULL128_INSTRUCTIONS_AVAILABLE => 50

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_SVE_BITPERM_INSTRUCTIONS_AVAILABLE => 51

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_SVE_BF16_INSTRUCTIONS_AVAILABLE => 52

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_SVE_EBF16_INSTRUCTIONS_AVAILABLE => 53

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_SVE_B16B16_INSTRUCTIONS_AVAILABLE => 54

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_SVE_SHA3_INSTRUCTIONS_AVAILABLE => 55

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_SVE_SM4_INSTRUCTIONS_AVAILABLE => 56

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_SVE_I8MM_INSTRUCTIONS_AVAILABLE => 57

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_SVE_F32MM_INSTRUCTIONS_AVAILABLE => 58

    /**
     * @type {Integer (UInt32)}
     */
    static PF_ARM_SVE_F64MM_INSTRUCTIONS_AVAILABLE => 59

    /**
     * @type {Integer (UInt32)}
     */
    static PF_BMI2_INSTRUCTIONS_AVAILABLE => 60

    /**
     * @type {Integer (UInt32)}
     */
    static PF_MOVDIR64B_INSTRUCTION_AVAILABLE => 61
}
