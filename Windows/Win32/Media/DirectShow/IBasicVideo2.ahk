#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBasicVideo.ahk

/**
 * The IBasicVideo2 interface extends the IBasicVideo interface.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-ibasicvideo2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBasicVideo2 extends IBasicVideo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBasicVideo2
     * @type {Guid}
     */
    static IID => Guid("{329bb360-f6ea-11d1-9038-00a0c9697298}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 39

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPreferredAspectRatio"]

    /**
     * The GetPreferredAspectRatio method retrieves the preferred aspect ratio.
     * @param {Pointer<Integer>} plAspectX Pointer to a value that indicates the x-axis aspect ratio.
     * @param {Pointer<Integer>} plAspectY Pointer to a value that indicates the y-axis aspect ratio.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
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
     * One or both of the parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The renderer does not implement <b>IBasicVideo2</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo2-getpreferredaspectratio
     */
    GetPreferredAspectRatio(plAspectX, plAspectY) {
        plAspectXMarshal := plAspectX is VarRef ? "int*" : "ptr"
        plAspectYMarshal := plAspectY is VarRef ? "int*" : "ptr"

        result := ComCall(39, this, plAspectXMarshal, plAspectX, plAspectYMarshal, plAspectY, "HRESULT")
        return result
    }
}
