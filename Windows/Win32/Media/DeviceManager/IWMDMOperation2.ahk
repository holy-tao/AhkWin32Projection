#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMOperation.ahk

/**
 * The optional, application-implemented IWMDMOperation2 interface extends IWMDMOperation by providing methods to get and set extended attributes.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmoperation2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMOperation2 extends IWMDMOperation{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMOperation2
     * @type {Guid}
     */
    static IID => Guid("{33445b48-7df7-425c-ad8f-0fc6d82f9f75}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetObjectAttributes2", "GetObjectAttributes2"]

    /**
     * 
     * @param {Integer} dwAttributes 
     * @param {Integer} dwAttributesEx 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmoperation2-setobjectattributes2
     */
    SetObjectAttributes2(dwAttributes, dwAttributesEx, pFormat, pVideoFormat) {
        result := ComCall(13, this, "uint", dwAttributes, "uint", dwAttributesEx, "ptr", pFormat, "ptr", pVideoFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwAttributes 
     * @param {Pointer<Integer>} pdwAttributesEx 
     * @param {Pointer<WAVEFORMATEX>} pAudioFormat 
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmoperation2-getobjectattributes2
     */
    GetObjectAttributes2(pdwAttributes, pdwAttributesEx, pAudioFormat, pVideoFormat) {
        result := ComCall(14, this, "uint*", pdwAttributes, "uint*", pdwAttributesEx, "ptr", pAudioFormat, "ptr", pVideoFormat, "HRESULT")
        return result
    }
}
