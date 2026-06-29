#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWICBitmapFrameDecode.ahk" { IWICBitmapFrameDecode }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WICBitmapChainType.ahk" { WICBitmapChainType }

/**
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICBitmapFrameChainReader extends IUnknown {
    /**
     * The interface identifier for IWICBitmapFrameChainReader
     * @type {Guid}
     */
    static IID := Guid("{0c599495-a120-4222-9130-a8c29410bd0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICBitmapFrameChainReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetChainedFrameCount : IntPtr
        GetChainedFrame      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICBitmapFrameChainReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {WICBitmapChainType} chainType 
     * @returns {Integer} 
     */
    GetChainedFrameCount(chainType) {
        result := ComCall(3, this, WICBitmapChainType, chainType, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {WICBitmapChainType} chainType 
     * @param {Integer} index 
     * @returns {IWICBitmapFrameDecode} 
     */
    GetChainedFrame(chainType, index) {
        result := ComCall(4, this, WICBitmapChainType, chainType, "uint", index, "ptr*", &ppIBitmapFrame := 0, "HRESULT")
        return IWICBitmapFrameDecode(ppIBitmapFrame)
    }

    Query(iid) {
        if (IWICBitmapFrameChainReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetChainedFrameCount := CallbackCreate(GetMethod(implObj, "GetChainedFrameCount"), flags, 3)
        this.vtbl.GetChainedFrame := CallbackCreate(GetMethod(implObj, "GetChainedFrame"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetChainedFrameCount)
        CallbackFree(this.vtbl.GetChainedFrame)
    }
}
