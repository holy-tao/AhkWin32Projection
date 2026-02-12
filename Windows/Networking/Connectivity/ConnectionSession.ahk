#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IConnectionSession.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * The ConnectionSession class is used to represent a connection to an access point established with [AcquireConnectionAsync](connectivitymanager_acquireconnectionasync_1960335865.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionsession
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class ConnectionSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IConnectionSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IConnectionSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Retrieves the [ConnectionProfile](connectionprofile.md) associated with the connection session.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionsession.connectionprofile
     * @type {ConnectionProfile} 
     */
    ConnectionProfile {
        get => this.get_ConnectionProfile()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {ConnectionProfile} 
     */
    get_ConnectionProfile() {
        if (!this.HasProp("__IConnectionSession")) {
            if ((queryResult := this.QueryInterface(IConnectionSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionSession := IConnectionSession(outPtr)
        }

        return this.__IConnectionSession.get_ConnectionProfile()
    }

    /**
     * Closes the connection to the access point.
     * @remarks
     * This method is used by UWP apps written in JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the `Close` method is exposed as the [Dispose](/uwp/api/windows.networking.connectivity.connectionsession.dispose) method on the [ConnectionSession](connectionsession.md). For apps written in C++, this method is called when using the delete keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectionsession.close
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
