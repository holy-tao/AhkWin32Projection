#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that retrieve information about a specific input or output connector pin.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectconnectorinfo
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectConnectorInfo extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffectConnectorInfo
     * @type {Guid}
     */
    static IID := Guid("{f66d2e4b-b46b-42fc-859e-3da0ecdb3c43}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectConnectorInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIndex         : IntPtr
        GetOptimalFormat : IntPtr
        GetNumberFormats : IntPtr
        GetFormat        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectConnectorInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the zero based index value for the pin.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * When this method returns, contains the zero based index value for the pin.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnectorinfo-getindex
     */
    GetIndex() {
        result := ComCall(3, this, "uint*", &puiIndex := 0, "HRESULT")
        return puiIndex
    }

    /**
     * Retrieves the optimal pixel format for the pin.
     * @returns {Guid} Type: <b>WICPixelFormatGUID*</b>
     * 
     * When this method returns, contains the optimal pixel format for the pin.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnectorinfo-getoptimalformat
     */
    GetOptimalFormat() {
        pFormat := Guid()
        result := ComCall(4, this, Guid.Ptr, pFormat, "HRESULT")
        return pFormat
    }

    /**
     * Retrieves the number of pixel formats supported by the pin.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * When this method returns, contains the number of pixel formats supported by the pin.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnectorinfo-getnumberformats
     */
    GetNumberFormats() {
        result := ComCall(5, this, "uint*", &pulNumberFormats := 0, "HRESULT")
        return pulNumberFormats
    }

    /**
     * Retrieves the pixel format for the given pin.
     * @param {Integer} ulIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating the pin to retrieve the pixel format.
     * @returns {Guid} Type: <b>WICPixelFormatGUID*</b>
     * 
     * When this method returns, contains the pixel format of the given pin.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnectorinfo-getformat
     */
    GetFormat(ulIndex) {
        pFormat := Guid()
        result := ComCall(6, this, "uint", ulIndex, Guid.Ptr, pFormat, "HRESULT")
        return pFormat
    }

    Query(iid) {
        if (IMILBitmapEffectConnectorInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIndex := CallbackCreate(GetMethod(implObj, "GetIndex"), flags, 2)
        this.vtbl.GetOptimalFormat := CallbackCreate(GetMethod(implObj, "GetOptimalFormat"), flags, 2)
        this.vtbl.GetNumberFormats := CallbackCreate(GetMethod(implObj, "GetNumberFormats"), flags, 2)
        this.vtbl.GetFormat := CallbackCreate(GetMethod(implObj, "GetFormat"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIndex)
        CallbackFree(this.vtbl.GetOptimalFormat)
        CallbackFree(this.vtbl.GetNumberFormats)
        CallbackFree(this.vtbl.GetFormat)
    }
}
