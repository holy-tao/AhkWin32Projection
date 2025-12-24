#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTfDisplayAttributeInfo.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfDisplayAttributeMgr interface is implemented by the TSF manager and used by an application to obtain and enumerate display attributes. Individual display attributes are accessed through the ITfDisplayAttributeInfo interface.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfdisplayattributemgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfDisplayAttributeMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfDisplayAttributeMgr
     * @type {Guid}
     */
    static IID => Guid("{8ded7393-5db1-475c-9e71-a39111b0ff67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnUpdateInfo", "EnumDisplayAttributeInfo", "GetDisplayAttributeInfo"]

    /**
     * ITfDisplayAttributeMgr::OnUpdateInfo method
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfdisplayattributemgr-onupdateinfo
     */
    OnUpdateInfo() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * ITfDisplayAttributeMgr::EnumDisplayAttributeInfo method
     * @returns {IEnumTfDisplayAttributeInfo} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfdisplayattributeinfo">IEnumTfDisplayAttributeInfo</a> interface pointer that receives the enumerator object.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfdisplayattributemgr-enumdisplayattributeinfo
     */
    EnumDisplayAttributeInfo() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfDisplayAttributeInfo(ppEnum)
    }

    /**
     * ITfDisplayAttributeMgr::GetDisplayAttributeInfo method
     * @param {Pointer<Guid>} guid Contains a GUID that identifies the display attribute data requested. This value is obtained by obtaining the GUID_PROP_ATTRIBUTE property for the range of text. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-getproperty">ITfContext::GetProperty</a> and <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-trackproperties">ITfContext::TrackProperties</a>.
     * @param {Pointer<ITfDisplayAttributeInfo>} ppInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfdisplayattributeinfo">ITfDisplayAttributeInfo</a> interface pointer that receives the object.
     * @param {Pointer<Guid>} pclsidOwner Pointer to a CLSID value that receives the CLSID of the display attribute provider. This parameter can be <b>NULL</b> if the CLSID is not required.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfdisplayattributemgr-getdisplayattributeinfo
     */
    GetDisplayAttributeInfo(guid, ppInfo, pclsidOwner) {
        result := ComCall(5, this, "ptr", guid, "ptr*", ppInfo, "ptr", pclsidOwner, "HRESULT")
        return result
    }
}
