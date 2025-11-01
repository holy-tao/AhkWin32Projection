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
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypagesite-onstatuschange
     */
    OnStatusChange(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLocaleID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypagesite-getlocaleid
     */
    GetLocaleID(pLocaleID) {
        pLocaleIDMarshal := pLocaleID is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pLocaleIDMarshal, pLocaleID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypagesite-getpagecontainer
     */
    GetPageContainer(ppUnk) {
        result := ComCall(5, this, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pMsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypagesite-translateaccelerator
     */
    TranslateAccelerator(pMsg) {
        result := ComCall(6, this, "ptr", pMsg, "HRESULT")
        return result
    }
}
