#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Defines values for the properties on the [SystemMediaTransportControls](systemmediatransportcontrols.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolsproperty
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class SystemMediaTransportControlsProperty extends Win32Enum{

    /**
     * The sound level property.
     * @type {Integer (Int32)}
     */
    static SoundLevel => 0
}
