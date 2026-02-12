#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDsAdminNewObj interface is used by a primary or secondary object creation wizard extension to obtain page count data and to control the command buttons in the wizard.
 * @see https://learn.microsoft.com/windows/win32/api//content/dsadmin/nn-dsadmin-idsadminnewobj
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDsAdminNewObj extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDsAdminNewObj
     * @type {Guid}
     */
    static IID => Guid("{f2573587-e6fc-11d2-82af-00c04f68928b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetButtons", "GetPageCounts"]

    /**
     * The IDsAdminNewObj::SetButtons method enables or disables the &quot;Next&quot; command button in the wizard for a specific page.
     * @remarks
     * No assumption should be made regarding the state of the "Next" command button when the page is first displayed. The object creation extension should set the state of the "Next" command button when the page is first displayed and when the data in the page changes. If the data in the page is not mandatory, then the "Next" button should be enabled when the page is first displayed and the state should not be changed by the extension.
     * 
     * If the extension calling the function is a primary extension with a single page and there are no secondary extensions loaded, for example: the wizard has a single page, the command buttons are; "OK" and "Cancel", instead of "Back", "Next", and "Cancel". In this case, a call to this function will enable or disable the "OK" button.
     * @param {Integer} nCurrIndex Contains the zero-based index of the wizard page for which the "Next" button will be enabled or disabled. This index is relative to the page count of the wizard extension that calls the method.
     * @param {BOOL} bValid Specifies if the "Next" command button is enabled or disabled. If this value is zero, the "Next" command button is disabled. If this value is nonzero, the "Next" command button is enabled.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Returns one of the following values.
     * @see https://learn.microsoft.com/windows/win32/api//content/dsadmin/nf-dsadmin-idsadminnewobj-setbuttons
     */
    SetButtons(nCurrIndex, bValid) {
        result := ComCall(3, this, "uint", nCurrIndex, "int", bValid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IDsAdminNewObj::GetPageCounts method obtains the total number of pages in the wizard as well as the index of the first page of the extension.
     * @remarks
     * This function will provide results based on the count of pages added using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/nf-dsadmin-idsadminnewobjext-addpages">IDsAdminNewObjExt::AddPages</a>. If there are changes to the number of pages because of page manipulations by Win32 APIs, the supplied values may not be accurate. If this method is called in response to the <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/nf-dsadmin-idsadminnewobjext-setobject">IDsAdminNewObjExt::SetObject</a> method, the supplied page counts are most likely to be accurate.
     * @param {Pointer<Integer>} pnTotal Pointer to a <b>LONG</b> value that receives the total number of pages contained in the wizard.
     * @param {Pointer<Integer>} pnStartIndex Pointer to a <b>LONG</b> value that receives the zero-based index of the first page of the extension.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Returns one of the following values.
     * @see https://learn.microsoft.com/windows/win32/api//content/dsadmin/nf-dsadmin-idsadminnewobj-getpagecounts
     */
    GetPageCounts(pnTotal, pnStartIndex) {
        pnTotalMarshal := pnTotal is VarRef ? "int*" : "ptr"
        pnStartIndexMarshal := pnStartIndex is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pnTotalMarshal, pnTotal, pnStartIndexMarshal, pnStartIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
