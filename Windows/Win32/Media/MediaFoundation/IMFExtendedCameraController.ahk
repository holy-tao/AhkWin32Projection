#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFExtendedCameraControl.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMFExtendedCameraController interface allows apps to retrieve an instance of IMFExtendedCameraControl, which is used to configure a capture device's extended properties.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfextendedcameracontroller
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
     * Gets an instance of IMFExtendedCameraControl, which allows an app to get the current capture device's extended property controls.
     * @param {Integer} dwStreamIndex A **DWORD** indicating stream index to use for this property. Specify [MF_CAPTURE_ENGINE_MEDIASOURCE](/windows/win32/medfound/mf-capture-engine-mediasource-config) to indicate that the extended property is a filter-level property.
     * @param {Integer} ulPropertyId The ID indicating the index for identifying the property within [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol
     * ).
     * @returns {Pointer<IMFExtendedCameraControl>} Receives a pointer to the **IMFExtendedCameraControl** instance that represents the requested control.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfextendedcameracontroller-getextendedcameracontrol
     */
    GetExtendedCameraControl(dwStreamIndex, ulPropertyId) {
        result := ComCall(3, this, "uint", dwStreamIndex, "uint", ulPropertyId, "ptr*", &ppControl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppControl
    }
}
