#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMILBitmapEffectConnectorInfo.ahk" { IMILBitmapEffectConnectorInfo }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that retrieves information about what input and output pins are exposed by the bitmap effect.
 * @remarks
 * If this interface is not implemented when creating a custom bitmap effect, a single input and output pin implementation with a 32bit RGBA format is assumes.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectconnectionsinfo
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectConnectionsInfo extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffectConnectionsInfo
     * @type {Guid}
     */
    static IID := Guid("{476b538a-c765-4237-ba4a-d6a880ff0cfc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectConnectionsInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNumberInputs        : IntPtr
        GetNumberOutputs       : IntPtr
        GetInputConnectorInfo  : IntPtr
        GetOutputConnectorInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectConnectionsInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the number of input pins the bitmap effect implements.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * When this method returns, contains the number of input pins the bitmap effect implements.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnectionsinfo-getnumberinputs
     */
    GetNumberInputs() {
        result := ComCall(3, this, "uint*", &puiNumInputs := 0, "HRESULT")
        return puiNumInputs
    }

    /**
     * Retrieves the number of output pins the bitmap effect implements.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * When this method returns, contains the number of output pins the bitmap effect implements.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnectionsinfo-getnumberoutputs
     */
    GetNumberOutputs() {
        result := ComCall(4, this, "uint*", &puiNumOutputs := 0, "HRESULT")
        return puiNumOutputs
    }

    /**
     * Retrieves the IMILBitmapEffectConnectorInfo associated with the given input pin.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating which input pin to query for connector information.
     * @returns {IMILBitmapEffectConnectorInfo} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectconnectorinfo">IMILBitmapEffectConnectorInfo</a>**</b>
     * 
     * When this method returns, contain the connector information for the given input pin.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnectionsinfo-getinputconnectorinfo
     */
    GetInputConnectorInfo(uiIndex) {
        result := ComCall(5, this, "uint", uiIndex, "ptr*", &ppConnectorInfo := 0, "HRESULT")
        return IMILBitmapEffectConnectorInfo(ppConnectorInfo)
    }

    /**
     * Retrieves the IMILBitmapEffectConnectorInfo associated with the given output pin.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating which output pin to query for connector information.
     * @returns {IMILBitmapEffectConnectorInfo} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectconnectorinfo">IMILBitmapEffectConnectorInfo</a>**</b>
     * 
     * When this method returns, contain the connector information for the given output pin.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnectionsinfo-getoutputconnectorinfo
     */
    GetOutputConnectorInfo(uiIndex) {
        result := ComCall(6, this, "uint", uiIndex, "ptr*", &ppConnectorInfo := 0, "HRESULT")
        return IMILBitmapEffectConnectorInfo(ppConnectorInfo)
    }

    Query(iid) {
        if (IMILBitmapEffectConnectionsInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNumberInputs := CallbackCreate(GetMethod(implObj, "GetNumberInputs"), flags, 2)
        this.vtbl.GetNumberOutputs := CallbackCreate(GetMethod(implObj, "GetNumberOutputs"), flags, 2)
        this.vtbl.GetInputConnectorInfo := CallbackCreate(GetMethod(implObj, "GetInputConnectorInfo"), flags, 3)
        this.vtbl.GetOutputConnectorInfo := CallbackCreate(GetMethod(implObj, "GetOutputConnectorInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNumberInputs)
        CallbackFree(this.vtbl.GetNumberOutputs)
        CallbackFree(this.vtbl.GetInputConnectorInfo)
        CallbackFree(this.vtbl.GetOutputConnectorInfo)
    }
}
