#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMILBitmapEffectOutputConnector.ahk" { IMILBitmapEffectOutputConnector }

/**
 * Exposes methods that define an interior output connector.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectinterioroutputconnector
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectInteriorOutputConnector extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffectInteriorOutputConnector
     * @type {Guid}
     */
    static IID := Guid("{00bbb6dc-acc9-4bfc-b344-8bee383dfefa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectInteriorOutputConnector interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOutputConnector : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectInteriorOutputConnector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the IMILBitmapEffectOutputConnector associated with the interior output connector.
     * @returns {IMILBitmapEffectOutputConnector} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectoutputconnector">IMILBitmapEffectOutputConnector</a>**</b>
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectinterioroutputconnector-getoutputconnector
     */
    GetOutputConnector() {
        result := ComCall(3, this, "ptr*", &pOutputConnector := 0, "HRESULT")
        return IMILBitmapEffectOutputConnector(pOutputConnector)
    }

    Query(iid) {
        if (IMILBitmapEffectInteriorOutputConnector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOutputConnector := CallbackCreate(GetMethod(implObj, "GetOutputConnector"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOutputConnector)
    }
}
