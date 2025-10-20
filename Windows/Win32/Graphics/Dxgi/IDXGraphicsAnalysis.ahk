#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGraphicsAnalysis extends IUnknown{
    /**
     * The interface identifier for IDXGraphicsAnalysis
     * @type {Guid}
     */
    static IID => Guid("{9f251514-9d4d-4902-9d60-18988ab7d4b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    BeginCapture() {
        ComCall(3, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    EndCapture() {
        ComCall(4, this)
        return result
    }
}
