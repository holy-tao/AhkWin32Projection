#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the format for the ITA serialized data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadyitadataformat
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyITADataFormat extends Win32Enum{

    /**
     * Returns the serialized [IPropertySet](../windows.foundation.collections/ipropertyset.md) as detailed in the remarks for the [PlayReadyITADataGenerator.GenerateData](playreadyitadatagenerator_generatedata_1705409289.md) method.
     * @type {Integer (Int32)}
     */
    static SerializedProperties => 0

    /**
     * Returns the entire serialized blob including the content protection system **GUID**, the stream count, and the next stream ID block.
     * @type {Integer (Int32)}
     */
    static SerializedProperties_WithContentProtectionWrapper => 1
}
