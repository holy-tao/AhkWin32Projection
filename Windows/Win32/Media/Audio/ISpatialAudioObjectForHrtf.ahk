#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpatialAudioObjectBase.ahk

/**
 * Represents an object that provides audio data to be rendered from a position in 3D space, relative to the user, a head-relative transfer function (HRTF).
 * @remarks
 * <div class="alert"><b>Note</b>  Many of the methods provided by this interface are implemented in the inherited <a href="https://docs.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectbase">ISpatialAudioObjectBase</a> interface.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioObjectForHrtf extends ISpatialAudioObjectBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioObjectForHrtf
     * @type {Guid}
     */
    static IID => Guid("{d7436ade-1978-4e14-aba0-555bd8eb83b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPosition", "SetGain", "SetOrientation", "SetEnvironment", "SetDistanceDecay", "SetDirectivity"]

    /**
     * Sets the position in 3D space, relative to the listener, from which the ISpatialAudioObjectForHrtf audio data will be rendered.
     * @remarks
     * This method can only be called on a  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a> that is of type <b>AudioObjectType_Dynamic</b>. Set the type of the audio object with the <i>type</i> parameter to the  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nf-spatialaudiohrtf-ispatialaudioobjectrenderstreamforhrtf-activatespatialaudioobjectforhrtf">ISpatialAudioObjectRenderStreamForHrtf::ActivateSpatialAudioObjectForHrtf</a> method.
     * 
     *  Position values use a right-handed Cartesian coordinate system, where each unit represents 1 meter. The coordinate system is relative to the listener where the origin (x=0.0, y=0.0, z=0.0) represents the center point between the listener's ears.
     * 
     * If <b>SetPosition</b> is never called, the origin (x=0.0, y=0.0, z=0.0) is used as the default position. After <b>SetPosition</b> is called, the position that is set will be used for the audio object until the position is changed with another call to <b>SetPosition</b>.
     * @param {Float} x The x position of the audio object, in meters, relative to the listener. Positive values are to the right of the listener and negative values are to the left.
     * @param {Float} y The y position of the audio object, in meters, relative to the listener. Positive values are above the listener and negative values are below.
     * @param {Float} z The z position of the audio object, in meters, relative to the listener. Positive values are behind the listener and negative values are in front.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_OUT_OF_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779299(v=vs.85)">ISpatialAudioObjectRenderStreamBase::BeginUpdatingAudioObjects</a> was not called before the call to <b>SetPosition</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_RESOURCES_INVALIDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779275(v=vs.85)">SetEndOfStream</a> was called either explicitly or implicitly in a previous audio processing pass. <b>SetEndOfStream</b> is called implicitly by the system if <b>GetBuffer</b> is not called within an audio processing pass (between calls to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779299(v=vs.85)">ISpatialAudioObjectRenderStreamBase::BeginUpdatingAudioObjects</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779300(v=vs.85)">ISpatialAudioObjectRenderStreamBase::EndUpdatingAudioObjects</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> SPTLAUDCLNT_E_PROPERTY_NOT_SUPPORTED </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a> is not of type <b>AudioObjectType_Dynamic</b>. Set the type of the audio object with the <i>type</i> parameter to the  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nf-spatialaudiohrtf-ispatialaudioobjectrenderstreamforhrtf-activatespatialaudioobjectforhrtf">ISpatialAudioObjectRenderStreamBase::ActivateSpatialAudioObjectForHrtf</a> method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudiohrtf/nf-spatialaudiohrtf-ispatialaudioobjectforhrtf-setposition
     */
    SetPosition(x, y, z) {
        result := ComCall(7, this, "float", x, "float", y, "float", z, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the gain for the ISpatialAudioObjectForHrtf.
     * @remarks
     * This is valid only for spatial audio objects configured to use the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/ne-spatialaudiohrtf-spatialaudiohrtfdistancedecaytype">SpatialAudioHrtfDistanceDecay_CustomDecay</a> decay type. Set the decay type of an <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a> object by calling <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nf-spatialaudiohrtf-ispatialaudioobjectforhrtf-setdistancedecay">SetDistanceDecay</a>. Set the default decay type for an all objects in an HRTF render stream by setting the <b>DistanceDecay</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfactivationparams">SpatialAudioHrtfActivationParams</a> passed into <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-activatespatialaudiostream">ISpatialAudioClient::ActivateSpatialAudioStream</a>.
     * 
     * If <b>SetGain</b> is never called, the default value of 0.0 is used. After <b>SetGain</b> is called, the gain that is set will be used for the audio object until the gain is changed with another call to <b>SetGain</b>.
     * @param {Float} gain The gain for the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a> in dB.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_OUT_OF_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779299(v=vs.85)">ISpatialAudioObjectRenderStreamBase::BeginUpdatingAudioObjects</a> was not called before the call to <b>SetGain</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_RESOURCES_INVALIDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779275(v=vs.85)">SetEndOfStream</a> was called either explicitly or implicitly in a previous audio processing pass. <b>SetEndOfStream</b> is called implicitly by the system if <b>GetBuffer</b> is not called within an audio processing pass (between calls to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779299(v=vs.85)">ISpatialAudioObjectRenderStreamBase::BeginUpdatingAudioObjects</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779300(v=vs.85)">ISpatialAudioObjectRenderStreamBase::EndUpdatingAudioObjects</a>).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudiohrtf/nf-spatialaudiohrtf-ispatialaudioobjectforhrtf-setgain
     */
    SetGain(gain) {
        result := ComCall(8, this, "float", gain, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the orientation in 3D space, relative to the listener's frame of reference, from which the ISpatialAudioObjectForHrtf audio data will be rendered.
     * @remarks
     * If <b>SetOrientation</b> is never called, the default value of an identity matrix is used. After <b>SetOrientation</b> is called, the orientation that is set will be used for the audio object until the orientation is changed with another call to <b>SetOrientation</b>.
     * @param {Pointer<Pointer<Float>>} orientation An array of floats defining row-major 3x3 rotation matrix.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_OUT_OF_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779299(v=vs.85)">ISpatialAudioObjectRenderStreamBase::BeginUpdatingAudioObjects</a> was not called before the call to <b>SetOrientation</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_RESOURCES_INVALIDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779275(v=vs.85)">SetEndOfStream</a> was called either explicitly or implicitly in a previous audio processing pass. <b>SetEndOfStream</b> is called implicitly by the system if <b>GetBuffer</b> is not called within an audio processing pass (between calls to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779299(v=vs.85)">ISpatialAudioObjectRenderStreamBase::BeginUpdatingAudioObjects</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779300(v=vs.85)">ISpatialAudioObjectRenderStreamBase::EndUpdatingAudioObjects</a>).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudiohrtf/nf-spatialaudiohrtf-ispatialaudioobjectforhrtf-setorientation
     */
    SetOrientation(orientation) {
        orientationMarshal := orientation is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, orientationMarshal, orientation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the type of acoustic environment that is simulated when audio is processed for the ISpatialAudioObjectForHrtf.
     * @remarks
     * If <b>SetEnvironment</b> is not called, the default value of <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/ne-spatialaudiohrtf-spatialaudiohrtfenvironmenttype">SpatialAudioHrtfEnvironment_Small</a> is used.
     * @param {Integer} environment A value specifying the type of acoustic environment that is simulated when audio is processed for the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_OUT_OF_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779299(v=vs.85)">ISpatialAudioObjectRenderStreamBase::BeginUpdatingAudioObjects</a> was not called before the call to <b>SetEnvironment</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_RESOURCES_INVALIDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779275(v=vs.85)">SetEndOfStream</a> was called either explicitly or implicitly in a previous audio processing pass. <b>SetEndOfStream</b> is called implicitly by the system if <b>GetBuffer</b> is not called within an audio processing pass (between calls to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779299(v=vs.85)">ISpatialAudioObjectRenderStreamBase::BeginUpdatingAudioObjects</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779300(v=vs.85)">ISpatialAudioObjectRenderStreamBase::EndUpdatingAudioObjects</a>).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudiohrtf/nf-spatialaudiohrtf-ispatialaudioobjectforhrtf-setenvironment
     */
    SetEnvironment(environment) {
        result := ComCall(10, this, "int", environment, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the decay model that is applied over distance from the position of an ISpatialAudioObjectForHrtf to the position of the listener.
     * @remarks
     * If <b>SetEnvironment</b> is not called, the default values are used.
     * @param {Pointer<SpatialAudioHrtfDistanceDecay>} distanceDecay The decay model.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_OUT_OF_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779299(v=vs.85)">ISpatialAudioObjectRenderStreamBase::BeginUpdatingAudioObjects</a> was not called before the call to <b>SetDistanceDecay</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_RESOURCES_INVALIDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779275(v=vs.85)">SetEndOfStream</a> was called either explicitly or implicitly in a previous audio processing pass. <b>SetEndOfStream</b> is called implicitly by the system if <b>GetBuffer</b> is not called within an audio processing pass (between calls to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779299(v=vs.85)">ISpatialAudioObjectRenderStreamBase::BeginUpdatingAudioObjects</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779300(v=vs.85)">ISpatialAudioObjectRenderStreamBase::EndUpdatingAudioObjects</a>).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudiohrtf/nf-spatialaudiohrtf-ispatialaudioobjectforhrtf-setdistancedecay
     */
    SetDistanceDecay(distanceDecay) {
        result := ComCall(11, this, "ptr", distanceDecay, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the spatial audio directivity model for the ISpatialAudioObjectForHrtf.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfdirectivity">SpatialAudioHrtfDirectivity</a> structure represents an omnidirectional model that can be linearly interpolated with a cardioid or cone model.
     * 
     * If <b>SetDirectivity</b> is not called, the default type of <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/ne-spatialaudiohrtf-spatialaudiohrtfdirectivitytype">SpatialAudioHrtfDirectivity_OmniDirectional</a> is used with no interpolation.
     * @param {Pointer<SpatialAudioHrtfDirectivityUnion>} directivity The spatial audio directivity model. This value can be one of the following structures:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfdirectivity">SpatialAudioHrtfDirectivity</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfdirectivitycardioid">SpatialAudioHrtfDirectivityCardioid</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfdirectivitycone">SpatialAudioHrtfDirectivityCone</a>
     * </li>
     * </ul>
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_OUT_OF_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779299(v=vs.85)">ISpatialAudioObjectRenderStreamBase::BeginUpdatingAudioObjects</a> was not called before the call to <b>SetDirectivity</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_RESOURCES_INVALIDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779275(v=vs.85)">SetEndOfStream</a> was called either explicitly or implicitly in a previous audio processing pass. <b>SetEndOfStream</b> is called implicitly by the system if <b>GetBuffer</b> is not called within an audio processing pass (between calls to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779299(v=vs.85)">ISpatialAudioObjectRenderStreamBase::BeginUpdatingAudioObjects</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt779300(v=vs.85)">ISpatialAudioObjectRenderStreamBase::EndUpdatingAudioObjects</a>).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudiohrtf/nf-spatialaudiohrtf-ispatialaudioobjectforhrtf-setdirectivity
     */
    SetDirectivity(directivity) {
        result := ComCall(12, this, "ptr", directivity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
