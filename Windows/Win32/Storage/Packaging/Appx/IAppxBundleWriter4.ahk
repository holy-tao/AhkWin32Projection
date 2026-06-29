#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a write-only object model for bundle packages. (IAppxBundleWriter4)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxbundlewriter4
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxBundleWriter4 extends IUnknown {
    /**
     * The interface identifier for IAppxBundleWriter4
     * @type {Guid}
     */
    static IID := Guid("{9cd9d523-5009-4c01-9882-dc029fbd47a3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxBundleWriter4 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddPayloadPackage           : IntPtr
        AddPackageReference         : IntPtr
        AddExternalPackageReference : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxBundleWriter4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a new app package to the bundle. (IAppxBundleWriter4.AddPayloadPackage)
     * @param {PWSTR} fileName The name of the payload file. The file name path must be relative to the root of the package.
     * @param {IStream} packageStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of <i>fileName</i>.
     * @param {BOOL} isDefaultApplicablePackage A flag for whether this package is a default applicable package.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlewriter4-addpayloadpackage
     */
    AddPayloadPackage(fileName, packageStream, isDefaultApplicablePackage) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(3, this, "ptr", fileName, "ptr", packageStream, BOOL, isDefaultApplicablePackage, "HRESULT")
        return result
    }

    /**
     * Adds a reference to an optional app package or a payload file within an app bundle. (IAppxBundleWriter4.AddPackageReference)
     * @param {PWSTR} fileName The name of the payload file. The file name path must be relative to the root of the package.
     * @param {IStream} inputStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of <i>fileName</i>.
     * @param {BOOL} isDefaultApplicablePackage A flag for whether this package is a default applicable package.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlewriter4-addpackagereference
     */
    AddPackageReference(fileName, inputStream, isDefaultApplicablePackage) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(4, this, "ptr", fileName, "ptr", inputStream, BOOL, isDefaultApplicablePackage, "HRESULT")
        return result
    }

    /**
     * Adds a reference within the package bundle to an external app package.
     * @param {PWSTR} fileName The name of the payload file. The file name path must be relative to the root of the package.
     * @param {IStream} inputStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of <i>fileName</i>.
     * @param {BOOL} isDefaultApplicablePackage A flag for whether this package is a default applicable package.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlewriter4-addexternalpackagereference
     */
    AddExternalPackageReference(fileName, inputStream, isDefaultApplicablePackage) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(5, this, "ptr", fileName, "ptr", inputStream, BOOL, isDefaultApplicablePackage, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAppxBundleWriter4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddPayloadPackage := CallbackCreate(GetMethod(implObj, "AddPayloadPackage"), flags, 4)
        this.vtbl.AddPackageReference := CallbackCreate(GetMethod(implObj, "AddPackageReference"), flags, 4)
        this.vtbl.AddExternalPackageReference := CallbackCreate(GetMethod(implObj, "AddExternalPackageReference"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddPayloadPackage)
        CallbackFree(this.vtbl.AddPackageReference)
        CallbackFree(this.vtbl.AddExternalPackageReference)
    }
}
