#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaStreamSampleProtectionProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a collection properties that are specific to the Digital Rights Management (DRM) protection of the [MediaStreamSample](mediastreamsample.md).
 * @remarks
 * See the [MediaStreamSource Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/MediaStreamSource%20streaming%20sample) for an example of using Media Stream Source in a Universal Windows app.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsampleprotectionproperties
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaStreamSampleProtectionProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaStreamSampleProtectionProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaStreamSampleProtectionProperties.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sets the Digital Rights Management (DRM) key identifier for the [MediaStreamSample](mediastreamsample.md).
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The value to set the Digital Rights Management (DRM) key identifier to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsampleprotectionproperties.setkeyidentifier
     */
    SetKeyIdentifier(value_length, value) {
        if (!this.HasProp("__IMediaStreamSampleProtectionProperties")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSampleProtectionProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSampleProtectionProperties := IMediaStreamSampleProtectionProperties(outPtr)
        }

        return this.__IMediaStreamSampleProtectionProperties.SetKeyIdentifier(value_length, value)
    }

    /**
     * Gets the Digital Rights Management (DRM) key identifier from the [MediaStreamSample](mediastreamsample.md).
     * @remarks
     * This method is used with encrypted [MediaStreamSample](mediastreamsample.md) objects that belonging to a protection scheme that uses multiple keys. The key identifier allows the decryptor to know which key to use to decrypt the data.
     * @param {Pointer<Byte>} value Receives the key identifier used to decrypt the data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsampleprotectionproperties.getkeyidentifier
     */
    GetKeyIdentifier(value) {
        if (!this.HasProp("__IMediaStreamSampleProtectionProperties")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSampleProtectionProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSampleProtectionProperties := IMediaStreamSampleProtectionProperties(outPtr)
        }

        return this.__IMediaStreamSampleProtectionProperties.GetKeyIdentifier(value)
    }

    /**
     * Sets the Digital Rights Management (DRM) initialization vector for the [MediaStreamSample](mediastreamsample.md).
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The value to set the Digital Rights Management (DRM) initialization vector to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsampleprotectionproperties.setinitializationvector
     */
    SetInitializationVector(value_length, value) {
        if (!this.HasProp("__IMediaStreamSampleProtectionProperties")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSampleProtectionProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSampleProtectionProperties := IMediaStreamSampleProtectionProperties(outPtr)
        }

        return this.__IMediaStreamSampleProtectionProperties.SetInitializationVector(value_length, value)
    }

    /**
     * Gets the Digital Rights Management (DRM) initialization vector from the [MediaStreamSample](mediastreamsample.md).
     * @param {Pointer<Byte>} value The initialization vector.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsampleprotectionproperties.getinitializationvector
     */
    GetInitializationVector(value) {
        if (!this.HasProp("__IMediaStreamSampleProtectionProperties")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSampleProtectionProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSampleProtectionProperties := IMediaStreamSampleProtectionProperties(outPtr)
        }

        return this.__IMediaStreamSampleProtectionProperties.GetInitializationVector(value)
    }

    /**
     * Sets the Digital Rights Management (DRM) sub-sample mapping for the [MediaStreamSample](mediastreamsample.md).
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The value to set the Digital Rights Management (DRM) sub-sample mapping to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsampleprotectionproperties.setsubsamplemapping
     */
    SetSubSampleMapping(value_length, value) {
        if (!this.HasProp("__IMediaStreamSampleProtectionProperties")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSampleProtectionProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSampleProtectionProperties := IMediaStreamSampleProtectionProperties(outPtr)
        }

        return this.__IMediaStreamSampleProtectionProperties.SetSubSampleMapping(value_length, value)
    }

    /**
     * Gets the Digital Rights Management (DRM) sub-sample mapping from the [MediaStreamSample](mediastreamsample.md).
     * @remarks
     * The sub-sample mapping is used when only portions of the data contained in the [MediaStreamSample](mediastreamsample.md) is encrypted. The sub-sample mapping specifies which parts are encrypted and which are in the clear. The syntax of the sub-sample mapping data is specific to each individual Digital Rights Management (DRM) protection scheme.
     * @param {Pointer<Byte>} value Receives the sub-sample mapping.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsampleprotectionproperties.getsubsamplemapping
     */
    GetSubSampleMapping(value) {
        if (!this.HasProp("__IMediaStreamSampleProtectionProperties")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSampleProtectionProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSampleProtectionProperties := IMediaStreamSampleProtectionProperties(outPtr)
        }

        return this.__IMediaStreamSampleProtectionProperties.GetSubSampleMapping(value)
    }

;@endregion Instance Methods
}
