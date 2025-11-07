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
     * 
     * @param {IDataObject} pdo 
     * @param {Pointer<VARIANT>} arg 
     * @param {Pointer<VARIANT>} param2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendtaskpad-tasknotify
     */
    TaskNotify(pdo, arg, param2) {
        result := ComCall(3, this, "ptr", pdo, "ptr", arg, "ptr", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} pdo 
     * @param {PWSTR} szTaskGroup 
     * @returns {IEnumTASK} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendtaskpad-enumtasks
     */
    EnumTasks(pdo, szTaskGroup) {
        szTaskGroup := szTaskGroup is String ? StrPtr(szTaskGroup) : szTaskGroup

        result := ComCall(4, this, "ptr", pdo, "ptr", szTaskGroup, "ptr*", &ppEnumTASK := 0, "HRESULT")
        return IEnumTASK(ppEnumTASK)
    }

    /**
     * 
     * @param {PWSTR} pszGroup 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendtaskpad-gettitle
     */
    GetTitle(pszGroup) {
        pszGroup := pszGroup is String ? StrPtr(pszGroup) : pszGroup

        result := ComCall(5, this, "ptr", pszGroup, "ptr*", &pszTitle := 0, "HRESULT")
        return pszTitle
    }

    /**
     * 
     * @param {PWSTR} pszGroup 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendtaskpad-getdescriptivetext
     */
    GetDescriptiveText(pszGroup) {
        pszGroup := pszGroup is String ? StrPtr(pszGroup) : pszGroup

        result := ComCall(6, this, "ptr", pszGroup, "ptr*", &pszDescriptiveText := 0, "HRESULT")
        return pszDescriptiveText
    }

    /**
     * 
     * @param {PWSTR} pszGroup 
     * @returns {MMC_TASK_DISPLAY_OBJECT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendtaskpad-getbackground
     */
    GetBackground(pszGroup) {
        pszGroup := pszGroup is String ? StrPtr(pszGroup) : pszGroup

        pTDO := MMC_TASK_DISPLAY_OBJECT()
        result := ComCall(7, this, "ptr", pszGroup, "ptr", pTDO, "HRESULT")
        return pTDO
    }

    /**
     * 
     * @param {PWSTR} pszGroup 
     * @returns {MMC_LISTPAD_INFO} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendtaskpad-getlistpadinfo
     */
    GetListPadInfo(pszGroup) {
        pszGroup := pszGroup is String ? StrPtr(pszGroup) : pszGroup

        lpListPadInfo := MMC_LISTPAD_INFO()
        result := ComCall(8, this, "ptr", pszGroup, "ptr", lpListPadInfo, "HRESULT")
        return lpListPadInfo
    }
}
