#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1ConcreteTransform.ahk

/**
 * Provides methods to allow a blend operation to be inserted into a transform graph.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1blendtransform
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1BlendTransform extends ID2D1ConcreteTransform{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1BlendTransform
     * @type {Guid}
     */
    static IID => Guid("{63ac0b32-ba44-450f-8806-7f4ca1ff2f1b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDescription", "GetDescription"]

    /**
     * 
     * @param {Pointer<D2D1_BLEND_DESCRIPTION>} description 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1blendtransform-setdescription
     */
    SetDescription(description) {
        ComCall(6, this, "ptr", description)
    }

    /**
     * 
     * @param {Pointer<D2D1_BLEND_DESCRIPTION>} description 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1blendtransform-getdescription
     */
    GetDescription(description) {
        ComCall(7, this, "ptr", description)
    }
}
