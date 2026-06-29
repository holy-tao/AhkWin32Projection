#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\IDataObject.ahk" { IDataObject }
#Import ".\MMC_TASK_DISPLAY_OBJECT.ahk" { MMC_TASK_DISPLAY_OBJECT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumTASK.ahk" { IEnumTASK }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\MMC_LISTPAD_INFO.ahk" { MMC_LISTPAD_INFO }

/**
 * The IExtendTaskPad interface is introduced in MMC 1.1.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iextendtaskpad
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IExtendTaskPad extends IUnknown {
    /**
     * The interface identifier for IExtendTaskPad
     * @type {Guid}
     */
    static IID := Guid("{8dee6511-554d-11d1-9fea-00600832db4a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExtendTaskPad interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        TaskNotify         : IntPtr
        EnumTasks          : IntPtr
        GetTitle           : IntPtr
        GetDescriptiveText : IntPtr
        GetBackground      : IntPtr
        GetListPadInfo     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExtendTaskPad.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IExtendTaskPad::TaskNotify method enables MMC to notify the snap-in when a task is extended. If the taskpad is a list-view taskpad, MMC also calls IExtendTaskPad::TaskNotify when a list-view button is extended.
     * @remarks
     * The snap-in can identify the scope item that owns the taskpad using the pdo pointer; it then can identify the task by the VARIANT value returned in the arg parameter. If the taskpad is a list-view taskpad, the snap-in can identify the selected item (or items if multiselection is supported) in a result list using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iresultdata">IResultData</a> interface. Based on this data, the snap-in can perform the appropriate actions on the appropriate object.
     * 
     * If a taskpad list-view button is ed for a list-view taskpad, the snap-in can identify the button for the particular taskpad by the VARIANT value returned in the arg parameter.
     * 
     * A custom taskpad can pass any values that it determines should be sent in the arg and param parameters.
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
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendtaskpad-tasknotify
     */
    TaskNotify(pdo, arg, param2) {
        result := ComCall(3, this, "ptr", pdo, VARIANT.Ptr, arg, VARIANT.Ptr, param2, "HRESULT")
        return result
    }

    /**
     * The IExtendTaskPad::EnumTasks method enables MMC to get a pointer to the IEnumTASK interface of the object that contains the snap-in's tasks.
     * @remarks
     * MMC calls this method each time a taskpad from the snap-in is displayed. MMC also calls the method if the snap-in extends another snap-in's taskpad in order to get a pointer to the snap-in's 
     * IEnumTASK interface.
     * @param {IDataObject} pdo A pointer to the data object for the scope item that owns the taskpad.
     * @param {PWSTR} szTaskGroup A pointer to a null-terminated string that contains the group name that identifies the taskpad. The group name is the string that follows the hash (#) in the string passed in the ppViewType parameter when MMC calls <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-getresultviewtype">IComponent::GetResultViewType</a> to display the taskpad. If no group name is specified, szTaskGroup is a <b>NULL</b> string.
     * @returns {IEnumTASK} A pointer to address of 
     * IEnumTASK interface of the object that contains the snap-in's tasks.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendtaskpad-enumtasks
     */
    EnumTasks(pdo, szTaskGroup) {
        szTaskGroup := szTaskGroup is String ? StrPtr(szTaskGroup) : szTaskGroup

        result := ComCall(4, this, "ptr", pdo, "ptr", szTaskGroup, "ptr*", &ppEnumTASK := 0, "HRESULT")
        return IEnumTASK(ppEnumTASK)
    }

    /**
     * The IExtendTaskPad::GetTitle method enables MMC to get the taskpad title text to display in taskpads that use MMC taskpad templates.
     * @remarks
     * Allocate the <i>pszTitle</i> string with the COM API function <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> (or the equivalent) and MMC will release it.
     * @param {PWSTR} pszGroup A pointer to a null-terminated string that contains the group name that identifies the taskpad. The group name is the string that follows the hash (#) in the string passed in the <i>ppViewType</i> parameter when MMC calls <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-getresultviewtype">IComponent::GetResultViewType</a> to display the taskpad. If no group name is specified, <i>pszGroup</i> is a <b>NULL</b> string.
     * @returns {PWSTR} A pointer to the address of a null-terminated string that contains the title for the taskpad specified by <i>pszGroup</i>. This text is displayed at the top of the taskpad as the title for the entire taskpad. If <i>pszTitle</i> points to a <b>NULL</b> string, no title is displayed.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendtaskpad-gettitle
     */
    GetTitle(pszGroup) {
        pszGroup := pszGroup is String ? StrPtr(pszGroup) : pszGroup

        result := ComCall(5, this, "ptr", pszGroup, PWSTR.Ptr, &pszTitle := 0, "HRESULT")
        return pszTitle
    }

    /**
     * The IExtendTaskPad::GetDescriptiveText method enables MMC to get the taskpad's descriptive text to display in taskpads that use MMC taskpad templates.
     * @remarks
     * Allocate the pszDescriptiveText string with the COM API function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> (or the equivalent) and MMC will release it.
     * @param {PWSTR} pszGroup A pointer to a null-terminated string that contains the group name that identifies the taskpad. The group name is the string that follows the hash (#) in the string passed in the ppViewType parameter when MMC calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-getresultviewtype">IComponent::GetResultViewType</a> to display the taskpad. If no group name is specified, szGroup is a <b>NULL</b> string.
     * @returns {PWSTR} A pointer to the address of a null-terminated string that contains the descriptive text for the taskpad specified by pszGroup. This text is displayed at the top of the taskpad beneath the title for the entire taskpad. This text can be a phrase that serves as a subtitle or instructions (such as "Click an action to perform.").
     * 
     * If pszDescriptiveText points to a <b>NULL</b> string, no descriptive text is displayed.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendtaskpad-getdescriptivetext
     */
    GetDescriptiveText(pszGroup) {
        pszGroup := pszGroup is String ? StrPtr(pszGroup) : pszGroup

        result := ComCall(6, this, "ptr", pszGroup, PWSTR.Ptr, &pszDescriptiveText := 0, "HRESULT")
        return pszDescriptiveText
    }

    /**
     * The IExtendTaskPad::GetBackground method enables MMC to get the taskpad's background image to display in taskpads that use MMC taskpad templates.
     * @remarks
     * Allocate the strings in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task_display_bitmap">MMC_TASK_DISPLAY_BITMAP</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task_display_symbol">MMC_TASK_DISPLAY_SYMBOL</a> structure specified in the pTDO parameter with the COM API function CoTaskMemAlloc (or the equivalent) and MMC will release it.
     * @param {PWSTR} pszGroup A pointer to a null-terminated string that contains the group name that identifies the taskpad. The group name is the string that follows the hash (#) in the string passed in the ppViewType parameter when MMC calls IComponent::GetResultViewType to display the taskpad. If no group name is specified, pszGroup is a <b>NULL</b> string.
     * @returns {MMC_TASK_DISPLAY_OBJECT} A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_task_display_object">MMC_TASK_DISPLAY_OBJECT</a> structure that the snap-in must fill in to specify the image to be displayed as the background for the taskpad specified by pszGroup.
     * 
     * Be aware that the caller (MMC) allocates the memory for the 
     * MMC_TASK_DISPLAY_OBJECT structure.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendtaskpad-getbackground
     */
    GetBackground(pszGroup) {
        pszGroup := pszGroup is String ? StrPtr(pszGroup) : pszGroup

        pTDO := MMC_TASK_DISPLAY_OBJECT()
        result := ComCall(7, this, "ptr", pszGroup, MMC_TASK_DISPLAY_OBJECT.Ptr, pTDO, "HRESULT")
        return pTDO
    }

    /**
     * The IExtendTaskPad::GetListPadInfo method is used for list-view taskpads only.
     * @remarks
     * If the snap-in is not a list-view taskpad, this method is not called by MMC.
     * @param {PWSTR} pszGroup A pointer to a null-terminated string that contains the group name that identifies the taskpad. The group name is the string that follows the hash (#) in the string passed in the ppViewType parameter when MMC calls <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-getresultviewtype">IComponent::GetResultViewType</a> to display the taskpad. If no group name is specified, szGroup is a <b>NULL</b> string.
     * @returns {MMC_LISTPAD_INFO} A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_listpad_info">MMC_LISTPAD_INFO</a> structure that the snap-in must fill in with the title text for the list control, the text for an optional button, and the command ID passed to <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iextendtaskpad-tasknotify">IExtendTaskPad::TaskNotify</a> when that optional button is clicked.
     * 
     * Be aware that the caller (MMC) allocates the memory for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_listpad_info">MMC_LISTPAD_INFO</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendtaskpad-getlistpadinfo
     */
    GetListPadInfo(pszGroup) {
        pszGroup := pszGroup is String ? StrPtr(pszGroup) : pszGroup

        lpListPadInfo := MMC_LISTPAD_INFO()
        result := ComCall(8, this, "ptr", pszGroup, MMC_LISTPAD_INFO.Ptr, lpListPadInfo, "HRESULT")
        return lpListPadInfo
    }

    Query(iid) {
        if (IExtendTaskPad.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TaskNotify := CallbackCreate(GetMethod(implObj, "TaskNotify"), flags, 4)
        this.vtbl.EnumTasks := CallbackCreate(GetMethod(implObj, "EnumTasks"), flags, 4)
        this.vtbl.GetTitle := CallbackCreate(GetMethod(implObj, "GetTitle"), flags, 3)
        this.vtbl.GetDescriptiveText := CallbackCreate(GetMethod(implObj, "GetDescriptiveText"), flags, 3)
        this.vtbl.GetBackground := CallbackCreate(GetMethod(implObj, "GetBackground"), flags, 3)
        this.vtbl.GetListPadInfo := CallbackCreate(GetMethod(implObj, "GetListPadInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TaskNotify)
        CallbackFree(this.vtbl.EnumTasks)
        CallbackFree(this.vtbl.GetTitle)
        CallbackFree(this.vtbl.GetDescriptiveText)
        CallbackFree(this.vtbl.GetBackground)
        CallbackFree(this.vtbl.GetListPadInfo)
    }
}
