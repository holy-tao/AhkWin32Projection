#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWICBitmapFrameEncode.ahk" { IWICBitmapFrameEncode }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\StructuredStorage\IPropertyBag2.ahk" { IPropertyBag2 }
#Import ".\WICBitmapChainType.ahk" { WICBitmapChainType }

/**
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICBitmapFrameChainWriter extends IUnknown {
    /**
     * The interface identifier for IWICBitmapFrameChainWriter
     * @type {Guid}
     */
    static IID := Guid("{40d9ea28-4768-47b3-8c12-558a48e98e38}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICBitmapFrameChainWriter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AppendFrameToChain   : IntPtr
        DoesSupportChainType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICBitmapFrameChainWriter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {WICBitmapChainType} chainType 
     * @param {Pointer<IPropertyBag2>} ppIEncoderOptions 
     * @returns {IWICBitmapFrameEncode} 
     */
    AppendFrameToChain(chainType, ppIEncoderOptions) {
        result := ComCall(3, this, WICBitmapChainType, chainType, "ptr*", &ppIFrameEncode := 0, IPropertyBag2.Ptr, ppIEncoderOptions, "HRESULT")
        return IWICBitmapFrameEncode(ppIFrameEncode)
    }

    /**
     * 
     * @param {WICBitmapChainType} chainType 
     * @returns {BOOL} 
     */
    DoesSupportChainType(chainType) {
        result := ComCall(4, this, WICBitmapChainType, chainType, BOOL.Ptr, &pfIsSupported := 0, "HRESULT")
        return pfIsSupported
    }

    Query(iid) {
        if (IWICBitmapFrameChainWriter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AppendFrameToChain := CallbackCreate(GetMethod(implObj, "AppendFrameToChain"), flags, 4)
        this.vtbl.DoesSupportChainType := CallbackCreate(GetMethod(implObj, "DoesSupportChainType"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AppendFrameToChain)
        CallbackFree(this.vtbl.DoesSupportChainType)
    }
}
