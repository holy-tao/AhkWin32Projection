#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The layout template used for content tiles on the **Cortana** canvas.
  * 
  * Specify the template with the [ContentTileType](voicecommandcontenttile_contenttiletype.md) property.
  * 
  * > [!NOTE]
  * > All content tiles on a **Cortana** feedback screen must use the same template.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandcontenttiletype
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class VoiceCommandContentTileType extends Win32Enum{

    /**
     * Only item title.<img src="images/VoiceCommandContentTileType_TitleOnly_small.png" alt="TitleOnly" />
     * @type {Integer (Int32)}
     */
    static TitleOnly => 0

    /**
     * Item title with up to three lines of text. <img src="images/VoiceCommandContentTileType_TitleWithText_small.png" alt="TitleWithText" />
     * @type {Integer (Int32)}
     */
    static TitleWithText => 1

    /**
     * Item title with small, square image.
     * @type {Integer (Int32)}
     */
    static TitleWith68x68Icon => 2

    /**
     * Item title, up to three lines of text, and small square image. <img src="images/VoiceCommandContentTileType_TitleWith68x68IconAndText_small.png" alt="TitleWith68x68IconAndText" />
     * @type {Integer (Int32)}
     */
    static TitleWith68x68IconAndText => 3

    /**
     * Item title with tall image.
     * @type {Integer (Int32)}
     */
    static TitleWith68x92Icon => 4

    /**
     * Item title, up to three lines of text, and tall image. <img src="images/VoiceCommandContentTileType_TitleWith68x92IconAndText_small.png" alt="TitleWith68x92IconAndText" />
     * @type {Integer (Int32)}
     */
    static TitleWith68x92IconAndText => 5

    /**
     * Item title with wide image.
     * @type {Integer (Int32)}
     */
    static TitleWith280x140Icon => 6

    /**
     * Item title, up to two lines of text, and wide image. <img src="images/VoiceCommandContentTileType_TitleWith280x140IconAndText_small.png" alt="TitleWith280x140IconAndText" />
     * @type {Integer (Int32)}
     */
    static TitleWith280x140IconAndText => 7
}
