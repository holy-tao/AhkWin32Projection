#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate which value of a feature should be retrieved or configured by the **NVME_ADMIN_COMMAND_GET_FEATURES** and **NVME_ADMIN_COMMAND_SET_FEATURES** Admin commands.
 * @remarks
 * In the **NVME_ADMIN_COMMAND_GET_FEATURES** and **NVME_ADMIN_COMMAND_SET_FEATURES** Admin commands, the feature is specified in the Feature Identifier (**FID**) member of the [NVME_CDW10_GET_FEATURES](ns-nvme-nvme_cdw10_get_features.md) and [NVME_CDW10_SET_FEATURES](ns-nvme-nvme_cdw10_set_features.md) structures.
 * 
 * If a Get Features command is received with the Select field **SEL** set to saved and the controller does not support the feature specified by the Feature Identifier being saved or does not currently have any saved values, then the controller treats the Select field as though it was set to default.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_feature_value_codes
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_FEATURE_VALUE_CODES extends Win32Enum{

    /**
     * The current operating attribute value for the specified feature.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_VALUE_CURRENT => 0

    /**
     * The default attribute value for the specified feature.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_VALUE_DEFAULT => 1

    /**
     * The last saved attribute value for the specified feature. For example, the last Set Features command completed without error, with the Save bit set to `1` for the specified feature.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_VALUE_SAVED => 2

    /**
     * The supported capabilities for the specified feature.
     * 
     * The supported capabilities are returned in Dword 0 of the completion entry of the Get Features command, in the following way:
     * 
     * - If Dword 0 bit 0 of the completion entry of the Get Features command is set to `1`, then the Feature Identifier is saveable. If Dword 0 bit 0 of the completion entry of the Get Features command is cleared to `0`, then the Feature Identifier is not saveable.
     * - If Dword 0 bit 1 of the completion entry of the Get Features command is set to `1`, then the Feature Identifier is namespace specific and settings are applied to individual namespaces. If Dword 0 bit 1 of the completion entry of the Get Features command is cleared to `0`, then the Feature Identifier is not namespace specific and its settings apply to the entire controller.
     * - If Dword 0 bit 2 of the completion entry of the Get Features command is set to `1`, then the Feature Identifier is changeable. If Dword 0 bit 2 of the completion entry of the Get Features command is cleared to `0`, then the Feature Identifier is not changeable.
     * @type {Integer (Int32)}
     */
    static NVME_FEATURE_VALUE_SUPPORTED_CAPABILITIES => 3
}
