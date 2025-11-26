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
     * The IsOffloadCapable method retrieves information about whether or not the endpoint on which a stream is created is capable of supporting an offloaded audio stream.
     * @param {Integer} Category An enumeration that specifies the category of an audio stream.
     * @returns {BOOL} A pointer to a Boolean value. <b>TRUE</b> indicates that the endpoint is offload-capable. <b>FALSE</b> indicates that the endpoint is not offload-capable.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient2-isoffloadcapable
     */
    IsOffloadCapable(Category) {
        result := ComCall(15, this, "int", Category, "int*", &pbOffloadCapable := 0, "HRESULT")
        return pbOffloadCapable
    }

    /**
     * Sets the properties of the audio stream by populating an AudioClientProperties structure.
     * @param {Pointer<AudioClientProperties>} pProperties Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/audioclient/ns-audioclient-audioclientproperties-r1">AudioClientProperties</a> structure.
     * @returns {HRESULT} The <b>SetClientProperties</b> method returns <b>S_OK</b> to indicate that it has completed successfully. Otherwise it returns an appropriate error code.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient2-setclientproperties
     */
    SetClientProperties(pProperties) {
        result := ComCall(16, this, "ptr", pProperties, "HRESULT")
        return result
    }

    /**
     * The GetBufferSizeLimits method returns the buffer size limits of the hardware audio engine in 100-nanosecond units.
     * @param {Pointer<WAVEFORMATEX>} pFormat A pointer to the target format that is being queried for the buffer size limit.
     * @param {BOOL} bEventDriven Boolean value to indicate whether or not the stream can be event-driven.
     * @param {Pointer<Integer>} phnsMinBufferDuration Returns a pointer to the minimum buffer size (in 100-nanosecond units) that is 
     * required for the underlying hardware audio engine to operate at the format specified  in the <i>pFormat</i> parameter,  without frequent audio glitching.
     * @param {Pointer<Integer>} phnsMaxBufferDuration Returns a pointer to the maximum buffer size (in 100-nanosecond units) that the underlying hardware 
     * audio engine can support for the format specified  in the <i>pFormat</i> parameter.
     * @returns {HRESULT} The <b>GetBufferSizeLimits</b> method returns <b>S_OK</b> to indicate that it has completed successfully. Otherwise it returns an appropriate error code. For example, it can return <b>AUDCLNT_E_DEVICE_INVALIDATED</b>, if the device was removed and the method is called.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclient2-getbuffersizelimits
     */
    GetBufferSizeLimits(pFormat, bEventDriven, phnsMinBufferDuration, phnsMaxBufferDuration) {
        phnsMinBufferDurationMarshal := phnsMinBufferDuration is VarRef ? "int64*" : "ptr"
        phnsMaxBufferDurationMarshal := phnsMaxBufferDuration is VarRef ? "int64*" : "ptr"

        result := ComCall(17, this, "ptr", pFormat, "int", bEventDriven, phnsMinBufferDurationMarshal, phnsMinBufferDuration, phnsMaxBufferDurationMarshal, phnsMaxBufferDuration, "HRESULT")
        return result
    }
}
