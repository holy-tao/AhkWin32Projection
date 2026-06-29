#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMPDownloadCollection.ahk" { IWMPDownloadCollection }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPDownloadManager extends IDispatch {
    /**
     * The interface identifier for IWMPDownloadManager
     * @type {Guid}
     */
    static IID := Guid("{e15e9ad1-8f20-4cc4-9ec7-1a328ca86a0d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPDownloadManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        getDownloadCollection    : IntPtr
        createDownloadCollection : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPDownloadManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} lCollectionId 
     * @returns {IWMPDownloadCollection} 
     */
    getDownloadCollection(lCollectionId) {
        result := ComCall(7, this, "int", lCollectionId, "ptr*", &ppCollection := 0, "HRESULT")
        return IWMPDownloadCollection(ppCollection)
    }

    /**
     * 
     * @returns {IWMPDownloadCollection} 
     */
    createDownloadCollection() {
        result := ComCall(8, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IWMPDownloadCollection(ppCollection)
    }

    Query(iid) {
        if (IWMPDownloadManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getDownloadCollection := CallbackCreate(GetMethod(implObj, "getDownloadCollection"), flags, 3)
        this.vtbl.createDownloadCollection := CallbackCreate(GetMethod(implObj, "createDownloadCollection"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getDownloadCollection)
        CallbackFree(this.vtbl.createDownloadCollection)
    }
}
