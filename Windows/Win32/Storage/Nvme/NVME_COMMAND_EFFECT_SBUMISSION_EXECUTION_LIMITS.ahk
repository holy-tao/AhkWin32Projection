#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_command_effect_sbumission_execution_limits
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_COMMAND_EFFECT_SBUMISSION_EXECUTION_LIMITS{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_COMMAND_EFFECT_SBUMISSION_EXECUTION_LIMIT_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_COMMAND_EFFECT_SBUMISSION_EXECUTION_LIMIT_SINGLE_PER_NAMESPACE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_COMMAND_EFFECT_SBUMISSION_EXECUTION_LIMIT_SINGLE_PER_CONTROLLER => 2
}
