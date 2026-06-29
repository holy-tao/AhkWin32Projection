#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ICCSubStreamFiltering)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-iccsubstreamfiltering
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct ICCSubStreamFiltering extends IUnknown {
    /**
     * The interface identifier for ICCSubStreamFiltering
     * @type {Guid}
     */
    static IID := Guid("{4b2bd7ea-8347-467b-8dbf-62f784929cc3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICCSubStreamFiltering interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_SubstreamTypes : IntPtr
        put_SubstreamTypes : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICCSubStreamFiltering.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    SubstreamTypes {
        get => this.get_SubstreamTypes()
        set => this.put_SubstreamTypes(value)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Receives a bitwise OR of flags that specify the closed captioning services. For a list of flags, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/ks-cc-substream">KS_CC_SUBSTREAM Constants</a>.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-iccsubstreamfiltering-get_substreamtypes
     */
    get_SubstreamTypes() {
        result := ComCall(3, this, "int*", &pTypes := 0, "HRESULT")
        return pTypes
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} Types Bitwise OR of flags that specify the closed captioning services. For a list of flags, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/ks-cc-substream">KS_CC_SUBSTREAM Constants</a>. Any services that are not selected are simply dropped.
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
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-iccsubstreamfiltering-put_substreamtypes
     */
    put_SubstreamTypes(Types) {
        result := ComCall(4, this, "int", Types, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICCSubStreamFiltering.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SubstreamTypes := CallbackCreate(GetMethod(implObj, "get_SubstreamTypes"), flags, 2)
        this.vtbl.put_SubstreamTypes := CallbackCreate(GetMethod(implObj, "put_SubstreamTypes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SubstreamTypes)
        CallbackFree(this.vtbl.put_SubstreamTypes)
    }
}
