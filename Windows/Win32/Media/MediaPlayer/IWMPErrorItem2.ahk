#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPErrorItem.ahk

/**
 * The IWMPErrorItem2 interface provides a method that supplements the IWMPErrorItem interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmperroritem2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPErrorItem2 extends IWMPErrorItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPErrorItem2
     * @type {Guid}
     */
    static IID => Guid("{f75ccec0-c67c-475c-931e-8719870bee7d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_condition"]

    /**
     */
    condition {
        get => this.get_condition()
    }

    /**
     * The get_condition method retrieves a value indicating the condition for the error.
     * @param {Pointer<Integer>} plCondition Pointer to a <b>long</b> containing the condition code.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmperroritem2-get_condition
     */
    get_condition(plCondition) {
        plConditionMarshal := plCondition is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, plConditionMarshal, plCondition, "HRESULT")
        return result
    }
}
