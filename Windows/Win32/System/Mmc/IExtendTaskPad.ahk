#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTASK.ahk
#Include .\MMC_TASK_DISPLAY_OBJECT.ahk
#Include .\MMC_LISTPAD_INFO.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IExtendTaskPad interface is introduced in MMC 1.1.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iextendtaskpad
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IExtendTaskPad extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExtendTaskPad
     * @type {Guid}
     */
    static IID => Guid("{8dee6511-554d-11d1-9fea-00600832db4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TaskNotify", "EnumTasks", "GetTitle", "GetDescriptiveText", "GetBackground", "GetListPadInfo"]

    /**
     * The IExtendTaskPad::TaskNotify method enables MMC to notify the snap-in when a task is extended. If the taskpad is a list-view taskpad, MMC also calls IExtendTaskPad::TaskNotify when a list-view button is extended.
     * @param {IDataObject} pdo A pointer to the data object for the scope item that owns the taskpad. If your snap-in owns the item that displays the taskpad, pdo is a pointer to that item. If your snap-in is extending the taskpad of another snap-in, pdo is a pointer to the item in the snap-in that owns the taskpad.
     * @param {Pointer<VARIANT>} arg A pointer to a VARIANT structure that contains information passed back from the CIC control on the taskpad.
     * 
     * Taskpads using MMC taskpad templates
     * 
     * For the MMC-supplied taskpads, the VARIANT structure contains the command ID for the taskpad task or list-view button that was ed.
     * 
     * The vt field is VT_I4 and the lVal field contains the command ID for the taskpad task or list-view button that was ed. List-view buttons apply only to list-view taskpads.
     * 
     * A task command ID is specified in the nCommandID member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task">MMC_TASK</a> structure, which is passed in the <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ienumtask-next">IEnumTASK::Next</a> method that MMC calls when it retrieves the information for that task during the setup of the taskpad.
     * 
     * A list-view button is the button specified in the szButtonText member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_listpad_info">MMC_LISTPAD_INFO</a> structure, which is passed in the <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iextendtaskpad-getlistpadinfo">IExtendTaskPad::GetListPadInfo</a> method that MMC calls when it is setting up the list-view taskpad. The list-view button command ID is specified in the nCommandID member of 
     * MMC_LISTPAD_INFO.
     * 
     * Taskpads using custom HTML pages
     * 
     * For custom taskpads, the VARIANT structure can contain any data that the script on the custom HTML page wants to pass through the CIC object 
     * TaskNotify method
     * @param {Pointer<VARIANT>} param2 
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iextendtaskpad-tasknotify
     */
    TaskNotify(pdo, arg, param2) {
        result := ComCall(3, this, "ptr", pdo, "ptr", arg, "ptr", param2, "HRESULT")
        return result
    }

    /**
     * The IExtendTaskPad::EnumTasks method enables MMC to get a pointer to the IEnumTASK interface of the object that contains the snap-in's tasks.
     * @param {IDataObject} pdo A pointer to the data object for the scope item that owns the taskpad.
     * @param {PWSTR} szTaskGroup A pointer to a null-terminated string that contains the group name that identifies the taskpad. The group name is the string that follows the hash (#) in the string passed in the ppViewType parameter when MMC calls <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-getresultviewtype">IComponent::GetResultViewType</a> to display the taskpad. If no group name is specified, szTaskGroup is a <b>NULL</b> string.
     * @returns {IEnumTASK} A pointer to address of 
     * IEnumTASK interface of the object that contains the snap-in's tasks.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iextendtaskpad-enumtasks
     */
    EnumTasks(pdo, szTaskGroup) {
        szTaskGroup := szTaskGroup is String ? StrPtr(szTaskGroup) : szTaskGroup

        result := ComCall(4, this, "ptr", pdo, "ptr", szTaskGroup, "ptr*", &ppEnumTASK := 0, "HRESULT")
        return IEnumTASK(ppEnumTASK)
    }

    /**
     * The IExtendTaskPad::GetTitle method enables MMC to get the taskpad title text to display in taskpads that use MMC taskpad templates.
     * @param {PWSTR} pszGroup A pointer to a null-terminated string that contains the group name that identifies the taskpad. The group name is the string that follows the hash (#) in the string passed in the <i>ppViewType</i> parameter when MMC calls <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-getresultviewtype">IComponent::GetResultViewType</a> to display the taskpad. If no group name is specified, <i>pszGroup</i> is a <b>NULL</b> string.
     * @returns {PWSTR} A pointer to the address of a null-terminated string that contains the title for the taskpad specified by <i>pszGroup</i>. This text is displayed at the top of the taskpad as the title for the entire taskpad. If <i>pszTitle</i> points to a <b>NULL</b> string, no title is displayed.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iextendtaskpad-gettitle
     */
    GetTitle(pszGroup) {
        pszGroup := pszGroup is String ? StrPtr(pszGroup) : pszGroup

        result := ComCall(5, this, "ptr", pszGroup, "ptr*", &pszTitle := 0, "HRESULT")
        return pszTitle
    }

    /**
     * The IExtendTaskPad::GetDescriptiveText method enables MMC to get the taskpad's descriptive text to display in taskpads that use MMC taskpad templates.
     * @param {PWSTR} pszGroup A pointer to a null-terminated string that contains the group name that identifies the taskpad. The group name is the string that follows the hash (#) in the string passed in the ppViewType parameter when MMC calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-getresultviewtype">IComponent::GetResultViewType</a> to display the taskpad. If no group name is specified, szGroup is a <b>NULL</b> string.
     * @returns {PWSTR} A pointer to the address of a null-terminated string that contains the descriptive text for the taskpad specified by pszGroup. This text is displayed at the top of the taskpad beneath the title for the entire taskpad. This text can be a phrase that serves as a subtitle or instructions (such as "Click an action to perform.").
     * 
     * If pszDescriptiveText points to a <b>NULL</b> string, no descriptive text is displayed.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iextendtaskpad-getdescriptivetext
     */
    GetDescriptiveText(pszGroup) {
        pszGroup := pszGroup is String ? StrPtr(pszGroup) : pszGroup

        result := ComCall(6, this, "ptr", pszGroup, "ptr*", &pszDescriptiveText := 0, "HRESULT")
        return pszDescriptiveText
    }

    /**
     * The IExtendTaskPad::GetBackground method enables MMC to get the taskpad's background image to display in taskpads that use MMC taskpad templates.
     * @param {PWSTR} pszGroup A pointer to a null-terminated string that contains the group name that identifies the taskpad. The group name is the string that follows the hash (#) in the string passed in the ppViewType parameter when MMC calls IComponent::GetResultViewType to display the taskpad. If no group name is specified, pszGroup is a <b>NULL</b> string.
     * @returns {MMC_TASK_DISPLAY_OBJECT} A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task_display_object">MMC_TASK_DISPLAY_OBJECT</a> structure that the snap-in must fill in to specify the image to be displayed as the background for the taskpad specified by pszGroup.
     * 
     * Be aware that the caller (MMC) allocates the memory for the 
     * MMC_TASK_DISPLAY_OBJECT structure.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iextendtaskpad-getbackground
     */
    GetBackground(pszGroup) {
        pszGroup := pszGroup is String ? StrPtr(pszGroup) : pszGroup

        pTDO := MMC_TASK_DISPLAY_OBJECT()
        result := ComCall(7, this, "ptr", pszGroup, "ptr", pTDO, "HRESULT")
        return pTDO
    }

    /**
     * The IExtendTaskPad::GetListPadInfo method is used for list-view taskpads only.
     * @param {PWSTR} pszGroup A pointer to a null-terminated string that contains the group name that identifies the taskpad. The group name is the string that follows the hash (#) in the string passed in the ppViewType parameter when MMC calls <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-getresultviewtype">IComponent::GetResultViewType</a> to display the taskpad. If no group name is specified, szGroup is a <b>NULL</b> string.
     * @returns {MMC_LISTPAD_INFO} A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_listpad_info">MMC_LISTPAD_INFO</a> structure that the snap-in must fill in with the title text for the list control, the text for an optional button, and the command ID passed to <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iextendtaskpad-tasknotify">IExtendTaskPad::TaskNotify</a> when that optional button is clicked.
     * 
     * Be aware that the caller (MMC) allocates the memory for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_listpad_info">MMC_LISTPAD_INFO</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iextendtaskpad-getlistpadinfo
     */
    GetListPadInfo(pszGroup) {
        pszGroup := pszGroup is String ? StrPtr(pszGroup) : pszGroup

        lpListPadInfo := MMC_LISTPAD_INFO()
        result := ComCall(8, this, "ptr", pszGroup, "ptr", lpListPadInfo, "HRESULT")
        return lpListPadInfo
    }
}
