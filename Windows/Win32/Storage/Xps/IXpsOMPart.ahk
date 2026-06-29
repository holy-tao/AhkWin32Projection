#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Packaging\Opc\IOpcPartUri.ahk" { IOpcPartUri }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The base interface for all XPS document part interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompart
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMPart extends IUnknown {
    /**
     * The interface identifier for IXpsOMPart
     * @type {Guid}
     */
    static IID := Guid("{74eb2f0b-a91e-4486-afac-0fabeca3dfc6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMPart interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPartName : IntPtr
        SetPartName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMPart.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the name that will be used when the part is serialized.
     * @returns {IOpcPartUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the part name. If the part name has not been set (by the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompart-setpartname">SetPartName</a> method), a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompart-getpartname
     */
    GetPartName() {
        result := ComCall(3, this, "ptr*", &partUri := 0, "HRESULT")
        return IOpcPartUri(partUri)
    }

    /**
     * Sets the name that will be used when the part is serialized.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackagewriter">IXpsOMPackageWriter</a> will generate an error if it encounters an XPS document part whose name is the same as that of a  part it has previously serialized.
     * @param {IOpcPartUri} partUri A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a>  interface that contains the name of this part. This parameter cannot be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompart-setpartname
     */
    SetPartName(partUri) {
        result := ComCall(4, this, "ptr", partUri, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXpsOMPart.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPartName := CallbackCreate(GetMethod(implObj, "GetPartName"), flags, 2)
        this.vtbl.SetPartName := CallbackCreate(GetMethod(implObj, "SetPartName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPartName)
        CallbackFree(this.vtbl.SetPartName)
    }
}
