#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "Common\D2D1_COLOR_F.ahk" { D2D1_COLOR_F }
#Import ".\ID2D1Brush.ahk" { ID2D1Brush }

/**
 * Paints an area with a solid color.
 * @remarks
 * <h3><a id="Creating_ID2D1SolidColorBrush_Objects"></a><a id="creating_id2d1solidcolorbrush_objects"></a><a id="CREATING_ID2D1SOLIDCOLORBRUSH_OBJECTS"></a>Creating ID2D1SolidColorBrush Objects</h3>
 * 
 * To create a solid color brush, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createsolidcolorbrush(constd2d1_color_f__id2d1solidcolorbrush)">ID2D1RenderTarget::CreateSolidColorBrush</a> method of the render target on which the brush will be used. The brush can only be used with the render target that created it or with the compatible targets for that render target.
 * 
 * 
 * A solid color brush is a device-dependent resource. (For more information about resources, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1solidcolorbrush
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1SolidColorBrush extends ID2D1Brush {
    /**
     * The interface identifier for ID2D1SolidColorBrush
     * @type {Guid}
     */
    static IID := Guid("{2cd906a9-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1SolidColorBrush interfaces
    */
    struct Vtbl extends ID2D1Brush.Vtbl {
        SetColor : IntPtr
        GetColor : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1SolidColorBrush.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies the color of this solid color brush.
     * @remarks
     * To help create colors, Direct2D provides the [**ColorF**](/windows/win32/api/d2d1helper/nl-d2d1helper-colorf) class. It offers several helper methods for creating colors and provides a set or predefined colors.
     * @param {Pointer<D2D1_COLOR_F>} _color 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1solidcolorbrush-setcolor
     */
    SetColor(_color) {
        ComCall(8, this, D2D1_COLOR_F.Ptr, _color)
    }

    /**
     * Retrieves the color of the solid color brush.
     * @returns {D2D1_COLOR_F} Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-color-f">D2D1_COLOR_F</a></b>
     * 
     * The color of this solid color brush.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1solidcolorbrush-getcolor
     */
    GetColor() {
        result := ComCall(9, this, D2D1_COLOR_F)
        return result
    }

    Query(iid) {
        if (ID2D1SolidColorBrush.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetColor := CallbackCreate(GetMethod(implObj, "SetColor"), flags, 2)
        this.vtbl.GetColor := CallbackCreate(GetMethod(implObj, "GetColor"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetColor)
        CallbackFree(this.vtbl.GetColor)
    }
}
