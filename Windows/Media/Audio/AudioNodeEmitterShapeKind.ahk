#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the shape of an [AudioNodeEmitterShape](audionodeemittershape.md) object.
 * @remarks
 * Determine the kind of shape represented by an [AudioNodeEmitterShape](audionodeemittershape.md) by checking the [Kind](audionodeemittershape_kind.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemittershapekind
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioNodeEmitterShapeKind extends Win32Enum{

    /**
     * The shape is omnidirectional.
     * @type {Integer (Int32)}
     */
    static Omnidirectional => 0

    /**
     * The shape is a cone.
     * @type {Integer (Int32)}
     */
    static Cone => 1
}
