#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of decay model used by an [AudioNodeEmitter](audionodeemitter.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitterdecaykind
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioNodeEmitterDecayKind extends Win32Enum{

    /**
     * A natural roll-off model using a distance-squared formula is used.
     * @type {Integer (Int32)}
     */
    static Natural => 0

    /**
     * Decay is determined using the [MinGain](audionodeemitterdecaymodel_mingain.md) and [MaxGain](audionodeemitterdecaymodel_maxgain.md) properties..
     * @type {Integer (Int32)}
     */
    static Custom => 1
}
