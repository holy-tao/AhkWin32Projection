#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * Represents the drawing state of a render target:\_the antialiasing mode, transform, tags, and text-rendering options.
 * @remarks
 * 
 * <h3><a id="Creating_ID2D1DrawingStateBlock_Objects"></a><a id="creating_id2d1drawingstateblock_objects"></a><a id="CREATING_ID2D1DRAWINGSTATEBLOCK_OBJECTS"></a>Creating ID2D1DrawingStateBlock Objects</h3>
 * To create an <b>ID2D1DrawingStateBlock</b>, use the <a href="https://docs.microsoft.com/windows/win32/Direct2D/id2d1factory-createdrawingstateblock">ID2D1Factory::CreateDrawingStateBlock</a> method.
 * 
 * A drawing state block is a device-independent resource; you can create it once and retain it for the life of your application. For more information about resources, see the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1drawingstateblock
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1DrawingStateBlock extends ID2D1Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1DrawingStateBlock
     * @type {Guid}
     */
    static IID => Guid("{28506e39-ebf6-46a1-bb47-fd85565ab957}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDescription", "SetDescription", "SetTextRenderingParams", "GetTextRenderingParams"]

    /**
     * 
     * @param {Pointer<D2D1_DRAWING_STATE_DESCRIPTION>} stateDescription 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1drawingstateblock-getdescription
     */
    GetDescription(stateDescription) {
        ComCall(4, this, "ptr", stateDescription)
    }

    /**
     * 
     * @param {Pointer<D2D1_DRAWING_STATE_DESCRIPTION>} stateDescription 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1drawingstateblock-setdescription
     */
    SetDescription(stateDescription) {
        ComCall(5, this, "ptr", stateDescription)
    }

    /**
     * 
     * @param {IDWriteRenderingParams} textRenderingParams 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1drawingstateblock-settextrenderingparams
     */
    SetTextRenderingParams(textRenderingParams) {
        ComCall(6, this, "ptr", textRenderingParams)
    }

    /**
     * 
     * @param {Pointer<IDWriteRenderingParams>} textRenderingParams 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1drawingstateblock-gettextrenderingparams
     */
    GetTextRenderingParams(textRenderingParams) {
        ComCall(7, this, "ptr*", textRenderingParams)
    }
}
