#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConsole.ahk

/**
 * The IConsole2 interface is introduced in MMC 1.1.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iconsole2
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IConsole2 extends IConsole{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConsole2
     * @type {Guid}
     */
    static IID => Guid("{103d842a-aa63-11d1-a7e1-00c04fd8d565}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Expand", "IsTaskpadViewPreferred", "SetStatusText"]

    /**
     * The IConsole2::Expand method enables the snap-in to expand or collapse an item in the scope pane.
     * @param {Pointer} hItem A handle to the item to expand.
     * @param {BOOL} bExpand A value that specifies whether to expand or collapse the item. <b>TRUE</b> expands the item. <b>FALSE</b> collapses the item.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsole2-expand
     */
    Expand(hItem, bExpand) {
        result := ComCall(14, this, "ptr", hItem, "int", bExpand, "HRESULT")
        return result
    }

    /**
     * The IConsole2::IsTaskpadViewPreferred method is obsolete. It always returns S_OK.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsole2-istaskpadviewpreferred
     */
    IsTaskpadViewPreferred() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * The IConsole2::SetStatusText method enables the snap-in to change the text in the status bar. Be aware that this is used only by instances of IComponent.
     * @param {PWSTR} pszStatusText A pointer to a null-terminated string that contains text to be displayed in the status bar.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsole2-setstatustext
     */
    SetStatusText(pszStatusText) {
        pszStatusText := pszStatusText is String ? StrPtr(pszStatusText) : pszStatusText

        result := ComCall(16, this, "ptr", pszStatusText, "HRESULT")
        return result
    }
}
