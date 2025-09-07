#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MMC_TASK_DISPLAY_BITMAP.ahk
#Include .\MMC_TASK_DISPLAY_SYMBOL.ahk
#Include .\MMC_TASK_DISPLAY_OBJECT.ahk

/**
 * The MMC_TASK structure is introduced in MMC 1.1.
 * @remarks
 * Allocate the <b>szText</b>, <b>szHelpString</b>, <b>szActionURL</b>,and <b>szScript</b> strings used in the structure with the COM API function <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> (or the equivalent) and MMC will release them.
  * 
  * You should also allocate the strings in the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task_display_bitmap">MMC_TASK_DISPLAY_BITMAP</a> or 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task_display_symbol">MMC_TASK_DISPLAY_SYMBOL</a> structure specified in the <b>sDisplayObject</b> member with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> (or the equivalent) and MMC will release them.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmc_task
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_TASK extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task_display_object">MMC_TASK_DISPLAY_OBJECT</a> structure that the snap-in must fill in to specify the image to be displayed as the image for the task in the taskpad specified by <b>pszGroup</b>.
     * @type {MMC_TASK_DISPLAY_OBJECT}
     */
    sDisplayObject{
        get {
            if(!this.HasProp("__sDisplayObject"))
                this.__sDisplayObject := MMC_TASK_DISPLAY_OBJECT(this.ptr + 0)
            return this.__sDisplayObject
        }
    }

    /**
     * A pointer to a null-terminated string that contains the text placed directly to the right of the mouse-over image. This text serves as the label for the task. This text should be an action in the imperative such as "Add a new user."
     * @type {Pointer<Ptr>}
     */
    szText {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a null-terminated string that contains the descriptive text placed in the upper-right corner when the user moves the mouse over the mouse-over image or the label text for the task. This text serves as the description for the task such as "Creates a new account, creates a mailbox, and sets up everything a user must access the network."
     * @type {Pointer<Ptr>}
     */
    szHelpString {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Value of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_action_type">MMC_ACTION_TYPE</a> that specifies the type of action triggered when a user clicks a task on a taskpad.
     * 
     * There are three types of actions:
     * @type {Integer}
     */
    eActionType {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    nCommandID {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    szActionURL {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    szScript {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
