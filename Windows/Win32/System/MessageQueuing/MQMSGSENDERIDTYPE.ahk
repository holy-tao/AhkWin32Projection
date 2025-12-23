#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQMSGSENDERIDTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_SENDERID_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_SENDERID_TYPE_SID => 1
}
