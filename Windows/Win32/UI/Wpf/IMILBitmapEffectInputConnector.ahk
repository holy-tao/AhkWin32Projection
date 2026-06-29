#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMILBitmapEffectConnector.ahk" { IMILBitmapEffectConnector }
#Import ".\IMILBitmapEffectOutputConnector.ahk" { IMILBitmapEffectOutputConnector }

/**
 * Exposes methods that define an input connect.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectinputconnector
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectInputConnector extends IMILBitmapEffectConnector {
    /**
     * The interface identifier for IMILBitmapEffectInputConnector
     * @type {Guid}
     */
    static IID := Guid("{a9b4ecaa-7a3c-45e7-8573-f4b81b60dd6c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectInputConnector interfaces
    */
    struct Vtbl extends IMILBitmapEffectConnector.Vtbl {
        ConnectTo     : IntPtr
        GetConnection : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectInputConnector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Connects the input connector to the given output connector.
     * @param {IMILBitmapEffectOutputConnector} pConnector Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectoutputconnector">IMILBitmapEffectOutputConnector</a>*</b>
     * 
     * A pointer to the connector to connect the input to.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectinputconnector-connectto
     */
    ConnectTo(pConnector) {
        result := ComCall(9, this, "ptr", pConnector, "HRESULT")
        return result
    }

    /**
     * Gets the IMILBitmapEffectOutputConnector the input connector is connected to.
     * @returns {IMILBitmapEffectOutputConnector} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectoutputconnector">IMILBitmapEffectOutputConnector</a>**</b>
     * 
     * A pointer that receives a pointer to the associated output connector.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectinputconnector-getconnection
     */
    GetConnection() {
        result := ComCall(10, this, "ptr*", &ppConnector := 0, "HRESULT")
        return IMILBitmapEffectOutputConnector(ppConnector)
    }

    Query(iid) {
        if (IMILBitmapEffectInputConnector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConnectTo := CallbackCreate(GetMethod(implObj, "ConnectTo"), flags, 2)
        this.vtbl.GetConnection := CallbackCreate(GetMethod(implObj, "GetConnection"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConnectTo)
        CallbackFree(this.vtbl.GetConnection)
    }
}
