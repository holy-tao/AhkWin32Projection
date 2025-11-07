#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Describes the render information common to all of the various transform implementations.
 * @remarks
 * 
 * This interface is used by a transform implementation to first describe and then indicate changes to the rendering pass that corresponds to the transform.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1renderinfo
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1RenderInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1RenderInfo
     * @type {Guid}
     */
    static IID => Guid("{519ae1bd-d19a-420d-b849-364f594776b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInputDescription", "SetOutputBuffer", "SetCached", "SetInstructionCountHint"]

    /**
     * 
     * @param {Integer} inputIndex 
     * @param {D2D1_INPUT_DESCRIPTION} inputDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1renderinfo-setinputdescription
     */
    SetInputDescription(inputIndex, inputDescription) {
        result := ComCall(3, this, "uint", inputIndex, "ptr", inputDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bufferPrecision 
     * @param {Integer} channelDepth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1renderinfo-setoutputbuffer
     */
    SetOutputBuffer(bufferPrecision, channelDepth) {
        result := ComCall(4, this, "int", bufferPrecision, "int", channelDepth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} isCached 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1renderinfo-setcached
     */
    SetCached(isCached) {
        ComCall(5, this, "int", isCached)
    }

    /**
     * 
     * @param {Integer} instructionCount 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1renderinfo-setinstructioncounthint
     */
    SetInstructionCountHint(instructionCount) {
        ComCall(6, this, "uint", instructionCount)
    }
}
