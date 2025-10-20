#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1DrawingStateBlock.ahk

/**
 * Implementation of a drawing state block that adds the functionality of primitive blend in addition to already existing antialias mode, transform, tags and text rendering mode.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1drawingstateblock1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1DrawingStateBlock1 extends ID2D1DrawingStateBlock{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1DrawingStateBlock1
     * @type {Guid}
     */
    static IID => Guid("{689f1f85-c72e-4e33-8f19-85754efd5ace}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDescription", "SetDescription"]

    /**
     * 
     * @param {Pointer<D2D1_DRAWING_STATE_DESCRIPTION1>} stateDescription 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1drawingstateblock1-getdescription
     */
    GetDescription(stateDescription) {
        ComCall(8, this, "ptr", stateDescription)
    }

    /**
     * 
     * @param {Pointer<D2D1_DRAWING_STATE_DESCRIPTION1>} stateDescription 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1drawingstateblock1-setdescription
     */
    SetDescription(stateDescription) {
        ComCall(9, this, "ptr", stateDescription)
    }
}
