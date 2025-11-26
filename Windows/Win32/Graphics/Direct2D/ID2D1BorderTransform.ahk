#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1ConcreteTransform.ahk

/**
 * Extends the input rectangle to infinity using the specified extend modes.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1bordertransform
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1BorderTransform extends ID2D1ConcreteTransform{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1BorderTransform
     * @type {Guid}
     */
    static IID => Guid("{4998735c-3a19-473c-9781-656847e3a347}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetExtendModeX", "SetExtendModeY", "GetExtendModeX", "GetExtendModeY"]

    /**
     * Sets the extend mode in the x direction.
     * @remarks
     * 
     * If the extend mode enumeration is invalid, this operation is ignored.
     * 
     * 
     * @param {Integer} extendMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * The extend mode in the x direction.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1bordertransform-setextendmodex
     */
    SetExtendModeX(extendMode) {
        ComCall(6, this, "int", extendMode)
    }

    /**
     * Sets the extend mode in the y direction.
     * @remarks
     * 
     * If the extend mode enumeration is invalid, this operation is ignored.
     * 
     * 
     * @param {Integer} extendMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * The extend mode in the y direction.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1bordertransform-setextendmodey
     */
    SetExtendModeY(extendMode) {
        ComCall(7, this, "int", extendMode)
    }

    /**
     * Gets the extend mode in the x direction.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * This method returns the extend mode in the x direction.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1bordertransform-getextendmodex
     */
    GetExtendModeX() {
        result := ComCall(8, this, "int")
        return result
    }

    /**
     * Gets the extend mode in the y direction.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * This method returns the extend mode in the y direction.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1bordertransform-getextendmodey
     */
    GetExtendModeY() {
        result := ComCall(9, this, "int")
        return result
    }
}
