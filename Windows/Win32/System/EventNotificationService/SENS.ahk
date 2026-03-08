#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SENS_QOCINFO structure is used by the ISensNetwork::ConnectionMade method. This structure contains Quality of Connection information to the sink object in an application that subscribes to SENS.
 * @see https://learn.microsoft.com/windows/win32/api/sensevts/ns-sensevts-sens_qocinfo
 * @namespace Windows.Win32.System.EventNotificationService
 * @version v4.0.30319
 */
class SENS extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
