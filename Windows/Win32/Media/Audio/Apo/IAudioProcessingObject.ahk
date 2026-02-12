#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAudioMediaType.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * System Effects Audio Processing Objects (sAPOs) are typically used in or called from real-time process threads.
 * @see https://learn.microsoft.com/windows/win32/api//content/audioenginebaseapo/nn-audioenginebaseapo-iaudioprocessingobject
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
     * @remarks
     * This method is not real-time compliant and must not be called from a real-time processing thread. The implementation of this method does not and must not touch paged memory. Additionally, it must not call any blocking system routines.
     * @returns {HRESULT} The <c>Reset</c> method returns a value of S_OK when the call is completed successfully.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-reset
     */
    Reset() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetLatency method returns the latency for this APO. Latency is the amount of time it takes a frame to traverse the processing pass of an APO.
     * @remarks
     * If the client that is calling this APO knows the sampling rate, the client can calculate the latency in terms of the number of frames. To get the total latency of the entire audio signal processing stream, the client must query every APO in the processing chain and add up the results.
     * 
     * <div class="alert"><b>Important</b>    This method is not real-time compliant and must not be called from a real-time processing thread.</div>
     * <div> </div>
     * @returns {Integer} A pointer to an MFTIME structure that will receive the number of units of delay that this APO introduces. Each unit of delay represents 100 nanoseconds.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-getlatency
     */
    GetLatency() {
        result := ComCall(4, this, "int64*", &pTime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pTime
    }

    /**
     * GetRegistrationProperties returns the registration properties of the audio processing object (APO).
     * @remarks
     * The caller must free the memory returned by <c>GetRegistrationProperties</c>.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">This method must not be called from a real-time processing thread.
     * 
     * </div>
     * <div> </div>
     * @returns {Pointer<APO_REG_PROPERTIES>} The registration properties of the APO. This parameter is of type <a href="https://docs.microsoft.com/windows/desktop/api/audioenginebaseapo/ns-audioenginebaseapo-apo_reg_properties">APO_REG_PROPERTIES</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-getregistrationproperties
     */
    GetRegistrationProperties() {
        result := ComCall(5, this, "ptr*", &ppRegProps := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppRegProps
    }

    /**
     * The Initialize method initializes the APO and supports data of variable length.
     * @remarks
     * If this method is used to initialize an APO without the need to initialize any data, it is acceptable to supply a <b>NULL</b> as the value of the pbyData parameter and a 0 (zero) as the value of the cbDataSize parameter. The data that is supplied is of variable length and must have the following format:
     * 
     * 
     * ```
     * Struct MyAPOInitializationData
     * {
     * APOInitBaseStruct APOInit;
     * // list additional struct members here
     * // ...
     * };
     * ```
     * @param {Integer} cbDataSize This is the size, in bytes, of the initialization data.
     * @param {Pointer<Integer>} pbyData This is initialization data that is specific to this APO.
     * @returns {HRESULT} The <c>Initialize</c> method returns a value of S_OK if the call was successful. Otherwise, this method returns one of the following error codes:
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
     * @see https://learn.microsoft.com/windows/win32/api//content/audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-initialize
     */
    Initialize(cbDataSize, pbyData) {
        pbyDataMarshal := pbyData is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", cbDataSize, pbyDataMarshal, pbyData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method negotiates with the Windows Vista audio engine to establish a data format for the stream of audio data.
     * @remarks
     * There are differences in the implementation of the <c>IsInputFormatSupported</c> method by the different APOs. For example, with certain implementations, the output can only be of type float when the input format is of type integer.
     * 
     * To initiate format negotiation, the audio service first sets the output of the LFX sAPO to the default float32-based format. The audio service then calls the <c>IAudioProcessingObject::IsInputFormatSupported</c> method of the LFX sAPO, suggests the default format, and monitors the HRESULT response of this method. If the input of the LFX sAPO can support the suggested format, it returns S_OK, together with a reference to the supported format. If the input of the LFX sAPO cannot support the suggested format, it returns S_FALSE together with a reference to a format that is the closest match to the suggested one. If the LFX sAPO cannot support the suggested format and does not have a close match, it returns APOERR_FORMAT_NOT_SUPPORTED. The GFX sAPO works with the output format of the LFX sAPO. So the GFX sAPO is not involved in the format negotiation process.
     * @param {IAudioMediaType} pOppositeFormat A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/audiomediatype/nn-audiomediatype-iaudiomediatype">IAudioMediaType</a> interface. This parameter is used to indicate the output format of the data. The value of pOppositeFormat must be set to <b>NULL</b> to indicate that the output format can be any type.
     * @param {IAudioMediaType} pRequestedInputFormat A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/audiomediatype/nn-audiomediatype-iaudiomediatype">IAudioMediaType</a> interface. This parameter is used to indicate the input format that is to be verified.
     * @returns {IAudioMediaType} This parameter indicates the supported format that is closest to the format to be verified.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-isinputformatsupported
     */
    IsInputFormatSupported(pOppositeFormat, pRequestedInputFormat) {
        result := ComCall(7, this, "ptr", pOppositeFormat, "ptr", pRequestedInputFormat, "ptr*", &ppSupportedInputFormat := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAudioMediaType(ppSupportedInputFormat)
    }

    /**
     * The IsOutputFormatSupported method is used to verify that a specific output format is supported.
     * @remarks
     * There are differences in the implementation of the <c>IsOutputFormatSupported</c> method by the different APOs. For example, with certain implementations, the output can only be of type float when the input format is of type integer.
     * @param {IAudioMediaType} pOppositeFormat A pointer to an IAudioMediaType interface. This parameter indicates the output format. This parameter must be set to <b>NULL</b> to indicate that the output format can be any type.
     * @param {IAudioMediaType} pRequestedOutputFormat A pointer to an <b>IAudioMediaType</b> interface. This parameter indicates the output format that is to be verified.
     * @returns {IAudioMediaType} This parameter indicates the supported output format that is closest to the format to be verified.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-isoutputformatsupported
     */
    IsOutputFormatSupported(pOppositeFormat, pRequestedOutputFormat) {
        result := ComCall(8, this, "ptr", pOppositeFormat, "ptr", pRequestedOutputFormat, "ptr*", &ppSupportedOutputFormat := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAudioMediaType(ppSupportedOutputFormat)
    }

    /**
     * GetInputChannelCount returns the input channel count (samples-per-frame) for this APO.
     * @remarks
     * The input channel count that is returned refers to the input side of the APO.
     * @returns {Integer} The input channel count.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-getinputchannelcount
     */
    GetInputChannelCount() {
        result := ComCall(9, this, "uint*", &pu32ChannelCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pu32ChannelCount
    }
}
