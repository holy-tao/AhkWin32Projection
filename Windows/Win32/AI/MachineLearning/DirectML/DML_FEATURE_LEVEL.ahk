#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify a DirectML *feature level*. A feature level defines a broad umbrella of functionality supported by DirectML.
 * @remarks
 * The **DML_FEATURE_LEVEL_5_1** constant was introduced in `DML_FEATURE_LEVEL_5_1`. **DML_FEATURE_LEVEL_5_1** specifies [feature level 5_1](/windows/ai/directml/dml-feature-level-history#dml_feature_level_5_1).
  * 
  * The **DML_FEATURE_LEVEL_5_2** constant was introduced in `DML_FEATURE_LEVEL_5_2`. **DML_FEATURE_LEVEL_5_2** specifies [feature level 5_2](/windows/ai/directml/dml-feature-level-history#dml_feature_level_5_2).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_feature_level
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_FEATURE_LEVEL{

    /**
     * Specifies feature level 1_0.
     * @type {Integer (Int32)}
     */
    static DML_FEATURE_LEVEL_1_0 => 4096

    /**
     * Specifies feature level 2_0.
     * @type {Integer (Int32)}
     */
    static DML_FEATURE_LEVEL_2_0 => 8192

    /**
     * Specifies feature level 2_1.
     * @type {Integer (Int32)}
     */
    static DML_FEATURE_LEVEL_2_1 => 8448

    /**
     * Specifies feature level 3_0.
     * @type {Integer (Int32)}
     */
    static DML_FEATURE_LEVEL_3_0 => 12288

    /**
     * Specifies feature level 3_1.
     * @type {Integer (Int32)}
     */
    static DML_FEATURE_LEVEL_3_1 => 12544

    /**
     * Specifies feature level 4_0.
     * @type {Integer (Int32)}
     */
    static DML_FEATURE_LEVEL_4_0 => 16384

    /**
     * Specifies feature level 4_1.
     * @type {Integer (Int32)}
     */
    static DML_FEATURE_LEVEL_4_1 => 16640

    /**
     * Specifies feature level 5_0.
     * @type {Integer (Int32)}
     */
    static DML_FEATURE_LEVEL_5_0 => 20480

    /**
     * @type {Integer (Int32)}
     */
    static DML_FEATURE_LEVEL_5_1 => 20736

    /**
     * @type {Integer (Int32)}
     */
    static DML_FEATURE_LEVEL_5_2 => 20992

    /**
     * @type {Integer (Int32)}
     */
    static DML_FEATURE_LEVEL_6_0 => 24576

    /**
     * @type {Integer (Int32)}
     */
    static DML_FEATURE_LEVEL_6_1 => 24832

    /**
     * @type {Integer (Int32)}
     */
    static DML_FEATURE_LEVEL_6_2 => 25088
}
