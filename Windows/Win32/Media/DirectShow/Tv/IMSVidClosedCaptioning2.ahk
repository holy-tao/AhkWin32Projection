#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidClosedCaptioning.ahk

/**
 * The IMSVidClosedCaptioning2 interface sets the closed captioning service, such as CC1 or CC2. The MSVidClosedCaptioning feature exposes this interface.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidClosedCaptioning2)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidclosedcaptioning2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidClosedCaptioning2 extends IMSVidClosedCaptioning{
    /**
     * The interface identifier for IMSVidClosedCaptioning2
     * @type {Guid}
     */
    static IID => Guid("{e00cb864-a029-4310-9987-a873f5887d97}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * 
     * @param {Pointer<Int32>} On 
     * @returns {HRESULT} 
     */
    get_Service(On) {
        result := ComCall(18, this, "int*", On, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} On 
     * @returns {HRESULT} 
     */
    put_Service(On) {
        result := ComCall(19, this, "int", On, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
