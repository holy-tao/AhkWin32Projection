#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAudioClient.ahk

/**
 * The IAudioClient2 interface is derived from the IAudioClient interface, with a set of additional methods that enable a Windows Audio Session API (WASAPI) audio client to do the following:\_opt in for offloading, query stream properties, and get information from the hardware that handles offloading.The audio client can be successful in creating an offloaded stream if the underlying endpoint supports the hardware audio engine, the endpoint has been enumerated and discovered by the audio system, and there are still offload pin instances available on the endpoint.
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-iaudioclient2
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioClient2 extends IAudioClient{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioClient2
     * @type {Guid}
     */
    static IID => Guid("{726778cd-f60a-4eda-82de-e47610cd78aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsOffloadCapable", "SetClientProperties", "GetBufferSizeLimits"]

    /**
     * 
     * @param {Integer} Category 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient2-isoffloadcapable
     */
    IsOffloadCapable(Category) {
        result := ComCall(15, this, "int", Category, "int*", &pbOffloadCapable := 0, "HRESULT")
        return pbOffloadCapable
    }

    /**
     * 
     * @param {Pointer<AudioClientProperties>} pProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient2-setclientproperties
     */
    SetClientProperties(pProperties) {
        result := ComCall(16, this, "ptr", pProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @param {BOOL} bEventDriven 
     * @param {Pointer<Integer>} phnsMinBufferDuration 
     * @param {Pointer<Integer>} phnsMaxBufferDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclient2-getbuffersizelimits
     */
    GetBufferSizeLimits(pFormat, bEventDriven, phnsMinBufferDuration, phnsMaxBufferDuration) {
        phnsMinBufferDurationMarshal := phnsMinBufferDuration is VarRef ? "int64*" : "ptr"
        phnsMaxBufferDurationMarshal := phnsMaxBufferDuration is VarRef ? "int64*" : "ptr"

        result := ComCall(17, this, "ptr", pFormat, "int", bEventDriven, phnsMinBufferDurationMarshal, phnsMinBufferDuration, phnsMaxBufferDurationMarshal, phnsMaxBufferDuration, "HRESULT")
        return result
    }
}
