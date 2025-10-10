#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MMC_LISTPAD_INFO structure is introduced in MMC 1.1.
 * @remarks
 * 
  * Allocate the <b>szTitle</b> and <b>szButtonText</b> strings with the COM API function <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> (or the equivalent) and MMC will release it.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ns-mmc-mmc_listpad_info
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_LISTPAD_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A pointer to a null-terminated string that contains the text placed directly above the list control. This text can be the label for the objects within the list control (such as "Printers" if the list contains printers) or instructions (such as "Select a printer and click an action to perform.").
     * 
     * If <b>szTitle</b> is <b>NULL</b> or empty, no title is displayed for the list control.
     * 
     * Be aware that the <b>szTitle</b> member is not the same as the <i>pszTitle</i> parameter for 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iextendtaskpad-gettitle">IExtendTaskPad::GetTitle</a>. The <b>IExtendTaskPad::GetTitle</b> method returns the title for the entire taskpad that appears at the top of the taskpad and appears on every standard MMC taskpad. The <b>szTitle</b> member of 
     * <b>MMC_LISTPAD_INFO</b> is the label for the list control and appears only on MMC list view taskpads.
     * @type {Pointer<Char>}
     */
    szTitle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a null-terminated string that contains the text placed on a button that is directly above the list control and to the right of the <b>szTitle</b> text.
     * 
     * When the user clicks this button on the taskpad, MMC calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iextendtaskpad-tasknotify">IExtendTaskPad::TaskNotify</a> method of the snap-in and passes the value specified in <b>nCommandID</b> as a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure in the arg parameter. The <b>VARIANT</b> passed to 
     * <b>TaskNotify</b> has a <b>vt</b> member set to <b>VT_I4</b> and an <b>lVal</b> member that contains the command ID.
     * 
     * To make the button to appear with no text, set <b>szButtonText</b> to an empty string.
     * 
     * To hide this button to appear on the taskpad, set <b>szButtonText</b> to <b>NULL</b>.
     * @type {Pointer<Char>}
     */
    szButtonText {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Value that serves as an identifier for the button specified by <b>szButtonText</b>. It is recommended that you make this value unique to each taskpad to help identify the taskpad that sent the button-click notification.
     * 
     * When the user clicks this button, MMC calls the <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iextendtaskpad-tasknotify">IExtendTaskPad::TaskNotify</a> method of the snap-in and passes this value as a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> in the arg parameter.
     * 
     * This value is ignored if <b>szButtonText</b> is <b>NULL</b>.
     * @type {Pointer}
     */
    nCommandID {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
