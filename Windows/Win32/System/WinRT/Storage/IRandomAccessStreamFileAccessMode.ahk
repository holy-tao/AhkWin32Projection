#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to the file access mode that was used when the StorageFile.OpenAsync method was called to open the random-access byte stream.
 * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nn-windowsstoragecom-irandomaccessstreamfileaccessmode
 * @namespace Windows.Win32.System.WinRT.Storage
 */
export default struct IRandomAccessStreamFileAccessMode extends IUnknown {
    /**
     * The interface identifier for IRandomAccessStreamFileAccessMode
     * @type {Guid}
     */
    static IID := Guid("{332e5848-2e15-458e-85c4-c911c0c3d6f4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRandomAccessStreamFileAccessMode interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRandomAccessStreamFileAccessMode.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the file access mode that was used when the StorageFile.OpenAsync method was called to open the random-access byte stream.
     * @returns {Integer} The file access mode that was used when the <a href="https://docs.microsoft.com/uwp/api/windows.storage.storagefile.openasync">StorageFile.OpenAsync</a> method was called to open the random-access byte stream. Cast this value as a <a href="https://docs.microsoft.com/uwp/api/Windows.Storage.FileAccessMode">Windows::Storage::FileAccessMode</a> enumeration value.
     * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nf-windowsstoragecom-irandomaccessstreamfileaccessmode-getmode
     */
    GetMode() {
        result := ComCall(3, this, "uint*", &fileAccessMode := 0, "HRESULT")
        return fileAccessMode
    }

    Query(iid) {
        if (IRandomAccessStreamFileAccessMode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMode := CallbackCreate(GetMethod(implObj, "GetMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMode)
    }
}
