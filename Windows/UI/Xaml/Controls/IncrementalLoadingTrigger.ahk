#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify list view incremental loading behavior ([IncrementalLoadingTrigger](listviewbase_incrementalloadingtrigger.md) property).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.incrementalloadingtrigger
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IncrementalLoadingTrigger extends Win32Enum{

    /**
     * Incremental loading does not occur.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Uses an "edge" offset for incremental loading visual behavior, and enables the list view to notify the scroll host of incremental load per interaction with other settings ([IncrementalLoadingThreshold](listviewbase_incrementalloadingthreshold.md), [DataFetchSize](listviewbase_datafetchsize.md)).
     * @type {Integer (Int32)}
     */
    static Edge => 1
}
