#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the command submission and execution recommendations for the associated command.
 * @remarks
 * Use the values from this enumeration in the Command Submission and Execution (**CSE**) field of the [NVME_COMMAND_EFFECTS_DATA](ns-nvme-nvme_command_effects_data.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_command_effect_sbumission_execution_limits
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_COMMAND_EFFECT_SBUMISSION_EXECUTION_LIMITS extends Win32Enum{

    /**
     * No command submission or execution restriction.
     * @type {Integer (Int32)}
     */
    static NVME_COMMAND_EFFECT_SBUMISSION_EXECUTION_LIMIT_NONE => 0

    /**
     * The command may be submitted when there is no other outstanding command to the same namespace and another command should not be submitted to the same namespace until this command is complete.
     * @type {Integer (Int32)}
     */
    static NVME_COMMAND_EFFECT_SBUMISSION_EXECUTION_LIMIT_SINGLE_PER_NAMESPACE => 1

    /**
     * The command may be submitted when there is no other outstanding command to any namespace and another command should not be submitted to any namespace until this command is complete.
     * @type {Integer (Int32)}
     */
    static NVME_COMMAND_EFFECT_SBUMISSION_EXECUTION_LIMIT_SINGLE_PER_CONTROLLER => 2
}
