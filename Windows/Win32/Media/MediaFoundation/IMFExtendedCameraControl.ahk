#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is used to configure the capture device's extended properties.
 * @remarks
 * 
 * Get an instance of this interface by calling [IMFExtendedCameraController::GetExtendedCameraControl](nf-mfidl-imfextendedcameracontroller-getextendedcameracontrol.md)
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfextendedcameracontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFExtendedCameraControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFExtendedCameraControl
     * @type {Guid}
     */
    static IID => Guid("{38e33520-fca1-4845-a27a-68b7c6ab3789}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilities", "SetFlags", "GetFlags", "LockPayload", "UnlockPayload", "CommitSettings"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-setflags
     */
    SetFlags(ulFlags) {
        result := ComCall(4, this, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-getflags
     */
    GetFlags() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppPayload 
     * @param {Pointer<Integer>} pulPayload 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-lockpayload
     */
    LockPayload(ppPayload, pulPayload) {
        ppPayloadMarshal := ppPayload is VarRef ? "ptr*" : "ptr"
        pulPayloadMarshal := pulPayload is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, ppPayloadMarshal, ppPayload, pulPayloadMarshal, pulPayload, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-unlockpayload
     */
    UnlockPayload() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-commitsettings
     */
    CommitSettings() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
