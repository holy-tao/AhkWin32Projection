#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\TF_DISPLAYATTRIBUTE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfDisplayAttributeInfo interface is implemented by a text service to provide display attribute data. This interface is used by any component, most often an application, that must determine how text displays.
 * @remarks
 * An application obtains an instance of this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdisplayattributemgr-getdisplayattributeinfo">ITfDisplayAttributeMgr::GetDisplayAttributeInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-ienumtfdisplayattributeinfo-next">IEnumTfDisplayAttributeInfo::Next</a>.
 * 
 * A text service supplies an instance of this interface in its <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdisplayattributeprovider-getdisplayattributeinfo">ITfDisplayAttributeProvider::GetDisplayAttributeInfo</a> method.
 * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nn-msctf-itfdisplayattributeinfo
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfDisplayAttributeInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfDisplayAttributeInfo
     * @type {Guid}
     */
    static IID => Guid("{70528852-2f26-4aea-8c96-215150578932}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGUID", "GetDescription", "GetAttributeInfo", "SetAttributeInfo", "Reset"]

    /**
     * ITfDisplayAttributeInfo::GetGUID method
     * @returns {Guid} Pointer to a GUID value that receives the GUID for the display attribute.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfdisplayattributeinfo-getguid
     */
    GetGUID() {
        pguid := Guid()
        result := ComCall(3, this, "ptr", pguid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pguid
    }

    /**
     * ITfDisplayAttributeInfo::GetDescription method
     * @returns {BSTR} Pointer to a BSTR value that receives the description string. This value must be allocated using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The caller must free this memory using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfdisplayattributeinfo-getdescription
     */
    GetDescription() {
        pbstrDesc := BSTR()
        result := ComCall(4, this, "ptr", pbstrDesc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrDesc
    }

    /**
     * ITfDisplayAttributeInfo::GetAttributeInfo method
     * @returns {TF_DISPLAYATTRIBUTE} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_displayattribute">TF_DISPLAYATTRIBUTE</a> structure that receives display attribute data.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfdisplayattributeinfo-getattributeinfo
     */
    GetAttributeInfo() {
        pda := TF_DISPLAYATTRIBUTE()
        result := ComCall(5, this, "ptr", pda, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pda
    }

    /**
     * ITfDisplayAttributeInfo::SetAttributeInfo method
     * @remarks
     * The implementation of this method should not call <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdisplayattributemgr-onupdateinfo">ITfDisplayAttributeMgr::OnUpdateInfo</a> in response to this method. The caller must do so. This avoids redundant notifications if more than one attribute is modified. The caller must eventually call <b>ITfDisplayAttributeMgr::OnUpdateInfo</b> so that other clients will receive an attribute update notification.
     * @param {Pointer<TF_DISPLAYATTRIBUTE>} pda Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_displayattribute">TF_DISPLAYATTRIBUTE</a> structure that contains the new display attribute data.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The display attribute provider does not support attribute modification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pda</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfdisplayattributeinfo-setattributeinfo
     */
    SetAttributeInfo(pda) {
        result := ComCall(6, this, "ptr", pda, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * ITfDisplayAttributeInfo::Reset method
     * @remarks
     * The implementation of this method should not call <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdisplayattributemgr-onupdateinfo">ITfDisplayAttributeMgr::OnUpdateInfo</a> in response to this method. The caller must do so. This avoids redundant notifications if more than one attribute is modified. The caller must eventually call <b>ITfDisplayAttributeMgr::OnUpdateInfo</b> so that other clients will receive an attribute update notification.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The display attribute provider does not support attribute modification.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfdisplayattributeinfo-reset
     */
    Reset() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
