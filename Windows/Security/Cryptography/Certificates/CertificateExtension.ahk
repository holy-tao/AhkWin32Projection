#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICertificateExtension.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a certificate extension.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificateextension
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class CertificateExtension extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICertificateExtension

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICertificateExtension.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the object ID.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificateextension.objectid
     * @type {HSTRING} 
     */
    ObjectId {
        get => this.get_ObjectId()
        set => this.put_ObjectId(value)
    }

    /**
     * Gets or sets a boolean indicating if the certificate extension is critical.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificateextension.iscritical
     * @type {Boolean} 
     */
    IsCritical {
        get => this.get_IsCritical()
        set => this.put_IsCritical(value)
    }

    /**
     * Gets or sets the value of the certificate extension.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificateextension.value
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new certificateExtension object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CertificateExtension")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ObjectId() {
        if (!this.HasProp("__ICertificateExtension")) {
            if ((queryResult := this.QueryInterface(ICertificateExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateExtension := ICertificateExtension(outPtr)
        }

        return this.__ICertificateExtension.get_ObjectId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ObjectId(value) {
        if (!this.HasProp("__ICertificateExtension")) {
            if ((queryResult := this.QueryInterface(ICertificateExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateExtension := ICertificateExtension(outPtr)
        }

        return this.__ICertificateExtension.put_ObjectId(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCritical() {
        if (!this.HasProp("__ICertificateExtension")) {
            if ((queryResult := this.QueryInterface(ICertificateExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateExtension := ICertificateExtension(outPtr)
        }

        return this.__ICertificateExtension.get_IsCritical()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCritical(value) {
        if (!this.HasProp("__ICertificateExtension")) {
            if ((queryResult := this.QueryInterface(ICertificateExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateExtension := ICertificateExtension(outPtr)
        }

        return this.__ICertificateExtension.put_IsCritical(value)
    }

    /**
     * Encodes the string value into the value byte array.
     * @param {HSTRING} value The string value to encode.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificateextension.encodevalue
     */
    EncodeValue(value) {
        if (!this.HasProp("__ICertificateExtension")) {
            if ((queryResult := this.QueryInterface(ICertificateExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateExtension := ICertificateExtension(outPtr)
        }

        return this.__ICertificateExtension.EncodeValue(value)
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_Value(value) {
        if (!this.HasProp("__ICertificateExtension")) {
            if ((queryResult := this.QueryInterface(ICertificateExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateExtension := ICertificateExtension(outPtr)
        }

        return this.__ICertificateExtension.get_Value(value)
    }

    /**
     * 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Value(value_length, value) {
        if (!this.HasProp("__ICertificateExtension")) {
            if ((queryResult := this.QueryInterface(ICertificateExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateExtension := ICertificateExtension(outPtr)
        }

        return this.__ICertificateExtension.put_Value(value_length, value)
    }

;@endregion Instance Methods
}
