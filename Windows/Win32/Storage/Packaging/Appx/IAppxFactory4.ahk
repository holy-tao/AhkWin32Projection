#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAppxPackageReader.ahk" { IAppxPackageReader }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxFactory4 extends IUnknown {
    /**
     * The interface identifier for IAppxFactory4
     * @type {Guid}
     */
    static IID := Guid("{92e50000-6934-4c8d-b472-229d431daddf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxFactory4 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreatePackageReaderFromSourceUri : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxFactory4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @param {PWSTR} expectedDigest 
     * @returns {IAppxPackageReader} 
     */
    CreatePackageReaderFromSourceUri(uri, expectedDigest) {
        uri := uri is String ? StrPtr(uri) : uri
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(3, this, "ptr", uri, "ptr", expectedDigest, "ptr*", &packageReader := 0, "HRESULT")
        return IAppxPackageReader(packageReader)
    }

    Query(iid) {
        if (IAppxFactory4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreatePackageReaderFromSourceUri := CallbackCreate(GetMethod(implObj, "CreatePackageReaderFromSourceUri"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreatePackageReaderFromSourceUri)
    }
}
