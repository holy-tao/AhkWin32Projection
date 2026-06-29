#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxBundleReader.ahk" { IAppxBundleReader }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Creates objects for reading and writing bundle packages, with the ability to specify the expected digest for the bundle file.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxbundlefactory2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxBundleFactory2 extends IUnknown {
    /**
     * The interface identifier for IAppxBundleFactory2
     * @type {Guid}
     */
    static IID := Guid("{7325b83d-0185-42c4-82ac-be34ab1a2a8a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxBundleFactory2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateBundleReader2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxBundleFactory2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a read-only bundle object that reads its contents from an IStream object, with an optional parameter for specifying the expected digest for the bundle.
     * @remarks
     * Get the digest string for the *expecteDigest* parameter by calling [IAppxDigestProvider::GetDigest](nf-appxpackaging-iappxdigestprovider-getdigest.md).
     * @param {IStream} inputStream The input stream that delivers the content of the package for reading. The stream must support [ISequentialStream::Read](../objidl/nf-objidl-isequentialstream-read.md), [IStream::Seek](../objidl/nf-objidl-istream-seek.md), and [IStream::Stat](/objidl/nf-objidl-istream-stat.md). If these methods fail, their error codes may be passed to and returned by this method.
     * @param {PWSTR} expectedDigest An LPCWSTR containing the expected digest, a hashed representation of the bundle file.
     * @returns {IAppxBundleReader} The created bundle reader.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlefactory2-createbundlereader2
     */
    CreateBundleReader2(inputStream, expectedDigest) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(3, this, "ptr", inputStream, "ptr", expectedDigest, "ptr*", &bundleReader := 0, "HRESULT")
        return IAppxBundleReader(bundleReader)
    }

    Query(iid) {
        if (IAppxBundleFactory2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateBundleReader2 := CallbackCreate(GetMethod(implObj, "CreateBundleReader2"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateBundleReader2)
    }
}
