#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteBitmapRenderTarget1.ahk" { IDWriteBitmapRenderTarget1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_BITMAP_DATA_BGRA32.ahk" { DWRITE_BITMAP_DATA_BGRA32 }

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteBitmapRenderTarget2 extends IDWriteBitmapRenderTarget1 {
    /**
     * The interface identifier for IDWriteBitmapRenderTarget2
     * @type {Guid}
     */
    static IID := Guid("{c553a742-fc01-44da-a66e-b8b9ed6c3995}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteBitmapRenderTarget2 interfaces
    */
    struct Vtbl extends IDWriteBitmapRenderTarget1.Vtbl {
        GetBitmapData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteBitmapRenderTarget2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {DWRITE_BITMAP_DATA_BGRA32} 
     */
    GetBitmapData() {
        _bitmapData := DWRITE_BITMAP_DATA_BGRA32()
        result := ComCall(13, this, DWRITE_BITMAP_DATA_BGRA32.Ptr, _bitmapData, "HRESULT")
        return _bitmapData
    }

    Query(iid) {
        if (IDWriteBitmapRenderTarget2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBitmapData := CallbackCreate(GetMethod(implObj, "GetBitmapData"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBitmapData)
    }
}
