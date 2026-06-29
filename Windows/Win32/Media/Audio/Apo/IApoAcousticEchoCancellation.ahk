#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is implemented by APOs to enable acoustic echo cancellation (AEC) scenarios.
 * @remarks
 * This interface may only be implemented by mode effects (MFX) on capture endpoints. Implementing this interface on any other APO will lead to a failure in loading that APO. If the mode effect on a capture endpoint is implemented as a series of chained APOs, only the APO closest to the device may implement this interface.
 * 
 * The **IApoAcousticEchoCancellation** interface has no explicit methods on it. Its purpose is to identify an AEC APO to the audio engine. APOs that implement this interface will be passed an [APO_CONNECTION_PROPERTY_V2](/windows/win32/api/audioapotypes/ns-audioapotypes-apo_connection_property_v2) structure in its call to [IAudioProcessingObjectRT::APOProcess](nf-audioenginebaseapo-iaudioprocessingobjectrt-apoprocess.md). **APO_CONNECTION_PROPERTY_V2** provides a timestamp to allow the APO to synchronize buffers from the primary and auxiliary streams. If the **u32Signature** field of the [APO_CONNECTION_PROPERTY](/windows/win32/api/audioapotypes/ns-audioapotypes-apo_connection_property) structure passed into **IAudioProcessingObjectRT::APOProcess** is equal to **APO_CONNECTION_PROPERTY_V2_SIGNATURE**, the structure can be safely typecast to a **APO_CONNECTION_PROPERTY_V2**.
 * 
 * Because AEC algorithms typically require specific sampling rates and channel counts, the audio engine provides resampling support to APOs that implement the **IApoAcousticEchoCancellation** interface. The [IAudioProcessingObject::IsInputFormatSupported](nf-audioenginebaseapo-iapoauxiliaryinputconfiguration-isinputformatsupported.md) method provides a mechanism for informing the system of the APO's preferred input format by returning the HRESULT APOERR_FORMAT_NOT_SUPPORTED. and returning the requested format in the method's *ppSupportedInputFormat* parameter. The audio engine will then resample input audio to the suggested format prior to sending it to the AEC APO. This eliminates the need for the AEC APO to implement sampling rate and channel count conversion.
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nn-audioenginebaseapo-iapoacousticechocancellation
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct IApoAcousticEchoCancellation extends IUnknown {
    /**
     * The interface identifier for IApoAcousticEchoCancellation
     * @type {Guid}
     */
    static IID := Guid("{25385759-3236-4101-a943-25693dfb5d2d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IApoAcousticEchoCancellation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IApoAcousticEchoCancellation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IApoAcousticEchoCancellation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
