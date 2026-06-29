#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "Common\D2D_SIZE_F.ahk" { D2D_SIZE_F }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import ".\ID2D1DeviceContext4.ahk" { ID2D1DeviceContext4 }
#Import ".\D2D1_SIMPLE_COLOR_PROFILE.ahk" { D2D1_SIMPLE_COLOR_PROFILE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1SvgDocument.ahk" { ID2D1SvgDocument }
#Import ".\ID2D1ColorContext1.ahk" { ID2D1ColorContext1 }

/**
 * This interface performs all the same functions as the ID2D1DeviceContext4 interface, plus it enables the creation of color contexts and Svg documents.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1devicecontext5
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1DeviceContext5 extends ID2D1DeviceContext4 {
    /**
     * The interface identifier for ID2D1DeviceContext5
     * @type {Guid}
     */
    static IID := Guid("{7836d248-68cc-4df6-b9e8-de991bf62eb7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1DeviceContext5 interfaces
    */
    struct Vtbl extends ID2D1DeviceContext4.Vtbl {
        CreateSvgDocument                        : IntPtr
        DrawSvgDocument                          : IntPtr
        CreateColorContextFromDxgiColorSpace     : IntPtr
        CreateColorContextFromSimpleColorProfile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1DeviceContext5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an SVG document from a stream.
     * @param {IStream} inputXmlStream Type: <b>IStream*</b>
     * 
     * An input stream containing the SVG XML document. If null, an empty document is created.
     * @param {D2D_SIZE_F} viewportSize Type: <b>D2D1_SIZE_F</b>
     * 
     * Size of the initial viewport of the document.
     * @returns {ID2D1SvgDocument} Type: <b>ID2D1SvgDocument**</b>
     * 
     * When this method returns, contains a pointer to the created SVG document.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext5-createsvgdocument
     */
    CreateSvgDocument(inputXmlStream, viewportSize) {
        result := ComCall(115, this, "ptr", inputXmlStream, D2D_SIZE_F, viewportSize, "ptr*", &svgDocument := 0, "HRESULT")
        return ID2D1SvgDocument(svgDocument)
    }

    /**
     * Draws an SVG document.
     * @param {ID2D1SvgDocument} svgDocument Type: <b>ID2D1SvgDocument*</b>
     * 
     * The SVG document to draw.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext5-drawsvgdocument
     */
    DrawSvgDocument(svgDocument) {
        ComCall(116, this, "ptr", svgDocument)
    }

    /**
     * Creates a color context from a DXGI color space type. It is only valid to use this with the Color Management Effect in 'Best' mode.
     * @param {DXGI_COLOR_SPACE_TYPE} colorSpace Type: <b>DXGI_COLOR_SPACE_TYPE</b>
     * 
     * The color space to create the color context from.
     * @returns {ID2D1ColorContext1} Type: <b>ID2D1ColorContext1**</b>
     * 
     * The created color context.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext5-createcolorcontextfromdxgicolorspace
     */
    CreateColorContextFromDxgiColorSpace(colorSpace) {
        result := ComCall(117, this, DXGI_COLOR_SPACE_TYPE, colorSpace, "ptr*", &colorContext := 0, "HRESULT")
        return ID2D1ColorContext1(colorContext)
    }

    /**
     * Creates a color context from a simple color profile. It is only valid to use this with the Color Management Effect in 'Best' mode. (overload 2/2)
     * @param {Pointer<D2D1_SIMPLE_COLOR_PROFILE>} simpleProfile Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_simple_color_profile">D2D1_SIMPLE_COLOR_PROFILE</a></b>
     * 
     * The simple color profile to create the color context from.
     * @returns {ID2D1ColorContext1} Type: <b>ID2D1ColorContext1**</b>
     * 
     * The created color context.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext5-createcolorcontextfromsimplecolorprofile(constd2d1_simple_color_profile__id2d1colorcontext1)
     */
    CreateColorContextFromSimpleColorProfile(simpleProfile) {
        result := ComCall(118, this, D2D1_SIMPLE_COLOR_PROFILE.Ptr, simpleProfile, "ptr*", &colorContext := 0, "HRESULT")
        return ID2D1ColorContext1(colorContext)
    }

    Query(iid) {
        if (ID2D1DeviceContext5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSvgDocument := CallbackCreate(GetMethod(implObj, "CreateSvgDocument"), flags, 4)
        this.vtbl.DrawSvgDocument := CallbackCreate(GetMethod(implObj, "DrawSvgDocument"), flags, 2)
        this.vtbl.CreateColorContextFromDxgiColorSpace := CallbackCreate(GetMethod(implObj, "CreateColorContextFromDxgiColorSpace"), flags, 3)
        this.vtbl.CreateColorContextFromSimpleColorProfile := CallbackCreate(GetMethod(implObj, "CreateColorContextFromSimpleColorProfile"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSvgDocument)
        CallbackFree(this.vtbl.DrawSvgDocument)
        CallbackFree(this.vtbl.CreateColorContextFromDxgiColorSpace)
        CallbackFree(this.vtbl.CreateColorContextFromSimpleColorProfile)
    }
}
