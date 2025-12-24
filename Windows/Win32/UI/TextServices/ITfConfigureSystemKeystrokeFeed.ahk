#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfConfigureSystemKeystrokeFeed interface is implemented by the TSF manager to enable and disable the processing of keystrokes.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfconfiguresystemkeystrokefeed
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfConfigureSystemKeystrokeFeed extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfConfigureSystemKeystrokeFeed
     * @type {Guid}
     */
    static IID => Guid("{0d2c969a-bc9c-437c-84ee-951c49b1a764}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DisableSystemKeystrokeFeed", "EnableSystemKeystrokeFeed"]

    /**
     * ITfConfigureSystemKeystrokeFeed::DisableSystemKeystrokeFeed method
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
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfconfiguresystemkeystrokefeed-disablesystemkeystrokefeed
     */
    DisableSystemKeystrokeFeed() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * ITfConfigureSystemKeystrokeFeed::EnableSystemKeystrokeFeed method
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was no corresponding call to DisableSystemKeystrokeFeed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfconfiguresystemkeystrokefeed-enablesystemkeystrokefeed
     */
    EnableSystemKeystrokeFeed() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
