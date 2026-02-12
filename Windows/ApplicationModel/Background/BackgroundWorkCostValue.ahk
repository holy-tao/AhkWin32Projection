#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the current cost of doing background work. Used as a hint to background tasks about how much work they can do.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundworkcostvalue
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class BackgroundWorkCostValue extends Win32Enum{

    /**
     * Background resource usage is low. The background task can do work.
     * @type {Integer (Int32)}
     */
    static Low => 0

    /**
     * Background resources are in use, but the background task can do some work.
     * @type {Integer (Int32)}
     */
    static Medium => 1

    /**
     * Background resources are under heavy use and the background task should not do any work.
     * @type {Integer (Int32)}
     */
    static High => 2
}
