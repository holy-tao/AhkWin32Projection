#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDRMReader2.ahk

/**
 * The IWMDRMReader3 interface enables content transcription by providing a method to get protection systems approved by a license.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmdrmreader3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMReader3 extends IWMDRMReader2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDRMReader3
     * @type {Guid}
     */
    static IID => Guid("{e08672de-f1e7-4ff4-a0a3-fc4b08e4caf8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInclusionList"]

    /**
     * The GetInclusionList method retrieves a list of identifiers specifying approved protection systems.
     * @param {Pointer<Pointer<Guid>>} ppGuids Address of a variable that receives a pointer to an array of identifiers. The array is allocated by using <b>CoTaskMemAlloc</b>. When finished with the list, release the memory by calling <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pcGuids Number of elements in the array received by the <i>ppGuids</i> parameter.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmreader3-getinclusionlist
     */
    GetInclusionList(ppGuids, pcGuids) {
        ppGuidsMarshal := ppGuids is VarRef ? "ptr*" : "ptr"
        pcGuidsMarshal := pcGuids is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, ppGuidsMarshal, ppGuids, pcGuidsMarshal, pcGuids, "HRESULT")
        return result
    }
}
