#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPSyncDevice.ahk

/**
 * The IWMPSyncDevice2 interface provides a method that supplements the IWMPSyncDevice interface.To use this interface, you must create a remoted instance of the Windows Media Player 10 or later control.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpsyncdevice2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSyncDevice2 extends IWMPSyncDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPSyncDevice2
     * @type {Guid}
     */
    static IID => Guid("{88afb4b2-140a-44d2-91e6-4543da467cd1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["setItemInfo"]

    /**
     * The setItemInfo method specifies an attribute value for a device.
     * @param {BSTR} bstrItemName <b>BSTR</b>specifying the name of the attribute on which to set the new value. For supported attribute names, see Remarks.
     * @param {BSTR} bstrVal <b>BSTR</b>specifying the new value. For information about supported values, see Remarks.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded or a partnership exists.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice2-setiteminfo
     */
    setItemInfo(bstrItemName, bstrVal) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(19, this, "ptr", bstrItemName, "ptr", bstrVal, "HRESULT")
        return result
    }
}
