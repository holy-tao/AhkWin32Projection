#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\GRAPHICS_EFFECT_PROPERTY_MAPPING.ahk" { GRAPHICS_EFFECT_PROPERTY_MAPPING }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Native interoperation interface that provides a counterpart to IGraphicsEffect and allows for metadata queries. This interface is available in C++ only.
 * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nn-windows-graphics-effects-interop-igraphicseffectd2d1interop
 * @namespace Windows.Win32.System.WinRT.Graphics.Direct2D
 */
export default struct IGraphicsEffectD2D1Interop extends IUnknown {
    /**
     * The interface identifier for IGraphicsEffectD2D1Interop
     * @type {Guid}
     */
    static IID := Guid("{2fc57384-a068-44d7-a331-30982fcf7177}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGraphicsEffectD2D1Interop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEffectId             : IntPtr
        GetNamedPropertyMapping : IntPtr
        GetPropertyCount        : IntPtr
        GetProperty             : IntPtr
        GetSource               : IntPtr
        GetSourceCount          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGraphicsEffectD2D1Interop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the ID of the effect.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * When this method returns, this parameter will contain the ID of the effect.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-geteffectid
     */
    GetEffectId() {
        id := Guid()
        result := ComCall(3, this, Guid.Ptr, id, "HRESULT")
        return id
    }

    /**
     * Retrieves the mapping for an effect property.
     * @param {PWSTR} name Type: <b>LPCWSTR</b>
     * 
     * Name of the property.
     * @param {Pointer<Integer>} index Type: <b>UINT*</b>
     * 
     * When this method returns, this parameter will contain the index of the property.
     * @param {Pointer<GRAPHICS_EFFECT_PROPERTY_MAPPING>} mapping Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.graphics.effects.interop/ne-windows-graphics-effects-interop-graphics_effect_property_mapping">GRAPHICS_EFFECT_PROPERTY_MAPPING</a>*</b>
     * 
     * Indicates how a strongly-typed effect property maps to an underlying Direct2D effect property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-getnamedpropertymapping
     */
    GetNamedPropertyMapping(name, index, mapping) {
        name := name is String ? StrPtr(name) : name

        indexMarshal := index is VarRef ? "uint*" : "ptr"
        mappingMarshal := mapping is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", name, indexMarshal, index, mappingMarshal, mapping, "HRESULT")
        return result
    }

    /**
     * Retrieve the property count for the effect.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When the method returns, this parameter will contain the property count.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-getpropertycount
     */
    GetPropertyCount() {
        result := ComCall(5, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Retrieves the effect property at the specified index.
     * @param {Integer} index Type: <b>UINT</b>
     * 
     * The index of the property to retrieve.
     * @returns {Pointer} Type: <b>Windows::Foundation::IPropertyValue**</b>
     * 
     * When this method returns, this parameter will contain the retrieved property.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-getproperty
     */
    GetProperty(index) {
        result := ComCall(6, this, "uint", index, "ptr*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the effect source at the specified index.
     * @param {Integer} index Type: <b>UINT</b>
     * 
     * Index of the source the retrieve.
     * @returns {Pointer} Type: <b>IGraphicsEffectSource**</b>
     * 
     * When the method returns, this parameter will contain the source at the specified index.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-getsource
     */
    GetSource(index) {
        result := ComCall(7, this, "uint", index, "ptr*", &source := 0, "HRESULT")
        return source
    }

    /**
     * Retrieves the source count for the effect.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When the method returns, this parameter will contain the source count for the effect.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.effects.interop/nf-windows-graphics-effects-interop-igraphicseffectd2d1interop-getsourcecount
     */
    GetSourceCount() {
        result := ComCall(8, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    Query(iid) {
        if (IGraphicsEffectD2D1Interop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEffectId := CallbackCreate(GetMethod(implObj, "GetEffectId"), flags, 2)
        this.vtbl.GetNamedPropertyMapping := CallbackCreate(GetMethod(implObj, "GetNamedPropertyMapping"), flags, 4)
        this.vtbl.GetPropertyCount := CallbackCreate(GetMethod(implObj, "GetPropertyCount"), flags, 2)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
        this.vtbl.GetSource := CallbackCreate(GetMethod(implObj, "GetSource"), flags, 3)
        this.vtbl.GetSourceCount := CallbackCreate(GetMethod(implObj, "GetSourceCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEffectId)
        CallbackFree(this.vtbl.GetNamedPropertyMapping)
        CallbackFree(this.vtbl.GetPropertyCount)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.GetSource)
        CallbackFree(this.vtbl.GetSourceCount)
    }
}
