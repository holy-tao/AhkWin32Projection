#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\StructuredStorage\IStorage.ahk" { IStorage }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.UI
 */
export default struct IThumbnailExtractor extends IUnknown {
    /**
     * The interface identifier for IThumbnailExtractor
     * @type {Guid}
     */
    static IID := Guid("{969dc708-5c76-11d1-8d86-0000f804b057}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IThumbnailExtractor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ExtractThumbnail : IntPtr
        OnFileUpdated    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IThumbnailExtractor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IStorage} pStg 
     * @param {Integer} ulLength 
     * @param {Integer} ulHeight 
     * @param {Pointer<Integer>} pulOutputLength 
     * @param {Pointer<Integer>} pulOutputHeight 
     * @param {Pointer<HBITMAP>} phOutputBitmap 
     * @returns {HRESULT} 
     */
    ExtractThumbnail(pStg, ulLength, ulHeight, pulOutputLength, pulOutputHeight, phOutputBitmap) {
        pulOutputLengthMarshal := pulOutputLength is VarRef ? "uint*" : "ptr"
        pulOutputHeightMarshal := pulOutputHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pStg, "uint", ulLength, "uint", ulHeight, pulOutputLengthMarshal, pulOutputLength, pulOutputHeightMarshal, pulOutputHeight, HBITMAP.Ptr, phOutputBitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStorage} pStg 
     * @returns {HRESULT} 
     */
    OnFileUpdated(pStg) {
        result := ComCall(4, this, "ptr", pStg, "HRESULT")
        return result
    }

    Query(iid) {
        if (IThumbnailExtractor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ExtractThumbnail := CallbackCreate(GetMethod(implObj, "ExtractThumbnail"), flags, 7)
        this.vtbl.OnFileUpdated := CallbackCreate(GetMethod(implObj, "OnFileUpdated"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ExtractThumbnail)
        CallbackFree(this.vtbl.OnFileUpdated)
    }
}
