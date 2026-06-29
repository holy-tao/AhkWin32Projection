#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMILBitmapEffectInputConnector.ahk" { IMILBitmapEffectInputConnector }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMILBitmapEffectOutputConnector.ahk" { IMILBitmapEffectOutputConnector }

/**
 * Exposes methods used to retrieve input and output connectors exposed by the bitmap effect.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectconnections
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectConnections extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffectConnections
     * @type {Guid}
     */
    static IID := Guid("{c2b5d861-9b1a-4374-89b0-dec4874d6a81}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectConnections interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInputConnector  : IntPtr
        GetOutputConnector : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectConnections.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the input connector associated with the given pin index.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating which input pin to use to retrieve the input connector.
     * @returns {IMILBitmapEffectInputConnector} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectinputconnector">IMILBitmapEffectInputConnector</a>**</b>
     * 
     * When this method returns, contains the input connector for the given input pin.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnections-getinputconnector
     */
    GetInputConnector(uiIndex) {
        result := ComCall(3, this, "uint", uiIndex, "ptr*", &ppConnector := 0, "HRESULT")
        return IMILBitmapEffectInputConnector(ppConnector)
    }

    /**
     * Retrieves the output connector associated with the given pin index.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating which output pin to use to retrieve the output connector.
     * @returns {IMILBitmapEffectOutputConnector} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectoutputconnector">IMILBitmapEffectOutputConnector</a>**</b>
     * 
     * When this method returns, contains the output connector for the given output pin.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnections-getoutputconnector
     */
    GetOutputConnector(uiIndex) {
        result := ComCall(4, this, "uint", uiIndex, "ptr*", &ppConnector := 0, "HRESULT")
        return IMILBitmapEffectOutputConnector(ppConnector)
    }

    Query(iid) {
        if (IMILBitmapEffectConnections.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInputConnector := CallbackCreate(GetMethod(implObj, "GetInputConnector"), flags, 3)
        this.vtbl.GetOutputConnector := CallbackCreate(GetMethod(implObj, "GetOutputConnector"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInputConnector)
        CallbackFree(this.vtbl.GetOutputConnector)
    }
}
