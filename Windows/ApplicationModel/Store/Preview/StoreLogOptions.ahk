#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines options that can be specified while using [GetStoreLogDataAsync](storeconfiguration_getstorelogdataasync_165112752.md) to get Microsoft Store log data for the current device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storelogoptions
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class StoreLogOptions extends Win32BitflagEnum{

    /**
     * No log options are specified.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Try to get log data with elevated privileges.
     * @type {Integer (UInt32)}
     */
    static TryElevate => 1
}
