#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPPlayerServices.ahk

/**
 * The IWMPPlayerServices2 interface provides a method used by the host of a remoted Windows Media Player control to manipulate the full mode of the Player.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpplayerservices2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlayerServices2 extends IWMPPlayerServices{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPPlayerServices2
     * @type {Guid}
     */
    static IID => Guid("{1bb1592f-f040-418a-9f71-17c7512b4d70}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["setBackgroundProcessingPriority"]

    /**
     * The setBackgroundProcessingPriority method specifies a priority level for general background processing tasks.
     * @param {BSTR} bstrPriority 
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The method succeeded.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplayerservices2-setbackgroundprocessingpriority
     */
    setBackgroundProcessingPriority(bstrPriority) {
        bstrPriority := bstrPriority is String ? BSTR.Alloc(bstrPriority).Value : bstrPriority

        result := ComCall(6, this, "ptr", bstrPriority, "HRESULT")
        return result
    }
}
