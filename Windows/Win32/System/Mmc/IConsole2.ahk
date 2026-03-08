#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConsole.ahk

/**
 * The IConsole2 interface is introduced in MMC 1.1.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iconsole2
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
     * @remarks
     * The <b>IConsole2::Expand</b> method is the programmatic equivalent of the user clicking on the plus or minus sign to expand or collapse an item in the scope pane. That is, this method causes a visible expansion or collapse of an item in the scope pane. Be aware that this method does not change the selection in the scope pane and does not affect the result pane.
     * 
     * When this method is called, MMC expands or collapses the item specified by <i>hItem</i> based on the value set for <i>bExpand</i>. MMC then sends an expand notification to the snap-in of each child item. MMC does so by calling each child snap-in's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponentdata-notify">IComponentData::Notify</a> method with event set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-expand">MMCN_EXPAND</a>, <i>lpDataObject</i> set as a pointer to the data object for <i>hItem</i>, arg set as <b>TRUE</b> or <b>FALSE</b> based on <i>bExpand</i>, and <i>param</i> set as <i>hItem</i>. Be aware that <i>hItem</i> is the <b>HSCOPEITEM</b> handle that you specified in your call to <b>IConsole2::Expand</b>.
     * 
     * The <b>IConsole2::Expand</b> method applies only to a particular view. This means that it applies only to the instance of the snap-in's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponent">IComponent</a> object that corresponds to the snap-in item that appears in a specific multiple-document interface (MDI) window within the console. Be aware that each MDI window within the console represents a different view and that an instance of a snap-in within an MDI window corresponds to an 
     * <b>IComponent</b> object for that snap-in.
     * 
     * Therefore, the snap-in should only call this method on the 
     * <b>IConsole2</b> interface pointer associated with an 
     * <b>IComponent</b> object, that is, an 
     * <b>IConsole2</b> interface pointer retrieved by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the <b>IConsole</b> interface pointer returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-initialize">IComponent::Initialize</a>.
     * 
     * To enumerate the child items of an item in the namespace without visibly expanding the item, the snap-in should use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsolenamespace2-expand">IConsoleNameSpace2::Expand</a> method.
     * @param {Pointer} hItem A handle to the item to expand.
     * @param {BOOL} bExpand A value that specifies whether to expand or collapse the item. <b>TRUE</b> expands the item. <b>FALSE</b> collapses the item.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole2-expand
     */
    Expand(hItem, bExpand) {
        result := ComCall(14, this, "ptr", hItem, "int", bExpand, "HRESULT")
        return result
    }

    /**
     * The IConsole2::IsTaskpadViewPreferred method is obsolete. It always returns S_OK.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole2-istaskpadviewpreferred
     */
    IsTaskpadViewPreferred() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * The IConsole2::SetStatusText method enables the snap-in to change the text in the status bar. Be aware that this is used only by instances of IComponent.
     * @remarks
     * The status bar has three sections, which are delineated by the pipe character (|). For example, setting the text in the status bar to "Left| Middle| Right" places "Left" in the leftmost section of the status bar, " Middle" in the middle section, and " Right" in the rightmost section.
     * 
     * If more than three fields are delineated (that is, there are more than two pipes), then everything that would be placed in the fourth and higher fields is omitted.
     * 
     * In addition, the middle section is designed to function as a progress bar. This functionality is invoked by passing the '%' character as the first character, followed by a number between 0 and 100, into the middle section. Instead of text, this section then displays a progress bar that is zero to 100 percent complete. For example, passing "Done|%75" places "Done" in the left section and a progress bar 75% complete in the middle section.
     * 
     * To display a string that begins with '%' in the middle section of the status bar, then begin the string with '%%'. This causes the middle section to display text and removes the first '%'. For example: "Today is|%%Wednesday%" results in the left section that contains "Today is" and the middle section that contains "%Wednesday%". If an invalid number or non-numeric text is entered in the middle section following a '%', then the middle section is empty. If a '%' is the only character in the section, then it will be shown as text.
     * 
     * This method should be called from an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsole2">IConsole2</a> interface pointer obtained through 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponent">IComponent</a>.
     * 
     * Only the snap-in that owns the currently selected scope item can change the status bar text.
     * 
     * In MMC version 1.1 and later, each multiple-document interface (MDI) child window has a status bar.
     * @param {PWSTR} pszStatusText A pointer to a null-terminated string that contains text to be displayed in the status bar.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole2-setstatustext
     */
    SetStatusText(pszStatusText) {
        pszStatusText := pszStatusText is String ? StrPtr(pszStatusText) : pszStatusText

        result := ComCall(16, this, "ptr", pszStatusText, "HRESULT")
        return result
    }
}
