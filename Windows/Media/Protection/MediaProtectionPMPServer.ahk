#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaProtectionPMPServer.ahk
#Include .\IMediaProtectionPMPServerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a Protected Media Path (PMP) server to enable playback of protected content using digital rights management (DRM).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.mediaprotectionpmpserver
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class MediaProtectionPMPServer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaProtectionPMPServer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaProtectionPMPServer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [MediaProtectionPMPServer](mediaprotectionpmpserver.md) class with the specified properties.
     * @remarks
     * [MediaProtectionPMPServer](mediaprotectionpmpserver.md) supports the following properties:
     * 
     * |Property                   |            Description  |
     * |---------------------------|-------------------------|
     * |"Windows.Media.Protection.MediaProtectionSystemId" | A GUID representing the DRM system your app will use. This allows the system to determine if hardware DRM is supported on the device. |
     * |Windows.Media.Protection.UseSoftwareProtectionLayer | Setting this to true tells the system to use software DRM even if hardware DRM is available on the current device. |
     * |Windows.Media.Protection.PMPStoreContext | When implementing a Store Content Decryption Module (CDM) object, the Store CDM should look for and make a copy of the [MF_CONTENTDECRYPTIONMODULE_PMPSTORECONTEXT](/windows/win32/medfound/mf-contentdecryptionmodule-pmpstorecontext) property in [IMFContentDecryptionModuleAccess::CreateContentDecryptionModule](/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmoduleaccess-createcontentdecryptionmodule). If the Store CDM object wants to create a **MediaProtectionPMPServer** that will support [CreateObjectByCLSID](/windows/win32/api/mfidl/nf-mfidl-imfpmphost-createobjectbyclsid) for objects defined in the Store CDM binary, they need pass this property. |
     * @param {IPropertySet} pProperties The set of properties used to initialize the server.
     * @returns {MediaProtectionPMPServer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.mediaprotectionpmpserver.#ctor
     */
    static CreatePMPServer(pProperties) {
        if (!MediaProtectionPMPServer.HasProp("__IMediaProtectionPMPServerFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.MediaProtectionPMPServer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaProtectionPMPServerFactory.IID)
            MediaProtectionPMPServer.__IMediaProtectionPMPServerFactory := IMediaProtectionPMPServerFactory(factoryPtr)
        }

        return MediaProtectionPMPServer.__IMediaProtectionPMPServerFactory.CreatePMPServer(pProperties)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the property set for the [MediaProtectionPMPServer](mediaprotectionpmpserver.md).
     * @remarks
     * [MediaProtectionPMPServer](mediaprotectionpmpserver.md) supports the following properties:
     * 
     * <table>
     *    <tr><th>Property</th><th>Description</th></tr>
     *    <tr><td>"Windows.Media.Protection.MediaProtectionSystemId"</td><td>A GUID representing the DRM system your app will use. This allows the system to determine if hardware DRM is supported on the device.</td></tr>
     *    <tr><td>Windows.Media.Protection.UseSoftwareProtectionLayer</td><td>Setting this to true tells the system to use software DRM even if hardware DRM is available on the current device.</td></tr>
     * </table>
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.mediaprotectionpmpserver.properties
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IMediaProtectionPMPServer")) {
            if ((queryResult := this.QueryInterface(IMediaProtectionPMPServer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaProtectionPMPServer := IMediaProtectionPMPServer(outPtr)
        }

        return this.__IMediaProtectionPMPServer.get_Properties()
    }

;@endregion Instance Methods
}
