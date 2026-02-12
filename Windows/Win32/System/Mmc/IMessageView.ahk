#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IMessageView interface is introduced in MMC 1.2.
 * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nn-mmc-imessageview
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IMessageView extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMessageView
     * @type {Guid}
     */
    static IID => Guid("{80f94174-fccc-11d2-b991-00c04f8ecd78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTitleText", "SetBodyText", "SetIcon", "Clear"]

    /**
     * The IMessageView::SetTitleText method enables a snap-in to set the title text for the result pane message displayed using the MMC message OCX control.
     * @remarks
     * MMC creates its own copies of the strings passed to it when the snap-in calls the IMessageView::SetTitleText and IMessageView::SetBodyText methods. The snap-in can release the resources at any time after calling 
     * <b>SetTitleText</b> and 
     * <b>SetBodyText</b>.
     * @param {PWSTR} pszTitleText A pointer to a null-terminated string that contains the title text for the result pane message.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-imessageview-settitletext
     */
    SetTitleText(pszTitleText) {
        pszTitleText := pszTitleText is String ? StrPtr(pszTitleText) : pszTitleText

        result := ComCall(3, this, "ptr", pszTitleText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IMessageView::SetBodyText method enables a snap-in to set the body text for the result pane message displayed using the MMC message OCX control.
     * @remarks
     * MMC creates its own copies of the strings passed to it when the snap-in calls the <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-imessageview-settitletext">IMessageView::SetTitleText</a> and <b>IMessageView::SetBodyText</b> methods. The snap-in can release the resources at any time after calling 
     * <b>SetTitleText</b> and 
     * SetBodyText.
     * @param {PWSTR} pszBodyText A pointer to a null-terminated string that contains the body text for the result pane message.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-imessageview-setbodytext
     */
    SetBodyText(pszBodyText) {
        pszBodyText := pszBodyText is String ? StrPtr(pszBodyText) : pszBodyText

        result := ComCall(4, this, "ptr", pszBodyText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IMessageView::SetIcon method enables a snap-in to set the icon for the result pane message displayed using the MMC message OCX control.
     * @param {Integer} id A value that specifies the type of icon for the result pane message. The value is taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-iconidentifier">IconIdentifier</a> enumeration.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-imessageview-seticon
     */
    SetIcon(id) {
        result := ComCall(5, this, "int", id, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IMessageView::Clear method enables a snap-in to clear the title, text, and icon of the result pane message displayed using the MMC message OCX control.
     * @remarks
     * The 
     * Clear method provides a way to reset the content of the message, but the snap-in is not required to call this method to release resources. MMC creates its own copies of the strings passed to it when the snap-in calls the <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-imessageview-settitletext">IMessageView::SetTitleText</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-imessageview-setbodytext">IMessageView::SetBodyText</a> methods. The snap-in can release the resources after calling 
     * SetTitleText and 
     * SetBodyText.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-imessageview-clear
     */
    Clear() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
