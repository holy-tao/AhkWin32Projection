#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a write-only object model for bundle packages. (IAppxBundleWriter3)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxbundlewriter3
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxBundleWriter3 extends IUnknown {
    /**
     * The interface identifier for IAppxBundleWriter3
     * @type {Guid}
     */
    static IID := Guid("{ad711152-f969-4193-82d5-9ddf2786d21a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxBundleWriter3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddPackageReference : IntPtr
        Close               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxBundleWriter3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a reference to an optional app package or a payload file within an app bundle. (IAppxBundleWriter3.AddPackageReference)
     * @remarks
     * By adding a reference to a payload file or optional app package to an app bundle, the overall size of the bundle is reduced.
     * @param {PWSTR} fileName The name of the payload file. The file name path must be relative to the root of the package.
     * @param {IStream} inputStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of <i>fileName</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlewriter3-addpackagereference
     */
    AddPackageReference(fileName, inputStream) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(3, this, "ptr", fileName, "ptr", inputStream, "HRESULT")
        return result
    }

    /**
     * Finalizes the bundle package by writing footprint files at the end of the package, and closes the writer’s output stream. (IAppxBundleWriter3.Close)
     * @param {PWSTR} hashMethodString The string value of the <b>HashMethod</b> attribute of the <a href="https://docs.microsoft.com/uwp/schemas/blockmapschema/element-blockmap">BlockMap</a> root element.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlewriter3-close
     */
    Close(hashMethodString) {
        hashMethodString := hashMethodString is String ? StrPtr(hashMethodString) : hashMethodString

        result := ComCall(4, this, "ptr", hashMethodString, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAppxBundleWriter3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddPackageReference := CallbackCreate(GetMethod(implObj, "AddPackageReference"), flags, 3)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddPackageReference)
        CallbackFree(this.vtbl.Close)
    }
}
