#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayReadyLicenseSession.ahk
#Include .\IPlayReadyLicenseSession2.ahk
#Include .\IPlayReadyLicenseSessionFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Creates a media session and binds license acquisition to that media session.
 * @remarks
 * You must maintain the **PlayReadyLicenseSession** instance until playback has completed. If the app fails to do this, the garbage collector may, at its discretion, release the object. This can cause playback to fail.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicensesession
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyLicenseSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayReadyLicenseSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayReadyLicenseSession.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [PlayReadyLicenseSession](playreadylicensesession.md) class.
     * @remarks
     * In order for you to make use of the **PlayReadyLicenseSession** class, you must construct it with an **IPropertySet** to be used in the *configuration* parameter. The **IPropertySet** must contain the following:
     * 
     * 
     * + The property  must be set to a valid instance of the [MediaProtectionPMPServer](../windows.media.protection/mediaprotectionpmpserver.md) class.
     * + That instance of the **Windows.Media.Protection.MediaProtectionPMPServer** class must have been initialized with an **IPropertySet** that includes the following properties:   +  set to the string value "{F4637010-03C3-42CD-B932-B48ADF3A6A54}".
     *    +  set to another **IPropertySet**. That last **IPropertySet** must have the property  set to the string value "Windows.Media.Protection.PlayReady.PlayReadyWinRTTrustedInput".
     * 
     * 
     * 
     * The following JavaScript code demonstrates this process.
     * 
     * ```csharp
     *     var cpsystems = new Windows.Foundation.Collections.PropertySet();       
     *     cpsystems["{F4637010-03C3-42CD-B932-B48ADF3A6A54}"] = "Windows.Media.Protection.PlayReady.PlayReadyWinRTTrustedInput"; // PlayReady
     *  
     *     var pmpSystemInfo = new Windows.Foundation.Collections.PropertySet();
     *     pmpSystemInfo["Windows.Media.Protection.MediaProtectionSystemId"] = "{F4637010-03C3-42CD-B932-B48ADF3A6A54}";
     *     pmpSystemInfo["Windows.Media.Protection.MediaProtectionSystemIdMapping"] = cpsystems;
     *     var pmpServer = new Windows.Media.Protection.MediaProtectionPMPServer( pmpSystemInfo );
     *  
     *     var licenseSessionProperties = new Windows.Foundation.Collections.PropertySet();
     *     licenseSessionProperties["Windows.Media.Protection.MediaProtectionPMPServer"] = pmpServer;
     * 
     *     var licenseSession = new Windows.Media.Protection.PlayReady.PlayReadyLicenseSession( licenseSessionProperties );
     * 
     * ```
     * @param {IPropertySet} configuration The configuration data for the license session.
     * @returns {PlayReadyLicenseSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicensesession.#ctor
     */
    static CreateInstance(configuration) {
        if (!PlayReadyLicenseSession.HasProp("__IPlayReadyLicenseSessionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyLicenseSession")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyLicenseSessionFactory.IID)
            PlayReadyLicenseSession.__IPlayReadyLicenseSessionFactory := IPlayReadyLicenseSessionFactory(factoryPtr)
        }

        return PlayReadyLicenseSession.__IPlayReadyLicenseSessionFactory.CreateInstance(configuration)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Creates a license acquisition service request whose license will be tied to the media session.
     * @returns {IPlayReadyLicenseAcquisitionServiceRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicensesession.createlaservicerequest
     */
    CreateLAServiceRequest() {
        if (!this.HasProp("__IPlayReadyLicenseSession")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicenseSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicenseSession := IPlayReadyLicenseSession(outPtr)
        }

        return this.__IPlayReadyLicenseSession.CreateLAServiceRequest()
    }

    /**
     * Updates the media protection manger with the appropriate settings so the media foundation can be used for playback.
     * @param {MediaProtectionManager} mpm The media protection manager to be updated.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicensesession.configuremediaprotectionmanager
     */
    ConfigureMediaProtectionManager(mpm) {
        if (!this.HasProp("__IPlayReadyLicenseSession")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicenseSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicenseSession := IPlayReadyLicenseSession(outPtr)
        }

        return this.__IPlayReadyLicenseSession.ConfigureMediaProtectionManager(mpm)
    }

    /**
     * Creates a PlayReadyLicense class iterator that supports in-memory-only PlayReady licenses in addition to persisted licenses.
     * @param {PlayReadyContentHeader} contentHeader The content header used to locate associated licenses.
     * @param {Boolean} fullyEvaluated Indicates whether evaluated license chains should be enumerated or if all licenses (including those that are unusable) should be enumerated. Set this parameter to true if evaluated license chains should be enumerated. Set this parameter to false if all licenses should be enumerated.
     * @returns {PlayReadyLicenseIterable} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicensesession.createlicenseiterable
     */
    CreateLicenseIterable(contentHeader, fullyEvaluated) {
        if (!this.HasProp("__IPlayReadyLicenseSession2")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicenseSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicenseSession2 := IPlayReadyLicenseSession2(outPtr)
        }

        return this.__IPlayReadyLicenseSession2.CreateLicenseIterable(contentHeader, fullyEvaluated)
    }

;@endregion Instance Methods
}
