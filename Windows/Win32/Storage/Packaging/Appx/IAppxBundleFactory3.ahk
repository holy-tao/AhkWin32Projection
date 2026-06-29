#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxBundleReader.ahk" { IAppxBundleReader }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxBundleFactory3 extends IUnknown {
    /**
     * The interface identifier for IAppxBundleFactory3
     * @type {Guid}
     */
    static IID := Guid("{d11ea6b6-3909-4376-b7c4-10d50f5cf3ae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxBundleFactory3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateBundleReaderFromSourceUri : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxBundleFactory3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @param {PWSTR} expectedDigest 
     * @returns {IAppxBundleReader} 
     */
    CreateBundleReaderFromSourceUri(uri, expectedDigest) {
        uri := uri is String ? StrPtr(uri) : uri
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(3, this, "ptr", uri, "ptr", expectedDigest, "ptr*", &bundleReader := 0, "HRESULT")
        return IAppxBundleReader(bundleReader)
    }

    Query(iid) {
        if (IAppxBundleFactory3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateBundleReaderFromSourceUri := CallbackCreate(GetMethod(implObj, "CreateBundleReaderFromSourceUri"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateBundleReaderFromSourceUri)
    }
}
