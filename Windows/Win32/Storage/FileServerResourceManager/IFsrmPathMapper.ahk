#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Used to retrieve the network share paths that are mapped to a local path.
 * @remarks
 * To create this object from a script, use the program identifier, "Fsrm.FsrmPathMapper".
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nn-fsrm-ifsrmpathmapper
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmPathMapper extends IDispatch {
    /**
     * The interface identifier for IFsrmPathMapper
     * @type {Guid}
     */
    static IID := Guid("{6f4dbfff-6920-4821-a6c3-b7e94c1fd60c}")

    /**
     * The class identifier for FsrmPathMapper
     * @type {Guid}
     */
    static CLSID := Guid("{f3be42bd-8ac2-409e-bbd8-faf9b6b41feb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmPathMapper interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetSharePathsForLocalPath : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmPathMapper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a list of network shares that point to the specified local path.
     * @remarks
     * When you get the path property for a quota, the path is the local path. You use this method to convert that 
     *     local path to the network path if you want to know the actual network share that is running out of space.
     * @param {BSTR} localPath The local path. The string is limited to 260 characters.
     * @returns {Pointer<SAFEARRAY>} A <b>SAFEARRAY</b> of <b>VARIANT</b>s. Each 
     *       <b>VARIANT</b> contains a network share path that points to the local path. The variant 
     *       type is <b>VT_BSTR</b>. Use the <b>bstrVal</b> member to access the share 
     *       path.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmpathmapper-getsharepathsforlocalpath
     */
    GetSharePathsForLocalPath(localPath) {
        localPath := localPath is String ? BSTR.Alloc(localPath).Value : localPath

        result := ComCall(7, this, BSTR, localPath, "ptr*", &sharePaths := 0, "HRESULT")
        return sharePaths
    }

    Query(iid) {
        if (IFsrmPathMapper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSharePathsForLocalPath := CallbackCreate(GetMethod(implObj, "GetSharePathsForLocalPath"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSharePathsForLocalPath)
    }
}
