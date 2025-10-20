#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1DeviceContext4.ahk

/**
 * This interface performs all the same functions as the ID2D1DeviceContext4 interface, plus it enables the creation of color contexts and Svg documents.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1devicecontext5
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1DeviceContext5 extends ID2D1DeviceContext4{
    /**
     * The interface identifier for ID2D1DeviceContext5
     * @type {Guid}
     */
    static IID => Guid("{7836d248-68cc-4df6-b9e8-de991bf62eb7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 115

    /**
     * 
     * @param {Pointer<IStream>} inputXmlStream 
     * @param {D2D_SIZE_F} viewportSize 
     * @param {Pointer<ID2D1SvgDocument>} svgDocument 
     * @returns {HRESULT} 
     */
    CreateSvgDocument(inputXmlStream, viewportSize, svgDocument) {
        result := ComCall(115, this, "ptr", inputXmlStream, "ptr", viewportSize, "ptr", svgDocument, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1SvgDocument>} svgDocument 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawSvgDocument(svgDocument) {
        ComCall(116, this, "ptr", svgDocument)
        return result
    }

    /**
     * 
     * @param {Integer} colorSpace 
     * @param {Pointer<ID2D1ColorContext1>} colorContext 
     * @returns {HRESULT} 
     */
    CreateColorContextFromDxgiColorSpace(colorSpace, colorContext) {
        result := ComCall(117, this, "int", colorSpace, "ptr", colorContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_SIMPLE_COLOR_PROFILE>} simpleProfile 
     * @param {Pointer<ID2D1ColorContext1>} colorContext 
     * @returns {HRESULT} 
     */
    CreateColorContextFromSimpleColorProfile(simpleProfile, colorContext) {
        result := ComCall(118, this, "ptr", simpleProfile, "ptr", colorContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
