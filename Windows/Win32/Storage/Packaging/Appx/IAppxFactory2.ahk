#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAppxSourceContentGroupMapReader.ahk" { IAppxSourceContentGroupMapReader }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxContentGroupMapWriter.ahk" { IAppxContentGroupMapWriter }
#Import ".\IAppxContentGroupMapReader.ahk" { IAppxContentGroupMapReader }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Creates objects for reading and writing app packages. (IAppxFactory2)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxfactory2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxFactory2 extends IUnknown {
    /**
     * The interface identifier for IAppxFactory2
     * @type {Guid}
     */
    static IID := Guid("{f1346df2-c282-4e22-b918-743a929a8d55}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxFactory2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateContentGroupMapReader       : IntPtr
        CreateSourceContentGroupMapReader : IntPtr
        CreateContentGroupMapWriter       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxFactory2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an IAppxContentGroupMapReader.
     * @param {IStream} inputStream The stream that delivers the content group map XML for reading.
     * @returns {IAppxContentGroupMapReader} The content group map reader.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfactory2-createcontentgroupmapreader
     */
    CreateContentGroupMapReader(inputStream) {
        result := ComCall(3, this, "ptr", inputStream, "ptr*", &contentGroupMapReader := 0, "HRESULT")
        return IAppxContentGroupMapReader(contentGroupMapReader)
    }

    /**
     * Creates an IAppxSourceContentGroupMapReader.
     * @param {IStream} inputStream The stream that delivers the source content group map XML for reading.
     * @returns {IAppxSourceContentGroupMapReader} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfactory2-createsourcecontentgroupmapreader
     */
    CreateSourceContentGroupMapReader(inputStream) {
        result := ComCall(4, this, "ptr", inputStream, "ptr*", &reader := 0, "HRESULT")
        return IAppxSourceContentGroupMapReader(reader)
    }

    /**
     * Creates an IAppxContentGroupMapWriter.
     * @param {IStream} stream The stream that receives the content group map.
     * @returns {IAppxContentGroupMapWriter} Provides a write-only object model for a content group map.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfactory2-createcontentgroupmapwriter
     */
    CreateContentGroupMapWriter(stream) {
        result := ComCall(5, this, "ptr", stream, "ptr*", &contentGroupMapWriter := 0, "HRESULT")
        return IAppxContentGroupMapWriter(contentGroupMapWriter)
    }

    Query(iid) {
        if (IAppxFactory2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateContentGroupMapReader := CallbackCreate(GetMethod(implObj, "CreateContentGroupMapReader"), flags, 3)
        this.vtbl.CreateSourceContentGroupMapReader := CallbackCreate(GetMethod(implObj, "CreateSourceContentGroupMapReader"), flags, 3)
        this.vtbl.CreateContentGroupMapWriter := CallbackCreate(GetMethod(implObj, "CreateContentGroupMapWriter"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateContentGroupMapReader)
        CallbackFree(this.vtbl.CreateSourceContentGroupMapReader)
        CallbackFree(this.vtbl.CreateContentGroupMapWriter)
    }
}
