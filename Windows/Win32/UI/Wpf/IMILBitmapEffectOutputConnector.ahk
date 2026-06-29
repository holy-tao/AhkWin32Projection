#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMILBitmapEffectInputConnector.ahk" { IMILBitmapEffectInputConnector }
#Import ".\IMILBitmapEffectConnector.ahk" { IMILBitmapEffectConnector }

/**
 * Exposes methods that define an output connector. (IMILBitmapEffectOutputConnector)
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectoutputconnector
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectOutputConnector extends IMILBitmapEffectConnector {
    /**
     * The interface identifier for IMILBitmapEffectOutputConnector
     * @type {Guid}
     */
    static IID := Guid("{92957aad-841b-4866-82ec-8752468b07fd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectOutputConnector interfaces
    */
    struct Vtbl extends IMILBitmapEffectConnector.Vtbl {
        GetNumberConnections : IntPtr
        GetConnection        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectOutputConnector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the number of connections the output connector has.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * The number of connects the output connector has.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectoutputconnector-getnumberconnections
     */
    GetNumberConnections() {
        result := ComCall(9, this, "uint*", &puiNumberConnections := 0, "HRESULT")
        return puiNumberConnections
    }

    /**
     * Gets the IMILBitmapEffectInputConnector associated with the output connector.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * The index of the desired input connector.
     * @returns {IMILBitmapEffectInputConnector} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectinputconnector">IMILBitmapEffectInputConnector</a>**</b>
     * 
     * A pointer that receives a pointer to the associated input connector.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectoutputconnector-getconnection
     */
    GetConnection(uiIndex) {
        result := ComCall(10, this, "uint", uiIndex, "ptr*", &ppConnection := 0, "HRESULT")
        return IMILBitmapEffectInputConnector(ppConnection)
    }

    Query(iid) {
        if (IMILBitmapEffectOutputConnector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNumberConnections := CallbackCreate(GetMethod(implObj, "GetNumberConnections"), flags, 2)
        this.vtbl.GetConnection := CallbackCreate(GetMethod(implObj, "GetConnection"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNumberConnections)
        CallbackFree(this.vtbl.GetConnection)
    }
}
