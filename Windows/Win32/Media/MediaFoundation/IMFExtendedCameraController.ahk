#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfextendedcameracontroller
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFExtendedCameraController extends IUnknown{
    /**
     * The interface identifier for IMFExtendedCameraController
     * @type {Guid}
     */
    static IID => Guid("{b91ebfee-ca03-4af4-8a82-a31752f4a0fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} ulPropertyId 
     * @param {Pointer<IMFExtendedCameraControl>} ppControl 
     * @returns {HRESULT} 
     */
    GetExtendedCameraControl(dwStreamIndex, ulPropertyId, ppControl) {
        result := ComCall(3, this, "uint", dwStreamIndex, "uint", ulPropertyId, "ptr", ppControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
