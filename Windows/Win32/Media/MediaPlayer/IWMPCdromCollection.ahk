#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IWMPCdrom.ahk" { IWMPCdrom }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWMPCdromCollection interface provides a way to organize and access a collection of CD or DVD drives.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpcdromcollection
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPCdromCollection extends IDispatch {
    /**
     * The interface identifier for IWMPCdromCollection
     * @type {Guid}
     */
    static IID := Guid("{ee4c8fe2-34b2-11d3-a3bf-006097c9b344}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPCdromCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_count           : IntPtr
        item                : IntPtr
        getByDriveSpecifier : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPCdromCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    count {
        get => this.get_count()
    }

    /**
     * The get_count method retrieves the number of available CD and DVD drives on the system.
     * @remarks
     * To retrieve the value of this property, read access to the library is required. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * DVD drives are counted exactly like CD drives. However, the Windows Media Player ActiveX control only supports DVD functionality for Windows XP or later. Typically, DVD drives can play CD media, but CD drives cannot play DVD media.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>long</b> set to 0.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromcollection-get_count
     */
    get_count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The item method retrieves a pointer to an IWMPCdrom interface at the given index.
     * @remarks
     * To use this method, read access to the library is required. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_INVALIDARG.
     * @param {Integer} lIndex <b>long</b> containing the index.
     * @returns {IWMPCdrom} Pointer to a pointer to an <b>IWMPCdrom</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromcollection-item
     */
    item(lIndex) {
        result := ComCall(8, this, "int", lIndex, "ptr*", &ppItem := 0, "HRESULT")
        return IWMPCdrom(ppItem)
    }

    /**
     * The getByDriveSpecifier method retrieves a pointer to an IWMPCdrom interface associated with a particular drive letter.
     * @remarks
     * Drive letters must be given in the form <i>X</i>:, where <i>X</i> represents the drive letter.
     * 
     * To use this method, read access to the library is required. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_INVALIDARG.
     * @param {BSTR} bstrDriveSpecifier <b>BSTR</b> containing the drive letter followed by a colon (":") character.
     * @returns {IWMPCdrom} Pointer to a pointer to an <b>IWMPCdrom</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromcollection-getbydrivespecifier
     */
    getByDriveSpecifier(bstrDriveSpecifier) {
        bstrDriveSpecifier := bstrDriveSpecifier is String ? BSTR.Alloc(bstrDriveSpecifier).Value : bstrDriveSpecifier

        result := ComCall(9, this, BSTR, bstrDriveSpecifier, "ptr*", &ppCdrom := 0, "HRESULT")
        return IWMPCdrom(ppCdrom)
    }

    Query(iid) {
        if (IWMPCdromCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_count := CallbackCreate(GetMethod(implObj, "get_count"), flags, 2)
        this.vtbl.item := CallbackCreate(GetMethod(implObj, "item"), flags, 3)
        this.vtbl.getByDriveSpecifier := CallbackCreate(GetMethod(implObj, "getByDriveSpecifier"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_count)
        CallbackFree(this.vtbl.item)
        CallbackFree(this.vtbl.getByDriveSpecifier)
    }
}
