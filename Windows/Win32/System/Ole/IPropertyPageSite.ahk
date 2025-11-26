#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the main features for a property page site object.
 * @remarks
 * 
 * For each property page created within a property frame, the frame creates a property page site to provide information to the property page and to receive notifications from the page when changes occur. This latter notification is used to initiate a call to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-ispagedirty">IPropertyPage::IsPageDirty</a>, the return value of which is then used to enable or disable the frame's <b>Apply</b> button.
 * 
 * <h3><a id="OLE_Implementation"></a><a id="ole_implementation"></a><a id="OLE_IMPLEMENTATION"></a>OLE Implementation</h3>
 * The system provides an implementation of the <b>IPropertyPageSite</b> interface through the <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-olecreatepropertyframe">OleCreatePropertyFrame</a> or <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-olecreatepropertyframeindirect">OleCreatePropertyFrameIndirect</a> functions. The frame implementation provided through these functions only implements the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypagesite-onstatuschange">OnStatusChange</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypagesite-getlocaleid">GetLocaleID</a> methods. The <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypagesite-getpagecontainer">GetPageContainer</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypagesite-translateaccelerator">TranslateAccelerator</a> methods return E_NOTIMPL.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ipropertypagesite
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IPropertyPageSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyPageSite
     * @type {Guid}
     */
    static IID => Guid("{b196b28c-bab4-101a-b69c-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStatusChange", "GetLocaleID", "GetPageContainer", "TranslateAccelerator"]

    /**
     * Informs the frame that the property page managed by this site has changed its state, that is, one or more property values have been changed in the page. Property pages should call this method whenever changes occur in their dialog boxes.
     * @param {Integer} dwFlags 
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ipropertypagesite-onstatuschange
     */
    OnStatusChange(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves the locale identifier (an LCID) that a property page can use to adjust its locale-specific settings.
     * @returns {Integer} A pointer to a variable that receives the locale identifier. See <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifier-constants-and-strings">Language Identifier Constants and Strings</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ipropertypagesite-getlocaleid
     */
    GetLocaleID() {
        result := ComCall(4, this, "uint*", &pLocaleID := 0, "HRESULT")
        return pLocaleID
    }

    /**
     * Retrieves a pointer to the object representing the entire property frame dialog box that contains all the pages. Calling this method could potentially allow one page to navigate to another.
     * @returns {IUnknown} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer variable that receives the interface pointer to the container object. If an error occurs, the implementation must set *<i>ppUnk</i> to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ipropertypagesite-getpagecontainer
     */
    GetPageContainer() {
        result := ComCall(5, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * Passes a keystroke to the property frame for processing.
     * @param {Pointer<MSG>} pMsg A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure to be processed.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The page site did not process the message.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The page site does not support keyboard processing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ipropertypagesite-translateaccelerator
     */
    TranslateAccelerator(pMsg) {
        result := ComCall(6, this, "ptr", pMsg, "HRESULT")
        return result
    }
}
