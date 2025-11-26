#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAudioMediaType.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * System Effects Audio Processing Objects (sAPOs) are typically used in or called from real-time process threads.
 * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nn-audioenginebaseapo-iaudioprocessingobject
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioProcessingObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioProcessingObject
     * @type {Guid}
     */
    static IID => Guid("{fd7f2b29-24d0-4b5c-b177-592c39f9ca10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "GetLatency", "GetRegistrationProperties", "Initialize", "IsInputFormatSupported", "IsOutputFormatSupported", "GetInputChannelCount"]

    /**
     * The Reset method resets the APO to its original state. This method does not cause any changes in the connection objects that are attached to the input or the output of the APO.
     * @returns {HRESULT} The <code>Reset</code> method returns a value of S_OK when the call is completed successfully.
     * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-reset
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The GetLatency method returns the latency for this APO. Latency is the amount of time it takes a frame to traverse the processing pass of an APO.
     * @returns {Integer} A pointer to an MFTIME structure that will receive the number of units of delay that this APO introduces. Each unit of delay represents 100 nanoseconds.
     * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-getlatency
     */
    GetLatency() {
        result := ComCall(4, this, "int64*", &pTime := 0, "HRESULT")
        return pTime
    }

    /**
     * GetRegistrationProperties returns the registration properties of the audio processing object (APO).
     * @returns {Pointer<APO_REG_PROPERTIES>} The registration properties of the APO. This parameter is of type <a href="https://docs.microsoft.com/windows/desktop/api/audioenginebaseapo/ns-audioenginebaseapo-apo_reg_properties">APO_REG_PROPERTIES</a>.
     * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-getregistrationproperties
     */
    GetRegistrationProperties() {
        result := ComCall(5, this, "ptr*", &ppRegProps := 0, "HRESULT")
        return ppRegProps
    }

    /**
     * The Initialize method initializes the APO and supports data of variable length.
     * @param {Integer} cbDataSize This is the size, in bytes, of the initialization data.
     * @param {Pointer<Integer>} pbyData This is initialization data that is specific to this APO.
     * @returns {HRESULT} The <code>Initialize</code> method returns a value of S_OK if the call was successful. Otherwise, this method returns one of the following error codes:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer passed to the function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>APOERR_ALREADY_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * APO already initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other HRESULTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * These additional error conditions are tracked by the audio engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-initialize
     */
    Initialize(cbDataSize, pbyData) {
        pbyDataMarshal := pbyData is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", cbDataSize, pbyDataMarshal, pbyData, "HRESULT")
        return result
    }

    /**
     * This method negotiates with the Windows Vista audio engine to establish a data format for the stream of audio data.
     * @param {IAudioMediaType} pOppositeFormat A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/audiomediatype/nn-audiomediatype-iaudiomediatype">IAudioMediaType</a> interface. This parameter is used to indicate the output format of the data. The value of pOppositeFormat must be set to <b>NULL</b> to indicate that the output format can be any type.
     * @param {IAudioMediaType} pRequestedInputFormat A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/audiomediatype/nn-audiomediatype-iaudiomediatype">IAudioMediaType</a> interface. This parameter is used to indicate the input format that is to be verified.
     * @returns {IAudioMediaType} This parameter indicates the supported format that is closest to the format to be verified.
     * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-isinputformatsupported
     */
    IsInputFormatSupported(pOppositeFormat, pRequestedInputFormat) {
        result := ComCall(7, this, "ptr", pOppositeFormat, "ptr", pRequestedInputFormat, "ptr*", &ppSupportedInputFormat := 0, "HRESULT")
        return IAudioMediaType(ppSupportedInputFormat)
    }

    /**
     * The IsOutputFormatSupported method is used to verify that a specific output format is supported.
     * @param {IAudioMediaType} pOppositeFormat A pointer to an IAudioMediaType interface. This parameter indicates the output format. This parameter must be set to <b>NULL</b> to indicate that the output format can be any type.
     * @param {IAudioMediaType} pRequestedOutputFormat A pointer to an <b>IAudioMediaType</b> interface. This parameter indicates the output format that is to be verified.
     * @returns {IAudioMediaType} This parameter indicates the supported output format that is closest to the format to be verified.
     * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-isoutputformatsupported
     */
    IsOutputFormatSupported(pOppositeFormat, pRequestedOutputFormat) {
        result := ComCall(8, this, "ptr", pOppositeFormat, "ptr", pRequestedOutputFormat, "ptr*", &ppSupportedOutputFormat := 0, "HRESULT")
        return IAudioMediaType(ppSupportedOutputFormat)
    }

    /**
     * GetInputChannelCount returns the input channel count (samples-per-frame) for this APO.
     * @returns {Integer} The input channel count.
     * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-getinputchannelcount
     */
    GetInputChannelCount() {
        result := ComCall(9, this, "uint*", &pu32ChannelCount := 0, "HRESULT")
        return pu32ChannelCount
    }
}
