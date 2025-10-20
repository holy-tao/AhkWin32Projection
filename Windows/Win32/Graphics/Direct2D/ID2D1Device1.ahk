#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Device.ahk

/**
 * Represents a resource domain whose objects and device contexts can be used together.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_2/nn-d2d1_2-id2d1device1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Device1 extends ID2D1Device{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Device1
     * @type {Guid}
     */
    static IID => Guid("{d21768e1-23a4-4823-a14b-7c3eba85d658}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRenderingPriority", "SetRenderingPriority", "CreateDeviceContext"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nf-d2d1_2-id2d1device1-getrenderingpriority
     */
    GetRenderingPriority() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} renderingPriority 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/nf-d2d1_2-id2d1device1-setrenderingpriority
     */
    SetRenderingPriority(renderingPriority) {
        ComCall(10, this, "int", renderingPriority)
    }

    /**
     * 
     * @param {Integer} options 
     * @param {Pointer<ID2D1DeviceContext1>} deviceContext1 
     * @returns {HRESULT} 
     */
    CreateDeviceContext(options, deviceContext1) {
        result := ComCall(11, this, "int", options, "ptr*", deviceContext1, "HRESULT")
        return result
    }
}
