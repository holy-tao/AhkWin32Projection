#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPCdrom.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPCdromCollection interface provides a way to organize and access a collection of CD or DVD drives.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpcdromcollection
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPCdromCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPCdromCollection
     * @type {Guid}
     */
    static IID => Guid("{ee4c8fe2-34b2-11d3-a3bf-006097c9b344}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_count", "item", "getByDriveSpecifier"]

    /**
     */
    count {
        get => this.get_count()
    }

    /**
     * The get_count method retrieves the number of available CD and DVD drives on the system.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> containing the count.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromcollection-get_count
     */
    get_count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The item method retrieves a pointer to an IWMPCdrom interface at the given index.
     * @param {Integer} lIndex <b>long</b> containing the index.
     * @returns {IWMPCdrom} Pointer to a pointer to an <b>IWMPCdrom</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromcollection-item
     */
    item(lIndex) {
        result := ComCall(8, this, "int", lIndex, "ptr*", &ppItem := 0, "HRESULT")
        return IWMPCdrom(ppItem)
    }

    /**
     * The getByDriveSpecifier method retrieves a pointer to an IWMPCdrom interface associated with a particular drive letter.
     * @param {BSTR} bstrDriveSpecifier <b>BSTR</b> containing the drive letter followed by a colon (":") character.
     * @returns {IWMPCdrom} Pointer to a pointer to an <b>IWMPCdrom</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromcollection-getbydrivespecifier
     */
    getByDriveSpecifier(bstrDriveSpecifier) {
        bstrDriveSpecifier := bstrDriveSpecifier is String ? BSTR.Alloc(bstrDriveSpecifier).Value : bstrDriveSpecifier

        result := ComCall(9, this, "ptr", bstrDriveSpecifier, "ptr*", &ppCdrom := 0, "HRESULT")
        return IWMPCdrom(ppCdrom)
    }
}
