#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFExtendedCameraControl.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExtendedCameraControl"]

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} ulPropertyId 
     * @returns {IMFExtendedCameraControl} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontroller-getextendedcameracontrol
     */
    GetExtendedCameraControl(dwStreamIndex, ulPropertyId) {
        result := ComCall(3, this, "uint", dwStreamIndex, "uint", ulPropertyId, "ptr*", &ppControl := 0, "HRESULT")
        return IMFExtendedCameraControl(ppControl)
    }
}
