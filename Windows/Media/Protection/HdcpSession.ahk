#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHdcpSession.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\HdcpSession.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Allows apps to set and query the current state of High-bandwidth Digital Content Protection (HDCP) between the graphics hardware and the display.
 * @remarks
 * You may want to turn on HDCP for your app, even though you're using neither the low-level Media Core Media Pipeline APIs for OPM, nor PlayReady DRM.
 * 
 * Different ISVs (Independent Software Vendors) may need different levels of protection. An ISV with a legal requirement for "simple In-Transit protection" might use HTTPS with Auth for streaming and HDCP for display output protection. Other ISVs build sophisticated pipelines and require direct control of HDCP from within those pipelines. They may enforce the stricter HDCP2 for some content, but not require it for other content.
 * 
 * ISVs may want to set HDCP state and check that it has been established. If the system is unable to establish HDCP, they may opt to implement business logic which will constrain the bitrate or resolution, or not play at all. They build their business logic based on their legal obligations.
 * 
 * Once the app is done with playback that must be HDCP protected, they may opt to turn it back off (for trailers, for example, or as part of a clean exit).
 * 
 * The **HdcpSession** APIs accommodate all of the above scenarios, allowing you to tweak your app's HDCP settings to suit your particular needs.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.hdcpsession
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class HdcpSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHdcpSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHdcpSession.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the **HdcpSession** class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.HdcpSession")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnProtectionChangedToken")) {
            this.remove_ProtectionChanged(this.__OnProtectionChangedToken)
            this.__OnProtectionChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * Checks whether the effective protection of the [HdcpSession](hdcpsession.md) instance is at least equal to the given [HdcpProtection](hdcpprotection.md) value.
     * @param {Integer} protection The level of protection to check against the [HdcpSession](hdcpsession.md) instance's protection level.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.hdcpsession.iseffectiveprotectionatleast
     */
    IsEffectiveProtectionAtLeast(protection) {
        if (!this.HasProp("__IHdcpSession")) {
            if ((queryResult := this.QueryInterface(IHdcpSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdcpSession := IHdcpSession(outPtr)
        }

        return this.__IHdcpSession.IsEffectiveProtectionAtLeast(protection)
    }

    /**
     * Returns the effective protection of the [HdcpSession](hdcpsession.md) instance.
     * @remarks
     * To get the output of this method, assign it to a variable of type **HdcpProtection?**:
     * 
     * ```csharp
     * HdcpProtection? protection = hdcpSession.GetEffectiveProtection();
     * ```
     * 
     * Then, to get the actual value of the enumeration, use `protection.Value`.
     * @returns {IReference<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.hdcpsession.geteffectiveprotection
     */
    GetEffectiveProtection() {
        if (!this.HasProp("__IHdcpSession")) {
            if ((queryResult := this.QueryInterface(IHdcpSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdcpSession := IHdcpSession(outPtr)
        }

        return this.__IHdcpSession.GetEffectiveProtection()
    }

    /**
     * Asynchronously attempts to set the protection of the [HdcpSession](hdcpsession.md) instance with the given protection level.
     * @remarks
     * It is a good idea to listen for the [Completed](/uwp/api/Windows.Foundation.IAsyncOperation_TResult_#Windows_Foundation_IAsyncOperation_1_Completed) event on this function, and then to check the results by calling [GetResults](/uwp/api/Windows.Foundation.IAsyncOperation_TResult_#Windows_Foundation_IAsyncOperation_1_GetResults) on the operation and compare it to the values of the [HdcpSetProtectionResult](hdcpsetprotectionresult.md) enumeration. This way, you can implement your own logic depending on the result of trying to set HDCP. For a usage example, see [HdcpSession](hdcpsession.md).
     * @param {Integer} protection The level of protection at which to set the [HdcpSession](hdcpsession.md) instance.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.hdcpsession.setdesiredminprotectionasync
     */
    SetDesiredMinProtectionAsync(protection) {
        if (!this.HasProp("__IHdcpSession")) {
            if ((queryResult := this.QueryInterface(IHdcpSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdcpSession := IHdcpSession(outPtr)
        }

        return this.__IHdcpSession.SetDesiredMinProtectionAsync(protection)
    }

    /**
     * 
     * @param {TypedEventHandler<HdcpSession, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProtectionChanged(handler) {
        if (!this.HasProp("__IHdcpSession")) {
            if ((queryResult := this.QueryInterface(IHdcpSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdcpSession := IHdcpSession(outPtr)
        }

        return this.__IHdcpSession.add_ProtectionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ProtectionChanged(token) {
        if (!this.HasProp("__IHdcpSession")) {
            if ((queryResult := this.QueryInterface(IHdcpSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHdcpSession := IHdcpSession(outPtr)
        }

        return this.__IHdcpSession.remove_ProtectionChanged(token)
    }

    /**
     * Closes the [HdcpSession](hdcpsession.md) instance.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.hdcpsession.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
