#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies each policy property and its associated value.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_policy_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_POLICY_PROPERTY_ID{

    /**
     * This property is used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetpolicyproperty">WsGetPolicyProperty</a>.
 *                  It is of type <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_policy_state">WS_POLICY_STATE</a>.
 * 
 * The current state of the policy object.
     * @type {Integer (Int32)}
     */
    static WS_POLICY_PROPERTY_STATE => 1

    /**
     * This property is used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemetadata">WsCreateMetadata</a> when
 *                     specifying <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_metadata_property_id">WS_METADATA_PROPERTY_POLICY_PROPERTIES</a> as part of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_metadata_property">WS_METADATA_PROPERTY*</a> parameter.  It is of type <b>ULONG</b>.
 *                 
 * 
 * This property controls the maximum number of alternatives
 *                     allowed for a given <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-policy">WS_POLICY</a> object.
 *                 
 * 
 * When a policy is processed, the amount of memory allocated 
 *                     and CPU consumed is proportional to the number of policy
 *                     alternatives present in the policy, not to the actual size
 *                     of the policy.  Even a small policy may contain a large number
 *                     of alternatives due to the expansion of different permutations
 *                     of assertions.  Setting this property to a large
 *                     value may lead to excessive processing or memory consumption.
 *                 
 * 
 * The default value is 32.
     * @type {Integer (Int32)}
     */
    static WS_POLICY_PROPERTY_MAX_ALTERNATIVES => 2

    /**
     * This property is used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemetadata">WsCreateMetadata</a> when
 *                     specifying <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_metadata_property_id">WS_METADATA_PROPERTY_POLICY_PROPERTIES</a>.
 *                   It is of type <b>ULONG</b>.
 * 
 * This property controls the maximum depth of any policy that is
 *                     read and processed.  The maximum depth of a policy is defined as the maximum
 *                     number of levels of nested container elements (<b>Policy</b>, <b>All</b>, <b>ExactlyOne</b>)
 *                     when considering the policy and any policies that it references.
 *                 
 * 
 * A small amount of stack space is consumed for each level of
 *                     policy that is processed.  Setting this value to a large
 *                     value may lead to stack overflow for a policy that is 
 *                     deeply nested or contains a cyclic reference.
 *                 
 * 
 * The default value is 32.
     * @type {Integer (Int32)}
     */
    static WS_POLICY_PROPERTY_MAX_DEPTH => 3

    /**
     * This property is used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemetadata">WsCreateMetadata</a> when
 *                     specifying <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_metadata_property_id">WS_METADATA_PROPERTY_POLICY_PROPERTIES</a>.
 *                  It is of type <b>ULONG</b>.
 * 
 * This property controls the maximum number of policy extensions 
 *                     (unknown assertions) allowed for a given <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-policy">WS_POLICY</a> object. 
 *                     Policy extensions can be retrieved by supplying <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_policy_extension">WS_POLICY_EXTENSION</a> 
 *                     array in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_policy_constraints">WS_POLICY_CONSTRAINTS</a> structure when using the 
 *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmatchpolicyalternative">WsMatchPolicyAlternative</a> API.
 *                 
 * 
 * The default value is 8.
 *                 
 * 
 * When a policy is processed, the amount of memory allocated 
 *                     and CPU consumed is proportional to the number of policy
 *                     alternatives present in the policy, not to the actual size
 *                     of the policy.  Even a small policy may contain a large number
 *                     of alternatives due to the expansion of different permutations
 *                     of assertions.  Setting this property to a large
 *                     value may lead to excessive processing or memory consumption.
     * @type {Integer (Int32)}
     */
    static WS_POLICY_PROPERTY_MAX_EXTENSIONS => 4
}
