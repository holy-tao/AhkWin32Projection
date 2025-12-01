#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the provider information to retrieve.
 * @remarks
 * If you specify <b>EventOpcodeInformation</b> when calling <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhqueryproviderfieldinformation">TdhQueryProviderFieldInformation</a>, you must specify the  <i>EventFieldValue</i> parameter as follows:
 * 
 * <ul>
 * <li>Bits 0 - 15 must contain the task value</li>
 * <li>Bits 16 - 23 must contain the opcode value</li>
 * </ul>
 * You can get the task and opcode values from <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_descriptor">EVENT_RECORD.EventHeader.EventDescriptor</a>.
 * 
 * WMI MOF class supports retrieving keyword and level information only.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ne-tdh-event_field_type
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_FIELD_TYPE extends Win32Enum{

    /**
     * Keyword information defined in the manifest. For providers that define themselves using MOF classes, this type returns the enable flags values if the provider class includes the Flags property. For details, see the "Specifying level and enable flags values for a provider" section of <a href="https://docs.microsoft.com/windows/desktop/ETW/event-tracing-mof-qualifiers">Event Tracing MOF Qualifiers</a>.
     * @type {Integer (Int32)}
     */
    static EventKeywordInformation => 0

    /**
     * Level information defined in the manifest.
     * @type {Integer (Int32)}
     */
    static EventLevelInformation => 1

    /**
     * Channel information defined in the manifest.
     * @type {Integer (Int32)}
     */
    static EventChannelInformation => 2

    /**
     * Task information defined in the manifest.
     * @type {Integer (Int32)}
     */
    static EventTaskInformation => 3

    /**
     * Operation code information defined in the manifest.
     * @type {Integer (Int32)}
     */
    static EventOpcodeInformation => 4

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static EventInformationMax => 5
}
