#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMVideoAcceleratorNotify interface is a callback interface used in conjunction with the IAMVideoAccelerator interface.
 * @see https://docs.microsoft.com/windows/win32/api//videoacc/nn-videoacc-iamvideoacceleratornotify
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMVideoAcceleratorNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMVideoAcceleratorNotify
     * @type {Guid}
     */
    static IID => Guid("{256a6a21-fbad-11d1-82bf-00a0c9696c8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUncompSurfacesInfo", "SetUncompSurfacesInfo", "GetCreateVideoAcceleratorData"]

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @param {Pointer<AMVAUncompBufferInfo>} pUncompBufferInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/videoacc/nf-videoacc-iamvideoacceleratornotify-getuncompsurfacesinfo
     */
    GetUncompSurfacesInfo(pGuid, pUncompBufferInfo) {
        result := ComCall(3, this, "ptr", pGuid, "ptr", pUncompBufferInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwActualUncompSurfacesAllocated 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/videoacc/nf-videoacc-iamvideoacceleratornotify-setuncompsurfacesinfo
     */
    SetUncompSurfacesInfo(dwActualUncompSurfacesAllocated) {
        result := ComCall(4, this, "uint", dwActualUncompSurfacesAllocated, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @param {Pointer<Integer>} pdwSizeMiscData 
     * @param {Pointer<Pointer<Void>>} ppMiscData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/videoacc/nf-videoacc-iamvideoacceleratornotify-getcreatevideoacceleratordata
     */
    GetCreateVideoAcceleratorData(pGuid, pdwSizeMiscData, ppMiscData) {
        pdwSizeMiscDataMarshal := pdwSizeMiscData is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pGuid, pdwSizeMiscDataMarshal, pdwSizeMiscData, "ptr*", ppMiscData, "HRESULT")
        return result
    }
}
