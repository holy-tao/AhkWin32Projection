#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Packaging\Opc\IOpcPartUri.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The base interface for all XPS document part interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsompart
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPart extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMPart
     * @type {Guid}
     */
    static IID => Guid("{74eb2f0b-a91e-4486-afac-0fabeca3dfc6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPartName", "SetPartName"]

    /**
     * Gets the name that will be used when the part is serialized.
     * @returns {IOpcPartUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name. If the part name has not been set (by the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompart-setpartname">SetPartName</a> method), a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompart-getpartname
     */
    GetPartName() {
        result := ComCall(3, this, "ptr*", &partUri := 0, "HRESULT")
        return IOpcPartUri(partUri)
    }

    /**
     * Sets the name that will be used when the part is serialized.
     * @param {IOpcPartUri} partUri A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a>  interface that contains the name of this part. This parameter cannot be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>partUri</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsompart-setpartname
     */
    SetPartName(partUri) {
        result := ComCall(4, this, "ptr", partUri, "HRESULT")
        return result
    }
}
