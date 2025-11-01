#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-ipresentationcontent
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class IPresentationContent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPresentationContent
     * @type {Guid}
     */
    static IID => Guid("{5668bb79-3d8e-415c-b215-f38020f2d252}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTag"]

    /**
     * 
     * @param {Pointer} tag 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationcontent-settag
     */
    SetTag(tag) {
        ComCall(3, this, "ptr", tag)
    }
}
