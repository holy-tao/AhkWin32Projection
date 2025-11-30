#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MMC_ACTION_TYPE enumeration is introduced in MMC 1.1.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ne-mmc-mmc_action_type
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_ACTION_TYPE extends Win32Enum{

    /**
     * No actions specified.
     * @type {Integer (Int32)}
     */
    static MMC_ACTION_UNINITIALIZED => -1

    /**
     * When the user clicks the task, MMC calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iextendtaskpad-tasknotify">IExtendTaskPad::TaskNotify</a> and returns the command ID specified in the nCommandID member of the 
     * MMC_TASK structure that was filled in when MMC called <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ienumtask-next">IEnumTASK::Next</a> to add the task to the taskpad.
     * @type {Integer (Int32)}
     */
    static MMC_ACTION_ID => 0

    /**
     * When the user clicks the task, MMC activates the link specified by the szActionURL member of the 
     * MMC_TASK structure.
     * @type {Integer (Int32)}
     */
    static MMC_ACTION_LINK => 1

    /**
     * When the user clicks the task, MMC executes the script contained in the szScript member of 
     * MMC_TASK using the window.execScript method on the taskpad DHTML page.
     * @type {Integer (Int32)}
     */
    static MMC_ACTION_SCRIPT => 2
}
