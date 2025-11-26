#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfMSAAControl interface is used by Microsoft Active Accessibility to add or remove a document from TSF control, to avoid unnecessary overhead in TSF. This interface is not recommended for use by other applications.
 * @see https://docs.microsoft.com/windows/win32/api//msaatext/nn-msaatext-itfmsaacontrol
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfMSAAControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfMSAAControl
     * @type {Guid}
     */
    static IID => Guid("{b5f8fb3b-393f-4f7c-84cb-504924c2705a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SystemEnableMSAA", "SystemDisableMSAA"]

    /**
     * ITfMSAAControl::SystemEnableMSAA method
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-itfmsaacontrol-systemenablemsaa
     */
    SystemEnableMSAA() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * ITfMSAAControl::SystemDisableMSAA method
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-itfmsaacontrol-systemdisablemsaa
     */
    SystemDisableMSAA() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
