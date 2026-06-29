#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMILBitmapEffectInputConnector.ahk" { IMILBitmapEffectInputConnector }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that define an interior input connector.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectinteriorinputconnector
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectInteriorInputConnector extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffectInteriorInputConnector
     * @type {Guid}
     */
    static IID := Guid("{20287e9e-86a2-4e15-953d-eb1438a5b842}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectInteriorInputConnector interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInputConnector : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectInteriorInputConnector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the IMILBitmapEffectInputConnector associated with the interior connector.
     * @returns {IMILBitmapEffectInputConnector} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectinputconnector">IMILBitmapEffectInputConnector</a>**</b>
     * 
     * A pointer that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectinputconnector">IMILBitmapEffectInputConnector</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectinteriorinputconnector-getinputconnector
     */
    GetInputConnector() {
        result := ComCall(3, this, "ptr*", &pInputConnector := 0, "HRESULT")
        return IMILBitmapEffectInputConnector(pInputConnector)
    }

    Query(iid) {
        if (IMILBitmapEffectInteriorInputConnector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInputConnector := CallbackCreate(GetMethod(implObj, "GetInputConnector"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInputConnector)
    }
}
