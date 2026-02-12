#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the status of an **XboxLiveEndpointPair** instance.
  * 
  * > [!IMPORTANT]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairstate
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class XboxLiveEndpointPairState extends Win32Enum{

    /**
     * The endpoint pair is in an invalid state.
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * The endpoint pair is being created, initiated by this device.
     * @type {Integer (Int32)}
     */
    static CreatingOutbound => 1

    /**
     * The endpoint pair is being created, initiated by a remote device.
     * @type {Integer (Int32)}
     */
    static CreatingInbound => 2

    /**
     * The endpoint pair is ready to be used.
     * @type {Integer (Int32)}
     */
    static Ready => 3

    /**
     * The endpoint pair is in the process of being deleted. Deletion was initiated locally.
     * @type {Integer (Int32)}
     */
    static DeletingLocally => 4

    /**
     * The endpoint pair is in the process of being deleted because the remote endpoint initiated deletion.
     * @type {Integer (Int32)}
     */
    static RemoteEndpointTerminating => 5

    /**
     * The endpoint pair has been deleted.
     * @type {Integer (Int32)}
     */
    static Deleted => 6
}
