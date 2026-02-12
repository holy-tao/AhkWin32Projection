#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICmsSignerInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents signer information for a signed CMS message which contains a set of properties.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmssignerinfo
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class CmsSignerInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICmsSignerInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICmsSignerInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the signer certificate that is used to sign the message.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmssignerinfo.certificate
     * @type {Certificate} 
     */
    Certificate {
        get => this.get_Certificate()
        set => this.put_Certificate(value)
    }

    /**
     * Gets or sets the hash algorithm that is used to sign the CMS message.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmssignerinfo.hashalgorithmname
     * @type {HSTRING} 
     */
    HashAlgorithmName {
        get => this.get_HashAlgorithmName()
        set => this.put_HashAlgorithmName(value)
    }

    /**
     * Gets the RFC3161 unauthenticated timestamp information.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmssignerinfo.timestampinfo
     * @type {CmsTimestampInfo} 
     */
    TimestampInfo {
        get => this.get_TimestampInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [CmsSignerInfo](cmssignerinfo.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CmsSignerInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_Certificate() {
        if (!this.HasProp("__ICmsSignerInfo")) {
            if ((queryResult := this.QueryInterface(ICmsSignerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICmsSignerInfo := ICmsSignerInfo(outPtr)
        }

        return this.__ICmsSignerInfo.get_Certificate()
    }

    /**
     * 
     * @param {Certificate} value 
     * @returns {HRESULT} 
     */
    put_Certificate(value) {
        if (!this.HasProp("__ICmsSignerInfo")) {
            if ((queryResult := this.QueryInterface(ICmsSignerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICmsSignerInfo := ICmsSignerInfo(outPtr)
        }

        return this.__ICmsSignerInfo.put_Certificate(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HashAlgorithmName() {
        if (!this.HasProp("__ICmsSignerInfo")) {
            if ((queryResult := this.QueryInterface(ICmsSignerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICmsSignerInfo := ICmsSignerInfo(outPtr)
        }

        return this.__ICmsSignerInfo.get_HashAlgorithmName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_HashAlgorithmName(value) {
        if (!this.HasProp("__ICmsSignerInfo")) {
            if ((queryResult := this.QueryInterface(ICmsSignerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICmsSignerInfo := ICmsSignerInfo(outPtr)
        }

        return this.__ICmsSignerInfo.put_HashAlgorithmName(value)
    }

    /**
     * 
     * @returns {CmsTimestampInfo} 
     */
    get_TimestampInfo() {
        if (!this.HasProp("__ICmsSignerInfo")) {
            if ((queryResult := this.QueryInterface(ICmsSignerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICmsSignerInfo := ICmsSignerInfo(outPtr)
        }

        return this.__ICmsSignerInfo.get_TimestampInfo()
    }

;@endregion Instance Methods
}
