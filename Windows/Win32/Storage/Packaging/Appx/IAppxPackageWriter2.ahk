#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a write-only object model for app packages. (IAppxPackageWriter2)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxpackagewriter2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxPackageWriter2 extends IUnknown {
    /**
     * The interface identifier for IAppxPackageWriter2
     * @type {Guid}
     */
    static IID := Guid("{2cf5c4fd-e54c-4ea5-ba4e-f8c4b105a8c8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxPackageWriter2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Close : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxPackageWriter2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Closes the package writer object's output stream.
     * @param {IStream} manifest The stream that provides the contents of the manifest for the package. The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>.
     * @param {IStream} contentGroupMap The stream that provides the contents of the content group map for the package.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code that includes, but is not limited to, those in the following table. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOT_VALID_STATE </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer is closed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>APPX_E_INVALID_MANIFEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input stream contains a manifest that is not valid. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackagewriter2-close
     */
    Close(manifest, contentGroupMap) {
        result := ComCall(3, this, "ptr", manifest, "ptr", contentGroupMap, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAppxPackageWriter2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Close)
    }
}
