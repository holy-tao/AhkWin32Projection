#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AE_CURRENT_POSITION.ahk" { AE_CURRENT_POSITION }
#Import "..\..\Media\Audio\Apo\APO_CONNECTION_PROPERTY.ahk" { APO_CONNECTION_PROPERTY }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Gets the input buffer for each processing pass.
 * @remarks
 * <b>IAudioInputEndpointRT</b> methods can be called 
 *      from a real-time processing thread. The implementation of the methods of this interface must not block, access 
 *      paged memory, or call any blocking system routines.
 * 
 * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client 
 *     applications.
 * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nn-audioengineendpoint-iaudioinputendpointrt
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IAudioInputEndpointRT extends IUnknown {
    /**
     * The interface identifier for IAudioInputEndpointRT
     * @type {Guid}
     */
    static IID := Guid("{8026ab61-92b2-43c1-a1df-5c37ebd08d82}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioInputEndpointRT interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInputDataPointer     : IntPtr
        ReleaseInputDataPointer : IntPtr
        PulseEndpoint           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioInputEndpointRT.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a pointer to the buffer from which data will be read by the audio engine.
     * @remarks
     * This method returns a pointer from the endpoint to the buffer <i>pConnectionProperty</i>-&gt;<b>pBuffer</b>, which
     *     contains data that needs to be passed into the engine as input.
     *     The data and the buffer pointer must remain valid until the
     *     <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/nf-audioengineendpoint-iaudioinputendpointrt-releaseinputdatapointer">IAudioInputEndpointRT::ReleaseInputDataPointer</a> method is called. The endpoint object must  set  the requested amount of information and insert silence if no
     *     valid data exists.
     *     The  buffer pointer, <i>pConnectionProperty</i>-&gt;<b>pBuffer</b>, returned by the endpoint object  must be frame aligned.
     *     Endpoints do not support the extra space, which may be available in
     *     the <a href="https://docs.microsoft.com/windows/desktop/api/audioapotypes/ns-audioapotypes-apo_connection_property">APO_CONNECTION_PROPERTY</a> associated with the connection properties
     *     passed in the <i>pConnectionProperty</i> parameter.
     * 
     * Passing zero in the <b>u32ValidFrameCount</b> member is a valid request. In this case,
     *     the input pointer must be valid but the endpoint does not read from it. The <i>pConnectionProperty</i>-&gt;<b>u32ValidFrameCount</b> value must be less than or equal to the maximum  frame count supported by the endpoint. To get the supported number of frames, call the <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-getframesperpacket">IAudioEndpoint::GetFramesPerPacket</a> method.
     * 
     * This method can be called from a real-time processing thread. The
     *     implementation of this method must not block, access
     *     paged memory, or call any blocking system routines.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @param {Pointer<APO_CONNECTION_PROPERTY>} pConnectionProperty A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/audioapotypes/ns-audioapotypes-apo_connection_property">APO_CONNECTION_PROPERTY</a> structure.
     * 
     * The caller sets the member values as follows:
     * 
     * <ul>
     * <li><b>pBuffer</b> is set to <b>NULL</b>.</li>
     * <li><b>u32ValidFrameCount</b> contains the number of frames that need to be
     *     in the retrieved data pointer. The endpoint object must not cache this
     *     information. The audio engine can change this number depending on
     *     its processing needs.</li>
     * <li><b>u32BufferFlags</b> is set to <b>BUFFER_INVALID</b>.</li>
     * </ul>
     * If this call completes successfully, the endpoint must set the member values as follows:
     * 
     * <ul>
     * <li><b>pBuffer</b> points to valid memory where the data has been read. This could include silence depending on the flags that were set in the <b>u32BufferFlags</b> member.</li>
     * <li><b>u32ValidFrameCount</b> is unchanged.</li>
     * <li><b>u32BufferFlags</b> is set to <b>BUFFER_VALID</b> if the data pointer contains valid data or to <b>BUFFER_SILENT</b> if the data
     *     pointer contains only silent data. The data in the buffer does
     *     not actually need to be silence, but the buffer specified in <b>pBuffer</b> must be capable of holding all the frames of
     *     silence contained in <b>u32ValidFrameCount</b> to match the required frame count.</li>
     * </ul>
     * @param {Pointer<AE_CURRENT_POSITION>} pAeTimeStamp A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/ns-audioengineendpoint-ae_current_position">AE_CURRENT_POSITION</a> structure that contains the time stamp of the data that is captured in the buffer.
     *     This parameter is optional.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioinputendpointrt-getinputdatapointer
     */
    GetInputDataPointer(pConnectionProperty, pAeTimeStamp) {
        ComCall(3, this, APO_CONNECTION_PROPERTY.Ptr, pConnectionProperty, AE_CURRENT_POSITION.Ptr, pAeTimeStamp)
    }

    /**
     * Releases the acquired data pointer.
     * @remarks
     * <b>ReleaseInputDataPointer</b> notifies the endpoint that the audio engine no longer requires the input data pointer and also indicates the number of frames used during the session.
     *     For example, an endpoint, which represents a looped buffer, is connected to the input of the
     *     audio engine and can advance its read
     *     pointer by using the actual frame count.
     *     If <b>u32FrameCount</b> is zero, this indicates that the client did not use any data
     *     from the specified input buffer. The <b>u32FrameCount</b> must be less than or equal to the maximum  frame count supported by the endpoint. To get the supported number of frames, the audio engine calls the <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpoint-getframesperpacket">IAudioEndpoint::GetFramesPerPacket</a> method.
     * 
     * This method can be called from a real-time processing thread. The implementation of this method must not block, access paged memory, or call any blocking system routines.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @param {Integer} u32FrameCount The number of frames that have been
     *     consumed by the audio engine. This count might not
     *     be the same as the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/nf-audioengineendpoint-iaudioinputendpointrt-getinputdatapointer">IAudioInputEndpointRT::GetInputDataPointer</a> method in the <i>pConnectionProperty</i>-&gt;<b>u32ValidFrameCount</b> member.
     * @param {Pointer} pDataPointer The pointer to the buffer retrieved by                  the <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/nf-audioengineendpoint-iaudioinputendpointrt-getinputdatapointer">GetInputDataPointer</a> method received  in the <i>pConnectionProperty</i>-&gt;<b>pBuffer</b> member.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioinputendpointrt-releaseinputdatapointer
     */
    ReleaseInputDataPointer(u32FrameCount, pDataPointer) {
        ComCall(4, this, "uint", u32FrameCount, "ptr", pDataPointer)
    }

    /**
     * Is reserved. (IAudioInputEndpointRT.PulseEndpoint)
     * @remarks
     * This method can be called from a real-time processing thread. The
     *     implementation of this method must not block, access paged memory, or call any blocking system routines.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioinputendpointrt-pulseendpoint
     */
    PulseEndpoint() {
        ComCall(5, this)
    }

    Query(iid) {
        if (IAudioInputEndpointRT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInputDataPointer := CallbackCreate(GetMethod(implObj, "GetInputDataPointer"), flags, 3)
        this.vtbl.ReleaseInputDataPointer := CallbackCreate(GetMethod(implObj, "ReleaseInputDataPointer"), flags, 3)
        this.vtbl.PulseEndpoint := CallbackCreate(GetMethod(implObj, "PulseEndpoint"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInputDataPointer)
        CallbackFree(this.vtbl.ReleaseInputDataPointer)
        CallbackFree(this.vtbl.PulseEndpoint)
    }
}
