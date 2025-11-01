#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPresentationSurface.ahk

/**
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class IPresentationSurface2 extends IPresentationSurface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPresentationSurface2
     * @type {Guid}
     */
    static IID => Guid("{95609569-c5f0-47f9-8804-5345f2e2767e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetIsHdrContent"]

    /**
     * 
     * @param {Integer} isHdrContent 
     * @returns {String} Nothing - always returns an empty string
     */
    SetIsHdrContent(isHdrContent) {
        ComCall(12, this, "char", isHdrContent)
    }
}
