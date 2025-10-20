#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLImageElementFactory extends IDispatch{
    /**
     * The interface identifier for IHTMLImageElementFactory
     * @type {Guid}
     */
    static IID => Guid("{3050f38e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLImageElementFactory
     * @type {Guid}
     */
    static CLSID => Guid("{3050f38f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {VARIANT} width 
     * @param {VARIANT} height 
     * @param {Pointer<IHTMLImgElement>} __MIDL__IHTMLImageElementFactory0000 
     * @returns {HRESULT} 
     */
    create(width, height, __MIDL__IHTMLImageElementFactory0000) {
        result := ComCall(7, this, "ptr", width, "ptr", height, "ptr", __MIDL__IHTMLImageElementFactory0000, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
