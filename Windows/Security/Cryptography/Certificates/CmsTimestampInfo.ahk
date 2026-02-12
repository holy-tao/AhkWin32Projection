#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICmsTimestampInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an RFC3161 unauthenticated timestamp attribute in a signed CMS message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmstimestampinfo
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class CmsTimestampInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICmsTimestampInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICmsTimestampInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the certificate that is used to sign the timestamp.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmstimestampinfo.signingcertificate
     * @type {Certificate} 
     */
    SigningCertificate {
        get => this.get_SigningCertificate()
    }

    /**
     * Gets the list of certificates that is used for chain building for the signing certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmstimestampinfo.certificates
     * @type {IVectorView<Certificate>} 
     */
    Certificates {
        get => this.get_Certificates()
    }

    /**
     * Gets the date and time of the timestamp.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmstimestampinfo.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_SigningCertificate() {
        if (!this.HasProp("__ICmsTimestampInfo")) {
            if ((queryResult := this.QueryInterface(ICmsTimestampInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICmsTimestampInfo := ICmsTimestampInfo(outPtr)
        }

        return this.__ICmsTimestampInfo.get_SigningCertificate()
    }

    /**
     * 
     * @returns {IVectorView<Certificate>} 
     */
    get_Certificates() {
        if (!this.HasProp("__ICmsTimestampInfo")) {
            if ((queryResult := this.QueryInterface(ICmsTimestampInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICmsTimestampInfo := ICmsTimestampInfo(outPtr)
        }

        return this.__ICmsTimestampInfo.get_Certificates()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__ICmsTimestampInfo")) {
            if ((queryResult := this.QueryInterface(ICmsTimestampInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICmsTimestampInfo := ICmsTimestampInfo(outPtr)
        }

        return this.__ICmsTimestampInfo.get_Timestamp()
    }

;@endregion Instance Methods
}
