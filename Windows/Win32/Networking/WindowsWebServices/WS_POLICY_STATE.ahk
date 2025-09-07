#Requires AutoHotkey v2.0.0 64-bit

/**
 * The state of the policy object.
 * @remarks
 * The following diagram illustrates the functions that
  *                 cause state transitions in the policy object.
  *             
  * :::image type="content" source="./images/PolicyStates.png" border="false" alt-text="Diagram of the state transitions for a Policy object showing the functions that cause transitions between the Created and Faulted states.":::
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_policy_state
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_POLICY_STATE{

    /**
     * The initial state of the policy object.
     * @type {Integer (Int32)}
     */
    static WS_POLICY_STATE_CREATED => 1

    /**
     * The policy object is no longer usable due to a previous error.
     * @type {Integer (Int32)}
     */
    static WS_POLICY_STATE_FAULTED => 2
}
