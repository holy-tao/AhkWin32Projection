#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines values for use with the FXEQ\_PARAMETERS structure.
 * @see https://learn.microsoft.com/windows/win32/xaudio2/fxeq-constants
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
class FXEQ extends Win32Struct {
    static sizeof => 0

    static packingSize => 1
}
