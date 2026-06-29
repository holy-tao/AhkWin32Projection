#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxBlockMapFile.ahk" { IAppxBlockMapFile }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enumerates the files from a block map.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxblockmapfilesenumerator
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxBlockMapFilesEnumerator extends IUnknown {
    /**
     * The interface identifier for IAppxBlockMapFilesEnumerator
     * @type {Guid}
     */
    static IID := Guid("{02b856a2-4262-4070-bacb-1a8cbbc42305}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxBlockMapFilesEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCurrent    : IntPtr
        GetHasCurrent : IntPtr
        MoveNext      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxBlockMapFilesEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the file at the current position of the enumerator.
     * @remarks
     * The enumerator returned can be empty. In this case, a call to  <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxblockmapfilesenumerator-gethascurrent">GetHasCurrent</a> returns <b>false</b>. If the enumerator is not empty, it points to the first element, and this method returns the first item. Subsequently, the user should use <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxblockmapfilesenumerator-movenext">MoveNext</a> to move through the items, and call <b>GetHasCurrent</b> before using <b>GetCurrent</b> to access the item.
     * @returns {IAppxBlockMapFile} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxblockmapfile">IAppxBlockMapFile</a>**</b>
     * 
     * The current file.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapfilesenumerator-getcurrent
     */
    GetCurrent() {
        result := ComCall(3, this, "ptr*", &_file := 0, "HRESULT")
        return IAppxBlockMapFile(_file)
    }

    /**
     * Determines whether there is a file at the current position of the enumerator. (IAppxBlockMapFilesEnumerator.GetHasCurrent)
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * <b>TRUE</b> if the enumerator's current position references an item; <b>FALSE</b> if the enumerator has passed the last item in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapfilesenumerator-gethascurrent
     */
    GetHasCurrent() {
        result := ComCall(4, this, BOOL.Ptr, &hasCurrent := 0, "HRESULT")
        return hasCurrent
    }

    /**
     * Advances the position of the enumerator to the next file. (IAppxBlockMapFilesEnumerator.MoveNext)
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * <b>TRUE</b> if the enumerator successfully advances
     * 
     * <b>FALSE</b> if the enumerator has passed the end of the collection.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapfilesenumerator-movenext
     */
    MoveNext() {
        result := ComCall(5, this, BOOL.Ptr, &hasCurrent := 0, "HRESULT")
        return hasCurrent
    }

    Query(iid) {
        if (IAppxBlockMapFilesEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCurrent := CallbackCreate(GetMethod(implObj, "GetCurrent"), flags, 2)
        this.vtbl.GetHasCurrent := CallbackCreate(GetMethod(implObj, "GetHasCurrent"), flags, 2)
        this.vtbl.MoveNext := CallbackCreate(GetMethod(implObj, "MoveNext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCurrent)
        CallbackFree(this.vtbl.GetHasCurrent)
        CallbackFree(this.vtbl.MoveNext)
    }
}
