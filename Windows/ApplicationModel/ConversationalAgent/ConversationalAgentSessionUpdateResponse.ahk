#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies each possible response for a [ConversationalAgentSession](conversationalagentsession.md) update.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsessionupdateresponse
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ConversationalAgentSessionUpdateResponse extends Win32Enum{

    /**
     * Indicates a [ConversationalAgentSession](conversationalagentsession.md) update succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Indicates a [ConversationalAgentSession](conversationalagentsession.md) update failed.
     * @type {Integer (Int32)}
     */
    static Failed => 1
}
