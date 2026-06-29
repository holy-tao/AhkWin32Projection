#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMILBitmapEffect.ahk" { IMILBitmapEffect }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMILBitmapEffectConnectorInfo.ahk" { IMILBitmapEffectConnectorInfo }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Exposes methods that define an effect output pin.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectconnector
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectConnector extends IMILBitmapEffectConnectorInfo {
    /**
     * The interface identifier for IMILBitmapEffectConnector
     * @type {Guid}
     */
    static IID := Guid("{f59567b3-76c1-4d47-ba1e-79f955e350ef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectConnector interfaces
    */
    struct Vtbl extends IMILBitmapEffectConnectorInfo.Vtbl {
        IsConnected     : IntPtr
        GetBitmapEffect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectConnector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether the connector is connected to an effect.
     * @returns {VARIANT_BOOL} Type: <b>VARIANT_BOOL*</b>
     * 
     * A pointer that receives <c>TRUE</code> if the connector is connected to an effect; otherwise, <code>FALSE</c>.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnector-isconnected
     */
    IsConnected() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &pfConnected := 0, "HRESULT")
        return pfConnected
    }

    /**
     * Gets the IMILBitmapEffect associated with the connector.
     * @returns {IMILBitmapEffect} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffect">IMILBitmapEffect</a>**</b>
     * 
     * A pointer that receives a pointer to the bitmap effect.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnector-getbitmapeffect
     */
    GetBitmapEffect() {
        result := ComCall(8, this, "ptr*", &ppEffect := 0, "HRESULT")
        return IMILBitmapEffect(ppEffect)
    }

    Query(iid) {
        if (IMILBitmapEffectConnector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsConnected := CallbackCreate(GetMethod(implObj, "IsConnected"), flags, 2)
        this.vtbl.GetBitmapEffect := CallbackCreate(GetMethod(implObj, "GetBitmapEffect"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsConnected)
        CallbackFree(this.vtbl.GetBitmapEffect)
    }
}
